package com.gsl.oros.core.banking.product.savings

class SavingsProduct {
    String productName
    String productCode
    Long currencyId
    Double initialAmountMin
    Double initialAmountMax
    Double balanceMin
    Double balanceMax

//    static hasMany = [savingsProductClientType : SavingsProductClientType, savingsAgioFee: SavingsAgioFee, savingsCloseFee: SavingsCloseFee, savingsEntryFee: SavingsEntryFee,
//                      savingsFixedOverdraftFee : SavingsFixedOverdraftFee, savingsInterest: SavingsInterest, savingsManagementFee: SavingsManagementFee,
//                      savingsReopenFee: SavingsReopenFee, savingsTermSetup: SavingsTermSetup, savingsTransaction: SavingsTransaction]

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
