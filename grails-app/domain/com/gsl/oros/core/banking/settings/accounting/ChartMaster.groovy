package com.gsl.oros.core.banking.settings.accounting

class ChartMaster {

    String accountCode
    String accountCode2
    String accountName
    Integer ordering
    Integer status
    String accountantName
    //Integer vatCategoryId


    static belongsTo = [chartGroup: ChartGroup, vatCategory:VatCategory]



    static constraints = {
        accountCode blank: false ,nullable: false, unique: true
        accountCode2 blank: true ,nullable: true
        accountName blank: false ,nullable: false
        ordering blank: false ,nullable: false
        status blank: false ,nullable: false
        accountantName blank: true, nullable: true
    }

}
