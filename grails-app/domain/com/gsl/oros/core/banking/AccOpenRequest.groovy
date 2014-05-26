package com.gsl.oros.core.banking

import com.gsl.cbs.contraints.enums.RequestStatus

class AccOpenRequest {
    Product product
    PersonalInfo personalInfo
    RequestStatus status
    Date requestDate
    Date approvedDate

    static constraints = {
        product nullable: false
        personalInfo nullable: false
        status nullable: false
        requestDate nullable: false
        approvedDate nullable: true
    }
}
