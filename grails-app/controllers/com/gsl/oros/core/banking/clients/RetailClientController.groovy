package com.gsl.oros.core.banking.clients
//import com.gsl.core.banking.BankAccountNumberService
//import com.gsl.core.banking.RetailAccountService
//import com.gsl.oros.core.banking.MasterBankAccount
//import com.gsl.oros.core.banking.accountHolder.AccountHolder
import com.gsl.oros.core.banking.operation.Client
import com.gsl.oros.core.banking.settings.Bank
//import com.gsl.oros.core.banking.settings.BankSetupDefaultSetting
import com.gsl.oros.core.banking.settings.Branch
import com.gsl.oros.core.banking.settings.Country

//import com.gsl.oros.core.banking.settings.NextGenerateId
import com.gsl.plugin.attachments.AttachStatus
import com.gsl.plugin.attachments.OrosAttachment
import com.gsl.plugin.attachments.RetailAttachment
import com.gsl.plugin.attachments.RetailSignatures
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile

@Secured(['ROLE_SUPER_ADMIN'])
class RetailClientController {

    def imageIndirectService
//    RetailAccountService retailAccountService
//    BankAccountNumberService bankAccountNumberService

    /*def afterInterceptor = {
        if (!params.retailAccount) {
            return
        }
        RetailAccount retailAccount = RetailAccount.get(params.retailAccount as Long)
        if (!retailAccount || !retailAccount.retailIntroducer
                || !retailAccount.retailOtherBank || !retailAccount.retailSignature || !retailAccount.retailAttachment) {
            return
        }

        if (retailAccount && retailAccount.retailIntroducer && retailAccount.retailOtherBank
                && retailAccount.retailSignature && retailAccount.retailAttachment) {

            MasterBankAccount bankAcCheck = MasterBankAccount.findByAccountTypeAndRelationId(AccountType.RETAIL, retailAccount.id as Long)
            if (bankAcCheck) {
                return
            }
            retailAccount.statusType = StatusType.REQUESTED
            retailAccount.save(flush: true)
        }
    }*/

    /*def index() {
        LinkedHashMap resultMap = retailAccountService.retailAccountPaginateList(params)
        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'retailClientList', model: [
                    dataReturns: null,
                    accountHolder : 1,
                    totalCount : 0,
                    dateFormat : BankSetupDefaultSetting.properties.bankDateFormat ? BankSetupDefaultSetting.properties.bankDateFormat : "dd/mm/yyyy",
                    dateMask   : "99/99/9999"
            ])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'retailClientList', model: [
                dataReturns: resultMap.results,
                accountHolder : 1,
                totalCount : totalCount,
                dateFormat : BankSetupDefaultSetting.properties.bankDateFormat ? BankSetupDefaultSetting.properties.bankDateFormat : "dd/mm/yyyy",
                dateMask   : "99/99/9999"
        ])
    }*/

  /*  def create() {
        if (!params.accountHolder) {
            render(view: 'process')
            return
        }
        render(view: '_create', model: [
                dateFormat   : "dd/mm/yyyy",
                dateMask     : "99/99/9999",
                accountHolder: params.accountHolder])
    }*/

    def editRetailClient(Long id) {
        RetailAccount retailAccount = RetailAccount.get(id)
        retailAccount?.retailIntroducer?.removeAll { it.status == false }
        retailAccount?.retailNominee?.removeAll { it.status == false }
        retailAccount?.retailOtherBank?.removeAll { it.status == false }
        //retailAccount?.retailSignature?.removeAll { it.status == AttachStatus.INACTIVE }
        retailAccount?.retailAttachment?.removeAll { it.status == AttachStatus.INACTIVE }

        RetailAdditionalDetail retailAdditionalDetail = RetailAdditionalDetail.findByRetailAccount(retailAccount)
        RetailClientHelp retailClientHelp = RetailClientHelp.findByRetailAccount(retailAccount)
        RetailAdministration retailAdministration = RetailAdministration.findByRetailAccount(retailAccount)

        render(template: 'create', model: [
                retailAccount         : retailAccount,
                accountHolder         : retailAccount.accountHolder.id,
                retailAdditionalDetail: retailAdditionalDetail,
                retailClientHelp      : retailClientHelp,
                retailAdministration  : retailAdministration,
                dateFormat            : BankSetupDefaultSetting.properties.bankDateFormat ? BankSetupDefaultSetting.properties.bankDateFormat : "dd/mm/yyyy",
                dateMask              : "99/99/9999"
        ])
    }

