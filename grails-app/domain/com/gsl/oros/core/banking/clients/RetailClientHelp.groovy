package com.gsl.oros.core.banking.clients

class RetailClientHelp {

    String gross
    Integer timeHorizon
    Integer risk
    String benchmark
    RetailAccount retailAccount

    static constraints = {
        gross nullable: true
        risk nullable: true
        benchmark nullable: true
        timeHorizon nullable: true
    }
}
