package com.gsl.oros.core.banking.settings

class Country {
    String iso2
    String name
    String printablename
    String iso3
    Long numcode
    Boolean status=true

    static hasMany = [state:State]

    static constraints = {
    }
    static mapping = {
        sort "name"
        order "asc"
    }
}
