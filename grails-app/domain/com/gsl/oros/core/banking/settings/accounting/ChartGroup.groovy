package com.gsl.oros.core.banking.settings.accounting

import com.gsl.oros.core.banking.settings.ChartClass

class ChartGroup {

    String name
    Integer status
    String accountantName


    static belongsTo = [chartClass: ChartClass, parentGroup:ChartGroup]
    static hasMany = [chartMasters: ChartMaster, parentGroups: ChartGroup]


    static constraints = {
        name blank: false, nullable: false, unique: true
        accountantName blank: true, nullable: true
        status blank: false, nullable: false
        parentGroup nullable: true
    }
}
