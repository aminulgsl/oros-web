package com.gsl.oros.core.banking.operation

class DepositTypeCash {
    long accountNo
    String name
    String address
    String phoneNo
    String comment

    static belongsTo = [deposit: Deposit]

    static constraints = {
        accountNo nullable: true
        name nullable: true
        phoneNo nullable: true
        address nullable: true
        comment nullable: true
    }
}