    def deleteRetailClient(Long id) {
        RetailAccount retailAccount = RetailAccount.get(id)
        if (!retailAccount) {
            def result = [isError: true, message: "Retail Client Account dose not found!!"]
            render result as JSON
            return
        }
        retailAccount.status = false
        def retailAccountSaved = retailAccount.save(flush: true)
        if (!retailAccountSaved) {
            def result = [isError: true, message: "Retail Account not deleted successfully!"]
            render result as JSON
            return
        }
        def result = [isError: false, message: "Retail Account deleted successfully!"]
        render result as JSON
    }
    // Retail Account Save and Edit
    def saveRetailAccount(RetailAccountCommand retailAccountCommand) {
        if (request.method != 'POST') {
            render(template: 'retailClientList')
            return
        }

        print(">>>>" + params)
        if (retailAccountCommand.hasErrors()) {
            render(view: '_create', model: [tabSelector: '1', retailAccountCommand: retailAccountCommand])
            return
        }

        if (retailAccountCommand.id) { // update
            RetailAccount retailAccount = RetailAccount.get(retailAccountCommand.id)
            retailAccount.properties = retailAccountCommand.properties
            if (!retailAccount.validate()) {
                flash.message = "Retail Account Information Not validated!"
                render(view: '_create', model: [tabSelector: '1'])
                return
            }
            def savedAccount = retailAccount.save(flush: true)
            if (!savedAccount) {
                flash.message = "Retail Account Not Update Data Successfully!"
                render(view: '_create', model: [tabSelector: '1'])
                return
            }

            savedAccount?.retailIntroducer?.removeAll { it.status == false }
            savedAccount?.retailNominee?.removeAll { it.status == false }
            savedAccount?.retailOtherBank?.removeAll { it.status == false }
            savedAccount?.retailSignature?.removeAll { it.status == AttachStatus.INACTIVE }

            def result = [isError: false, update: 'update', retailAccount: savedAccount, message: "Retail Account Update Data Successfully!"]
            render result as JSON
            return

        } else {

            RetailAccount retailAccount = new RetailAccount(retailAccountCommand.properties)
            if (!retailAccount.validate()) {
                flash.message = "Retail Account Information Not Validate!"
                render(view: '_create', model: [tabSelector: '1'])
                return
            }
            RetailAccount savedAccount = retailAccount.save(flush: true)
            if (!savedAccount) {
                flash.message = "Retail Account Not Added Data Successfully!"
                render(view: '_create', model: [tabSelector: '1'])
                return
            }
            def result = [isError: false, add: 'add',retailAccount: savedAccount, message: "Retail Account Added Data Successfully!"]
            render result as JSON
            return
        }
    }

    def saveRetailIntroducer(RetailIntroducerCommand retailIntroducerCommand) {

        if (request.method != 'POST') {
            flash.message = "Retail Introducer have some problem!"
            render(template: 'retailClientList')
            return
        }
        RetailAccount retailAccount = RetailAccount.get(retailIntroducerCommand.retailAccount.id)
        if (!retailAccount) {
            def result = [isError: true, message: "Retail Client account dose not found!!"]
            render result as JSON
            return
        }
        if (retailIntroducerCommand.hasErrors()) {
            def result = [isError: true, message: "Introducer data have some problem!"]
            render result as JSON
            return
        }

        RetailIntroducer retailIntroducer = new RetailIntroducer(retailIntroducerCommand.properties)
        if (!retailIntroducer.validate()) {
            def result = [isError: true, message: "Introducer data have some validated problem!!"]
            render result as JSON
            return
        }

        RetailIntroducer savedIntroducer = retailIntroducer.save(flush: true)
        if (!savedIntroducer) {
            def result = [isError: true, message: "Introducer dose not save successfully!!"]
            render result as JSON
            return
        }

        retailAccount.getRetailIntroducer().add(savedIntroducer)
        RetailAccount savedAccount = retailAccount.save(flush: true)

        def result = [isError: false, message: "Introducer Information data added successsfully!", introducer: savedIntroducer, client: retailIntroducerCommand.client]
        render result as JSON
    }

    def deleteRetailIntroducer() {
        RetailIntroducer retailIntroducer = RetailIntroducer.get(params.id as Long)
        if (!retailIntroducer) {
            def result = [isError: true, message: "Introducer dose not delete successfully!"]
            render result as JSON
            return
        }
        retailIntroducer.status = false
        def savedIntroducer = retailIntroducer.save(flush: true)
        if (!savedIntroducer) {
            def result = [isError: true, message: "Introducer dose not delete successfully!"]
            render result as JSON
            return
        }
        def result = [isError: false, message: "Introducer Delete successsfully!"]
        String output = result as JSON
        render output
    }

