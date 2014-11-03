package com.gsl.oros.core.banking.clients

class RetailAdditionalDetail {

    String residencyTax
    String domicile
    String incomeTax
    String insurenceNo
    String taxReference
    RetailAccount retailAccount

    static constraints = {
        residencyTax nullable: true
        domicile nullable: true
        incomeTax nullable: true
        insurenceNo nullable: true
        taxReference nullable: true
    }
}
