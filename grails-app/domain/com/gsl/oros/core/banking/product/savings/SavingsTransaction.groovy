package com.gsl.oros.core.banking.product.savings

class SavingsTransaction {
    Integer typeId
    Integer productId
    Double depositMin
    Double depositMax
    Double withdrawMin
    Double withdrawMax
    Double transferMin
    Double transferMax

    //static belongsTo = [savingsProduct:SavingsProduct]

    static constraints = {
        typeId nullable: false;
        productId nullable: false;
        depositMin nullable: false;
        depositMax nullable: false;
        withdrawMin nullable: false;
        withdrawMax nullable: false;
        transferMin nullable: false;
        transferMax nullable: false;
    }
}
