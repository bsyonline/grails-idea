package com.rolex.shop

import com.rolex.blog.User
import grails.transaction.Transactional

@Transactional
class OrderService {

    static transactional = true
    def preparedCart(session){
        def cart = null
        if(session.cartId != null){
            cart = Cart.get(session.cartId)
            if(cart != null && cart.status == CartStatus.NEW){
                return cart
            }
        }
        if(session.user.id!=null){
            def user = User.get(session.user.id)
            cart = Cart.findByUserAndStatus(user,CartStatus.NEW)
            if(cart != null){
                session.cartId = cart.id
                return cart
            }else{
                cart = new Cart(user:user,status: CartStatus.NEW)
                if(cart.save()){
                    session.cartId = cart.id
                    return cart
                }
            }
        }
    }
    def addToCart(session,goods) {
        def cart = preparedCart(session)
        if(cart&&goods){
            def item = Item.findByGoodsAndCart(goods,cart)
            if(item){
                item.itemNum += 1
            }else{
                item = new Item(goods:goods,itemNum: 1,cart: cart)
            }
            println "itemNum=$item.itemNum"
            def d =item.save flush:true
            println "itemNum=$d.itemNum"
        }
        return cart
    }
}
