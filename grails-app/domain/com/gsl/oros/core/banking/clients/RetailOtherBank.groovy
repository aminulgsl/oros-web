package com.gsl.oros.core.banking.clients

import com.gsl.oros.core.banking.settings.Bank
import com.gsl.oros.core.banking.settings.Branch

class RetailOtherBank {

    String accountNo
    String accountName
    String type
    String sortCode

    boolean status = true


    static belongsTo = [bank:Bank, branch:Branch]

    static constraints = {
        /*accountNo   blank: true, nullable: true
        accountName blank: true, nullable: true
        type        blank: true, nullable: true
        sortCode    blank: true, nullable: true
        status      blank: true, nullable: true*/
    }
}
