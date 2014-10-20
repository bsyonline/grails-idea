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
            content length: 5000
        }
    }


    String title
    String publisher
    Date dateCreated
    Date lastUpdated
    String content
    String pic

}
