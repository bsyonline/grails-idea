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
        items lazy: false
    }
    CartStatus status = CartStatus.NEW

    public def totalPrice = {
        def price = 0.0
        items.each{
            price = price.add(it.goods?.price.multiply(it.itemNum) as BigDecimal)
        }
        return price
    }
}

enum CartStatus{NEW,ORDERED}