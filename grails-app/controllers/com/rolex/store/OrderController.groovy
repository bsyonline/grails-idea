package com.rolex.store

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrderController {

    def orderService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Order.list(params), model: [orderInstanceCount: Order.count()]
    }

    def show(Order orderInstance) {
        respond orderInstance
    }

    def create() {
        Cart cart = null
        if(session.user != null){
            cart = orderService.preparedCart(session)
        }
        render (view: 'create', model: [cart:cart],orderInstance:new Order(params))
    }

    @Transactional
    def save(Order orderInstance) {
        orderInstance.user = session.user
        orderInstance.save flush: true
        render(view: 'pay')
    }

    def edit(Order orderInstance) {
        respond orderInstance
    }

    @Transactional
    def update(Order orderInstance) {
        if (orderInstance == null) {
            notFound()
            return
        }

        if (orderInstance.hasErrors()) {
            respond orderInstance.errors, view: 'edit'
            return
        }

        orderInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Order.label', default: 'Order'), orderInstance.id])
                redirect orderInstance
            }
            '*' { respond orderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Order orderInstance) {

        if (orderInstance == null) {
            notFound()
            return
        }

        orderInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Order.label', default: 'Order'), orderInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def addToCart(Product productInstance){
        Cart cart = orderService.addToCart(session,productInstance)
        //redirect (action:'index',controller: 'product')
        render cart as JSON
    }

    def removeFromCart(){
        def cart = orderService.preparedCart(session)
        Item item = Item.get(params.id)
        if(item.cart.id == cart.id){
            cart.items.remove(item)
            cart.save()
            item.delete(flush:true)
        }
        render (view: 'showCart', model: [cart:cart])
    }

    def showCart(){
        Cart cart = null
        if(session.user != null){
            cart = orderService.preparedCart(session)
        }
        render (view: 'showCart', model: [cart:cart])
    }

    def showItems(){
        Cart cart = null
        if(session.user != null){
            cart = orderService.preparedCart(session)
        }

        String products = "["
        cart?.items.each{
            products += "{\"title\":\"" + it.product.title + "\",\"price\":\"" + it.product.price + "\",\"num\":\""+ it.itemNum+"\",\"totalPrice\":\"" + it.cart.totalPrice()+"\"},"
        }

        products += products[0..-1] + "]"
        println products
        render products
    }

    def confirm(Order orderInstance){
        Cart cart = null
        if(session.user != null){
            cart = orderService.preparedCart(session)
        }
        orderInstance.cart = cart
        orderInstance.orderDate = new Date()
        orderInstance.no = '222'
        orderInstance.status = OrderStatus.NEW
        respond orderInstance
    }
}
