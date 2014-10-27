package com.rolex.blog

class Post {

    static constraints = {
        title(nullable: false)
        publisher(nullable: false)
        content(nullable: false)
        pic(nullable: true)
    }

    static mapping = {
        table 'b_post'
        columns {
            content type: 'text'
        }
    }
    static belongsTo = [publisher:User]
    static hasMany = [replies:Reply]

    String title
    User publisher
    Date dateCreated
    Date lastUpdated
    String content
    String pic

}
