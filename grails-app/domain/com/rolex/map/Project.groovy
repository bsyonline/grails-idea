package com.rolex.map

class Project {

    static constraints = {
        x (max:1000.0, min: 0.0, scale: 6)
        y (max:1000.0, min: 0.0, scale: 6)

    }

    static mapping = {
        table 'm_project'
        version false
        address type: 'text'
    }

    String name
    BigDecimal x
    BigDecimal y
    String address

}
