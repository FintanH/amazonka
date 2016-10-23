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
-- Module      : Network.AWS.WorkSpaces.DeleteTags
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes tags from a WorkSpace.
module Network.AWS.WorkSpaces.DeleteTags
    (
    -- * Creating a Request
      deleteTags
    , DeleteTags
    -- * Request Lenses
    , dResourceId
    , dTagKeys

    -- * Destructuring the Response
    , deleteTagsResponse
    , DeleteTagsResponse
    -- * Response Lenses
    , drsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.WorkSpaces.Types
import           Network.AWS.WorkSpaces.Types.Product

-- | The request of the < DeleteTags> operation.
--
-- /See:/ 'deleteTags' smart constructor.
data DeleteTags = DeleteTags'
    { _dResourceId :: !Text
    , _dTagKeys    :: ![Text]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteTags' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dResourceId'
--
-- * 'dTagKeys'
deleteTags
    :: Text -- ^ 'dResourceId'
    -> DeleteTags
deleteTags pResourceId_ =
    DeleteTags'
    { _dResourceId = pResourceId_
    , _dTagKeys = mempty
    }

-- | The resource ID of the request.
dResourceId :: Lens' DeleteTags Text
dResourceId = lens _dResourceId (\ s a -> s{_dResourceId = a});

-- | The tag keys of the request.
dTagKeys :: Lens' DeleteTags [Text]
dTagKeys = lens _dTagKeys (\ s a -> s{_dTagKeys = a}) . _Coerce;

instance AWSRequest DeleteTags where
        type Rs DeleteTags = DeleteTagsResponse
        request = postJSON workSpaces
        response
          = receiveEmpty
              (\ s h x ->
                 DeleteTagsResponse' <$> (pure (fromEnum s)))

instance Hashable DeleteTags

instance NFData DeleteTags

instance ToHeaders DeleteTags where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("WorkspacesService.DeleteTags" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteTags where
        toJSON DeleteTags'{..}
          = object
              (catMaybes
                 [Just ("ResourceId" .= _dResourceId),
                  Just ("TagKeys" .= _dTagKeys)])

instance ToPath DeleteTags where
        toPath = const "/"

instance ToQuery DeleteTags where
        toQuery = const mempty

-- | The result of the < DeleteTags> operation.
--
-- /See:/ 'deleteTagsResponse' smart constructor.
newtype DeleteTagsResponse a = DeleteTagsResponse'
    { _drsResponseStatus :: Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteTagsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'drsResponseStatus'
deleteTagsResponse
    :: Int -- ^ 'drsResponseStatus'
    -> DeleteTagsResponse (a)
deleteTagsResponse pResponseStatus_ =
    DeleteTagsResponse'
    { _drsResponseStatus = pResponseStatus_
    }

-- | The response status code.
drsResponseStatus :: Lens' (DeleteTagsResponse (a)) Int
drsResponseStatus = lens _drsResponseStatus (\ s a -> s{_drsResponseStatus = a});

instance NFData DeleteTagsResponse
