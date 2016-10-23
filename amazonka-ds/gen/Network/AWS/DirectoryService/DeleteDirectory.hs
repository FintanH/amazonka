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
-- Module      : Network.AWS.DirectoryService.DeleteDirectory
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes an AWS Directory Service directory.
module Network.AWS.DirectoryService.DeleteDirectory
    (
    -- * Creating a Request
      deleteDirectory
    , DeleteDirectory
    -- * Request Lenses
    , dddDirectoryId

    -- * Destructuring the Response
    , deleteDirectoryResponse
    , DeleteDirectoryResponse
    -- * Response Lenses
    , delrsDirectoryId
    , delrsResponseStatus
    ) where

import           Network.AWS.DirectoryService.Types
import           Network.AWS.DirectoryService.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains the inputs for the < DeleteDirectory> operation.
--
-- /See:/ 'deleteDirectory' smart constructor.
newtype DeleteDirectory = DeleteDirectory'
    { _dddDirectoryId :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteDirectory' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dddDirectoryId'
deleteDirectory
    :: Text -- ^ 'dddDirectoryId'
    -> DeleteDirectory
deleteDirectory pDirectoryId_ =
    DeleteDirectory'
    { _dddDirectoryId = pDirectoryId_
    }

-- | The identifier of the directory to delete.
dddDirectoryId :: Lens' DeleteDirectory Text
dddDirectoryId = lens _dddDirectoryId (\ s a -> s{_dddDirectoryId = a});

instance AWSRequest DeleteDirectory where
        type Rs DeleteDirectory = DeleteDirectoryResponse
        request = postJSON directoryService
        response
          = receiveJSON
              (\ s h x ->
                 DeleteDirectoryResponse' <$>
                   (x .?> "DirectoryId") <*> (pure (fromEnum s)))

instance Hashable DeleteDirectory

instance NFData DeleteDirectory

instance ToHeaders DeleteDirectory where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("DirectoryService_20150416.DeleteDirectory" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteDirectory where
        toJSON DeleteDirectory'{..}
          = object
              (catMaybes [Just ("DirectoryId" .= _dddDirectoryId)])

instance ToPath DeleteDirectory where
        toPath = const "/"

instance ToQuery DeleteDirectory where
        toQuery = const mempty

-- | Contains the results of the < DeleteDirectory> operation.
--
-- /See:/ 'deleteDirectoryResponse' smart constructor.
data DeleteDirectoryResponse a = DeleteDirectoryResponse'
    { _delrsDirectoryId    :: !(Maybe Text)
    , _delrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteDirectoryResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'delrsDirectoryId'
--
-- * 'delrsResponseStatus'
deleteDirectoryResponse
    :: Int -- ^ 'delrsResponseStatus'
    -> DeleteDirectoryResponse (a)
deleteDirectoryResponse pResponseStatus_ =
    DeleteDirectoryResponse'
    { _delrsDirectoryId = Nothing
    , _delrsResponseStatus = pResponseStatus_
    }

-- | The directory identifier.
delrsDirectoryId :: Lens' (DeleteDirectoryResponse (a)) (Maybe Text)
delrsDirectoryId = lens _delrsDirectoryId (\ s a -> s{_delrsDirectoryId = a});

-- | The response status code.
delrsResponseStatus :: Lens' (DeleteDirectoryResponse (a)) Int
delrsResponseStatus = lens _delrsResponseStatus (\ s a -> s{_delrsResponseStatus = a});

instance NFData DeleteDirectoryResponse
