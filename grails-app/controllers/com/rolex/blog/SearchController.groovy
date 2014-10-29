package com.rolex.blog

import com.rolex.blog.search.PostSearchQuery

class SearchController {

    def index(String searchString) {
        PostSearchQuery postQuery = new PostSearchQuery()
        postQuery.setSearchString(searchString)
        postQuery.searchDocuments(0, 100)
        List<Post> posts = postQuery.getPostResult()

        render (view: 'index',model: [searchResult:posts])
    }
}
