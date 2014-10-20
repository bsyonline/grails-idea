package com.rolex.command

import grails.validation.Validateable

/**
 * Created with IntelliJ IDEA.
 * User: rolex
 * Date: 14-9-16
 * version: 1.0
 */
@Validateable
class CustomRegisterCommand {
    String password
    String repassword

    static constraints = {
        repassword(validator:{
            val,obj ->
                if(val != obj.password){
                    return 'password is not same'
                }
        })
        password(nullable: true)
    }
}
