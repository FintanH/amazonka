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
-- Module      : Network.AWS.APIGateway.GetAPIKeys
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets information about the current < ApiKeys> resource.
--
-- This operation returns paginated results.
module Network.AWS.APIGateway.GetAPIKeys
    (
    -- * Creating a Request
      getAPIKeys
    , GetAPIKeys
    -- * Request Lenses
    , gakIncludeValues
    , gakNameQuery
    , gakLimit
    , gakPosition

    -- * Destructuring the Response
    , getAPIKeysResponse
    , GetAPIKeysResponse
    -- * Response Lenses
    , gakrsItems
    , gakrsWarnings
    , gakrsPosition
    , gakrsResponseStatus
    ) where

import           Network.AWS.APIGateway.Types
import           Network.AWS.APIGateway.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Pager
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | A request to get information about the current < ApiKeys> resource.
--
-- /See:/ 'getAPIKeys' smart constructor.
data GetAPIKeys = GetAPIKeys'
    { _gakIncludeValues :: !(Maybe Bool)
    , _gakNameQuery     :: !(Maybe Text)
    , _gakLimit         :: !(Maybe Int)
    , _gakPosition      :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetAPIKeys' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gakIncludeValues'
--
-- * 'gakNameQuery'
--
-- * 'gakLimit'
--
-- * 'gakPosition'
getAPIKeys
    :: GetAPIKeys
getAPIKeys =
    GetAPIKeys'
    { _gakIncludeValues = Nothing
    , _gakNameQuery = Nothing
    , _gakLimit = Nothing
    , _gakPosition = Nothing
    }

-- | A boolean flag to specify whether ('true') or not ('false') the result contains key values.
gakIncludeValues :: Lens' GetAPIKeys (Maybe Bool)
gakIncludeValues = lens _gakIncludeValues (\ s a -> s{_gakIncludeValues = a});

-- | The name of queried API keys.
gakNameQuery :: Lens' GetAPIKeys (Maybe Text)
gakNameQuery = lens _gakNameQuery (\ s a -> s{_gakNameQuery = a});

-- | The maximum number of < ApiKeys> to get information about.
gakLimit :: Lens' GetAPIKeys (Maybe Int)
gakLimit = lens _gakLimit (\ s a -> s{_gakLimit = a});

-- | The position of the current < ApiKeys> resource to get information about.
gakPosition :: Lens' GetAPIKeys (Maybe Text)
gakPosition = lens _gakPosition (\ s a -> s{_gakPosition = a});

instance AWSPager GetAPIKeys where
        page rq rs
          | stop (rs ^. gakrsPosition) = Nothing
          | stop (rs ^. gakrsItems) = Nothing
          | otherwise =
            Just $ rq & gakPosition .~ rs ^. gakrsPosition

instance AWSRequest GetAPIKeys where
        type Rs GetAPIKeys = GetAPIKeysResponse
        request = get apiGateway
        response
          = receiveJSON
              (\ s h x ->
                 GetAPIKeysResponse' <$>
                   (x .?> "item" .!@ mempty) <*>
                     (x .?> "warnings" .!@ mempty)
                     <*> (x .?> "position")
                     <*> (pure (fromEnum s)))

instance Hashable GetAPIKeys

instance NFData GetAPIKeys

instance ToHeaders GetAPIKeys where
        toHeaders
          = const
              (mconcat
                 ["Accept" =# ("application/json" :: ByteString)])

instance ToPath GetAPIKeys where
        toPath = const "/apikeys"

instance ToQuery GetAPIKeys where
        toQuery GetAPIKeys'{..}
          = mconcat
              ["includeValues" =: _gakIncludeValues,
               "name" =: _gakNameQuery, "limit" =: _gakLimit,
               "position" =: _gakPosition]

-- | Represents a collection of API keys as represented by an < ApiKeys> resource.
--
-- <http://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-api-keys.html Use API Keys>
--
-- /See:/ 'getAPIKeysResponse' smart constructor.
data GetAPIKeysResponse a = GetAPIKeysResponse'
    { _gakrsItems          :: !(Maybe [APIKey])
    , _gakrsWarnings       :: !(Maybe [Text])
    , _gakrsPosition       :: !(Maybe Text)
    , _gakrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetAPIKeysResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gakrsItems'
--
-- * 'gakrsWarnings'
--
-- * 'gakrsPosition'
--
-- * 'gakrsResponseStatus'
getAPIKeysResponse
    :: Int -- ^ 'gakrsResponseStatus'
    -> GetAPIKeysResponse (a)
getAPIKeysResponse pResponseStatus_ =
    GetAPIKeysResponse'
    { _gakrsItems = Nothing
    , _gakrsWarnings = Nothing
    , _gakrsPosition = Nothing
    , _gakrsResponseStatus = pResponseStatus_
    }

-- | The current page of any < ApiKey> resources in the collection of < ApiKey> resources.
gakrsItems :: Lens' (GetAPIKeysResponse (a)) [APIKey]
gakrsItems = lens _gakrsItems (\ s a -> s{_gakrsItems = a}) . _Default . _Coerce;

-- | A list of warning messages logged during the import of API keys when the 'failOnWarnings' option is set to true.
gakrsWarnings :: Lens' (GetAPIKeysResponse (a)) [Text]
gakrsWarnings = lens _gakrsWarnings (\ s a -> s{_gakrsWarnings = a}) . _Default . _Coerce;

-- | Undocumented member.
gakrsPosition :: Lens' (GetAPIKeysResponse (a)) (Maybe Text)
gakrsPosition = lens _gakrsPosition (\ s a -> s{_gakrsPosition = a});

-- | The response status code.
gakrsResponseStatus :: Lens' (GetAPIKeysResponse (a)) Int
gakrsResponseStatus = lens _gakrsResponseStatus (\ s a -> s{_gakrsResponseStatus = a});

instance NFData GetAPIKeysResponse
