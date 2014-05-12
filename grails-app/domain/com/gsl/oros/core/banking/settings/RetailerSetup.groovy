package com.gsl.oros.core.banking.settings

class RetailerSetup {
    static hasMany = [addresss: Address]
    BranchSetup branchSetup
    Currencys currencys
    String retailerName
    String retailerCode
    String account
    Boolean status
    Double minAmountPerDay
    Double maxAmountPerDay
    Double minDeposit
    Double maxDeposit
    Double minWithdrawal
    Double maxWithdrawal
    static constraints = {

    }
}
