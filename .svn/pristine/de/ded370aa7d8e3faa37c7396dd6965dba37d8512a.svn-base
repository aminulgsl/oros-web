package com.gsl.oros.core.banking.settings

class BankSetup {

    String bankFullName
    String bankShortName
    String chamberCommerceNo
    String logo
    String fileDir

    Currencys currencys
    String bankDateFormat
    Integer amntDeciPoint
    String dateSeparator
    String deciRoundType
    String decimalSeparator
    Integer percentageDeciPoint
    String language
    Integer numOfBookingPeriod
    Integer qtyDeciPoint
    String reportPageSize
    Boolean showGlCodeInReport
    Boolean showItemCodeInReport
    String taxType
    String thousandSeparator
    String reportDateFormat

    String taxNo
    String vatNo
    String paymentTerm
    String defaultVat
    Double incomeTaxReservation
    Double unforeseenExpenseReservation
    String invoiceMoment



    static hasMany = [generalAdd: Address, postalAdd: Address]

    static constraints = {
        bankFullName(nullable: false, blank: false)
        bankShortName(nullable: false, blank: false)

        logo(nullable: true, blank: true)
        fileDir(nullable: true)
        unforeseenExpenseReservation(nullable: true, blank: true)
        numOfBookingPeriod(nullable: true, blank: true)
        chamberCommerceNo(nullable: true, blank: true)
        taxNo(nullable: true, blank: true)
        vatNo(nullable: true, blank: true)
        percentageDeciPoint(nullable: true, blank: true)
        qtyDeciPoint(nullable: true, blank: true)
        reportPageSize(nullable: true, blank: true)
        taxType(nullable: true, blank: true)

    }
}
