package com.gsl.oros.core.banking.product.savings

class SavingsTransactionFee {
    Long transactionId
    Long type
    Double startAmount
    Double endAmount
    Double rate
    String rateType

    //static belongsTo = [savingsTransaction: SavingsTransaction]

    static constraints = {
        transactionId nullable: false;
        type nullable: false;
        startAmount nullable: false;
        endAmount nullable: false;
        rate nullable: false;
        rateType nullable: false;
    }
}
