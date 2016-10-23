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
-- Module      : Network.AWS.ServiceCatalog.DescribeRecord
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves a paginated list of the full details of a specific request. Use this operation after calling a request operation (< ProvisionProduct>, < TerminateProvisionedProduct>, or < UpdateProvisionedProduct>).
module Network.AWS.ServiceCatalog.DescribeRecord
    (
    -- * Creating a Request
      describeRecord
    , DescribeRecord
    -- * Request Lenses
    , drAcceptLanguage
    , drPageToken
    , drPageSize
    , drId

    -- * Destructuring the Response
    , describeRecordResponse
    , DescribeRecordResponse
    -- * Response Lenses
    , drrsRecordDetail
    , drrsNextPageToken
    , drrsRecordOutputs
    , drrsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.ServiceCatalog.Types
import           Network.AWS.ServiceCatalog.Types.Product

-- | /See:/ 'describeRecord' smart constructor.
data DescribeRecord = DescribeRecord'
    { _drAcceptLanguage :: !(Maybe Text)
    , _drPageToken      :: !(Maybe Text)
    , _drPageSize       :: !(Maybe Nat)
    , _drId             :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeRecord' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'drAcceptLanguage'
--
-- * 'drPageToken'
--
-- * 'drPageSize'
--
-- * 'drId'
describeRecord
    :: Text -- ^ 'drId'
    -> DescribeRecord
describeRecord pId_ =
    DescribeRecord'
    { _drAcceptLanguage = Nothing
    , _drPageToken = Nothing
    , _drPageSize = Nothing
    , _drId = pId_
    }

-- | Optional language code. Supported language codes are as follows:
--
-- \"en\" (English)
--
-- \"jp\" (Japanese)
--
-- \"zh\" (Chinese)
--
-- If no code is specified, \"en\" is used as the default.
drAcceptLanguage :: Lens' DescribeRecord (Maybe Text)
drAcceptLanguage = lens _drAcceptLanguage (\ s a -> s{_drAcceptLanguage = a});

-- | The page token of the first page retrieve. If null, this retrieves the first page of size 'PageSize'.
drPageToken :: Lens' DescribeRecord (Maybe Text)
drPageToken = lens _drPageToken (\ s a -> s{_drPageToken = a});

-- | The maximum number of items to return in the results. If more results exist than fit in the specified 'PageSize', the value of 'NextPageToken' in the response is non-null.
drPageSize :: Lens' DescribeRecord (Maybe Natural)
drPageSize = lens _drPageSize (\ s a -> s{_drPageSize = a}) . mapping _Nat;

-- | The record identifier of the ProvisionedProduct object for which to retrieve output information. This is the 'RecordDetail.RecordId' obtained from the request operation\'s response.
drId :: Lens' DescribeRecord Text
drId = lens _drId (\ s a -> s{_drId = a});

instance AWSRequest DescribeRecord where
        type Rs DescribeRecord = DescribeRecordResponse
        request = postJSON serviceCatalog
        response
          = receiveJSON
              (\ s h x ->
                 DescribeRecordResponse' <$>
                   (x .?> "RecordDetail") <*> (x .?> "NextPageToken")
                     <*> (x .?> "RecordOutputs" .!@ mempty)
                     <*> (pure (fromEnum s)))

instance Hashable DescribeRecord

instance NFData DescribeRecord

instance ToHeaders DescribeRecord where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AWS242ServiceCatalogService.DescribeRecord" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeRecord where
        toJSON DescribeRecord'{..}
          = object
              (catMaybes
                 [("AcceptLanguage" .=) <$> _drAcceptLanguage,
                  ("PageToken" .=) <$> _drPageToken,
                  ("PageSize" .=) <$> _drPageSize,
                  Just ("Id" .= _drId)])

instance ToPath DescribeRecord where
        toPath = const "/"

instance ToQuery DescribeRecord where
        toQuery = const mempty

-- | /See:/ 'describeRecordResponse' smart constructor.
data DescribeRecordResponse a = DescribeRecordResponse'
    { _drrsRecordDetail   :: !(Maybe RecordDetail)
    , _drrsNextPageToken  :: !(Maybe Text)
    , _drrsRecordOutputs  :: !(Maybe [RecordOutput])
    , _drrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeRecordResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'drrsRecordDetail'
--
-- * 'drrsNextPageToken'
--
-- * 'drrsRecordOutputs'
--
-- * 'drrsResponseStatus'
describeRecordResponse
    :: Int -- ^ 'drrsResponseStatus'
    -> DescribeRecordResponse (a)
describeRecordResponse pResponseStatus_ =
    DescribeRecordResponse'
    { _drrsRecordDetail = Nothing
    , _drrsNextPageToken = Nothing
    , _drrsRecordOutputs = Nothing
    , _drrsResponseStatus = pResponseStatus_
    }

-- | Detailed record information for the specified product.
drrsRecordDetail :: Lens' (DescribeRecordResponse (a)) (Maybe RecordDetail)
drrsRecordDetail = lens _drrsRecordDetail (\ s a -> s{_drrsRecordDetail = a});

-- | The page token to use to retrieve the next page of results for this operation. If there are no more pages, this value is null.
drrsNextPageToken :: Lens' (DescribeRecordResponse (a)) (Maybe Text)
drrsNextPageToken = lens _drrsNextPageToken (\ s a -> s{_drrsNextPageToken = a});

-- | A list of outputs for the specified Product object created as the result of a request. For example, a CloudFormation-backed product that creates an S3 bucket would have an output for the S3 bucket URL.
drrsRecordOutputs :: Lens' (DescribeRecordResponse (a)) [RecordOutput]
drrsRecordOutputs = lens _drrsRecordOutputs (\ s a -> s{_drrsRecordOutputs = a}) . _Default . _Coerce;

-- | The response status code.
drrsResponseStatus :: Lens' (DescribeRecordResponse (a)) Int
drrsResponseStatus = lens _drrsResponseStatus (\ s a -> s{_drrsResponseStatus = a});

instance NFData DescribeRecordResponse
