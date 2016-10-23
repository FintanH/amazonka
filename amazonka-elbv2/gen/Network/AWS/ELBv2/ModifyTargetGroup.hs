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
-- Module      : Network.AWS.ELBv2.ModifyTargetGroup
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Modifies the health checks used when evaluating the health state of the targets in the specified target group.
--
-- To monitor the health of the targets, use < DescribeTargetHealth>.
module Network.AWS.ELBv2.ModifyTargetGroup
    (
    -- * Creating a Request
      modifyTargetGroup
    , ModifyTargetGroup
    -- * Request Lenses
    , mtgMatcher
    , mtgHealthCheckPath
    , mtgUnhealthyThresholdCount
    , mtgHealthCheckIntervalSeconds
    , mtgHealthyThresholdCount
    , mtgHealthCheckProtocol
    , mtgHealthCheckTimeoutSeconds
    , mtgHealthCheckPort
    , mtgTargetGroupARN

    -- * Destructuring the Response
    , modifyTargetGroupResponse
    , ModifyTargetGroupResponse
    -- * Response Lenses
    , mtgrsTargetGroups
    , mtgrsResponseStatus
    ) where

import           Network.AWS.ELBv2.Types
import           Network.AWS.ELBv2.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains the parameters for ModifyTargetGroup.
--
-- /See:/ 'modifyTargetGroup' smart constructor.
data ModifyTargetGroup = ModifyTargetGroup'
    { _mtgMatcher                    :: !(Maybe Matcher)
    , _mtgHealthCheckPath            :: !(Maybe Text)
    , _mtgUnhealthyThresholdCount    :: !(Maybe Nat)
    , _mtgHealthCheckIntervalSeconds :: !(Maybe Nat)
    , _mtgHealthyThresholdCount      :: !(Maybe Nat)
    , _mtgHealthCheckProtocol        :: !(Maybe ProtocolEnum)
    , _mtgHealthCheckTimeoutSeconds  :: !(Maybe Nat)
    , _mtgHealthCheckPort            :: !(Maybe Text)
    , _mtgTargetGroupARN             :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ModifyTargetGroup' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mtgMatcher'
--
-- * 'mtgHealthCheckPath'
--
-- * 'mtgUnhealthyThresholdCount'
--
-- * 'mtgHealthCheckIntervalSeconds'
--
-- * 'mtgHealthyThresholdCount'
--
-- * 'mtgHealthCheckProtocol'
--
-- * 'mtgHealthCheckTimeoutSeconds'
--
-- * 'mtgHealthCheckPort'
--
-- * 'mtgTargetGroupARN'
modifyTargetGroup
    :: Text -- ^ 'mtgTargetGroupARN'
    -> ModifyTargetGroup
modifyTargetGroup pTargetGroupARN_ =
    ModifyTargetGroup'
    { _mtgMatcher = Nothing
    , _mtgHealthCheckPath = Nothing
    , _mtgUnhealthyThresholdCount = Nothing
    , _mtgHealthCheckIntervalSeconds = Nothing
    , _mtgHealthyThresholdCount = Nothing
    , _mtgHealthCheckProtocol = Nothing
    , _mtgHealthCheckTimeoutSeconds = Nothing
    , _mtgHealthCheckPort = Nothing
    , _mtgTargetGroupARN = pTargetGroupARN_
    }

-- | The HTTP codes to use when checking for a successful response from a target.
mtgMatcher :: Lens' ModifyTargetGroup (Maybe Matcher)
mtgMatcher = lens _mtgMatcher (\ s a -> s{_mtgMatcher = a});

-- | The ping path that is the destination for the health check request.
mtgHealthCheckPath :: Lens' ModifyTargetGroup (Maybe Text)
mtgHealthCheckPath = lens _mtgHealthCheckPath (\ s a -> s{_mtgHealthCheckPath = a});

-- | The number of consecutive health check failures required before considering the target unhealthy.
mtgUnhealthyThresholdCount :: Lens' ModifyTargetGroup (Maybe Natural)
mtgUnhealthyThresholdCount = lens _mtgUnhealthyThresholdCount (\ s a -> s{_mtgUnhealthyThresholdCount = a}) . mapping _Nat;

-- | The approximate amount of time, in seconds, between health checks of an individual target.
mtgHealthCheckIntervalSeconds :: Lens' ModifyTargetGroup (Maybe Natural)
mtgHealthCheckIntervalSeconds = lens _mtgHealthCheckIntervalSeconds (\ s a -> s{_mtgHealthCheckIntervalSeconds = a}) . mapping _Nat;

-- | The number of consecutive health checks successes required before considering an unhealthy target healthy.
mtgHealthyThresholdCount :: Lens' ModifyTargetGroup (Maybe Natural)
mtgHealthyThresholdCount = lens _mtgHealthyThresholdCount (\ s a -> s{_mtgHealthyThresholdCount = a}) . mapping _Nat;

-- | The protocol to use to connect with the target.
mtgHealthCheckProtocol :: Lens' ModifyTargetGroup (Maybe ProtocolEnum)
mtgHealthCheckProtocol = lens _mtgHealthCheckProtocol (\ s a -> s{_mtgHealthCheckProtocol = a});

-- | The amount of time, in seconds, during which no response means a failed health check.
mtgHealthCheckTimeoutSeconds :: Lens' ModifyTargetGroup (Maybe Natural)
mtgHealthCheckTimeoutSeconds = lens _mtgHealthCheckTimeoutSeconds (\ s a -> s{_mtgHealthCheckTimeoutSeconds = a}) . mapping _Nat;

-- | The port to use to connect with the target.
mtgHealthCheckPort :: Lens' ModifyTargetGroup (Maybe Text)
mtgHealthCheckPort = lens _mtgHealthCheckPort (\ s a -> s{_mtgHealthCheckPort = a});

-- | The Amazon Resource Name (ARN) of the target group.
mtgTargetGroupARN :: Lens' ModifyTargetGroup Text
mtgTargetGroupARN = lens _mtgTargetGroupARN (\ s a -> s{_mtgTargetGroupARN = a});

instance AWSRequest ModifyTargetGroup where
        type Rs ModifyTargetGroup = ModifyTargetGroupResponse
        request = postQuery eLBv2
        response
          = receiveXMLWrapper "ModifyTargetGroupResult"
              (\ s h x ->
                 ModifyTargetGroupResponse' <$>
                   (x .@? "TargetGroups" .!@ mempty >>=
                      may (parseXMLList "member"))
                     <*> (pure (fromEnum s)))

instance Hashable ModifyTargetGroup

instance NFData ModifyTargetGroup

instance ToHeaders ModifyTargetGroup where
        toHeaders = const mempty

instance ToPath ModifyTargetGroup where
        toPath = const "/"

instance ToQuery ModifyTargetGroup where
        toQuery ModifyTargetGroup'{..}
          = mconcat
              ["Action" =: ("ModifyTargetGroup" :: ByteString),
               "Version" =: ("2015-12-01" :: ByteString),
               "Matcher" =: _mtgMatcher,
               "HealthCheckPath" =: _mtgHealthCheckPath,
               "UnhealthyThresholdCount" =:
                 _mtgUnhealthyThresholdCount,
               "HealthCheckIntervalSeconds" =:
                 _mtgHealthCheckIntervalSeconds,
               "HealthyThresholdCount" =: _mtgHealthyThresholdCount,
               "HealthCheckProtocol" =: _mtgHealthCheckProtocol,
               "HealthCheckTimeoutSeconds" =:
                 _mtgHealthCheckTimeoutSeconds,
               "HealthCheckPort" =: _mtgHealthCheckPort,
               "TargetGroupArn" =: _mtgTargetGroupARN]

-- | Contains the output of ModifyTargetGroup.
--
-- /See:/ 'modifyTargetGroupResponse' smart constructor.
data ModifyTargetGroupResponse a = ModifyTargetGroupResponse'
    { _mtgrsTargetGroups   :: !(Maybe [TargetGroup])
    , _mtgrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ModifyTargetGroupResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mtgrsTargetGroups'
--
-- * 'mtgrsResponseStatus'
modifyTargetGroupResponse
    :: Int -- ^ 'mtgrsResponseStatus'
    -> ModifyTargetGroupResponse (a)
modifyTargetGroupResponse pResponseStatus_ =
    ModifyTargetGroupResponse'
    { _mtgrsTargetGroups = Nothing
    , _mtgrsResponseStatus = pResponseStatus_
    }

-- | Information about the target group.
mtgrsTargetGroups :: Lens' (ModifyTargetGroupResponse (a)) [TargetGroup]
mtgrsTargetGroups = lens _mtgrsTargetGroups (\ s a -> s{_mtgrsTargetGroups = a}) . _Default . _Coerce;

-- | The response status code.
mtgrsResponseStatus :: Lens' (ModifyTargetGroupResponse (a)) Int
mtgrsResponseStatus = lens _mtgrsResponseStatus (\ s a -> s{_mtgrsResponseStatus = a});

instance NFData ModifyTargetGroupResponse
