package com.gsl.oros.core.banking.settings.accounting

import com.gsl.oros.core.banking.settings.Address

class CustomerMaster {
    String customerCode
    String customerName
    String gender
    String bankName
    String firstName
    String middleName
    String lastName
    String email
    String defaultGlAccount
    String momentOfSending
    String chamberOfCommerce
    String customerType
    VatCategory vat
    String comments
    PaymentTerms paymentTerm
    int status

    static hasMany = [generalAddress:Address,
            postalAddress:Address,
            shippingAddress:Address,
            bankAccounts:CustomerBankAccount]

    static constraints = {
        customerCode nullable: false, unique: true
        customerName nullable: false
        gender nullable: true
        bankName nullable: true
        firstName nullable: true
        middleName nullable: true
        lastName nullable: true
        email nullable: true
        defaultGlAccount nullable: true
        momentOfSending nullable: true
        chamberOfCommerce nullable: true
        customerType nullable: false
        vat nullable: true
        comments nullable: true
        status nullable: false
    }
}