package com.gsl.oros.core.banking

import com.gsl.plugin.attachments.OrosAttachment

class PersonalInfo {
    String name
    String fatherName
    String motherName
    String gender
    String maritalStatus
    String presentAddress
    String permanentAddress
    String nationality
    String nationalId
    String email
    String phoneNo
    String profession

    static hasMany = [nominee:Nominee,otherBankAccount:OtherBankAccount,attachments:OrosAttachment]

    static constraints = {
        name nullable: false
        fatherName nullable: false
        motherName nullable: false
        gender nullable: false
        maritalStatus nullable: false
        presentAddress nullable: false
        permanentAddress nullable: false
        nationality nullable: false
        nationalId nullable: false
        email nullable: false
        phoneNo nullable: false
        profession nullable: true

    }
}
