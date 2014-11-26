package com.rolex.store

class Item implements Comparable{

    static constraints = {
    }
    static mapping = {
        table 's_item'
        version false
        product lazy: false
    }

    static belongsTo = [cart:Cart]
    Product product
    int itemNum

    @Override
    int compareTo(Object o) {
        return this.id.compareTo(((Item)o).id)
    }
}
