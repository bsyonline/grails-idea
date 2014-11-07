package com.rolex.store

import com.rolex.blog.User

class Order {

    static constraints = {
        paidDate(nullable: true)
        shipDate(nullable: true)
        no(nullable: true)
        status(nullable: true)
        orderDate(nullable: true)
        user(nullable: true)
    }
    static mapping = {
        table 's_order'
        version false
    }

    static belongsTo = [user:User]

    String no
    String consignee
    String address
    String orderDate
    String paidDate
    String shipDate
    String phone
    Cart cart
    BigDecimal price
    OrderStatus status

}

enum OrderStatus{
    NEW,PAID,SHIPPED,CLOSED
}