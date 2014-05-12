package com.gsl.oros.core.banking.operation

class DepositTypeCheque {
    long accountNo
    String name
    long bankId
    String branch
    String chequeNumber
    String address
    String comment

    static belongsTo = [deposit:Deposit]

    static constraints = {
        address nullable: true
        comment nullable: true
    }
}