    def saveRetailOtherBankAccount(RetailOtherBankCommand retailOtherBankCommand) {

        if (request.method != 'POST') {
            flash.message = "Other bank account data have some problem!"
            render(template: 'retailClientList')
            return
        }

        if (retailOtherBankCommand.hasErrors()) {
            def result = [isError: true, message: "Other bank account data have some problem!!"]
            render result as JSON
            return
        }

        RetailAccount retailAccount = RetailAccount.read(retailOtherBankCommand.retailAccount.id)
        if (!retailAccount) {
            flash.message = "Retail Client account dose not found!"
            render(template: 'retailClientList')
            return
        }


        if (retailOtherBankCommand.id) {  // update
            def row = params.row
            RetailOtherBank retailOtherBank = RetailOtherBank.get(retailOtherBankCommand.id)
            retailOtherBank.properties = retailOtherBankCommand.properties
            if (!retailOtherBank.validate()) {
                def result = [isError: true, message: "Other bank account data have some validated problem!!"]
                render result as JSON
                return
            }
            RetailOtherBank retailOtherBankUpdate = retailOtherBank.save(flush: true)
            if (!retailOtherBankUpdate) {
                def result = [isError: true, message: "Other bank account data not update successfully!!"]
                render result as JSON
                return
            }
            def result = [isError: false, message: "Other bank account information data update successsfully!", update: true, retailOtherBank: retailOtherBankUpdate, bank: retailOtherBankCommand.bank.name, branch: retailOtherBankCommand.branch.name, row: row]
            render result as JSON
        } else {   // add
            RetailOtherBank retailOtherBank = new RetailOtherBank(retailOtherBankCommand.properties)
            if (!retailOtherBank.validate()) {
                def result = [isError: true, message: "Other bank account data not validated successfully!!"]
                render result as JSON
                return
            }
            RetailOtherBank retailOtherBankSaved = retailOtherBank.save(flush: true)
            if (!retailOtherBankSaved) {
                def result = [isError: true, message: "Other bank account data not added successfully!!"]
                render result as JSON
                return
            }

            retailAccount.getRetailOtherBank().add(retailOtherBankSaved)
            RetailAccount savedAccount = retailAccount.save(flush: true)

            def result = [isError: false, add: true, message: "Other bank account information data added successsfully!", retailOtherBank: retailOtherBankSaved, bank: retailOtherBankCommand.bank.name, branch: retailOtherBankCommand.branch.name]
            render result as JSON
        }

    }

    def editOtherBankAccount() {
        def row = params.row
        RetailOtherBank retailOtherBank = RetailOtherBank.findById(params.id as Long)
        if (!retailOtherBank) {
            def result = [isError: true, message: "Data not find !!"]
            render result as JSON
            return
        }
        Bank bank = Bank.findById(retailOtherBank.bank.id as Long)
        Branch branch = Branch.findById(retailOtherBank.branch.id as Long)
        def result = [isError: false, retailOtherBank: retailOtherBank, bank: bank, branch: branch, row: row]
        render result as JSON
    }

    def deleteOtherBankAccount() {
        RetailOtherBank retailOtherBank = RetailOtherBank.get(params.id as Long)
        if (!retailOtherBank) {
            def result = [isError: true, message: "Have some problem!!"]
            render result as JSON
            return
        }
        retailOtherBank.status = false
        RetailOtherBank retailOtherBankSaved = retailOtherBank.save(flush: true)
        if (!retailOtherBankSaved) {
            def result = [isError: true, message: "Other bank account information does not delete!!"]
            render result as JSON
            return
        }

        def result = [isError: false, message: "Delete other bank account information data successsfully!"]
        render result as JSON
    }

    def saveRetailNomineeInfo(RetailNomineeCommand retailNomineeCommand) {
        if (request.method != 'POST') {
            flash.message = "Nominee data dose not added Successfully!"
            render(template: 'retailClientList')
            return
        }

        RetailAccount retailAccount = RetailAccount.read(retailNomineeCommand.retailAccount.id)
        if (retailNomineeCommand.hasErrors()) {
            def result = [isError: true, message: "Have some problem!!"]
            render result as JSON
            return
        }

        if (retailNomineeCommand.id) { // update
            def row = params.row
            RetailNominee retailNominee = RetailNominee.get(retailNomineeCommand.id)
            retailNominee.properties = retailNomineeCommand.properties
            RetailNominee retailNomineeSaved = retailNominee.save(flush: true)
            if (!retailNomineeSaved) {
                def result = [isError: true, message: "Nominee information have some problem!"]
                render result as JSON
                return
            }
            def result = [isError: false, message: "Nominee information data update successsfully!", update: true, retailNominee: retailNomineeSaved, row: row]
            render result as JSON
        } else { // add
            RetailNominee retailNominee = new RetailNominee(retailNomineeCommand.properties)
            RetailNominee retailNomineeSaved = retailNominee.save(flush: true)
            if (!retailNomineeSaved) {
                def result = [isError: true, message: "Have some problem!!"]
                render result as JSON
                return
            }

            retailAccount.getRetailNominee().add(retailNomineeSaved)
            RetailAccount savedAccount = retailAccount.save(flash:true)

            def result = [isError: false, add: true, message: "Nominee Information Added successsfully!", retailNominee: retailNomineeSaved]
            render result as JSON
        }
    }

