package com.gsl.oros.core.banking.agent

import com.gsl.oros.core.banking.settings.Country

class ThirdParty {

    String name
    String role
    String address
    String firm
    String nationalID2
    String email2
    String phone2
    String postCode2
    String residency
    Country nationality3
    Country countryofBirth2
    Boolean status=true


    static constraints = {
        role nullable: true
        address nullable: true
        firm nullable: true
        nationalID2 nullable: true
        email2 nullable: true
        phone2 nullable: true
        postCode2 nullable: true
        residency nullable: true
    }
}
