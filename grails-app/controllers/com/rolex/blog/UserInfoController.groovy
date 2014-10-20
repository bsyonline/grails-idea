package com.rolex.blog



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserInfoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Profile.list(params), model: [userInfoInstanceCount: Profile.count()]
    }

    def show(Profile userInfoInstance) {
        respond userInfoInstance
    }

    def create() {
        respond new Profile(params)
    }

    @Transactional
    def save(Profile userInfoInstance) {
        if (userInfoInstance == null) {
            notFound()
            return
        }

        if (userInfoInstance.hasErrors()) {
            respond userInfoInstance.errors, view: 'create'
            return
        }

        userInfoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userInfo.label', default: 'Profile'), userInfoInstance.id])
                redirect userInfoInstance
            }
            '*' { respond userInfoInstance, [status: CREATED] }
        }
    }

    def edit(Profile userInfoInstance) {
        respond userInfoInstance
    }

    @Transactional
    def update(Profile userInfoInstance) {
        if (userInfoInstance == null) {
            notFound()
            return
        }

        if (userInfoInstance.hasErrors()) {
            respond userInfoInstance.errors, view: 'edit'
            return
        }

        userInfoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Profile.label', default: 'Profile'), userInfoInstance.id])
                redirect userInfoInstance
            }
            '*' { respond userInfoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Profile userInfoInstance) {

        if (userInfoInstance == null) {
            notFound()
            return
        }

        userInfoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Profile.label', default: 'Profile'), userInfoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInfo.label', default: 'Profile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