    def deleteRetailNominee() {
        RetailNominee retailNominee = RetailNominee.get(params.id as Long)
        if (!retailNominee) {
            def result = [isError: true, message: "Retail Account data not exist!"]
            render result as JSON
            return
        }
        retailNominee.status = false
        RetailNominee retailNomineeSaved = retailNominee.save(flush: true)
        if (!retailNomineeSaved) {
            def result = [isError: false, message: "Nominee information not delete successsfully!"]
            render result as JSON
            return
        }

        def result = [isError: false, message: "Nominee information delete successsfully!"]
        render result as JSON
    }

    def editRetailNominee() {
        def row = params.row
        RetailNominee retailNominee = RetailNominee.findById(params.id as Long)
        if (!retailNominee) {
            def result = [isError: true, message: "Data not find !!"]
            render result as JSON
            return
        }
        def dobDate = retailNominee.dob.format('dd/MM/yyyy')
        def result = [isError: false, retailNominee: retailNominee, dobDate: dobDate, row: row]
        render result as JSON
    }

    def saveRetailAdditionalDetail(RetailAdditionalDetailCommand retailAdditionalDetailCommand) {
        if (request.method != 'POST') {
            flash.message = "Additional Detail data have some problem!"
            render(template: 'retailClientList')
            return
        }
        if (retailAdditionalDetailCommand.hasErrors()) {
            def result = [isError: true, message: "Additional Detail data have some problem!!"]
            render result as JSON
            return
        }
        RetailAccount retailAccount = RetailAccount.read(retailAdditionalDetailCommand.retailAccount.id)
        if (!retailAccount) {
            flash.message = "Additional Detail dose not found!"
            render(template: 'retailClientList')
            return
        }
        if (retailAdditionalDetailCommand.id) {  // update
            RetailAdditionalDetail retailAdditionalDetail = RetailAdditionalDetail.get(retailAdditionalDetailCommand.id)
            retailAdditionalDetail.properties = retailAdditionalDetailCommand.properties
            if (!retailAdditionalDetail.validate()) {
                def result = [isError: true, message: "Additional Detail data have some validated problem!!"]
                render result as JSON
                return
            }
            RetailAdditionalDetail retailAdditionalDetailUpdate = retailAdditionalDetail.save(flush: true)
            if (!retailAdditionalDetailUpdate) {
                def result = [isError: true, message: "Additional Detail data not update successfully!!"]
                render result as JSON
                return
            }
            def result = [isError: false, message: "Additional Detail information data update successsfully!", update: true, retailAdditionalDetail: retailAdditionalDetailUpdate]
            render result as JSON
        } else {   // add
            RetailAdditionalDetail retailAdditionalDetail = new RetailAdditionalDetail(retailAdditionalDetailCommand.properties)
            if (!retailAdditionalDetail.validate()) {
                def result = [isError: true, message: "Additional Detail data not validated successfully!!"]
                render result as JSON
                return
            }
            RetailAdditionalDetail retailAdditionalDetailSaved = retailAdditionalDetail.save(flush: true)
            if (!retailAdditionalDetailSaved) {
                def result = [isError: true, message: "Additional Detail data not added successfully!!"]
                render result as JSON
                return
            }

            def result = [isError: false, add: true, message: "Additional Detail information data added successsfully!", retailAdditionalDetail: retailAdditionalDetailSaved]
            render result as JSON
        }

    }

    def saveRetailClientHelp(RetailClientHelpCommand retailClientHelpCommand) {
        if (request.method != 'POST') {
            flash.message = "Additional Detail data have some problem!"
            render(template: 'retailClientList')
            return
        }
        if (retailClientHelpCommand.hasErrors()) {
            def result = [isError: true, message: "Client Help data have some problem!!"]
            render result as JSON
            return
        }
        RetailAccount retailAccount = RetailAccount.read(retailClientHelpCommand.retailAccount.id)
        if (!retailAccount) {
            flash.message = "Client Help dose not found!"
            render(template: 'retailClientList')
            return
        }
        if (retailClientHelpCommand.id) {  // update
            RetailClientHelp retailClientHelp = RetailClientHelp.get(retailClientHelpCommand.id)
            retailClientHelp.properties = retailClientHelpCommand.properties
            if (!retailClientHelp.validate()) {
                def result = [isError: true, message: "Client Help data have some validated problem!!"]
                render result as JSON
                return
            }
            RetailClientHelp retailClientHelpUpdate = retailClientHelp.save(flush: true)
            if (!retailClientHelpUpdate) {
                def result = [isError: true, message: "Client Help data not update successfully!!"]
                render result as JSON
                return
            }
            def result = [isError: false, message: "Client Help information data update successsfully!", update: true, retailClientHelp: retailClientHelpUpdate]
            render result as JSON
        } else {   // add
            RetailClientHelp retailClientHelp = new RetailClientHelp(retailClientHelpCommand.properties)
            if (!retailClientHelp.validate()) {
                def result = [isError: true, message: "Client Help data not validated successfully!!"]
                render result as JSON
                return
            }
            RetailClientHelp retailClientHelpSaved = retailClientHelp.save(flush: true)
            if (!retailClientHelpSaved) {
                def result = [isError: true, message: "Client Help data not added successfully!!"]
                render result as JSON
                return
            }

            def result = [isError: false, add: true, message: "Client Help information data added successsfully!", retailClientHelp: retailClientHelpSaved]
            render result as JSON
        }

    }

