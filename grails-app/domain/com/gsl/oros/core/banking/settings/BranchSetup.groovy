package com.gsl.oros.core.banking.settings

class BranchSetup {
    static hasMany = [generalAdd: Address, postalAdd: Address]
    String branchFullName
    String branchShortName
    String branchType
    String parentOffice
    Boolean status
    static constraints = {

    }
}
