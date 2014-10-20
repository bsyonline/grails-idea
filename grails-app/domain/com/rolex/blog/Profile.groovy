package com.rolex.blog

class Profile {

    static constraints = {
    }

    static belongsTo = User

    static mapping = {
        table 'b_user_info'
        version false
    }

    User user
    String firstName
    String lastName
    int age
    Date birth
    String address
    String phone
    int gender

}
