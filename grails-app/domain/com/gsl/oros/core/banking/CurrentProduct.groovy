package com.gsl.oros.core.banking

class CurrentProduct {

    String productName
    String productCode
    Double initialAmountMin
    Double initialAmountMax
    Double balanceMin
    Double balanceMax

    static constraints = {
        productName nullable: false;
        productCode nullable: false;
        initialAmountMin nullable: false;
        initialAmountMax nullable: false;
        balanceMin nullable: false;
        balanceMax nullable: false;
    }
}
