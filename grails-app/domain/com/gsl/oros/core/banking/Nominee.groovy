package com.gsl.oros.core.banking

class Nominee {
    String firstName
    String middleName
    String lastName
    String fatherName
    String motherName
    String gender
    String presentAddress
    String permanentAddress
    String nationality
    String nationalId
    String phoneNo
    String relation
    String profession
    Boolean status = true

    static constraints = {
        firstName nullable: false
        middleName nullable: true
        lastName nullable: false
        fatherName nullable: false
        motherName nullable: false
        gender nullable: false
        presentAddress nullable: false
        permanentAddress nullable: false
        nationality nullable: false
        nationalId nullable: false
        phoneNo nullable: true
        relation nullable: false
        profession nullable: false
    }
}
