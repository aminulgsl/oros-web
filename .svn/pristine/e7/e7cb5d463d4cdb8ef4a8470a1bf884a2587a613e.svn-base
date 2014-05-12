package com.gsl.oros.core.banking.clients

import com.gsl.oros.core.banking.attachments.Signatures

class RetailAccount {

    String title
    Date openingDate
    String accountPurpose
    Integer termAndCondition
    Long createAccountInfoId // fk

    boolean status = true

    static hasMany = [retailIntroducer: RetailIntroducer, retailOtherBank: RetailOtherBank, retailNominee: RetailNominee, retailSignature: Signatures]

    static constraints = {
        /*title blank: true, nullable: true
        openingDate blank: true, nullable: true
        accountPurpose blank: true, nullable: true
        termAndCondition blank: true, nullable: true
        status blank: true, nullable: true*/
    }

}
