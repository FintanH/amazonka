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
-- Module      : Network.AWS.ELBv2.DescribeLoadBalancerAttributes
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Describes the attributes for the specified load balancer.
module Network.AWS.ELBv2.DescribeLoadBalancerAttributes
    (
    -- * Creating a Request
      describeLoadBalancerAttributes
    , DescribeLoadBalancerAttributes
    -- * Request Lenses
    , dlbaLoadBalancerARN

    -- * Destructuring the Response
    , describeLoadBalancerAttributesResponse
    , DescribeLoadBalancerAttributesResponse
    -- * Response Lenses
    , dlbarsAttributes
    , dlbarsResponseStatus
    ) where

import           Network.AWS.ELBv2.Types
import           Network.AWS.ELBv2.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains the parameters for DescribeLoadBalancerAttributes.
--
-- /See:/ 'describeLoadBalancerAttributes' smart constructor.
newtype DescribeLoadBalancerAttributes = DescribeLoadBalancerAttributes'
    { _dlbaLoadBalancerARN :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeLoadBalancerAttributes' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dlbaLoadBalancerARN'
describeLoadBalancerAttributes
    :: Text -- ^ 'dlbaLoadBalancerARN'
    -> DescribeLoadBalancerAttributes
describeLoadBalancerAttributes pLoadBalancerARN_ =
    DescribeLoadBalancerAttributes'
    { _dlbaLoadBalancerARN = pLoadBalancerARN_
    }

-- | The Amazon Resource Name (ARN) of the load balancer.
dlbaLoadBalancerARN :: Lens' DescribeLoadBalancerAttributes Text
dlbaLoadBalancerARN = lens _dlbaLoadBalancerARN (\ s a -> s{_dlbaLoadBalancerARN = a});

instance AWSRequest DescribeLoadBalancerAttributes
         where
        type Rs DescribeLoadBalancerAttributes =
             DescribeLoadBalancerAttributesResponse
        request = postQuery eLBv2
        response
          = receiveXMLWrapper
              "DescribeLoadBalancerAttributesResult"
              (\ s h x ->
                 DescribeLoadBalancerAttributesResponse' <$>
                   (x .@? "Attributes" .!@ mempty >>=
                      may (parseXMLList "member"))
                     <*> (pure (fromEnum s)))

instance Hashable DescribeLoadBalancerAttributes

instance NFData DescribeLoadBalancerAttributes

instance ToHeaders DescribeLoadBalancerAttributes
         where
        toHeaders = const mempty

instance ToPath DescribeLoadBalancerAttributes where
        toPath = const "/"

instance ToQuery DescribeLoadBalancerAttributes where
        toQuery DescribeLoadBalancerAttributes'{..}
          = mconcat
              ["Action" =:
                 ("DescribeLoadBalancerAttributes" :: ByteString),
               "Version" =: ("2015-12-01" :: ByteString),
               "LoadBalancerArn" =: _dlbaLoadBalancerARN]

-- | Contains the output of DescribeLoadBalancerAttributes.
--
-- /See:/ 'describeLoadBalancerAttributesResponse' smart constructor.
data DescribeLoadBalancerAttributesResponse a = DescribeLoadBalancerAttributesResponse'
    { _dlbarsAttributes     :: !(Maybe [LoadBalancerAttribute])
    , _dlbarsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeLoadBalancerAttributesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dlbarsAttributes'
--
-- * 'dlbarsResponseStatus'
describeLoadBalancerAttributesResponse
    :: Int -- ^ 'dlbarsResponseStatus'
    -> DescribeLoadBalancerAttributesResponse (a)
describeLoadBalancerAttributesResponse pResponseStatus_ =
    DescribeLoadBalancerAttributesResponse'
    { _dlbarsAttributes = Nothing
    , _dlbarsResponseStatus = pResponseStatus_
    }

-- | Information about the load balancer attributes.
dlbarsAttributes :: Lens' (DescribeLoadBalancerAttributesResponse (a)) [LoadBalancerAttribute]
dlbarsAttributes = lens _dlbarsAttributes (\ s a -> s{_dlbarsAttributes = a}) . _Default . _Coerce;

-- | The response status code.
dlbarsResponseStatus :: Lens' (DescribeLoadBalancerAttributesResponse (a)) Int
dlbarsResponseStatus = lens _dlbarsResponseStatus (\ s a -> s{_dlbarsResponseStatus = a});

instance NFData
         DescribeLoadBalancerAttributesResponse
