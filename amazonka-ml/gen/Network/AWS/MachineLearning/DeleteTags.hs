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
-- Module      : Network.AWS.MachineLearning.DeleteTags
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified tags associated with an ML object. After this operation is complete, you can\'t recover deleted tags.
--
-- If you specify a tag that doesn\'t exist, Amazon ML ignores it.
module Network.AWS.MachineLearning.DeleteTags
    (
    -- * Creating a Request
      deleteTags
    , DeleteTags
    -- * Request Lenses
    , dTagKeys
    , dResourceId
    , dResourceType

    -- * Destructuring the Response
    , deleteTagsResponse
    , DeleteTagsResponse
    -- * Response Lenses
    , drsResourceId
    , drsResourceType
    , drsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.MachineLearning.Types
import           Network.AWS.MachineLearning.Types.Product
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteTags' smart constructor.
data DeleteTags = DeleteTags'
    { _dTagKeys      :: ![Text]
    , _dResourceId   :: !Text
    , _dResourceType :: !TaggableResourceType
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteTags' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dTagKeys'
--
-- * 'dResourceId'
--
-- * 'dResourceType'
deleteTags
    :: Text -- ^ 'dResourceId'
    -> TaggableResourceType -- ^ 'dResourceType'
    -> DeleteTags
deleteTags pResourceId_ pResourceType_ =
    DeleteTags'
    { _dTagKeys = mempty
    , _dResourceId = pResourceId_
    , _dResourceType = pResourceType_
    }

-- | One or more tags to delete.
dTagKeys :: Lens' DeleteTags [Text]
dTagKeys = lens _dTagKeys (\ s a -> s{_dTagKeys = a}) . _Coerce;

-- | The ID of the tagged ML object. For example, 'exampleModelId'.
dResourceId :: Lens' DeleteTags Text
dResourceId = lens _dResourceId (\ s a -> s{_dResourceId = a});

-- | The type of the tagged ML object.
dResourceType :: Lens' DeleteTags TaggableResourceType
dResourceType = lens _dResourceType (\ s a -> s{_dResourceType = a});

instance AWSRequest DeleteTags where
        type Rs DeleteTags = DeleteTagsResponse
        request = postJSON machineLearning
        response
          = receiveJSON
              (\ s h x ->
                 DeleteTagsResponse' <$>
                   (x .?> "ResourceId") <*> (x .?> "ResourceType") <*>
                     (pure (fromEnum s)))

instance Hashable DeleteTags

instance NFData DeleteTags

instance ToHeaders DeleteTags where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonML_20141212.DeleteTags" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteTags where
        toJSON DeleteTags'{..}
          = object
              (catMaybes
                 [Just ("TagKeys" .= _dTagKeys),
                  Just ("ResourceId" .= _dResourceId),
                  Just ("ResourceType" .= _dResourceType)])

instance ToPath DeleteTags where
        toPath = const "/"

instance ToQuery DeleteTags where
        toQuery = const mempty

-- | Amazon ML returns the following elements.
--
-- /See:/ 'deleteTagsResponse' smart constructor.
data DeleteTagsResponse a = DeleteTagsResponse'
    { _drsResourceId     :: !(Maybe Text)
    , _drsResourceType   :: !(Maybe TaggableResourceType)
    , _drsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteTagsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'drsResourceId'
--
-- * 'drsResourceType'
--
-- * 'drsResponseStatus'
deleteTagsResponse
    :: Int -- ^ 'drsResponseStatus'
    -> DeleteTagsResponse (a)
deleteTagsResponse pResponseStatus_ =
    DeleteTagsResponse'
    { _drsResourceId = Nothing
    , _drsResourceType = Nothing
    , _drsResponseStatus = pResponseStatus_
    }

-- | The ID of the ML object from which tags were deleted.
drsResourceId :: Lens' (DeleteTagsResponse (a)) (Maybe Text)
drsResourceId = lens _drsResourceId (\ s a -> s{_drsResourceId = a});

-- | The type of the ML object from which tags were deleted.
drsResourceType :: Lens' (DeleteTagsResponse (a)) (Maybe TaggableResourceType)
drsResourceType = lens _drsResourceType (\ s a -> s{_drsResourceType = a});

-- | The response status code.
drsResponseStatus :: Lens' (DeleteTagsResponse (a)) Int
drsResponseStatus = lens _drsResponseStatus (\ s a -> s{_drsResponseStatus = a});

instance NFData DeleteTagsResponse
