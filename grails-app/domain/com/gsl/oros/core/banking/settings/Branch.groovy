package com.gsl.oros.core.banking.settings

import com.gsl.oros.core.banking.clients.RetailOtherBank

class Branch {

    String name
//    Bank bank
    //Country country
    Integer branchCode

    static  belongsTo = [bank : Bank]
    static hasMany = [retailOtherBank: RetailOtherBank]

    static constraints = {
        branchCode nullable: true, blank: true
    }
}
