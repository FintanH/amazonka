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
-- Module      : Network.AWS.ElastiCache.CopySnapshot
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- The /CopySnapshot/ action makes a copy of an existing snapshot.
--
-- Users or groups that have permissions to use the /CopySnapshot/ API can create their own Amazon S3 buckets and copy snapshots to it. To control access to your snapshots, use an IAM policy to control who has the ability to use the /CopySnapshot/ API. For more information about using IAM to control the use of ElastiCache APIs, see <http://docs.aws.amazon.com/ElastiCache/latest/Snapshots.Exporting.html Exporting Snapshots> and <http://docs.aws.amazon.com/ElastiCache/latest/IAM.html Authentication & Access Control>.
--
-- __Erorr Message:__
--
-- -   __Error Message:__ The authenticated user does not have sufficient permissions to perform the desired activity.
--
--     __Solution:__ Contact your system administrator to get the needed permissions.
--
module Network.AWS.ElastiCache.CopySnapshot
    (
    -- * Creating a Request
      copySnapshot
    , CopySnapshot
    -- * Request Lenses
    , csTargetBucket
    , csSourceSnapshotName
    , csTargetSnapshotName

    -- * Destructuring the Response
    , copySnapshotResponse
    , CopySnapshotResponse
    -- * Response Lenses
    , csrsSnapshot
    , csrsResponseStatus
    ) where

