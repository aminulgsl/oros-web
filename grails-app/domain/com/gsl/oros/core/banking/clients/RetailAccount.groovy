package com.gsl.oros.core.banking.clients
//import com.gsl.cbs.contraints.enums.StatusType
//import com.gsl.oros.core.banking.accountHolder.AccountHolder
import com.gsl.plugin.attachments.RetailAttachment
import com.gsl.plugin.attachments.RetailSignatures


class RetailAccount {

    String title
    Date openingDate
    String accountPurpose
    Integer termAndCondition
//    AccountHolder accountHolder //fk
    String bankAccountNo

    boolean status = true
//    StatusType statusType = StatusType.DRAFT

    static hasMany = [
            retailIntroducer: RetailIntroducer,
            retailOtherBank : RetailOtherBank,
            retailNominee   : RetailNominee,
            retailSignature : RetailSignatures,
            retailAttachment: RetailAttachment
    ]

    static constraints = {
        bankAccountNo blank: true, nullable: true
    }

}
