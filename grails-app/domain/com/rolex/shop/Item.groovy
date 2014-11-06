package com.rolex.shop

class Item {

    static constraints = {
    }
    static mapping = {
        table 's_item'
        version false
        goods lazy: false
    }

    static belongsTo = [cart:Cart]
    Goods goods
    int itemNum

}
