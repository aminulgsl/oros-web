package com.gsl.oros.core.banking

class Product {
    String productName
    String productCode
    Long currencyId
    Double initialAmountMin
    Double initialAmountMax
    Double balanceMin
    Double balanceMax

    static constraints = {
        productName nullable: false;
        productCode nullable: false;
        currencyId nullable: false;
        initialAmountMin nullable: false;
        initialAmountMax nullable: false;
        balanceMin nullable: false;
        balanceMax nullable: false;
    }
}
