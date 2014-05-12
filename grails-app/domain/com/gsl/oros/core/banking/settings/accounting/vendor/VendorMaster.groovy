package com.gsl.oros.core.banking.settings.accounting.vendor

import com.gsl.oros.core.banking.settings.Address

class VendorMaster {

    Integer byShop
    String chamOfCommerce
    String comments
    String companyName
    String creditStatus
    String currCode
    String defaultGlAccount
    String email
    String firstName
    String frequencyOfInvoice
    String gender
    String lastName
    String middleName
    String momentOfSending
    Integer status
    String vat
    String vendorCode
    String vendorName
    String vendorType
    Integer paymentTermId
    Address generalAddress
    Address postalAddress
    boolean postalAsGeneral

    static hasMany = [bankAccountInfo:VendorBankAccount]
    static constraints = {
        generalAddress nullable: true
        postalAddress nullable: true
        bankAccountInfo nullable: true
        chamOfCommerce nullable: true
        creditStatus nullable: false
        comments nullable: true
        defaultGlAccount nullable: true
        email nullable: true, email: true
        firstName nullable: true
        gender nullable: true
        frequencyOfInvoice nullable: true
        lastName nullable: true
        currCode nullable: true
        momentOfSending nullable: true
        middleName nullable: true
        paymentTermId nullable: false
        companyName nullable: true
        status nullable: false
        vat nullable: true
        vendorCode nullable: false, unique: true
        vendorName nullable: false
        vendorType nullable: true
        byShop nullable: false
    }
}
