package com.gsl.oros.core.banking

import com.gsl.cbs.contraints.enums.GenderType
import com.gsl.cbs.contraints.enums.MaritialStatus
import com.gsl.uma.security.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class SavingsAccountController {

    @Secured(['ROLE_SUPER_ADMIN'])
    def index() {
        render(view: 'savingsAccountInfo')
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def openingForm() {
        render(view: 'openingForm')
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def savePersonalInfo(PersonalInfoCommand personalInfoCommand) {
        if (!request.method == 'POST') {
            flash.message = "This action is not allowed!"
            redirect(action: 'openingForm')
        }
        else {
            if (personalInfoCommand.hasErrors()) {
                def result = [isError:true, message:"Personal Info data has any problem!!"]
                render result as JSON
                return
            }
            if(personalInfoCommand.id){ // update
                PersonalInfo personalInfo = PersonalInfo.get(personalInfoCommand.id)
                personalInfo.properties = personalInfoCommand.properties
                if(!personalInfo.validate()){
                    def result = [isError:true, message:"Personal info data have some validation problem!"]
                    render result as JSON
                    return
                }
                PersonalInfo updatedPersonalInfo = personalInfo.save()
                if (!updatedPersonalInfo){
                    def result = [isError:true, message:"Personal Info not updated successfully!"]
                    render result as JSON
                    return
                }
                def result = [isError:false, message:"Personal info update successfully!", update:true, personalInfo:updatedPersonalInfo]
                render result as JSON
            }
            else { // add
                PersonalInfo personalInfo = new PersonalInfo(personalInfoCommand.properties)
                if(!personalInfo.validate()){
                    def result = [isError:true, message:"Personal Info not validated successfully!"]
                    render result as JSON
                    return
                }
                PersonalInfo savedPersonalInfo = personalInfo.save(flush: true)
                if(!savedPersonalInfo){
                    def result = [isError:true, message:"Personal Info not added successfully!"]
                    render result as JSON
                    return
                }
                def result = [isError:false, add:true, message:"Personal Info Added successfully!", personalInfo: savedPersonalInfo]
                render result as JSON
            }
        }
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def saveNominee(NomineeCommand nomineeCommand){
        if (!request.method == 'POST') {
            flash.message = "This action is not allowed!"
            render (view: 'openingForm')
        }
        else {
            PersonalInfo personalInfo = PersonalInfo.get(nomineeCommand.personalId)
            if (nomineeCommand.hasErrors()) {
                def result = [isError:true, message:"Nominee Info data has any problem!!"]
                render result as JSON
                return
            }
            if(nomineeCommand.id){ // update
                def row = params.row
                Nominee nominee = Nominee.get(nomineeCommand.id)
                nominee.properties = nomineeCommand.properties
                if(!nominee.validate()){
                    def result = [isError:true, message:"Nominee info data have some validation problem!"]
                    render result as JSON
                    return
                }
                Nominee updatedNominee = nominee.save()
                if (!updatedNominee){
                    def result = [isError:true, message:"Nominee Info not updated successfully!"]
                    render result as JSON
                    return
                }
                def result = [isError:false, message:"Nominee info update successfully!", update:true, personalInfo:personalInfo, nominee: updatedNominee, row: row]
                render result as JSON
            }
            else { // add
                Nominee nominee = new Nominee(nomineeCommand.properties)
                if(!nominee.validate()){
                    def result = [isError:true, message:"Nominee Info not validated successfully!"]
                    render result as JSON
                    return
                }
                Nominee savedNominee = nominee.save(flush: true)
                if(!savedNominee){
                    def result = [isError:true, message:"Nominee not added successfully!"]
                    render result as JSON
                    return
                }
                personalInfo.addToNominee(savedNominee)
                PersonalInfo savedPersonalInfo = personalInfo.save(flash:true)
                def result = [isError:false, add:true, message:"Nominee Info Added successfully!", nominee: savedNominee, personalInfo:savedPersonalInfo]
                render result as JSON
            }
        }
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def editNominee(Long id, Long row) {
        Nominee nominee = Nominee.findById(id)
        if(!nominee){
            def result = [isError:true, message:"Nominee not found !"]
            render result as JSON
            return
        }
        def result = [isError:false, nominee: nominee, row:row]
        render result as JSON
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def deleteNominee(Long id, Long personalId) {
        PersonalInfo personalInfo = PersonalInfo.get(personalId)
        if(!personalInfo){
            def result = [isError:true, message:"You are not found!"]
            render result as JSON
            return
        }
        Nominee nominee = Nominee.get(id)
        if (!nominee) {
            def result = [isError:true, message:"Nominee not found!"]
            render result as JSON
            return
        }
        nominee.status = false
        PersonalInfo savedPersonalInfo = personalInfo.save()
        if (!savedPersonalInfo){
            def result = [isError:true, message:"Nominee info not deleted!"]
            render result as JSON
            return
        }
        savedPersonalInfo.nominee?.removeAll {it.status== false}
        def result = [isError:false, message:"Nominee info deleted successfully!"]
        String output = result as JSON
        render output
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def saveOtherBankAccount(OtherBankAccountCommand otherBankAccountCommand){
        if (!request.method == 'POST') {
            flash.message = "This action is not allowed!"
            render (view: 'openingForm')
        }
        else {
            PersonalInfo personalInfo = PersonalInfo.get(otherBankAccountCommand.personalId)
            if (otherBankAccountCommand.hasErrors()) {
                def result = [isError:true, message:"Other bank account Info data has any problem!!"]
                render result as JSON
                return
            }
            if(otherBankAccountCommand.id){ // update
                def row = params.row
                OtherBankAccount otherBankAccount = OtherBankAccount.get(otherBankAccountCommand.id)
                otherBankAccount.properties = otherBankAccountCommand.properties
                if(!otherBankAccount.validate()){
                    def result = [isError:true, message:"Other bank account info data have some validation problem!"]
                    render result as JSON
                    return
                }
                OtherBankAccount updatedOtherBankAccount = otherBankAccount.save()
                if (!updatedOtherBankAccount){
                    def result = [isError:true, message:"Other bank account Info not updated successfully!"]
                    render result as JSON
                    return
                }
                def result = [isError:false, message:"Other bank account info update successfully!", update:true, personalInfo:personalInfo, otherBankAccount: updatedOtherBankAccount, row: row]
                render result as JSON
            }
            else { // add
                OtherBankAccount otherBankAccount = new OtherBankAccount(otherBankAccountCommand.properties)
                if(!otherBankAccount.validate()){
                    def result = [isError:true, message:"Other bank account Info not validated successfully!"]
                    render result as JSON
                    return
                }
                OtherBankAccount savedOtherBankAccount = otherBankAccount.save(flush: true)
                if(!savedOtherBankAccount){
                    def result = [isError:true, message:"Other bank account not added successfully!"]
                    render result as JSON
                    return
                }
                personalInfo.addToOtherBankAccount(savedOtherBankAccount)
                PersonalInfo savedPersonalInfo = personalInfo.save(flash:true)
                def result = [isError:false, add:true, message:"Other bank account Info Added successfully!", otherBankAccount: savedOtherBankAccount, personalInfo:savedPersonalInfo]
                render result as JSON
            }
        }
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def editOtherBankAccount(Long id, Long row) {
        OtherBankAccount otherBankAccount = OtherBankAccount.findById(id)
        if(!otherBankAccount){
            def result = [isError:true, message:"Other bank account not found !"]
            render result as JSON
            return
        }
        def result = [isError:false, otherBankAccount: otherBankAccount, row:row]
        render result as JSON
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def deleteOtherBankAccount(Long id, Long personalId) {
        PersonalInfo personalInfo = PersonalInfo.get(personalId)
        if(!personalInfo){
            def result = [isError:true, message:"You are not found!"]
            render result as JSON
            return
        }
        OtherBankAccount otherBankAccount = OtherBankAccount.get(id)
        if (!otherBankAccount) {
            def result = [isError:true, message:"Other bank account not found!"]
            render result as JSON
            return
        }
        otherBankAccount.status = false
        PersonalInfo savedPersonalInfo = personalInfo.save()
        if (!savedPersonalInfo){
            def result = [isError:true, message:"Other bank account info not deleted!"]
            render result as JSON
            return
        }
        savedPersonalInfo.nominee?.removeAll {it.status== false}
        def result = [isError:false, message:"Other bank account info deleted successfully!"]
        String output = result as JSON
        render output
    }
}

class PersonalInfoCommand {
    Long id
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

    static constraints = {
        importFrom PersonalInfo
        id nullable: true
    }
}

class NomineeCommand {
    Long id
    Long personalId
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

    static constraints = {
        importFrom Nominee
        id nullable: true
    }
}

class OtherBankAccountCommand {
    Long id
    Long personalId
    String bankName
    String ibanPrefix
    String bankAccountNo
    String bankAccountName

    static constraints = {
        importFrom Nominee
        id nullable: true
    }
}


