package com.rolex.blog

import com.rolex.blog.search.PostSearchQuery

class SearchController {

    def search(String searchString) {
        PostSearchQuery query = new PostSearchQuery()
        query.setSearchString(searchString)
        query.searchDocuments(1, 100);
        List<Post> list = query.getPostResult();
        render (view: 'search',model: [search:list])
    }
}
