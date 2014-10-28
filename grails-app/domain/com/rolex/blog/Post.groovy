package com.rolex.blog

class Post {

    static constraints = {
        title(nullable: false)
        author(nullable: false)
        content(nullable: false)
        pic(nullable: true)
    }

    static mapping = {
        table 'b_post'
        columns {
            content type: 'text'
        }
    }
    static belongsTo = [author:User]
    static hasMany = [replies:Reply,tags:Tag]

    int id
    String title
    User author
    Date dateCreated
    Date lastUpdated
    String content
    String pic

}
