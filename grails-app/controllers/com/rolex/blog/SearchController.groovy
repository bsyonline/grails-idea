package com.rolex.blog

import com.rolex.blog.search.PostSearchQuery

class SearchController {

    def index(String searchString) {
        PostSearchQuery query = new PostSearchQuery()
        query.setSearchString(searchString)
        query.searchDocuments(0, 100);
        List<Post> list = query.getPostResult();
        render (view: 'index',model: [searchResult:list])
    }
}
