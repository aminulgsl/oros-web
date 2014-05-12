package com.gsl.oros.core.banking.product.savings

import com.gsl.oros.core.banking.settings.ClientCategory

class SavingsProductClientType {
    Integer clientCategoryId
    Integer productId

    static belongsTo = [savingsProduct:SavingsProduct]

    static constraints = {
        clientCategoryId nullable: false;
        productId nullable: false;
    }
}
