package com.gsl.oros.core.banking.product.savings

class SavingsAgioFee {
    Integer productId
    Integer circleId
    Double min
    Double max
    Integer rateType
    Double value

    static belongsTo = [savingsProduct:SavingsProduct]

    static constraints = {
        productId nullable: false;
        circleId nullable: false;
        min nullable: false;
        max nullable: false;
        rateType nullable: false;
        value nullable: false;
    }
}
