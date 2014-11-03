package com.gsl.oros.core.banking.clients

import com.gsl.oros.core.banking.settings.Country

class RetailAdministration {

    String name
    String role
    String address
    String firm
    String nationalID
    String email
    String phone
    String postCode
    String residency
    Country nationality
    Country countryOfBirth
    Boolean status=true
    RetailAccount retailAccount



    static constraints = {
        role nullable: true
        address nullable: true
        firm nullable: true
        nationalID nullable: true
        email nullable: true
        phone nullable: true
        postCode nullable: true
        residency nullable: true
    }
}
