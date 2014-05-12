package com.gsl.oros.core.banking.settings

import com.gsl.cbs.contraints.enums.AddressType


class BankSetupController {
    def imageIndirectService

    def index() {
        def bankSetupData = BankSetup.get(1)
        println(bankSetupData.logo)
        render(view: '/coreBanking/settings/bankSetup/bankSetup',
                model: [bankSetupData: bankSetupData,
                        generalAdd: bankSetupData.generalAdd[0],
                        postalAdd: bankSetupData.postalAdd[0]])

    }

    def streetList() {
        def street = State.findAllByCountry(Country.read(params.country as Long))
        for (def i = 0; i < street.size(); i++) {
            render "<option value='${street.id[i]}'>${street.name[i]}</option>"
        }
    }

    def postalStateList() {
        def street = State.findAllByCountry(Country.read(params.postalCountry as Long))
        for (def i = 0; i < street.size(); i++) {
            render "<option value='${street.id[i]}'>${street.name[i]}</option>"
        }
    }

    def update(BankSetupCommand bankSetupCommand) {

        def file = request.getFile('bankLogo')

        if (bankSetupCommand.hasErrors()) {
            println(params.incomeTaxReservation)
            println(params.unforeseenExpenseReservation)
            println(params.logo)
            render(view: '/coreBanking/settings/bankSetup/bankSetup', model: [bankSetupCommand: bankSetupCommand])
            return
        }
        if (bankSetupCommand.bankId) {
            BankSetup bankSetup = BankSetup.get(bankSetupCommand.bankId)
            if (!bankSetup) {
                flash.message = "Sorry Id Is Not Available"
                render(view: '/coreBanking/settings/bankSetup/bankSetup')
                return
            }

            bankSetup.properties = bankSetupCommand.properties

            if (file.size > 0) {
//                String originalFilename = file.originalFilename
                String attachmentUrl = UUID.randomUUID().toString()// + ".${originalFilename.split("\\.")[-1]}"
//                File storeFile = attachmentService.storeFile(file, bankSetup.fileDir, attachmentUrl)
                File storeFile = imageIndirectService.storeFile(file,attachmentUrl,'234/543')
                if (storeFile) {
                    bankSetup.logo = attachmentUrl
                }
            }

            bankSetup.save(failOnError: true)

            Address general = Address.get(bankSetupCommand.generalId)
            general.properties = bankSetupCommand.general.properties
            general.addressType = AddressType.GENERAL
            general.save(failOnError: true)

            Address postal = Address.get(bankSetupCommand.postalId)
            postal.properties = bankSetupCommand.postal.properties
            postal.addressType = AddressType.POSTAL
            postal.save(failOnError: true)
            flash.message = "Successfully Update Bank Setup Information."
            redirect(controller: 'branchSetup', action: 'index')
            return
        }
        BankSetup bankSetup = new BankSetup(bankSetupCommand.properties)
        bankSetup.save(failOnError: true)
        Address general = new Address(bankSetupCommand.general.properties)
        general.addressType = AddressType.GENERAL
        general.save(failOnError: true)
        bankSetup.addToGeneralAdd(general)

        Address postal = new Address(bankSetupCommand.postal.properties)
        postal.addressType = AddressType.POSTAL
        postal.save(failOnError: true)
        bankSetup.addToPostalAdd(postal)
        flash.message = "Successfully Save Bank Setup Information."
        redirect(controller: 'branchSetup', action: 'index')

    }

}

class BankSetupCommand {
    Long bankId
    Long generalId
    Long postalId
    String bankFullName
    String bankShortName
    String chamberCommerceNo
    String logo

    Currencys currencys
    String bankDateFormat
    Integer amntDeciPoint
    String dateSeparator
    String deciRoundType
    String decimalSeparator
    Integer percentageDeciPoint
    String language
    Integer numOfBookingPeriod
    Integer qtyDeciPoint
    String reportPageSize
    String showGlCodeInReport
    String showItemCodeInReport
    String taxType
    String thousandSeparator
    String reportDateFormat

    String taxNo
    String vatNo
    String paymentTerm
    String defaultVat
    Double incomeTaxReservation
    Double unforeseenExpenseReservation
    String invoiceMoment

    Address general
    Address postal

    static constraints = {
        bankId(nullable: true, blank: true)
        bankId(nullable: true, blank: true)
        bankId(nullable: true, blank: true)

        bankFullName(nullable: false, blank: false)
        bankShortName(nullable: false, blank: false)

        logo(nullable: true, blank: true)
        unforeseenExpenseReservation(nullable: true, blank: true)
        numOfBookingPeriod(nullable: true, blank: true)
        chamberCommerceNo(nullable: true, blank: true)
    }
}
