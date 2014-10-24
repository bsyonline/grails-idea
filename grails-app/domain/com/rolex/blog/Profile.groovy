package com.rolex.blog

class Profile {

    static constraints = {
    }
    static mapping = {
        table 'b_profile'
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
