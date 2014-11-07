package com.rolex.store

class Product {

    static constraints = {
    }

    static mapping = {
        table 's_product'
        version false
    }
    String title
    String price
    int type
}
