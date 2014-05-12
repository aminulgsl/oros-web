package com.gsl.oros.core.banking.settings

import com.gsl.oros.core.banking.settings.ChartClass

class ChartClassType {

    String classType
    int status

    static hasMany = [chartClasses: ChartClass]
}
