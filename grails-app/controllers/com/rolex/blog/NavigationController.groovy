package com.rolex.blog

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NavigationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Navigation.list(params), model: [navigationInstanceCount: Navigation.count()]
    }

    def show(Navigation navigationInstance) {
        respond navigationInstance
    }

    def create() {
        respond new Navigation(params)
    }

    @Transactional
    def save(Navigation navigationInstance) {
        if (navigationInstance == null) {
            notFound()
            return
        }

        if (navigationInstance.hasErrors()) {
            respond navigationInstance.errors, view: 'create'
            return
        }

        navigationInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'navigation.label', default: 'Navigation'), navigationInstance.id])
                redirect navigationInstance
            }
            '*' { respond navigationInstance, [status: CREATED] }
        }
    }

    def edit(Navigation navigationInstance) {
        respond navigationInstance
    }

    @Transactional
    def update(Navigation navigationInstance) {
        if (navigationInstance == null) {
            notFound()
            return
        }

        if (navigationInstance.hasErrors()) {
            respond navigationInstance.errors, view: 'edit'
            return
        }

        navigationInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Navigation.label', default: 'Navigation'), navigationInstance.id])
                redirect navigationInstance
            }
            '*' { respond navigationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Navigation navigationInstance) {

        if (navigationInstance == null) {
            notFound()
            return
        }

        navigationInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Navigation.label', default: 'Navigation'), navigationInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'navigation.label', default: 'Navigation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def getNavs(){
        render Navigation.list() as JSON
    }
}
