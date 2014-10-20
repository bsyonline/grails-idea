package com.rolex.blog

class User {

    static constraints = {
        username(nullable: false,unique: true)
        password(nullable: false)
        email(email: true)
        profile(nullable: true)
    }

    static mapping = {
        table 'b_user'
        version false
    }

    String username
    String password
    String email
    Date dateCreated
    Date lastUpdated
    int active
    Profile profile
}
