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
-- Module      : Network.AWS.APIGateway.GetUsagePlanKeys
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets all the usage plan keys representing the API keys added to a specified usage plan.
module Network.AWS.APIGateway.GetUsagePlanKeys
    (
    -- * Creating a Request
      getUsagePlanKeys
    , GetUsagePlanKeys
    -- * Request Lenses
    , gupkNameQuery
    , gupkLimit
    , gupkPosition
    , gupkUsagePlanId

    -- * Destructuring the Response
    , getUsagePlanKeysResponse
    , GetUsagePlanKeysResponse
    -- * Response Lenses
    , gupkrsItems
    , gupkrsPosition
    , gupkrsResponseStatus
    ) where

import           Network.AWS.APIGateway.Types
import           Network.AWS.APIGateway.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | The GET request to get all the usage plan keys representing the API keys added to a specified usage plan.
--
-- /See:/ 'getUsagePlanKeys' smart constructor.
data GetUsagePlanKeys = GetUsagePlanKeys'
    { _gupkNameQuery   :: !(Maybe Text)
    , _gupkLimit       :: !(Maybe Int)
    , _gupkPosition    :: !(Maybe Text)
    , _gupkUsagePlanId :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetUsagePlanKeys' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gupkNameQuery'
--
-- * 'gupkLimit'
--
-- * 'gupkPosition'
--
-- * 'gupkUsagePlanId'
getUsagePlanKeys
    :: Text -- ^ 'gupkUsagePlanId'
    -> GetUsagePlanKeys
getUsagePlanKeys pUsagePlanId_ =
    GetUsagePlanKeys'
    { _gupkNameQuery = Nothing
    , _gupkLimit = Nothing
    , _gupkPosition = Nothing
    , _gupkUsagePlanId = pUsagePlanId_
    }

-- | A query parameter specifying the name of the to-be-returned usage plan keys.
gupkNameQuery :: Lens' GetUsagePlanKeys (Maybe Text)
gupkNameQuery = lens _gupkNameQuery (\ s a -> s{_gupkNameQuery = a});

-- | A query parameter specifying the maximum number usage plan keys returned by the GET request.
gupkLimit :: Lens' GetUsagePlanKeys (Maybe Int)
gupkLimit = lens _gupkLimit (\ s a -> s{_gupkLimit = a});

-- | A query parameter specifying the zero-based index specifying the position of a usage plan key.
gupkPosition :: Lens' GetUsagePlanKeys (Maybe Text)
gupkPosition = lens _gupkPosition (\ s a -> s{_gupkPosition = a});

-- | The Id of the < UsagePlan> resource representing the usage plan containing the to-be-retrieved < UsagePlanKey> resource representing a plan customer.
gupkUsagePlanId :: Lens' GetUsagePlanKeys Text
gupkUsagePlanId = lens _gupkUsagePlanId (\ s a -> s{_gupkUsagePlanId = a});

instance AWSRequest GetUsagePlanKeys where
        type Rs GetUsagePlanKeys = GetUsagePlanKeysResponse
        request = get apiGateway
        response
          = receiveJSON
              (\ s h x ->
                 GetUsagePlanKeysResponse' <$>
                   (x .?> "item" .!@ mempty) <*> (x .?> "position") <*>
                     (pure (fromEnum s)))

instance Hashable GetUsagePlanKeys

instance NFData GetUsagePlanKeys

instance ToHeaders GetUsagePlanKeys where
        toHeaders
          = const
              (mconcat
                 ["Accept" =# ("application/json" :: ByteString)])

instance ToPath GetUsagePlanKeys where
        toPath GetUsagePlanKeys'{..}
          = mconcat
              ["/usageplans/", toBS _gupkUsagePlanId, "/keys"]

instance ToQuery GetUsagePlanKeys where
        toQuery GetUsagePlanKeys'{..}
          = mconcat
              ["name" =: _gupkNameQuery, "limit" =: _gupkLimit,
               "position" =: _gupkPosition]

-- | Represents the collection of usage plan keys added to usage plans for the associated API keys and, possibly, other types of keys.
--
-- <http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html Create and Use Usage Plans>
--
-- /See:/ 'getUsagePlanKeysResponse' smart constructor.
data GetUsagePlanKeysResponse a = GetUsagePlanKeysResponse'
    { _gupkrsItems          :: !(Maybe [UsagePlanKey])
    , _gupkrsPosition       :: !(Maybe Text)
    , _gupkrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetUsagePlanKeysResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gupkrsItems'
--
-- * 'gupkrsPosition'
--
-- * 'gupkrsResponseStatus'
getUsagePlanKeysResponse
    :: Int -- ^ 'gupkrsResponseStatus'
    -> GetUsagePlanKeysResponse (a)
getUsagePlanKeysResponse pResponseStatus_ =
    GetUsagePlanKeysResponse'
    { _gupkrsItems = Nothing
    , _gupkrsPosition = Nothing
    , _gupkrsResponseStatus = pResponseStatus_
    }

-- | Gets the current item of the usage plan keys collection.
gupkrsItems :: Lens' (GetUsagePlanKeysResponse (a)) [UsagePlanKey]
gupkrsItems = lens _gupkrsItems (\ s a -> s{_gupkrsItems = a}) . _Default . _Coerce;

-- | Undocumented member.
gupkrsPosition :: Lens' (GetUsagePlanKeysResponse (a)) (Maybe Text)
gupkrsPosition = lens _gupkrsPosition (\ s a -> s{_gupkrsPosition = a});

-- | The response status code.
gupkrsResponseStatus :: Lens' (GetUsagePlanKeysResponse (a)) Int
gupkrsResponseStatus = lens _gupkrsResponseStatus (\ s a -> s{_gupkrsResponseStatus = a});

instance NFData GetUsagePlanKeysResponse
