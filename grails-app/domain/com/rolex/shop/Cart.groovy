package com.rolex.shop

import com.rolex.blog.User

class Cart {

    static constraints = {
    }
    static hasMany = [items:Item]
    static belongsTo = [user:User]
    static mapping = {
        table 's_cart'
        version false
    }
    CartStatus status = CartStatus.NEW

    public def totalPrice = {
        def price = 0.0
        item.each{
            price += it.itemNum * it.goods?.price
            return price
        }
    }
}

enum CartStatus{NEW,ORDERED}