    def saveRetailAdministration(RetailAdministrationCommand retailAdministrationCommand) {

        if (request.method != 'POST') {
            flash.message = "Correspondence & Administration data have some problem!"
            render(template: 'retailClientList')
            return
        }
        if (retailAdministrationCommand.hasErrors()) {
            def result = [isError: true, message: "Correspondence & Administration Detail data have some problem!!"]
            render result as JSON
            return
        }
        RetailAccount retailAccount = RetailAccount.read(retailAdministrationCommand.retailAccount.id)
        if (!retailAccount) {
            flash.message = "Correspondence & Administration dose not found!"
            render(template: 'retailClientList')
            return
        }
        if (retailAdministrationCommand.id) {  // update
            RetailAdministration retailAdministration = RetailAdministration.get(retailAdministrationCommand.id)
            retailAdministration.properties = retailAdministrationCommand.properties
            if (!retailAdministration.validate()) {
                def result = [isError: true, message: "Correspondence & Administration data have some validated problem!!"]
                render result as JSON
                return
            }
            RetailAdministration retailAdministrationUpdate = retailAdministration.save(flush: true)
            if (!retailAdministrationUpdate) {
                def result = [isError: true, message: "Correspondence & Administration data not update successfully!!"]
                render result as JSON
                return
            }
            def result = [isError: false, message: "Correspondence & Administration information data update successsfully!", update: true, retailAdministration: retailAdministrationUpdate]
            render result as JSON
        } else {   // add
            RetailAdministration retailAdministration = new RetailAdministration(retailAdministrationCommand.properties)
            if (!retailAdministration.validate()) {
                def result = [isError: true, message: "Correspondence & Administration data not validated successfully!!"]
                render result as JSON
                return
            }
            RetailAdministration retailAdministrationSaved = retailAdministration.save(flush: true)
            if (!retailAdministrationSaved) {
                def result = [isError: true, message: "Correspondence & Administration data not added successfully!!"]
                render result as JSON
                return
            }

            def result = [isError: false, add: true, message: "Correspondence & Administration information data added successsfully!", retailAdministration: retailAdministrationSaved]
            render result as JSON
        }
    }

    def saveRetailAttachment(RetailAttachmentCommand retailAttachmentCommand) {
        String type
        Long size
        String fileName
        String originalFileName

        if (request.method != 'POST') {
            def result = [isError: true, message: "Method problem"]
            render result as JSON
            return
        }
        if (retailAttachmentCommand.hasErrors()) {
            def result = [isError: true, message: "Have some error!!"]
            render result as JSON
            return
        }

        RetailAccount retailAccount = RetailAccount.get(retailAttachmentCommand.retailAccount.id)
        if (!retailAccount) {
            def result = [isError: true, message: "Retail Account Not found"]
            render result as JSON
            return
        }

        String fileDir = retailAccount.id.toString()
        fileName = request.getFileNames()[0]
        MultipartFile uploadedFile = request.getFile(fileName)
        type = uploadedFile.contentType
        size = uploadedFile.size
        originalFileName = uploadedFile.originalFilename


        RetailAttachment retailAttachment

        if (uploadedFile.empty) {
            def result = [isError: true, message: "Retail Account Not found"]
            render result as JSON
            return
        }
        retailAttachment = new RetailAttachment(
                name: fileName,
                description: retailAttachmentCommand.description,
                originalName: originalFileName,
                type: type,
                size: size,
                fileDir: fileDir,
                caption: retailAttachmentCommand.caption,
                status: AttachStatus.ACTIVE
        )
        if (!retailAttachment.validate()) {
            def result = [isError: true, message: "Retail Account Valided"]
            render result as JSON
            return
        }
        RetailAttachment savedAttachment = retailAttachment.save(flush: true)
        if (!savedAttachment) {
            def result = [isError: true, message: "Not Save"]
            render result as JSON
            return
        }

        //retailAccount.getRetailIntroducer().add(savedIntroducer)
        //RetailAccount savedAccount = retailAccount.save(flush: true)

        retailAccount.getRetailAttachment().add(savedAttachment)
        RetailAccount savedAccount = retailAccount.save(flush: true)

        File savedFile = imageIndirectService.storeFile(uploadedFile, retailAttachment.link, fileDir)
        if (!savedFile) {
            def result = [isError: true, message: "Signature added successfully!!"]
            render result as JSON
            return
        }
        def result = [isError: false, message: "Attachment file save successfully!", retailAttachment: savedAttachment]
        render result as JSON
    }

