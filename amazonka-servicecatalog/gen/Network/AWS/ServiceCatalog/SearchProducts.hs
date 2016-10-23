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
-- Module      : Network.AWS.ServiceCatalog.SearchProducts
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a paginated list all of the 'Products' objects to which the caller has access.
--
-- The output of this operation can be used as input for other operations, such as < DescribeProductView>.
module Network.AWS.ServiceCatalog.SearchProducts
    (
    -- * Creating a Request
      searchProducts
    , SearchProducts
    -- * Request Lenses
    , spFilters
    , spSortOrder
    , spAcceptLanguage
    , spPageToken
    , spPageSize
    , spSortBy

    -- * Destructuring the Response
    , searchProductsResponse
    , SearchProductsResponse
    -- * Response Lenses
    , sprsNextPageToken
    , sprsProductViewAggregations
    , sprsProductViewSummaries
    , sprsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.ServiceCatalog.Types
import           Network.AWS.ServiceCatalog.Types.Product

-- | /See:/ 'searchProducts' smart constructor.
data SearchProducts = SearchProducts'
    { _spFilters        :: !(Maybe (Map ProductViewFilterBy [Text]))
    , _spSortOrder      :: !(Maybe SortOrder)
    , _spAcceptLanguage :: !(Maybe Text)
    , _spPageToken      :: !(Maybe Text)
    , _spPageSize       :: !(Maybe Nat)
    , _spSortBy         :: !(Maybe ProductViewSortBy)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'SearchProducts' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'spFilters'
--
-- * 'spSortOrder'
--
-- * 'spAcceptLanguage'
--
-- * 'spPageToken'
--
-- * 'spPageSize'
--
-- * 'spSortBy'
searchProducts
    :: SearchProducts
searchProducts =
    SearchProducts'
    { _spFilters = Nothing
    , _spSortOrder = Nothing
    , _spAcceptLanguage = Nothing
    , _spPageToken = Nothing
    , _spPageSize = Nothing
    , _spSortBy = Nothing
    }

-- | (Optional) The list of filters with which to limit search results. If no search filters are specified, the output is all the products to which the calling user has access.
spFilters :: Lens' SearchProducts (HashMap ProductViewFilterBy [Text])
spFilters = lens _spFilters (\ s a -> s{_spFilters = a}) . _Default . _Map;

-- | (Optional) The sort order specifier. If no value is specified, results are not sorted.
spSortOrder :: Lens' SearchProducts (Maybe SortOrder)
spSortOrder = lens _spSortOrder (\ s a -> s{_spSortOrder = a});

-- | Optional language code. Supported language codes are as follows:
--
-- \"en\" (English)
--
-- \"jp\" (Japanese)
--
-- \"zh\" (Chinese)
--
-- If no code is specified, \"en\" is used as the default.
spAcceptLanguage :: Lens' SearchProducts (Maybe Text)
spAcceptLanguage = lens _spAcceptLanguage (\ s a -> s{_spAcceptLanguage = a});

-- | The page token of the first page retrieve. If null, this retrieves the first page of size 'PageSize'.
spPageToken :: Lens' SearchProducts (Maybe Text)
spPageToken = lens _spPageToken (\ s a -> s{_spPageToken = a});

-- | The maximum number of items to return in the results. If more results exist than fit in the specified 'PageSize', the value of 'NextPageToken' in the response is non-null.
spPageSize :: Lens' SearchProducts (Maybe Natural)
spPageSize = lens _spPageSize (\ s a -> s{_spPageSize = a}) . mapping _Nat;

-- | (Optional) The sort field specifier. If no value is specified, results are not sorted.
spSortBy :: Lens' SearchProducts (Maybe ProductViewSortBy)
spSortBy = lens _spSortBy (\ s a -> s{_spSortBy = a});

instance AWSRequest SearchProducts where
        type Rs SearchProducts = SearchProductsResponse
        request = postJSON serviceCatalog
        response
          = receiveJSON
              (\ s h x ->
                 SearchProductsResponse' <$>
                   (x .?> "NextPageToken") <*>
                     (x .?> "ProductViewAggregations" .!@ mempty)
                     <*> (x .?> "ProductViewSummaries" .!@ mempty)
                     <*> (pure (fromEnum s)))

instance Hashable SearchProducts

instance NFData SearchProducts

instance ToHeaders SearchProducts where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AWS242ServiceCatalogService.SearchProducts" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON SearchProducts where
        toJSON SearchProducts'{..}
          = object
              (catMaybes
                 [("Filters" .=) <$> _spFilters,
                  ("SortOrder" .=) <$> _spSortOrder,
                  ("AcceptLanguage" .=) <$> _spAcceptLanguage,
                  ("PageToken" .=) <$> _spPageToken,
                  ("PageSize" .=) <$> _spPageSize,
                  ("SortBy" .=) <$> _spSortBy])

instance ToPath SearchProducts where
        toPath = const "/"

instance ToQuery SearchProducts where
        toQuery = const mempty

-- | /See:/ 'searchProductsResponse' smart constructor.
data SearchProductsResponse a = SearchProductsResponse'
    { _sprsNextPageToken           :: !(Maybe Text)
    , _sprsProductViewAggregations :: !(Maybe (Map Text [ProductViewAggregationValue]))
    , _sprsProductViewSummaries    :: !(Maybe [ProductViewSummary])
    , _sprsResponseStatus          :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'SearchProductsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sprsNextPageToken'
--
-- * 'sprsProductViewAggregations'
--
-- * 'sprsProductViewSummaries'
--
-- * 'sprsResponseStatus'
searchProductsResponse
    :: Int -- ^ 'sprsResponseStatus'
    -> SearchProductsResponse (a)
searchProductsResponse pResponseStatus_ =
    SearchProductsResponse'
    { _sprsNextPageToken = Nothing
    , _sprsProductViewAggregations = Nothing
    , _sprsProductViewSummaries = Nothing
    , _sprsResponseStatus = pResponseStatus_
    }

-- | The page token to use to retrieve the next page of results for this operation. If there are no more pages, this value is null.
sprsNextPageToken :: Lens' (SearchProductsResponse (a)) (Maybe Text)
sprsNextPageToken = lens _sprsNextPageToken (\ s a -> s{_sprsNextPageToken = a});

-- | A list of the product view aggregation value objects.
sprsProductViewAggregations :: Lens' (SearchProductsResponse (a)) (HashMap Text [ProductViewAggregationValue])
sprsProductViewAggregations = lens _sprsProductViewAggregations (\ s a -> s{_sprsProductViewAggregations = a}) . _Default . _Map;

-- | A list of the product view summary objects.
sprsProductViewSummaries :: Lens' (SearchProductsResponse (a)) [ProductViewSummary]
sprsProductViewSummaries = lens _sprsProductViewSummaries (\ s a -> s{_sprsProductViewSummaries = a}) . _Default . _Coerce;

-- | The response status code.
sprsResponseStatus :: Lens' (SearchProductsResponse (a)) Int
sprsResponseStatus = lens _sprsResponseStatus (\ s a -> s{_sprsResponseStatus = a});

instance NFData SearchProductsResponse
