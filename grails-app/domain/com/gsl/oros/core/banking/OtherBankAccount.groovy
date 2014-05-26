package com.gsl.oros.core.banking

class OtherBankAccount {
    String bankName
    String ibanPrefix
    String bankAccountNo
    String bankAccountName
    Boolean status = true

    static constraints = {
        bankName nullable: false
        bankAccountName nullable: false
        bankAccountNo nullable: false
        ibanPrefix nullable: false
        status nullable: false
    }
}