    def deleteRetailAttachment() {
        RetailAttachment retailAttachment = RetailAttachment.get(params.attachment as Long)
        if (!retailAttachment) {
            def result = [isError: true, message: "Attachment file not found!"]
            render result as JSON
            return
        }
        retailAttachment.status = AttachStatus.INACTIVE
        RetailAttachment retailAttachmentSaved = retailAttachment.save(flush: true)
        if (!retailAttachmentSaved) {
            def result = [isError: true, message: "Attachment file not added!"]
            render result as JSON
            return
        }
        def result = [isError: false, message: "Attachment file added successfully!"]
        render result as JSON
    }

    def downloadRetailAttachment() {
        RetailAttachment retailAttachment = RetailAttachment.get(params.id as Long)
        if (!retailAttachment) {
            def result = [message: "Attachment file not found!"]
            render result as JSON
            return
        }
        String filePath = imageIndirectService.fullDirPath(retailAttachment.fileDir)
        def files = new File(filePath, retailAttachment.link) //Full path of a file
        if (files.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "attachment;filename=${retailAttachment.originalName.replaceAll(' ', '_')}")
            response.outputStream << files.bytes
        } else {
            def result = [message: "Attachment file not downlaod found!"]
            render result as JSON
        }
    }

    def saveRetailSignatures(SignaturesCommand signaturesCommand) {

        String type
        Long size
        String fileName
        String originalFileName

        if (request.method != 'POST') {
            flash.message = "Signature data have some problem!"
            render(template: 'retailClientList')
            return
        }

        RetailAccount retailAccount = RetailAccount.get(signaturesCommand.retailAccount.id)
        if (!retailAccount) {
            def result = [isError: true, message: "Retail Client account dose not found!!"]
            render result as JSON
            return
        }
        if (signaturesCommand.hasErrors()) {
            def result = [isError: true, message: "Signature data have some problem!!!"]
            render result as JSON
            return
        }

        RetailSignatures retailSignatures

        if (params.firstId && params.secondId) { // for update
            List<RetailSignatures> signatureList = new LinkedList<RetailSignatures>();
            def signatureArray = []
            signatureArray.add(params.firstId)
            signatureArray.add(params.secondId)

            for (int i = 0; i < 2; i++) {
                fileName = request.getFileNames()[i]
                MultipartFile uploadedFile = request.getFile(fileName)
                type = uploadedFile.contentType
                size = uploadedFile.size
                originalFileName = uploadedFile.originalFilename

                if (!(type in ['image/jpeg', 'image/gif', 'image/bmp', 'image/png', 'image/jpg'])) {
                    def result = [isError: true, message: "Signature file type is not validated!!"]
                    render result as JSON
                    return
                }
                if (size >= 900000) {
                    def result = [isError: true, message: "Signature file size is too large!!"]
                    render result as JSON
                    return
                }

                RetailSignatures signature = RetailSignatures.get(signatureArray[i] as Long)
                String fileDir = retailAccount.id.toString()
                /*if (uploadedFile.empty) {
                    orosAttachment.properties['name','originalName','type','fileDir','size'] = [
                            name: signature.name,
                            originalName: signature.originalName,
                            type: signature.type,
                            fileDir: signature.fileDir,
                            size: signature.size
                    ]
                }*/
                retailSignatures = new RetailSignatures(
                        name: fileName,
                        originalName: originalFileName,
                        type: type,
                        fileDir: fileDir,
                        size: size
                )

                if (!retailSignatures.validate()) {
                    def result = [isError: true, message: "Signature not validated successfully!!"]
                    render result as JSON
                    return
                }

                signature.properties = retailSignatures
                RetailSignatures savedSignature = signature.save(flush: true)
                if (!savedSignature) {
                    def result = [isError: true, message: "Signature not save successfully!!"]
                    render result as JSON
                    return
                }
                retailAccount.getRetailSignature().add(savedSignature)
                RetailAccount savedAccount = retailAccount.save(flush:true)

                File savedFile = imageIndirectService.storeFile(uploadedFile, retailSignatures.link, fileDir)
                if (!savedFile) {
                    def result = [isError: true, message: "Signature added successfully!!"]
                    render result as JSON
                    return
                }
                signatureList.add(savedSignature)
            }

            def result = [isError: false, update: true, message: "Signature update Successfully!", signatureList: signatureList]
            render result as JSON
            return
        } else { // add
            List<RetailSignatures> signatureList = new LinkedList<RetailSignatures>();

            String fileDir = retailAccount.id.toString()
            for (int i = 0; i < 2; i++) {
                fileName = request.getFileNames()[i]
                MultipartFile uploadedFile = request.getFile(fileName)
                type = uploadedFile.contentType
                size = uploadedFile.size
                originalFileName = uploadedFile.originalFilename

                if (!(type in ['image/jpeg', 'image/gif', 'image/bmp', 'image/png', 'image/jpg'])) {
                    def result = [isError: true, message: "Signature file type is not validated!!"]
                    render result as JSON
                    return
                }

                if (size >= 900000) {
                    def result = [isError: true, message: "Signature file size is too large!!"]
                    render result as JSON
                    return
                }

                if (uploadedFile.empty) {
                    def result = [isError: true, message: "Signature not uploaded successfully!!"]
                    render result as JSON
                    return
                }

                retailSignatures = new RetailSignatures(
                        name: fileName,
                        originalName: originalFileName,
                        type: type,
                        fileDir: fileDir,
                        size: size
                )
                if (!retailSignatures.validate()) {
                    def result = [isError: true, message: "Signature not validated successfully!!"]
                    render result as JSON
                    return
                }

                RetailSignatures savedSignature = retailSignatures.save(flush: true)
                if (!savedSignature) {
                    def result = [isError: true, message: "Signature not save successfully!!"]
                    render result as JSON
                    return
                }
                retailAccount.getRetailSignature().add(savedSignature)
                RetailAccount savedAccount = retailAccount.save(flush:true)

                File savedFile = imageIndirectService.storeFile(uploadedFile, retailSignatures.link, fileDir)
                if (!savedFile) {
                    def result = [isError: true, message: "Signature added successfully!!"]
                    render result as JSON
                    return
                }
                signatureList.add(savedSignature)
            }
            def result = [isError: false, add: true, message: "Signature added successfully!!", signatureList: signatureList]
            String successStr = result as JSON
            render successStr
        }

    }

    def deleteRetailSignatures() {
        String id = params.id
        def values = id.split(',')
        for (int i = 0; i < values.length; i++) {
            Long signatureId = values[i] as Long
            OrosAttachment retailsignature = OrosAttachment.get(signatureId)
            if (!retailsignature) {
                def result = [isError: true, message: "Signature dose not delete successfully!"]
                render result as JSON
                return
            }

            retailsignature.status = AttachStatus.INACTIVE
            def savedSignature = retailsignature.save(flush: true)
            if (!savedSignature) {
                def result = [isError: true, message: "Signature" + retailsignature.originalName + "dose not delete successfully!"]
                render result as JSON
                return
            }
        }

        def result = [isError: false, message: "Signature Delete successsfully!"]
        render result as JSON
    }

    def checkAccountNo() {
        def result = Client.findByAccountNo(params.accountNo)
        def r = [result: result]
        render r as JSON
    }

    def fetchBranch(Long id) {
        Bank bank = Bank.read(id)
        List<Branch> branch = Branch.findAllByBank(bank)
        for (def i = 0; i < branch.size(); i++) {
            render "<option value='${branch.id[i]}'>${branch.name[i]}</option>"
        }

    }

    def fetchAccountHolderInfo() {
        RetailAccount retailAccount = RetailAccount.read(params.retailAccount as Long)
        // Edit in Final stage
//        AccountHolder accountHolder = AccountHolder.get(retailAccount.accountHolder.id as Long)
//        def result = [isError: false, accountHolder: accountHolder]
//        render result as JSON
    }

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap = retailAccountService.retailAccountPaginateList(params)
        if (!resultMap || resultMap.totalCount == 0) {
            gridData = [iTotalRecords: 0, iTotalDisplayRecords: 0, aaData: []]
            result = gridData as JSON
            render result
            return
        }
        int totalCount = resultMap.totalCount
        gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: resultMap.results]
        result = gridData as JSON
        render result
    }

    def retailAccountRequest() {
        LinkedHashMap resultMap = retailAccountService.retailAccountApprovedList(params)
        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'approvedList', model: [dataReturns: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: '/openAccount/retailClient/approvedList', model: [dataReturns: resultMap.results, totalCount: totalCount])
    }

    def approvedList() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap = retailAccountService.retailAccountApprovedList(params)
        if (!resultMap || resultMap.totalCount == 0) {
            gridData = [iTotalRecords: 0, iTotalDisplayRecords: 0, aaData: []]
            result = gridData as JSON
            render result
            return
        }
        int totalCount = resultMap.totalCount
        gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: resultMap.results]
        result = gridData as JSON
        render result
    }

    /*def saveApprovedRetailsAccount(Long id) {
        RetailAccount retailAccount = RetailAccount.get(id)
        if (!retailAccount) {
            def result = [isError: true, message: "Retail Client Account dose not found!!"]
            render result as JSON
            return
        }

        // Account Number Genareted
        NextGenerateId nextGenerateId = NextGenerateId.findByAccountType(AccountType.RETAIL)
        if (!nextGenerateId) {
            def result = [isError: true, message: "Account Type format not save!!"]
            render result as JSON
            return
        }

        MasterBankAccount bankAcCheck = MasterBankAccount.findByAccountTypeAndRelationId(nextGenerateId.accountType, retailAccount.id as Long)
        if (bankAcCheck) {
            def result = [isError: true, message: "*** Already Approved!! ***"]
            render result as JSON
            return
        }

        def resultMap = bankAccountNumberService.bankAccountNumberGenerated(nextGenerateId)
        MasterBankAccount masterBankAccount = new MasterBankAccount(
                accountNo: resultMap.accountNumber,
                accountType: AccountType.RETAIL,
                relationId: retailAccount.id
        )
        masterBankAccount.save(flush: true)

        // update in Retail Account , bankAccountNo field
        retailAccount.bankAccountNo = resultMap.accountNumber
        retailAccount.save(flush: true)

        retailAccount.statusType = StatusType.APPROVED
        def retailAccountSaved = retailAccount.save(flush: true)

        if (!retailAccountSaved) {
            def result = [isError: true, message: "Retail Account not Approved successfully!"]
            render result as JSON
            return
        }

        def result = [isError: false, message: "Retail Account Approved successfully!"]
        render result as JSON
    }*/

}

