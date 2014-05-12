package com.gsl.oros.core.banking.accountHolder

class EducationalInfo {
    String degreeName
    String boardName
    String instituteName
    String achievedResult
    Boolean status
//    static belongsTo = [accountHolder:AccountHolder]

    static constraints = {
        degreeName nullable: false
        boardName nullable: false
        instituteName nullable: false
        achievedResult nullable: false
    }
}
