package com.gsl.oros.core.banking.operation

import com.gsl.cbs.contraints.enums.DepositType
import com.gsl.uma.security.User

class Deposit {

    Long accountHolderId
    Long branchId
    Date dateOfDeposit
    String recipientCurrency
    String depositorCurrency      // USD, BDT
    int status          //1001=posting, 2001= checking
    Double amount
    Double balance
    DepositType depositType      // CHECK, CASH, BANK_TRANSFER, CREDIT_CARD

    User createdBy        // User.id
    Date createdOn = new Date()      // current date & time
    User updatedBy        // User.id
    Date updatedOn      // current date & time

    static constraints = {
        updatedBy nullable: true
        updatedOn nullable: true
    }
}
