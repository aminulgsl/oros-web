package com.gsl.oros.core.banking.clients

class RetailNominee {

    String firstName
    String middleName
    String lastName
    String email
    String addressLine1
    String addressLine2
    String accountNo
    Date dob
    String branchName
    String contactNo
    String type
    String relation
    String gender
    Boolean status = true

    //static belongsTo = [retailAccount :RetailAccount]

    static constraints = {
        firstName blank: true, nullable: true
        middleName blank: true, nullable: true
        lastName blank: true, nullable: true
        email blank: true, nullable: true
        addressLine1 blank: true, nullable: true
        addressLine2 blank: true, nullable: true
        accountNo blank: false, nullable: false   // must fillup
        dob blank: false, nullable: false         // must fillup
        branchName blank: true, nullable: true
        contactNo blank: true, nullable: true
        type blank: true, nullable: true
        relation blank: true, nullable: true
        gender blank: false, nullable: false      // must fillup
        status blank: true, nullable: true
    }
}
