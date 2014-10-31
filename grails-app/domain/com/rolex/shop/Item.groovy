package com.rolex.shop

class Item {

    static constraints = {
    }
    static mapping = {
        table 's_item'
        version false
    }

    static belongsTo = [cart:Cart]
    Goods goods
    int itemNum

}
