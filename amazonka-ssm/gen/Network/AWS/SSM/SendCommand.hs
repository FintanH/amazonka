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
-- Module      : Network.AWS.SSM.SendCommand
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Executes commands on one or more remote instances.
module Network.AWS.SSM.SendCommand
    (
    -- * Creating a Request
      sendCommand
    , SendCommand
    -- * Request Lenses
    , scServiceRoleARN
    , scNotificationConfig
    , scDocumentHashType
    , scOutputS3KeyPrefix
    , scParameters
    , scDocumentHash
    , scTimeoutSeconds
    , scComment
    , scOutputS3BucketName
    , scInstanceIds
    , scDocumentName

    -- * Destructuring the Response
    , sendCommandResponse
    , SendCommandResponse
    -- * Response Lenses
    , scrsCommand
    , scrsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SSM.Types
import           Network.AWS.SSM.Types.Product

-- | /See:/ 'sendCommand' smart constructor.
data SendCommand = SendCommand'
    { _scServiceRoleARN     :: !(Maybe Text)
    , _scNotificationConfig :: !(Maybe NotificationConfig)
    , _scDocumentHashType   :: !(Maybe DocumentHashType)
    , _scOutputS3KeyPrefix  :: !(Maybe Text)
    , _scParameters         :: !(Maybe (Map Text [Text]))
    , _scDocumentHash       :: !(Maybe Text)
    , _scTimeoutSeconds     :: !(Maybe Nat)
    , _scComment            :: !(Maybe Text)
    , _scOutputS3BucketName :: !(Maybe Text)
    , _scInstanceIds        :: !(List1 Text)
    , _scDocumentName       :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'SendCommand' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'scServiceRoleARN'
--
-- * 'scNotificationConfig'
--
-- * 'scDocumentHashType'
--
-- * 'scOutputS3KeyPrefix'
--
-- * 'scParameters'
--
-- * 'scDocumentHash'
--
-- * 'scTimeoutSeconds'
--
-- * 'scComment'
--
-- * 'scOutputS3BucketName'
--
-- * 'scInstanceIds'
--
-- * 'scDocumentName'
sendCommand
    :: NonEmpty Text -- ^ 'scInstanceIds'
    -> Text -- ^ 'scDocumentName'
    -> SendCommand
sendCommand pInstanceIds_ pDocumentName_ =
    SendCommand'
    { _scServiceRoleARN = Nothing
    , _scNotificationConfig = Nothing
    , _scDocumentHashType = Nothing
    , _scOutputS3KeyPrefix = Nothing
    , _scParameters = Nothing
    , _scDocumentHash = Nothing
    , _scTimeoutSeconds = Nothing
    , _scComment = Nothing
    , _scOutputS3BucketName = Nothing
    , _scInstanceIds = _List1 # pInstanceIds_
    , _scDocumentName = pDocumentName_
    }

-- | The IAM role that SSM uses to send notifications.
scServiceRoleARN :: Lens' SendCommand (Maybe Text)
scServiceRoleARN = lens _scServiceRoleARN (\ s a -> s{_scServiceRoleARN = a});

-- | Configurations for sending notifications.
scNotificationConfig :: Lens' SendCommand (Maybe NotificationConfig)
scNotificationConfig = lens _scNotificationConfig (\ s a -> s{_scNotificationConfig = a});

-- | Sha256 or Sha1.
--
-- Sha1 hashes have been deprecated.
scDocumentHashType :: Lens' SendCommand (Maybe DocumentHashType)
scDocumentHashType = lens _scDocumentHashType (\ s a -> s{_scDocumentHashType = a});

-- | The directory structure within the S3 bucket where the responses should be stored.
scOutputS3KeyPrefix :: Lens' SendCommand (Maybe Text)
scOutputS3KeyPrefix = lens _scOutputS3KeyPrefix (\ s a -> s{_scOutputS3KeyPrefix = a});

-- | The required and optional parameters specified in the SSM document being executed.
scParameters :: Lens' SendCommand (HashMap Text [Text])
scParameters = lens _scParameters (\ s a -> s{_scParameters = a}) . _Default . _Map;

-- | The Sha256 or Sha1 hash created by the system when the document was created.
--
-- Sha1 hashes have been deprecated.
scDocumentHash :: Lens' SendCommand (Maybe Text)
scDocumentHash = lens _scDocumentHash (\ s a -> s{_scDocumentHash = a});

-- | If this time is reached and the command has not already started executing, it will not execute.
scTimeoutSeconds :: Lens' SendCommand (Maybe Natural)
scTimeoutSeconds = lens _scTimeoutSeconds (\ s a -> s{_scTimeoutSeconds = a}) . mapping _Nat;

-- | User-specified information about the command, such as a brief description of what the command should do.
scComment :: Lens' SendCommand (Maybe Text)
scComment = lens _scComment (\ s a -> s{_scComment = a});

-- | The name of the S3 bucket where command execution responses should be stored.
scOutputS3BucketName :: Lens' SendCommand (Maybe Text)
scOutputS3BucketName = lens _scOutputS3BucketName (\ s a -> s{_scOutputS3BucketName = a});

-- | Required. The instance IDs where the command should execute. You can specify a maximum of 50 IDs.
scInstanceIds :: Lens' SendCommand (NonEmpty Text)
scInstanceIds = lens _scInstanceIds (\ s a -> s{_scInstanceIds = a}) . _List1;

-- | Required. The name of the SSM document to execute. This can be an SSM public document or a custom document.
scDocumentName :: Lens' SendCommand Text
scDocumentName = lens _scDocumentName (\ s a -> s{_scDocumentName = a});

instance AWSRequest SendCommand where
        type Rs SendCommand = SendCommandResponse
        request = postJSON ssm
        response
          = receiveJSON
              (\ s h x ->
                 SendCommandResponse' <$>
                   (x .?> "Command") <*> (pure (fromEnum s)))

instance Hashable SendCommand

instance NFData SendCommand

instance ToHeaders SendCommand where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonSSM.SendCommand" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON SendCommand where
        toJSON SendCommand'{..}
          = object
              (catMaybes
                 [("ServiceRoleArn" .=) <$> _scServiceRoleARN,
                  ("NotificationConfig" .=) <$> _scNotificationConfig,
                  ("DocumentHashType" .=) <$> _scDocumentHashType,
                  ("OutputS3KeyPrefix" .=) <$> _scOutputS3KeyPrefix,
                  ("Parameters" .=) <$> _scParameters,
                  ("DocumentHash" .=) <$> _scDocumentHash,
                  ("TimeoutSeconds" .=) <$> _scTimeoutSeconds,
                  ("Comment" .=) <$> _scComment,
                  ("OutputS3BucketName" .=) <$> _scOutputS3BucketName,
                  Just ("InstanceIds" .= _scInstanceIds),
                  Just ("DocumentName" .= _scDocumentName)])

instance ToPath SendCommand where
        toPath = const "/"

instance ToQuery SendCommand where
        toQuery = const mempty

-- | /See:/ 'sendCommandResponse' smart constructor.
data SendCommandResponse a = SendCommandResponse'
    { _scrsCommand        :: !(Maybe Command)
    , _scrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'SendCommandResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'scrsCommand'
--
-- * 'scrsResponseStatus'
sendCommandResponse
    :: Int -- ^ 'scrsResponseStatus'
    -> SendCommandResponse (a)
sendCommandResponse pResponseStatus_ =
    SendCommandResponse'
    { _scrsCommand = Nothing
    , _scrsResponseStatus = pResponseStatus_
    }

-- | The request as it was received by SSM. Also provides the command ID which can be used future references to this request.
scrsCommand :: Lens' (SendCommandResponse (a)) (Maybe Command)
scrsCommand = lens _scrsCommand (\ s a -> s{_scrsCommand = a});

-- | The response status code.
scrsResponseStatus :: Lens' (SendCommandResponse (a)) Int
scrsResponseStatus = lens _scrsResponseStatus (\ s a -> s{_scrsResponseStatus = a});

instance NFData SendCommandResponse
