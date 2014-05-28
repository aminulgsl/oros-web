package com.gsl.oros.core.banking

import com.gsl.cbs.contraints.enums.RequestStatus
import com.gsl.uma.security.User

class AccOpenRequest {
    Long product
    User user
    Long personalInfo
    RequestStatus status
    Date requestDate
    Date approvedDate

    static constraints = {
        product nullable: false
        user nullable: false
        personalInfo nullable: false
        status nullable: false
        requestDate nullable: false
        approvedDate nullable: true
    }
}
