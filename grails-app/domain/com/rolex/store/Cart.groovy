package com.rolex.store

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
    SortedSet items
    CartStatus status = CartStatus.NEW

    public def totalPrice = {
        BigDecimal price = 0.0
        items.each{
            BigDecimal productPrice = it.product?.price as BigDecimal
            int num = it.itemNum as int
            price = (price as BigDecimal).add(productPrice.multiply(num) as BigDecimal)
        }
        return price
    }
}

enum CartStatus{NEW,ORDERED}