package com.gsl.oros.core.banking.settings

class OthersBranchSetup {
    String branchFullName
    String branchShortName
    String contactName
    String contactDesignation
    String contactPhone
    String contactMobile
    String contactEmail
    Boolean status

    OthersBankSetup bankName
    static hasMany = [generalAdd: Address, postalAdd: Address]

    static constraints = {
        contactEmail nullable: true
    }
}