// Command Object
class RetailAccountCommand {
    Long id
    String title
    Date openingDate
    String accountPurpose
    Integer termAndCondition
//    AccountHolder accountHolder // fk

    static constraints = {
        id blank: true, nullable: true
        title blank: false, nullable: false
        openingDate blank: false, nullable: false
        accountPurpose blank: false, nullable: false
        termAndCondition blank: false, nullable: false
//        accountHolder blank: true, nullable: true
    }

}

class RetailIntroducerCommand {
    Long id
    String relation
    Client client
    RetailAccount retailAccount

    static constraints = {
        id blank: true, nullable: true
        relation blank: false, nullable: false
        client blank: false, nullable: false
    }

}

class RetailOtherBankCommand {
    Long id
    String accountNo
    String accountName
    String type
    String sortCode
    Bank bank
    Branch branch
    RetailAccount retailAccount

    static constraints = {
        id blank: true, nullable: true
        accountNo blank: false, nullable: false
        accountName blank: false, nullable: false
        type blank: false, nullable: false
        sortCode blank: false, nullable: false
    }
}

class RetailNomineeCommand {
    Long id
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
    RetailAccount retailAccount

    static constraints = {
        id blank: true, nullable: true
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
    }
}

class SignaturesCommand {

    Long id
    RetailAccount retailAccount

