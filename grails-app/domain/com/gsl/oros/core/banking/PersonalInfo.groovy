package com.gsl.oros.core.banking

class PersonalInfo {
    String fatherName
    String motherName
    String gender
    String maritalStatus
    String presentAddress
    String permanentAddress
    String nationality
    String nationalId
    String phoneNo
    String profession

    static hasMany = [nominee:Nominee,otherBankAccount:OtherBankAccount]

    static constraints = {
        fatherName nullable: false
        motherName nullable: false
        gender nullable: false
        maritalStatus nullable: false
        presentAddress nullable: false
        permanentAddress nullable: false
        nationality nullable: false
        nationalId nullable: false
        phoneNo nullable: false
        profession nullable: true

    }
}
