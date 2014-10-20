package com.rolex.blog

import com.rolex.command.CustomRegisterCommand

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def send = { CustomRegisterCommand cmd ->
        def user = new User(params)
        if (!user.hasErrors() && user.validate() && !cmd.hasErrors()) {
            user.password = user.password.encodeAsPassword()
            if (user.save()) {
                flash.message = message(code: 'user.register.success', args: [user.username])
                session.user = user
                sendMessage()
                render (view:'activate')
                return
            }

        }
        render(view: 'register', model: [userInstance: user, cmd: cmd])
    }

    def sendMessage() {
        def time = new Date().getTime()
        def checkcode =  encodeBase64(time.toString())
        def url = "http://localhost:8888/grails-shop/user/activate?username=$params.username&checkcode=$checkcode"
        sendMail {
            to params.email
            subject 'no reply'
            html g.render(template:"mail", model: [username:params.username,date:new Date(),url:url])
        }
    }

    def resend(){
        sendMessage()
        render (view:'activate')
    }

    def activate(){
        long registerTime = decodeBase64(params.checkcode) as long
        long now = new Date().getTime() as long
        def user = User.findByUsername(params.username)
        if((now-registerTime)>1800000){
            flash.email = user.email
            flash.username = user.username
            render (view: 'timeout')
            return
        }
        if(user.active == 1){
            render (view: 'activated',model: [username:user.username])
            return
        }
        user.active = 1
        user.save flush: true
        render (view: 'success')
    }

    def mail(){
        render(view:'_mail', model: [url:"http://baidu.com"])
    }

    def encodeBase64(String s){
        return s.toString().bytes.encodeBase64().toString()
    }

    def decodeBase64(String s){
        return new String(s.decodeBase64())
    }
}
