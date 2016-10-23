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
-- Module      : Network.AWS.Snowball.CreateJob
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a job to import or export data between Amazon S3 and your on-premises data center. Note that your AWS account must have the right trust policies and permissions in place to create a job for Snowball. For more information, see < api-reference-policies>.
module Network.AWS.Snowball.CreateJob
    (
    -- * Creating a Request
      createJob
    , CreateJob
    -- * Request Lenses
    , cjKMSKeyARN
    , cjNotification
    , cjDescription
    , cjSnowballCapacityPreference
    , cjJobType
    , cjResources
    , cjAddressId
    , cjRoleARN
    , cjShippingOption

    -- * Destructuring the Response
    , createJobResponse
    , CreateJobResponse
    -- * Response Lenses
    , cjrsJobId
    , cjrsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.Snowball.Types
import           Network.AWS.Snowball.Types.Product

-- | /See:/ 'createJob' smart constructor.
data CreateJob = CreateJob'
    { _cjKMSKeyARN                  :: !(Maybe Text)
    , _cjNotification               :: !(Maybe Notification)
    , _cjDescription                :: !(Maybe Text)
    , _cjSnowballCapacityPreference :: !(Maybe SnowballCapacity)
    , _cjJobType                    :: !JobType
    , _cjResources                  :: !JobResource
    , _cjAddressId                  :: !Text
    , _cjRoleARN                    :: !Text
    , _cjShippingOption             :: !ShippingOption
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CreateJob' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cjKMSKeyARN'
--
-- * 'cjNotification'
--
-- * 'cjDescription'
--
-- * 'cjSnowballCapacityPreference'
--
-- * 'cjJobType'
--
-- * 'cjResources'
--
-- * 'cjAddressId'
--
-- * 'cjRoleARN'
--
-- * 'cjShippingOption'
createJob
    :: JobType -- ^ 'cjJobType'
    -> JobResource -- ^ 'cjResources'
    -> Text -- ^ 'cjAddressId'
    -> Text -- ^ 'cjRoleARN'
    -> ShippingOption -- ^ 'cjShippingOption'
    -> CreateJob
createJob pJobType_ pResources_ pAddressId_ pRoleARN_ pShippingOption_ =
    CreateJob'
    { _cjKMSKeyARN = Nothing
    , _cjNotification = Nothing
    , _cjDescription = Nothing
    , _cjSnowballCapacityPreference = Nothing
    , _cjJobType = pJobType_
    , _cjResources = pResources_
    , _cjAddressId = pAddressId_
    , _cjRoleARN = pRoleARN_
    , _cjShippingOption = pShippingOption_
    }

-- | The 'KmsKeyARN' that you want to associate with this job. 'KmsKeyARN's are created using the <http://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html CreateKey> AWS Key Management Service (KMS) API action.
cjKMSKeyARN :: Lens' CreateJob (Maybe Text)
cjKMSKeyARN = lens _cjKMSKeyARN (\ s a -> s{_cjKMSKeyARN = a});

-- | Defines the Amazon Simple Notification Service (Amazon SNS) notification settings for this job.
cjNotification :: Lens' CreateJob (Maybe Notification)
cjNotification = lens _cjNotification (\ s a -> s{_cjNotification = a});

-- | Defines an optional description of this specific job, for example 'Important Photos 2016-08-11'.
cjDescription :: Lens' CreateJob (Maybe Text)
cjDescription = lens _cjDescription (\ s a -> s{_cjDescription = a});

-- | If your job is being created in one of the US regions, you have the option of specifying what size Snowball you\'d like for this job. In all other regions, Snowballs come with 80 TB in storage capacity.
cjSnowballCapacityPreference :: Lens' CreateJob (Maybe SnowballCapacity)
cjSnowballCapacityPreference = lens _cjSnowballCapacityPreference (\ s a -> s{_cjSnowballCapacityPreference = a});

-- | Defines the type of job that you\'re creating.
cjJobType :: Lens' CreateJob JobType
cjJobType = lens _cjJobType (\ s a -> s{_cjJobType = a});

-- | Defines the Amazon S3 buckets associated with this job.
--
-- With 'IMPORT' jobs, you specify the bucket or buckets that your transferred data will be imported into.
--
-- With 'EXPORT' jobs, you specify the bucket or buckets that your transferred data will be exported from. Optionally, you can also specify a 'KeyRange' value. If you choose to export a range, you define the length of the range by providing either an inclusive 'BeginMarker' value, an inclusive 'EndMarker' value, or both. Ranges are UTF-8 binary sorted.
cjResources :: Lens' CreateJob JobResource
cjResources = lens _cjResources (\ s a -> s{_cjResources = a});

-- | The ID for the address that you want the Snowball shipped to.
cjAddressId :: Lens' CreateJob Text
cjAddressId = lens _cjAddressId (\ s a -> s{_cjAddressId = a});

-- | The 'RoleARN' that you want to associate with this job. 'RoleArn's are created using the <http://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html CreateRole> AWS Identity and Access Management (IAM) API action.
cjRoleARN :: Lens' CreateJob Text
cjRoleARN = lens _cjRoleARN (\ s a -> s{_cjRoleARN = a});

-- | The shipping speed for this job. Note that this speed does not dictate how soon you\'ll get the Snowball, rather it represents how quickly the Snowball moves to its destination while in transit. Regional shipping speeds are as follows:
--
-- -   In Australia, you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day.
--
-- -   In the European Union (EU), you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.
--
-- -   In India, Snowballs are delivered in one to seven days.
--
-- -   In the US, you have access to one-day shipping and two-day shipping.
--
cjShippingOption :: Lens' CreateJob ShippingOption
cjShippingOption = lens _cjShippingOption (\ s a -> s{_cjShippingOption = a});

instance AWSRequest CreateJob where
        type Rs CreateJob = CreateJobResponse
        request = postJSON snowball
        response
          = receiveJSON
              (\ s h x ->
                 CreateJobResponse' <$>
                   (x .?> "JobId") <*> (pure (fromEnum s)))

instance Hashable CreateJob

instance NFData CreateJob

instance ToHeaders CreateJob where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AWSIESnowballJobManagementService.CreateJob" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON CreateJob where
        toJSON CreateJob'{..}
          = object
              (catMaybes
                 [("KmsKeyARN" .=) <$> _cjKMSKeyARN,
                  ("Notification" .=) <$> _cjNotification,
                  ("Description" .=) <$> _cjDescription,
                  ("SnowballCapacityPreference" .=) <$>
                    _cjSnowballCapacityPreference,
                  Just ("JobType" .= _cjJobType),
                  Just ("Resources" .= _cjResources),
                  Just ("AddressId" .= _cjAddressId),
                  Just ("RoleARN" .= _cjRoleARN),
                  Just ("ShippingOption" .= _cjShippingOption)])

instance ToPath CreateJob where
        toPath = const "/"

instance ToQuery CreateJob where
        toQuery = const mempty

-- | /See:/ 'createJobResponse' smart constructor.
data CreateJobResponse a = CreateJobResponse'
    { _cjrsJobId          :: !(Maybe Text)
    , _cjrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CreateJobResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cjrsJobId'
--
-- * 'cjrsResponseStatus'
createJobResponse
    :: Int -- ^ 'cjrsResponseStatus'
    -> CreateJobResponse (a)
createJobResponse pResponseStatus_ =
    CreateJobResponse'
    { _cjrsJobId = Nothing
    , _cjrsResponseStatus = pResponseStatus_
    }

-- | The automatically generated ID for a job, for example 'JID123e4567-e89b-12d3-a456-426655440000'.
cjrsJobId :: Lens' (CreateJobResponse (a)) (Maybe Text)
cjrsJobId = lens _cjrsJobId (\ s a -> s{_cjrsJobId = a});

-- | The response status code.
cjrsResponseStatus :: Lens' (CreateJobResponse (a)) Int
cjrsResponseStatus = lens _cjrsResponseStatus (\ s a -> s{_cjrsResponseStatus = a});

instance NFData CreateJobResponse