    static constraints = {
        id blank: true, nullable: true
    }
}

// agent
class RetailAdditionalDetailCommand {
    Long id
    String residencyTax
    String domicile
    String incomeTax
    String insurenceNo
    String taxReference
    RetailAccount retailAccount

    static constraints = {
        id nullable: true, blank: true
        residencyTax nullable: true
        domicile nullable: true
        incomeTax nullable: true
        insurenceNo nullable: true
        taxReference nullable: true
    }
}

class RetailClientHelpCommand {
    Long id
    String gross
    Integer timeHorizon
    Integer risk
    String benchmark
    RetailAccount retailAccount

    static constraints = {
        id nullable: true, blank: true
        gross nullable: true
        risk nullable: true
        benchmark nullable: true
        timeHorizon nullable: true
    }
}

class RetailAdministrationCommand {
    Long id
    String name
    String role
    String address
    String firm
    String nationalID
    String email
    String phone
    String postCode
    String residency
    Country nationality
    Country countryOfBirth
    Boolean status = true
    RetailAccount retailAccount


    static constraints = {
        id nullable: true, blank: true
        role nullable: true
        address nullable: true
        firm nullable: true
        nationalID nullable: true
        email nullable: true
        phone nullable: true
        postCode nullable: true
        residency nullable: true
    }
}

class RetailAttachmentCommand {
    Long id
    String caption
//    String remarks
    String description
    RetailAccount retailAccount
    static constraints = {
        id nullable: true, blank: true
        caption nullable: false
        description nullable: true
//        remarks nullable: true
    }
}



