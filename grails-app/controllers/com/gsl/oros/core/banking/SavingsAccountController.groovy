package com.gsl.oros.core.banking

import com.gsl.cbs.contraints.enums.RequestStatus
import com.gsl.plugin.attachments.AttachStatus
import com.gsl.plugin.attachments.OrosAttachment
import com.gsl.uma.security.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile

class SavingsAccountController {
    def imageIndirectService
    def springSecurityService

    @Secured(['ROLE_SUPER_ADMIN'])
    def index() {
        render(view: 'products', model: [savingsProductList:SavingsProduct.list()])
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def product() {
        render(view: 'savingsAccountInfo', model: [productId:params.productId])
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def apply() {
        Long userId = springSecurityService.principal.id
        User loggedUser = User.read(userId)
        PersonalInfo personalInfo = PersonalInfo.read(params.personalId)
        render(view: 'openingForm', model: [user:loggedUser, productId:params.productId, personalInfo:personalInfo])
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def savePersonalInfo(SavingsPersonalInfoCommand personalInfoCommand) {
        if (!request.method == 'POST') {
            flash.message = "This action is not allowed!"
            redirect(action: 'apply')
        }
        else {
            Long userId = springSecurityService.principal.id
            User loggedUser = User.read(userId)
            SavingsProduct savingsProduct = SavingsProduct.read(personalInfoCommand.productId)
            if (personalInfoCommand.hasErrors()) {
                def result = [isError:true, message:"Personal Info data has any problem!"]
                render result as JSON
                return
            }
            if(personalInfoCommand.id){ // update
                PersonalInfo personalInfo = PersonalInfo.get(personalInfoCommand.id)
                personalInfo.properties = personalInfoCommand.properties
                personalInfo.name = loggedUser.username
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
                personalInfo.name = loggedUser.username
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
                AccOpenRequest accOpenRequest = new AccOpenRequest(user: loggedUser.id, personalInfo: savedPersonalInfo.id, savingsProduct: savingsProduct.id, status: RequestStatus.DRAFT, requestDate: new Date())
                AccOpenRequest savedAccOpenRequest = accOpenRequest.save(flush: true)
                savedPersonalInfo.accOpenRequest = savedAccOpenRequest
                loggedUser.addToAccOpenRequest(savedAccOpenRequest)
                loggedUser.save(flush: true)
                savingsProduct.addToAccOpenRequest(savedAccOpenRequest)
                savingsProduct.save(flush: true)

                def result = [isError:false, add:true, message:"Personal Info Added successfully!", personalInfo: savedPersonalInfo]
                render result as JSON
            }
        }
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def saveNominee(SavingsNomineeCommand nomineeCommand){
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
                if ((personalInfo.otherBankAccount[0]!=null)&&(personalInfo.attachments[0]!=null)){
                    personalInfo.accOpenRequest.status = RequestStatus.SUBMITTED
                }
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
        if ((savedPersonalInfo.nominee[0]==null)){
            savedPersonalInfo.accOpenRequest.status = RequestStatus.DRAFT
        }
        def result = [isError:false, message:"Nominee info deleted successfully!"]
        String output = result as JSON
        render output
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def saveOtherBankAccount(SavingsBankAccountCommand otherBankAccountCommand){
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
                if ((personalInfo.nominee[0]!=null)&&(personalInfo.attachments[0]!=null)){
                    personalInfo.accOpenRequest.status = RequestStatus.SUBMITTED
                }
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
        savedPersonalInfo.otherBankAccount?.removeAll {it.status== false}
        if ((savedPersonalInfo.otherBankAccount[0]==null)){
            savedPersonalInfo.accOpenRequest.status = RequestStatus.DRAFT
        }
        def result = [isError:false, message:"Other bank account info deleted successfully!"]
        String output = result as JSON
        render output
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def saveAttachment(SavingsAttachmentsCommand attachmentsCommand){
        ArrayList<String> extList = new ArrayList<String>();
        extList.add(".jpg");
        extList.add(".jpeg");
        extList.add(".gif");
        extList.add(".png");
        extList.add(".bmp");
        extList.add(".pdf");
//        String [] allowedAttachmentList = ['']

        String type
        Long size
        String fileName
        String originalFileName
        if (!request.method == 'POST') {
            flash.message = "This action not allowed"
            render (view: 'clientList')
            return
        }
        if(!params.personalId){
            def result = [isError:true, message:"You are not found!"]
            render result as JSON
            return
        }
        if (attachmentsCommand.hasErrors()) {
            def result = [isError:true, message:"Identification document has any problem!!"]
            render result as JSON
            return
        }

        PersonalInfo personalInfo =  PersonalInfo.get(attachmentsCommand.personalId)
        if(!personalInfo){
            def result = [isError:true, message:"You are not found!"]
            render result as JSON
            return
        }
        String fileDir = personalInfo.id.toString()
        fileName = request.getFileNames()[0]
        MultipartFile uploadedFile = request.getFile(fileName)
        type = uploadedFile.contentType
        size = uploadedFile.size
        originalFileName = uploadedFile.originalFilename

        OrosAttachment orosAttachment
        if(attachmentsCommand.id){
            def row = params.row
            orosAttachment = personalInfo.attachments.find{it.id == attachmentsCommand.id}
            if(!orosAttachment){
                def result = [isError:true, message:"Identification document not found!"]
                render result as JSON
                return
            }
            if (uploadedFile.empty){
                orosAttachment.properties['name','description','caption','remarks'] = [name:fileName,description: attachmentsCommand.caption,caption: attachmentsCommand.caption,remarks: attachmentsCommand.remarks]
            }else {
                orosAttachment.properties['name', 'description', 'originalName', 'type', 'size', 'caption', 'remarks'] = [
                        name         : fileName,
                        description  : attachmentsCommand.caption,
                        originalName : originalFileName,
                        type         : type,
                        fileDir      : fileDir,
                        size         : size,
                        caption      : attachmentsCommand.caption,
                        remarks      : attachmentsCommand.remarks]
                int a = originalFileName.lastIndexOf(".")
                String extName = originalFileName.substring(a)
                if(!(extList.contains(extName)))
                {
                    def result = [isError:true, message:"Invalid file type!"]
                    render result as JSON
                    return
                }
                if(size>=900000){
                    def result = [isError:true, message:"File is greater than 900 KB!"]
                    render result as JSON
                    return
                }
            }
            if(!orosAttachment.validate()){
                def result = [isError:true, message:"Identification document data have some validation problem!"]
                render result as JSON
                return
            }
            OrosAttachment updatedAttachment = orosAttachment.save()
            if(!updatedAttachment){
                // unable to upload file
                def result = [isError:true, message:"Identification document not updated successfully!"]
                render result as JSON
                return
            }
            File savedFile = imageIndirectService.storeFile(uploadedFile,orosAttachment.link,fileDir)
            if(!savedFile){
                // unable to upload file
                def result = [isError:true, message:"Identification document not updated successfully!"]
                render result as JSON
                return
            }
            def result = [isError:false, message:"Identification document update successfully!",
                    update:true, personalInfo:personalInfo, attachments: updatedAttachment, row: row]
            render result as JSON
        }
        else{
            if (uploadedFile.empty) {
                def result = [isError:true, message:"Identification document not found!"]
                render result as JSON
                return
            }
            orosAttachment = new OrosAttachment(
                    name: fileName,
                    description: attachmentsCommand.caption,
                    originalName: originalFileName,
                    type: type,
                    fileDir: fileDir,
                    size: size,
                    caption: attachmentsCommand.caption,
                    remarks: attachmentsCommand.remarks
            )
            if(!orosAttachment.validate()){
                def result = [isError:true, message:"Identification document data have some validation problem!"]
                render result as JSON
                return
            }
            int a = originalFileName.lastIndexOf(".")
            String extName = originalFileName.substring(a)
            if(!(extList.contains(extName)))
            {
                def result = [isError:true, message:"Invalid file type!"]
                render result as JSON
                return
            }
            if(size>=900000){
                def result = [isError:true, message:"File is greater than 900 KB!"]
                render result as JSON
                return
            }
            OrosAttachment savedAttachment = orosAttachment.save(flush: true)
            if(!savedAttachment){
                def result = [isError:true, message:"Identification document not added successfully!"]
                render result as JSON
                return
            }
            personalInfo.getAttachments().add(savedAttachment)
            if ((personalInfo.nominee[0]!=null)&&(personalInfo.otherBankAccount[0]!=null)){
                personalInfo.accOpenRequest.status = RequestStatus.SUBMITTED
            }
            PersonalInfo savedPersonalInfo = personalInfo.save()
            if(!savedPersonalInfo){
                def result = [isError:true, message:"Identification document not saved successfully!"]
                render result as JSON
                return
            }
            File savedFile = imageIndirectService.storeFile(uploadedFile,orosAttachment.link,fileDir)
            if(!savedFile){
                // unable to upload file
                def result = [isError:true, message:"Identification document not saved successfully!"]
                render result as JSON
                return
            }
            def result = [isError:false, message:"Identification document added successfully!",
                    add:true, personalInfo:savedPersonalInfo, attachments: savedAttachment]
            render result as JSON
        }
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def downloadIdentification(Long attachmentId){
        OrosAttachment orosAttachment = OrosAttachment.read(attachmentId)
        if(!orosAttachment){
            def result = [isError:true, message:"Identification document not found !"]
            render result as JSON
            return
        }
        String filePath = imageIndirectService.fullDirPath(orosAttachment.fileDir)
        def files = new File(filePath,orosAttachment.link) //Full path of a file
        if (files.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "attachment;filename=${orosAttachment.originalName.replaceAll(' ','_')}") //Please filename must be add with its extension .jpg,.png,.pdf,.doc otherwise it cant detect the file
            response.outputStream << files.bytes
        }else {
            return
        }
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def editIdentification(Long id, Long row){
        OrosAttachment orosAttachment = OrosAttachment.findById(id)
        if(!orosAttachment){
            def result = [isError:true, message:"Identification document not found !"]
            render result as JSON
            return
        }
        def result = [isError:false, attachments: orosAttachment, row:row]
        render result as JSON
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def deleteIdentification(Long id, Long personalId){
        PersonalInfo personalInfo = PersonalInfo.get(personalId)
        if(!personalInfo){
            def result = [isError:true, message:"You are not found!"]
            render result as JSON
            return
        }
        OrosAttachment orosAttachment = OrosAttachment.get(id)
        if (!orosAttachment) {
            def result = [isError:true, message:"Identification document not found!"]
            render result as JSON
            return
        }
        orosAttachment.status = AttachStatus.DELETED
        PersonalInfo savedPersonalInfo = personalInfo.save()
        if(!savedPersonalInfo){
            def result = [isError:true, message:"Identification document not deleted!"]
            render result as JSON
            return
        }
        savedPersonalInfo.attachments?.removeAll {it.status== AttachStatus.DELETED}
        if ((savedPersonalInfo.attachments[0]==null)){
            savedPersonalInfo.accOpenRequest.status = RequestStatus.DRAFT
        }
        def result = [isError:false, message:"Identification document deleted successfully!"]
        String output = result as JSON
        render output
    }
}

class SavingsPersonalInfoCommand {
    Long id
    Long productId
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

    static constraints = {
        importFrom PersonalInfo
        id nullable: true
        productId nullable: false
        name nullable: true
    }
}

class SavingsNomineeCommand {
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
        personalId nullable: false
    }
}

class SavingsBankAccountCommand {
    Long id
    Long personalId
    String bankName
    String ibanPrefix
    String bankAccountNo
    String bankAccountName

    static constraints = {
        importFrom OtherBankAccount
        id nullable: true
        personalId nullable: false
    }
}

class SavingsAttachmentsCommand{
    Long id
    Long personalId
    String caption
    String remarks
    static constraints = {
        importFrom OrosAttachment
        id nullable: true
        personalId nullable: false
        caption nullable: false
        remarks nullable: false
    }
}