import           Network.AWS.ElastiCache.Types
import           Network.AWS.ElastiCache.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Represents the input of a /CopySnapshotMessage/ action.
--
-- /See:/ 'copySnapshot' smart constructor.
data CopySnapshot = CopySnapshot'
    { _csTargetBucket       :: !(Maybe Text)
    , _csSourceSnapshotName :: !Text
    , _csTargetSnapshotName :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CopySnapshot' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'csTargetBucket'
--
-- * 'csSourceSnapshotName'
--
-- * 'csTargetSnapshotName'
copySnapshot
    :: Text -- ^ 'csSourceSnapshotName'
    -> Text -- ^ 'csTargetSnapshotName'
    -> CopySnapshot
copySnapshot pSourceSnapshotName_ pTargetSnapshotName_ =
    CopySnapshot'
    { _csTargetBucket = Nothing
    , _csSourceSnapshotName = pSourceSnapshotName_
    , _csTargetSnapshotName = pTargetSnapshotName_
    }

-- | The Amazon S3 bucket to which the snapshot will be exported. This parameter is used only when exporting a snapshot for external access.
--
-- When using this parameter to export a snapshot, be sure Amazon ElastiCache has the needed permissions to this S3 bucket. For more information, see <http://docs.aws.amazon.com/AmazonElastiCache/AmazonElastiCache/latest/UserGuide/Snapshots.Exporting.html#Snapshots.Exporting.GrantAccess Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket> in the /Amazon ElastiCache User Guide/.
--
-- __Error Messages:__
--
-- You could receive one of the following error messages.
--
-- __Erorr Messages__
--
-- -   __Error Message:__ ElastiCache has not been granted READ permissions %s on the S3 Bucket.
--
--     __Solution:__ Add List and Read permissions on the bucket.
--
-- -   __Error Message:__ ElastiCache has not been granted WRITE permissions %s on the S3 Bucket.
--
--     __Solution:__ Add Upload\/Delete permissions on the bucket.
--
-- -   __Error Message:__ ElastiCache has not been granted READ_ACP permissions %s on the S3 Bucket.
--
--     __Solution:__ Add View Permissions permissions on the bucket.
--
-- -   __Error Message:__ The S3 bucket %s is outside of the region.
--
--     __Solution:__ Before exporting your snapshot, create a new Amazon S3 bucket in the same region as your snapshot. For more information, see <http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/Snapshots.Exporting.html#Snapshots.Exporting.CreateBucket Step 1: Create an Amazon S3 Bucket>.
--
-- -   __Error Message:__ The S3 bucket %s does not exist.
--
--     __Solution:__ Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/Snapshots.Exporting.html#Snapshots.Exporting.CreateBucket Step 1: Create an Amazon S3 Bucket>.
--
-- -   __Error Message:__ The S3 bucket %s is not owned by the authenticated user.
--
--     __Solution:__ Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/Snapshots.Exporting.html#Snapshots.Exporting.CreateBucket Step 1: Create an Amazon S3 Bucket>.
--
-- -   __Error Message:__ The authenticated user does not have sufficient permissions to perform the desired activity.
--
--     __Solution:__ Contact your system administrator to get the needed permissions.
--
-- For more information, see <http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/Snapshots.Exporting.html Exporting a Snapshot> in the /Amazon ElastiCache User Guide/.
csTargetBucket :: Lens' CopySnapshot (Maybe Text)
csTargetBucket = lens _csTargetBucket (\ s a -> s{_csTargetBucket = a});

-- | The name of an existing snapshot from which to make a copy.
csSourceSnapshotName :: Lens' CopySnapshot Text
csSourceSnapshotName = lens _csSourceSnapshotName (\ s a -> s{_csSourceSnapshotName = a});

-- | A name for the snapshot copy. ElastiCache does not permit overwriting a snapshot, therefore this name must be unique within its context - ElastiCache or an Amazon S3 bucket if exporting.
--
-- __Error Message__
--
-- -   __Error Message:__ The S3 bucket %s already contains an object with key %s.
--
--     __Solution:__ Give the /TargetSnapshotName/ a new and unique value. If exporting a snapshot, you could alternatively create a new Amazon S3 bucket and use this same value for /TargetSnapshotName/.
--
csTargetSnapshotName :: Lens' CopySnapshot Text
csTargetSnapshotName = lens _csTargetSnapshotName (\ s a -> s{_csTargetSnapshotName = a});

instance AWSRequest CopySnapshot where
        type Rs CopySnapshot = CopySnapshotResponse
        request = postQuery elastiCache
        response
          = receiveXMLWrapper "CopySnapshotResult"
              (\ s h x ->
                 CopySnapshotResponse' <$>
                   (x .@? "Snapshot") <*> (pure (fromEnum s)))

instance Hashable CopySnapshot

instance NFData CopySnapshot

instance ToHeaders CopySnapshot where
        toHeaders = const mempty

instance ToPath CopySnapshot where
        toPath = const "/"

instance ToQuery CopySnapshot where
        toQuery CopySnapshot'{..}
          = mconcat
              ["Action" =: ("CopySnapshot" :: ByteString),
               "Version" =: ("2015-02-02" :: ByteString),
               "TargetBucket" =: _csTargetBucket,
               "SourceSnapshotName" =: _csSourceSnapshotName,
               "TargetSnapshotName" =: _csTargetSnapshotName]

-- | /See:/ 'copySnapshotResponse' smart constructor.
data CopySnapshotResponse a = CopySnapshotResponse'
    { _csrsSnapshot       :: !(Maybe Snapshot)
    , _csrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CopySnapshotResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'csrsSnapshot'
--
-- * 'csrsResponseStatus'
copySnapshotResponse
    :: Int -- ^ 'csrsResponseStatus'
    -> CopySnapshotResponse (a)
copySnapshotResponse pResponseStatus_ =
    CopySnapshotResponse'
    { _csrsSnapshot = Nothing
    , _csrsResponseStatus = pResponseStatus_
    }

-- | Undocumented member.
csrsSnapshot :: Lens' (CopySnapshotResponse (a)) (Maybe Snapshot)
csrsSnapshot = lens _csrsSnapshot (\ s a -> s{_csrsSnapshot = a});

-- | The response status code.
csrsResponseStatus :: Lens' (CopySnapshotResponse (a)) Int
csrsResponseStatus = lens _csrsResponseStatus (\ s a -> s{_csrsResponseStatus = a});

instance NFData CopySnapshotResponse
