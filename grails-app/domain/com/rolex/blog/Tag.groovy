package com.rolex.blog

class Tag {

    static constraints = {
    }

    static mapping = {
        table 'b_tag'
        version false
    }

    String name
    String url
}
