package com.gsl.oros.core.banking.operation

import com.gsl.oros.core.banking.clients.RetailIntroducer

class Client {
    String name
    String accountNo
    String address
    String contactNo
    String imageUrl
    String signatureUrl

    static hasMany = [retailIntroducers: RetailIntroducer]

    static constraints = {
    }
}
