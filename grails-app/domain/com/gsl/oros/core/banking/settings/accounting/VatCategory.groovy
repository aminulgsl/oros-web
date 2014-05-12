package com.gsl.oros.core.banking.settings.accounting

class VatCategory {

    String name
    String rate

    static hasMany = [chartMasters: ChartMaster]

    static constraints = {
    }
}
