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
-- Module      : Network.AWS.WorkSpaces.DescribeWorkspacesConnectionStatus
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Describes the connection status of a specified WorkSpace.
module Network.AWS.WorkSpaces.DescribeWorkspacesConnectionStatus
    (
    -- * Creating a Request
      describeWorkspacesConnectionStatus
    , DescribeWorkspacesConnectionStatus
    -- * Request Lenses
    , dwcsWorkspaceIds
    , dwcsNextToken

    -- * Destructuring the Response
    , describeWorkspacesConnectionStatusResponse
    , DescribeWorkspacesConnectionStatusResponse
    -- * Response Lenses
    , dwcsrsNextToken
    , dwcsrsWorkspacesConnectionStatus
    , dwcsrsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.WorkSpaces.Types
import           Network.AWS.WorkSpaces.Types.Product

-- | /See:/ 'describeWorkspacesConnectionStatus' smart constructor.
data DescribeWorkspacesConnectionStatus = DescribeWorkspacesConnectionStatus'
    { _dwcsWorkspaceIds :: !(Maybe (List1 Text))
    , _dwcsNextToken    :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeWorkspacesConnectionStatus' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dwcsWorkspaceIds'
--
-- * 'dwcsNextToken'
describeWorkspacesConnectionStatus
    :: DescribeWorkspacesConnectionStatus
describeWorkspacesConnectionStatus =
    DescribeWorkspacesConnectionStatus'
    { _dwcsWorkspaceIds = Nothing
    , _dwcsNextToken = Nothing
    }

-- | An array of strings that contain the identifiers of the WorkSpaces.
dwcsWorkspaceIds :: Lens' DescribeWorkspacesConnectionStatus (Maybe (NonEmpty Text))
dwcsWorkspaceIds = lens _dwcsWorkspaceIds (\ s a -> s{_dwcsWorkspaceIds = a}) . mapping _List1;

-- | The next token of the request.
dwcsNextToken :: Lens' DescribeWorkspacesConnectionStatus (Maybe Text)
dwcsNextToken = lens _dwcsNextToken (\ s a -> s{_dwcsNextToken = a});

instance AWSRequest
         DescribeWorkspacesConnectionStatus where
        type Rs DescribeWorkspacesConnectionStatus =
             DescribeWorkspacesConnectionStatusResponse
        request = postJSON workSpaces
        response
          = receiveJSON
              (\ s h x ->
                 DescribeWorkspacesConnectionStatusResponse' <$>
                   (x .?> "NextToken") <*>
                     (x .?> "WorkspacesConnectionStatus" .!@ mempty)
                     <*> (pure (fromEnum s)))

instance Hashable DescribeWorkspacesConnectionStatus

instance NFData DescribeWorkspacesConnectionStatus

instance ToHeaders DescribeWorkspacesConnectionStatus
         where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("WorkspacesService.DescribeWorkspacesConnectionStatus"
                       :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeWorkspacesConnectionStatus
         where
        toJSON DescribeWorkspacesConnectionStatus'{..}
          = object
              (catMaybes
                 [("WorkspaceIds" .=) <$> _dwcsWorkspaceIds,
                  ("NextToken" .=) <$> _dwcsNextToken])

instance ToPath DescribeWorkspacesConnectionStatus
         where
        toPath = const "/"

instance ToQuery DescribeWorkspacesConnectionStatus
         where
        toQuery = const mempty

-- | /See:/ 'describeWorkspacesConnectionStatusResponse' smart constructor.
data DescribeWorkspacesConnectionStatusResponse a = DescribeWorkspacesConnectionStatusResponse'
    { _dwcsrsNextToken                  :: !(Maybe Text)
    , _dwcsrsWorkspacesConnectionStatus :: !(Maybe [WorkspaceConnectionStatus])
    , _dwcsrsResponseStatus             :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeWorkspacesConnectionStatusResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dwcsrsNextToken'
--
-- * 'dwcsrsWorkspacesConnectionStatus'
--
-- * 'dwcsrsResponseStatus'
describeWorkspacesConnectionStatusResponse
    :: Int -- ^ 'dwcsrsResponseStatus'
    -> DescribeWorkspacesConnectionStatusResponse (a)
describeWorkspacesConnectionStatusResponse pResponseStatus_ =
    DescribeWorkspacesConnectionStatusResponse'
    { _dwcsrsNextToken = Nothing
    , _dwcsrsWorkspacesConnectionStatus = Nothing
    , _dwcsrsResponseStatus = pResponseStatus_
    }

-- | The next token of the result.
dwcsrsNextToken :: Lens' (DescribeWorkspacesConnectionStatusResponse (a)) (Maybe Text)
dwcsrsNextToken = lens _dwcsrsNextToken (\ s a -> s{_dwcsrsNextToken = a});

-- | The connection status of the WorkSpace.
dwcsrsWorkspacesConnectionStatus :: Lens' (DescribeWorkspacesConnectionStatusResponse (a)) [WorkspaceConnectionStatus]
dwcsrsWorkspacesConnectionStatus = lens _dwcsrsWorkspacesConnectionStatus (\ s a -> s{_dwcsrsWorkspacesConnectionStatus = a}) . _Default . _Coerce;

-- | The response status code.
dwcsrsResponseStatus :: Lens' (DescribeWorkspacesConnectionStatusResponse (a)) Int
dwcsrsResponseStatus = lens _dwcsrsResponseStatus (\ s a -> s{_dwcsrsResponseStatus = a});

instance NFData
         DescribeWorkspacesConnectionStatusResponse
