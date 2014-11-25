package com.rolex.store

class Image {

    static constraints = {
    }
    static belongsTo = [product:Product]
    static mapping = {
        table 's_image'
        version false
    }

    String name
}
