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
-- Module      : Network.AWS.APIGateway.GetUsagePlans
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets all the usage plans of the caller\'s account.
module Network.AWS.APIGateway.GetUsagePlans
    (
    -- * Creating a Request
      getUsagePlans
    , GetUsagePlans
    -- * Request Lenses
    , gupKeyId
    , gupLimit
    , gupPosition

    -- * Destructuring the Response
    , getUsagePlansResponse
    , GetUsagePlansResponse
    -- * Response Lenses
    , guprsItems
    , guprsPosition
    , guprsResponseStatus
    ) where

import           Network.AWS.APIGateway.Types
import           Network.AWS.APIGateway.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | The GET request to get all the usage plans of the caller\'s account.
--
-- /See:/ 'getUsagePlans' smart constructor.
data GetUsagePlans = GetUsagePlans'
    { _gupKeyId    :: !(Maybe Text)
    , _gupLimit    :: !(Maybe Int)
    , _gupPosition :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetUsagePlans' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gupKeyId'
--
-- * 'gupLimit'
--
-- * 'gupPosition'
getUsagePlans
    :: GetUsagePlans
getUsagePlans =
    GetUsagePlans'
    { _gupKeyId = Nothing
    , _gupLimit = Nothing
    , _gupPosition = Nothing
    }

-- | The identifier of the API key associated with the usage plans.
gupKeyId :: Lens' GetUsagePlans (Maybe Text)
gupKeyId = lens _gupKeyId (\ s a -> s{_gupKeyId = a});

-- | The number of < UsagePlan> resources to be returned as the result.
gupLimit :: Lens' GetUsagePlans (Maybe Int)
gupLimit = lens _gupLimit (\ s a -> s{_gupLimit = a});

-- | The zero-based array index specifying the position of the to-be-retrieved < UsagePlan> resource.
gupPosition :: Lens' GetUsagePlans (Maybe Text)
gupPosition = lens _gupPosition (\ s a -> s{_gupPosition = a});

instance AWSRequest GetUsagePlans where
        type Rs GetUsagePlans = GetUsagePlansResponse
        request = get apiGateway
        response
          = receiveJSON
              (\ s h x ->
                 GetUsagePlansResponse' <$>
                   (x .?> "item" .!@ mempty) <*> (x .?> "position") <*>
                     (pure (fromEnum s)))

instance Hashable GetUsagePlans

instance NFData GetUsagePlans

instance ToHeaders GetUsagePlans where
        toHeaders
          = const
              (mconcat
                 ["Accept" =# ("application/json" :: ByteString)])

instance ToPath GetUsagePlans where
        toPath = const "/usageplans"

instance ToQuery GetUsagePlans where
        toQuery GetUsagePlans'{..}
          = mconcat
              ["keyId" =: _gupKeyId, "limit" =: _gupLimit,
               "position" =: _gupPosition]

-- | Represents a collection of usage plans for an AWS account.
--
-- <http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html Create and Use Usage Plans>
--
-- /See:/ 'getUsagePlansResponse' smart constructor.
data GetUsagePlansResponse a = GetUsagePlansResponse'
    { _guprsItems          :: !(Maybe [UsagePlan])
    , _guprsPosition       :: !(Maybe Text)
    , _guprsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetUsagePlansResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'guprsItems'
--
-- * 'guprsPosition'
--
-- * 'guprsResponseStatus'
getUsagePlansResponse
    :: Int -- ^ 'guprsResponseStatus'
    -> GetUsagePlansResponse (a)
getUsagePlansResponse pResponseStatus_ =
    GetUsagePlansResponse'
    { _guprsItems = Nothing
    , _guprsPosition = Nothing
    , _guprsResponseStatus = pResponseStatus_
    }

-- | Gets the current item when enumerating the collection of < UsagePlan>.
guprsItems :: Lens' (GetUsagePlansResponse (a)) [UsagePlan]
guprsItems = lens _guprsItems (\ s a -> s{_guprsItems = a}) . _Default . _Coerce;

-- | Undocumented member.
guprsPosition :: Lens' (GetUsagePlansResponse (a)) (Maybe Text)
guprsPosition = lens _guprsPosition (\ s a -> s{_guprsPosition = a});

-- | The response status code.
guprsResponseStatus :: Lens' (GetUsagePlansResponse (a)) Int
guprsResponseStatus = lens _guprsResponseStatus (\ s a -> s{_guprsResponseStatus = a});

instance NFData GetUsagePlansResponse
