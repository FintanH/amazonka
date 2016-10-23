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
-- Module      : Network.AWS.WorkSpaces.StartWorkspaces
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Starts the specified WorkSpaces. The API only works with WorkSpaces that have RunningMode configured as AutoStop and the State set to “STOPPED.”
module Network.AWS.WorkSpaces.StartWorkspaces
    (
    -- * Creating a Request
      startWorkspaces
    , StartWorkspaces
    -- * Request Lenses
    , swStartWorkspaceRequests

    -- * Destructuring the Response
    , startWorkspacesResponse
    , StartWorkspacesResponse
    -- * Response Lenses
    , swrsFailedRequests
    , swrsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.WorkSpaces.Types
import           Network.AWS.WorkSpaces.Types.Product

-- | /See:/ 'startWorkspaces' smart constructor.
newtype StartWorkspaces = StartWorkspaces'
    { _swStartWorkspaceRequests :: List1 StartRequest
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'StartWorkspaces' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'swStartWorkspaceRequests'
startWorkspaces
    :: NonEmpty StartRequest -- ^ 'swStartWorkspaceRequests'
    -> StartWorkspaces
startWorkspaces pStartWorkspaceRequests_ =
    StartWorkspaces'
    { _swStartWorkspaceRequests = _List1 # pStartWorkspaceRequests_
    }

-- | The requests.
swStartWorkspaceRequests :: Lens' StartWorkspaces (NonEmpty StartRequest)
swStartWorkspaceRequests = lens _swStartWorkspaceRequests (\ s a -> s{_swStartWorkspaceRequests = a}) . _List1;

instance AWSRequest StartWorkspaces where
        type Rs StartWorkspaces = StartWorkspacesResponse
        request = postJSON workSpaces
        response
          = receiveJSON
              (\ s h x ->
                 StartWorkspacesResponse' <$>
                   (x .?> "FailedRequests" .!@ mempty) <*>
                     (pure (fromEnum s)))

instance Hashable StartWorkspaces

instance NFData StartWorkspaces

instance ToHeaders StartWorkspaces where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("WorkspacesService.StartWorkspaces" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON StartWorkspaces where
        toJSON StartWorkspaces'{..}
          = object
              (catMaybes
                 [Just
                    ("StartWorkspaceRequests" .=
                       _swStartWorkspaceRequests)])

instance ToPath StartWorkspaces where
        toPath = const "/"

instance ToQuery StartWorkspaces where
        toQuery = const mempty

-- | /See:/ 'startWorkspacesResponse' smart constructor.
data StartWorkspacesResponse a = StartWorkspacesResponse'
    { _swrsFailedRequests :: !(Maybe [FailedWorkspaceChangeRequest])
    , _swrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'StartWorkspacesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'swrsFailedRequests'
--
-- * 'swrsResponseStatus'
startWorkspacesResponse
    :: Int -- ^ 'swrsResponseStatus'
    -> StartWorkspacesResponse (a)
startWorkspacesResponse pResponseStatus_ =
    StartWorkspacesResponse'
    { _swrsFailedRequests = Nothing
    , _swrsResponseStatus = pResponseStatus_
    }

-- | The failed requests.
swrsFailedRequests :: Lens' (StartWorkspacesResponse (a)) [FailedWorkspaceChangeRequest]
swrsFailedRequests = lens _swrsFailedRequests (\ s a -> s{_swrsFailedRequests = a}) . _Default . _Coerce;

-- | The response status code.
swrsResponseStatus :: Lens' (StartWorkspacesResponse (a)) Int
swrsResponseStatus = lens _swrsResponseStatus (\ s a -> s{_swrsResponseStatus = a});

instance NFData StartWorkspacesResponse
