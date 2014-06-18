package com.gsl.oros.core.banking

import com.gsl.cbs.contraints.enums.RequestStatus
import com.gsl.uma.security.User

class AccOpenRequest {
    User user
    PersonalInfo personalInfo
    String accountType
    Long productId
    String productName
//    SavingsProduct savingsProduct
//    CurrentProduct currentProduct
    RequestStatus status
    Date requestDate
    Date approvedDate

    static constraints = {
        user nullable: false
        personalInfo nullable: false
        accountType nullable: false
        productId nullable: false
        productName nullable: false
//        savingsProduct nullable: true
//        currentProduct nullable: true
        status nullable: false
        requestDate nullable: false
        approvedDate nullable: true
    }
}
