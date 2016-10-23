{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.APIGateway.ImportAPIKeys
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Import API keys from an external source, such as a CSV-formatted file.
module Network.AWS.APIGateway.ImportAPIKeys
    (
    -- * Creating a Request
      importAPIKeys
    , ImportAPIKeys
    -- * Request Lenses
    , iakFailOnWarnings
    , iakBody
    , iakFormat

    -- * Destructuring the Response
    , importAPIKeysResponse
    , ImportAPIKeysResponse
    -- * Response Lenses
    , iakrsIds
    , iakrsWarnings
    , iakrsResponseStatus
    ) where

import           Network.AWS.APIGateway.Types
import           Network.AWS.APIGateway.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | The POST request to import API keys from an external source, such as a CSV-formatted file.
--
-- /See:/ 'importAPIKeys' smart constructor.
data ImportAPIKeys = ImportAPIKeys'
    { _iakFailOnWarnings :: !(Maybe Bool)
    , _iakBody           :: !(HashMap Text Value)
    , _iakFormat         :: !APIKeysFormat
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | Creates a value of 'ImportAPIKeys' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'iakFailOnWarnings'
--
-- * 'iakBody'
--
-- * 'iakFormat'
importAPIKeys
    :: HashMap Text Value -- ^ 'iakBody'
    -> APIKeysFormat -- ^ 'iakFormat'
    -> ImportAPIKeys
importAPIKeys pBody_ pFormat_ =
    ImportAPIKeys'
    { _iakFailOnWarnings = Nothing
    , _iakBody = pBody_
    , _iakFormat = pFormat_
    }

-- | A query parameter to indicate whether to rollback < ApiKey> importation ('true') or not ('false') when error is encountered.
iakFailOnWarnings :: Lens' ImportAPIKeys (Maybe Bool)
iakFailOnWarnings = lens _iakFailOnWarnings (\ s a -> s{_iakFailOnWarnings = a});

-- | The payload of the POST request to import API keys. For the payload format, see <http://docs.aws.amazon.com/apigateway/latest/developerguide/api-key-file-format.html API Key File Format>.
iakBody :: Lens' ImportAPIKeys (HashMap Text Value)
iakBody = lens _iakBody (\ s a -> s{_iakBody = a});

-- | A query parameter to specify the input format to imported API keys. Currently, only the 'csv' format is supported.
iakFormat :: Lens' ImportAPIKeys APIKeysFormat
iakFormat = lens _iakFormat (\ s a -> s{_iakFormat = a});

instance AWSRequest ImportAPIKeys where
        type Rs ImportAPIKeys = ImportAPIKeysResponse
        request = postBody apiGateway
        response
          = receiveJSON
              (\ s h x ->
                 ImportAPIKeysResponse' <$>
                   (x .?> "ids" .!@ mempty) <*>
                     (x .?> "warnings" .!@ mempty)
                     <*> (pure (fromEnum s)))

instance Hashable ImportAPIKeys

instance NFData ImportAPIKeys

instance ToBody ImportAPIKeys where
        toBody = toBody . _iakBody

instance ToHeaders ImportAPIKeys where
        toHeaders
          = const
              (mconcat
                 ["Accept" =# ("application/json" :: ByteString)])

instance ToPath ImportAPIKeys where
        toPath = const "/apikeys"

instance ToQuery ImportAPIKeys where
        toQuery ImportAPIKeys'{..}
          = mconcat
              ["failonwarnings" =: _iakFailOnWarnings,
               "format" =: _iakFormat, "mode=import"]

-- | The identifier of an API key used to reference an API key in a usage plan.
--
-- /See:/ 'importAPIKeysResponse' smart constructor.
data ImportAPIKeysResponse a = ImportAPIKeysResponse'
    { _iakrsIds            :: !(Maybe [Text])
    , _iakrsWarnings       :: !(Maybe [Text])
    , _iakrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ImportAPIKeysResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'iakrsIds'
--
-- * 'iakrsWarnings'
--
-- * 'iakrsResponseStatus'
importAPIKeysResponse
    :: Int -- ^ 'iakrsResponseStatus'
    -> ImportAPIKeysResponse (a)
importAPIKeysResponse pResponseStatus_ =
    ImportAPIKeysResponse'
    { _iakrsIds = Nothing
    , _iakrsWarnings = Nothing
    , _iakrsResponseStatus = pResponseStatus_
    }

-- | A list of all the < ApiKey> identifiers.
iakrsIds :: Lens' (ImportAPIKeysResponse (a)) [Text]
iakrsIds = lens _iakrsIds (\ s a -> s{_iakrsIds = a}) . _Default . _Coerce;

-- | A list of warning messages.
iakrsWarnings :: Lens' (ImportAPIKeysResponse (a)) [Text]
iakrsWarnings = lens _iakrsWarnings (\ s a -> s{_iakrsWarnings = a}) . _Default . _Coerce;

-- | The response status code.
iakrsResponseStatus :: Lens' (ImportAPIKeysResponse (a)) Int
iakrsResponseStatus = lens _iakrsResponseStatus (\ s a -> s{_iakrsResponseStatus = a});

instance NFData ImportAPIKeysResponse
