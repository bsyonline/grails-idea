package com.rolex.blog

class User {

    static constraints = {
        username(nullable: false,unique: true)
        password(nullable: false)
        email(email: true)
        profile(nullable: true)
    }
    static hasMany = [replies:Reply,replyTo:Reply,posts:Post]
    static mappedBy = [replies:'replier',replyTo:'replyTo']
    static hasOne = [profile:Profile]
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
}
