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
-- Module      : Network.AWS.ELBv2.CreateListener
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a listener for the specified Application load balancer.
--
-- To update a listener, use < ModifyListener>. When you are finished with a listener, you can delete it using < DeleteListener>. If you are finished with both the listener and the load balancer, you can delete them both using < DeleteLoadBalancer>.
--
-- For more information, see <http://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html Listeners for Your Application Load Balancers> in the /Application Load Balancers Guide/.
module Network.AWS.ELBv2.CreateListener
    (
    -- * Creating a Request
      createListener
    , CreateListener
    -- * Request Lenses
    , clSSLPolicy
    , clCertificates
    , clLoadBalancerARN
    , clProtocol
    , clPort
    , clDefaultActions

    -- * Destructuring the Response
    , createListenerResponse
    , CreateListenerResponse
    -- * Response Lenses
    , clrsListeners
    , clrsResponseStatus
    ) where

import           Network.AWS.ELBv2.Types
import           Network.AWS.ELBv2.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains the parameters for CreateListener.
--
-- /See:/ 'createListener' smart constructor.
data CreateListener = CreateListener'
    { _clSSLPolicy       :: !(Maybe Text)
    , _clCertificates    :: !(Maybe [Certificate])
    , _clLoadBalancerARN :: !Text
    , _clProtocol        :: !ProtocolEnum
    , _clPort            :: !Nat
    , _clDefaultActions  :: ![Action]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CreateListener' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'clSSLPolicy'
--
-- * 'clCertificates'
--
-- * 'clLoadBalancerARN'
--
-- * 'clProtocol'
--
-- * 'clPort'
--
-- * 'clDefaultActions'
createListener
    :: Text -- ^ 'clLoadBalancerARN'
    -> ProtocolEnum -- ^ 'clProtocol'
    -> Natural -- ^ 'clPort'
    -> CreateListener
createListener pLoadBalancerARN_ pProtocol_ pPort_ =
    CreateListener'
    { _clSSLPolicy = Nothing
    , _clCertificates = Nothing
    , _clLoadBalancerARN = pLoadBalancerARN_
    , _clProtocol = pProtocol_
    , _clPort = _Nat # pPort_
    , _clDefaultActions = mempty
    }

-- | The security policy that defines which ciphers and protocols are supported. The default is the current predefined security policy.
clSSLPolicy :: Lens' CreateListener (Maybe Text)
clSSLPolicy = lens _clSSLPolicy (\ s a -> s{_clSSLPolicy = a});

-- | The SSL server certificate. You must provide exactly one certificate if the protocol is HTTPS.
clCertificates :: Lens' CreateListener [Certificate]
clCertificates = lens _clCertificates (\ s a -> s{_clCertificates = a}) . _Default . _Coerce;

-- | The Amazon Resource Name (ARN) of the load balancer.
clLoadBalancerARN :: Lens' CreateListener Text
clLoadBalancerARN = lens _clLoadBalancerARN (\ s a -> s{_clLoadBalancerARN = a});

-- | The protocol for connections from clients to the load balancer.
clProtocol :: Lens' CreateListener ProtocolEnum
clProtocol = lens _clProtocol (\ s a -> s{_clProtocol = a});

-- | The port on which the load balancer is listening.
clPort :: Lens' CreateListener Natural
clPort = lens _clPort (\ s a -> s{_clPort = a}) . _Nat;

-- | The default actions for the listener.
clDefaultActions :: Lens' CreateListener [Action]
clDefaultActions = lens _clDefaultActions (\ s a -> s{_clDefaultActions = a}) . _Coerce;

instance AWSRequest CreateListener where
        type Rs CreateListener = CreateListenerResponse
        request = postQuery eLBv2
        response
          = receiveXMLWrapper "CreateListenerResult"
              (\ s h x ->
                 CreateListenerResponse' <$>
                   (x .@? "Listeners" .!@ mempty >>=
                      may (parseXMLList "member"))
                     <*> (pure (fromEnum s)))

instance Hashable CreateListener

instance NFData CreateListener

instance ToHeaders CreateListener where
        toHeaders = const mempty

instance ToPath CreateListener where
        toPath = const "/"

instance ToQuery CreateListener where
        toQuery CreateListener'{..}
          = mconcat
              ["Action" =: ("CreateListener" :: ByteString),
               "Version" =: ("2015-12-01" :: ByteString),
               "SslPolicy" =: _clSSLPolicy,
               "Certificates" =:
                 toQuery (toQueryList "member" <$> _clCertificates),
               "LoadBalancerArn" =: _clLoadBalancerARN,
               "Protocol" =: _clProtocol, "Port" =: _clPort,
               "DefaultActions" =:
                 toQueryList "member" _clDefaultActions]

-- | Contains the output of CreateListener.
--
-- /See:/ 'createListenerResponse' smart constructor.
data CreateListenerResponse a = CreateListenerResponse'
    { _clrsListeners      :: !(Maybe [Listener])
    , _clrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CreateListenerResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'clrsListeners'
--
-- * 'clrsResponseStatus'
createListenerResponse
    :: Int -- ^ 'clrsResponseStatus'
    -> CreateListenerResponse (a)
createListenerResponse pResponseStatus_ =
    CreateListenerResponse'
    { _clrsListeners = Nothing
    , _clrsResponseStatus = pResponseStatus_
    }

-- | Information about the listener.
clrsListeners :: Lens' (CreateListenerResponse (a)) [Listener]
clrsListeners = lens _clrsListeners (\ s a -> s{_clrsListeners = a}) . _Default . _Coerce;

-- | The response status code.
clrsResponseStatus :: Lens' (CreateListenerResponse (a)) Int
clrsResponseStatus = lens _clrsResponseStatus (\ s a -> s{_clrsResponseStatus = a});

instance NFData CreateListenerResponse
