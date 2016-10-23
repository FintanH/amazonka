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
-- Module      : Network.AWS.ELBv2.ModifyLoadBalancerAttributes
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Modifies the specified attributes of the specified load balancer.
--
-- If any of the specified attributes can\'t be modified as requested, the call fails. Any existing attributes that you do not modify retain their current values.
module Network.AWS.ELBv2.ModifyLoadBalancerAttributes
    (
    -- * Creating a Request
      modifyLoadBalancerAttributes
    , ModifyLoadBalancerAttributes
    -- * Request Lenses
    , mlbaLoadBalancerARN
    , mlbaAttributes

    -- * Destructuring the Response
    , modifyLoadBalancerAttributesResponse
    , ModifyLoadBalancerAttributesResponse
    -- * Response Lenses
    , mlbarsAttributes
    , mlbarsResponseStatus
    ) where

import           Network.AWS.ELBv2.Types
import           Network.AWS.ELBv2.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains the parameters for ModifyLoadBalancerAttributes.
--
-- /See:/ 'modifyLoadBalancerAttributes' smart constructor.
data ModifyLoadBalancerAttributes = ModifyLoadBalancerAttributes'
    { _mlbaLoadBalancerARN :: !Text
    , _mlbaAttributes      :: ![LoadBalancerAttribute]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ModifyLoadBalancerAttributes' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mlbaLoadBalancerARN'
--
-- * 'mlbaAttributes'
modifyLoadBalancerAttributes
    :: Text -- ^ 'mlbaLoadBalancerARN'
    -> ModifyLoadBalancerAttributes
modifyLoadBalancerAttributes pLoadBalancerARN_ =
    ModifyLoadBalancerAttributes'
    { _mlbaLoadBalancerARN = pLoadBalancerARN_
    , _mlbaAttributes = mempty
    }

-- | The Amazon Resource Name (ARN) of the load balancer.
mlbaLoadBalancerARN :: Lens' ModifyLoadBalancerAttributes Text
mlbaLoadBalancerARN = lens _mlbaLoadBalancerARN (\ s a -> s{_mlbaLoadBalancerARN = a});

-- | The load balancer attributes.
mlbaAttributes :: Lens' ModifyLoadBalancerAttributes [LoadBalancerAttribute]
mlbaAttributes = lens _mlbaAttributes (\ s a -> s{_mlbaAttributes = a}) . _Coerce;

instance AWSRequest ModifyLoadBalancerAttributes
         where
        type Rs ModifyLoadBalancerAttributes =
             ModifyLoadBalancerAttributesResponse
        request = postQuery eLBv2
        response
          = receiveXMLWrapper
              "ModifyLoadBalancerAttributesResult"
              (\ s h x ->
                 ModifyLoadBalancerAttributesResponse' <$>
                   (x .@? "Attributes" .!@ mempty >>=
                      may (parseXMLList "member"))
                     <*> (pure (fromEnum s)))

instance Hashable ModifyLoadBalancerAttributes

instance NFData ModifyLoadBalancerAttributes

instance ToHeaders ModifyLoadBalancerAttributes where
        toHeaders = const mempty

instance ToPath ModifyLoadBalancerAttributes where
        toPath = const "/"

instance ToQuery ModifyLoadBalancerAttributes where
        toQuery ModifyLoadBalancerAttributes'{..}
          = mconcat
              ["Action" =:
                 ("ModifyLoadBalancerAttributes" :: ByteString),
               "Version" =: ("2015-12-01" :: ByteString),
               "LoadBalancerArn" =: _mlbaLoadBalancerARN,
               "Attributes" =: toQueryList "member" _mlbaAttributes]

-- | Contains the output of ModifyLoadBalancerAttributes.
--
-- /See:/ 'modifyLoadBalancerAttributesResponse' smart constructor.
data ModifyLoadBalancerAttributesResponse a = ModifyLoadBalancerAttributesResponse'
    { _mlbarsAttributes     :: !(Maybe [LoadBalancerAttribute])
    , _mlbarsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ModifyLoadBalancerAttributesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mlbarsAttributes'
--
-- * 'mlbarsResponseStatus'
modifyLoadBalancerAttributesResponse
    :: Int -- ^ 'mlbarsResponseStatus'
    -> ModifyLoadBalancerAttributesResponse (a)
modifyLoadBalancerAttributesResponse pResponseStatus_ =
    ModifyLoadBalancerAttributesResponse'
    { _mlbarsAttributes = Nothing
    , _mlbarsResponseStatus = pResponseStatus_
    }

-- | Information about the load balancer attributes.
mlbarsAttributes :: Lens' (ModifyLoadBalancerAttributesResponse (a)) [LoadBalancerAttribute]
mlbarsAttributes = lens _mlbarsAttributes (\ s a -> s{_mlbarsAttributes = a}) . _Default . _Coerce;

-- | The response status code.
mlbarsResponseStatus :: Lens' (ModifyLoadBalancerAttributesResponse (a)) Int
mlbarsResponseStatus = lens _mlbarsResponseStatus (\ s a -> s{_mlbarsResponseStatus = a});

instance NFData ModifyLoadBalancerAttributesResponse
