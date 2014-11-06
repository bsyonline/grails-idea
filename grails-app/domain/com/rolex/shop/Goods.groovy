package com.rolex.shop

class Goods {

    static constraints = {
    }

    static mapping = {
        table 's_goods'
        version false
    }
    String title
    String price
    int type
}
