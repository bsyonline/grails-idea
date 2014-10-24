package com.rolex.blog

class Reply {

    static constraints = {
        post(nullable: true)
        parent(nullable: true)
        replyTo(nullable: true)
    }
    static belongsTo = [post:Post,parent:Reply]
    static hasMany = [replies:Reply]
    static mapping = {
        table 'b_reply'
        version false
    }

    Date lastUpdated
    Date dateCreated
    String content
    Post post
    User replier
    User replyTo
    Reply parent
}
