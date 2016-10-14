{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns      #-}

-- |
-- Module      : Network.AWS.Error
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : provisional
-- Portability : non-portable (GHC extensions)
--
module Network.AWS.Error where

import Control.Applicative
import Control.Monad

import Data.Aeson
import Data.Aeson.Types (parseEither)
import Data.Maybe
import Data.Monoid

import Network.AWS.Data.ByteString
import Network.AWS.Data.Headers
import Network.AWS.Data.Text
import Network.AWS.Data.XML
import Network.AWS.Lens            (Choice, Getting, Optic', filtered)
import Network.AWS.Types
import Network.HTTP.Client         (HttpException (..),
                                    HttpExceptionContent (..))
import Network.HTTP.Types          (ResponseHeaders, Status (..))

import qualified Data.ByteString.Lazy as LBS
import qualified Network.HTTP.Client  as Client

statusSuccess :: Status -> Bool
statusSuccess (statusCode -> n) = n >= 200 && n < 300

httpStatus :: AsError a => Getting (First Status) a Status
httpStatus = _Error . f
  where
    f g = \case
        TransportError (HttpExceptionRequest rq (StatusCodeException rs b))
            -> (\x ->
                   let err = StatusCodeException (rs { Client.responseStatus = x }) b
                    in TransportError (HttpExceptionRequest rq err))
               <$> g (Client.responseStatus rs)

        TransportError e
            -> pure (TransportError e)

        SerializeError (SerializeError' a s b e)
            -> (\x -> SerializeError (SerializeError' a x b e)) <$> g s

        ServiceError e
            -> (\x -> ServiceError (e { _serviceStatus = x }))
               <$> g (_serviceStatus e)

hasStatus :: (Applicative f, Choice p)
          => Int
          -> Optic' p f ServiceError ServiceError
hasStatus n = filtered ((n ==) . fromEnum . _serviceStatus)

hasCode :: (Applicative f, Choice p)
        => ErrorCode
        -> Optic' p f ServiceError ServiceError
hasCode c = filtered ((c ==) . _serviceCode)

serviceError :: Abbrev
             -> Status
             -> [Header]
             -> Maybe ErrorCode
             -> Maybe ErrorMessage
             -> Maybe RequestId
             -> ServiceError
serviceError a s h c m r =
    ServiceError' a s h (fromMaybe (getErrorCode s h) c) m (r <|> getRequestId h)

getRequestId :: [Header] -> Maybe RequestId
getRequestId h =
    either (const Nothing) Just (h .# hAMZRequestId <|> h .# hAMZNRequestId)

getErrorCode :: Status -> [Header] -> ErrorCode
getErrorCode s h =
    case h .# hAMZNErrorType of
        Left  _ -> errorCode (toText (statusMessage s))
        Right x -> errorCode x

parseJSONError :: Abbrev
               -> Status
               -> [Header]
               -> LazyByteString
               -> Error
parseJSONError a s h bs = decodeError a s h bs (parse bs)
  where
    parse = eitherDecode' >=> parseEither (withObject "JSONError" go)

    go o = do
        e <- (Just <$> o .: "__type") <|> o .:? "code"
        m <- msg e o
        return $! serviceError a s h e m Nothing

    msg c o =
        if c == Just "RequestEntityTooLarge"
            then pure (Just "Request body must be less than 1 MB")
            else Just <$> o .:  "message"
                      <|> o .:? "Message"

parseXMLError :: Abbrev
              -> Status
              -> [Header]
              -> LazyByteString
              -> Error
parseXMLError a s h bs = decodeError a s h bs (decodeXML bs >>= go)
  where
    go x = serviceError a s h
        <$> code x
        <*> may (firstElement "Message"   x)
        <*> may (firstElement "RequestId" x  <|> firstElement "RequestID" x)

    code x = Just <$> (firstElement "Code" x >>= parseXML)
         <|> return root

    root = errorCode <$> rootElementName bs

    may (Left  _) = pure Nothing
    may (Right x) = Just <$> parseXML x

parseRESTError :: Abbrev
               -> Status
               -> [Header]
               -> a
               -> Error
parseRESTError a s h _ =
    ServiceError (serviceError a s h Nothing Nothing Nothing)

decodeError :: Abbrev
            -> Status
            -> [Header]
            -> LazyByteString
            -> Either String ServiceError
            -> Error
decodeError a s h bs e
    | LBS.null bs = parseRESTError a s h bs
    | otherwise   =
        either (SerializeError . SerializeError' a s (Just bs))
               ServiceError
               e
