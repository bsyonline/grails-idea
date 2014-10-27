package com.rolex.blog

class ManagementController {

    def index() {
        def posts = Post.list()
        def tags = Tag.list()
        def replies = Reply.list()
        render (view: 'index',model: [postInstanceList:posts,tagInstanceList:tags,replyInstanceList:replies])
    }
}
