package com.rolex.shop

class Goods {

    def orderService

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
