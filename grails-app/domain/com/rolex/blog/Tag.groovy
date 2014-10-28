package com.rolex.blog

class Tag {

    static constraints = {
    }

    static mapping = {
        table 'b_tag'
        version false
    }

    static hasMany = [posts:Post]
    static belongsTo = [Post]

    String name
    String url
}
