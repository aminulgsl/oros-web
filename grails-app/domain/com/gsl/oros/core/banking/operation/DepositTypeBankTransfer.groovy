package com.gsl.oros.core.banking.operation

class DepositTypeBankTransfer {
    String accountNo
    String name
    String address
    long bankId
    String branch
    String pinCode
    String comment

    static belongsTo = [deposit: Deposit]

    static constraints = {
        address nullable: true
        comment nullable: true
    }
}
