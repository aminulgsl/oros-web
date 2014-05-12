package com.gsl.oros.core.banking.settings

import com.gsl.oros.core.banking.settings.accounting.ChartGroup


class ChartClass {

    String name
    String accountantName
    int status

    static belongsTo = [chartClassType: ChartClassType]

    static hasMany = [chartGroups: ChartGroup]



    static constraints = {
        name blank: false, nullable: false, unique: true
        status blank: true ,nullable: true
        accountantName blank: true, nullable: true
    }



}
