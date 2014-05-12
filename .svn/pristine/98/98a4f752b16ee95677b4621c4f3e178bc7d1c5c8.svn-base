package com.gsl.oros.core.banking.settings

class OthersBankSetup {
    String bankFullName
    String bankShortName
    String iban
    String contactName
    String contactDesignation
    String contactPhone
    String contactMobile
    String contactEmail
    Boolean status

    static hasMany = [generalAdd: Address, postalAdd: Address]

    static constraints = {
        contactEmail nullable: true
    }
}
