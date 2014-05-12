package com.gsl.oros.core.banking.settings

import com.gsl.cbs.contraints.enums.AddressType
import com.gsl.oros.core.banking.product.settings.OthBankUtility
import grails.converters.JSON

class OthBankSetupController {

    def index() {
        render(view: "/coreBanking/settings/othBankSetup/othBankList")
    }

    def create() {
        render(view: "/coreBanking/settings/othBankSetup/othBankSetup")
    }

    def save(OthBankSetupCommand othBankSetupCommand) {
        if (!request.method == 'POST') {
            render(view: '/coreBanking/settings/othBankSetup/othBankSetup')
            return
        }
        if (othBankSetupCommand.hasErrors()) {
            render(view: '/coreBanking/settings/othBankSetup/othBankSetup',
                    model: [othBankSetup: othBankSetupCommand,
                            generalId: othBankSetupCommand.generalId,
                            postalId: othBankSetupCommand.postalId,
                            generalAdd: othBankSetupCommand.general.properties,
                            postalAdd: othBankSetupCommand.postal.properties])
            return
        }
        OthersBankSetup othersBankSetup
        if (params.id) {  // Update Others Bank Setup
            othersBankSetup = OthersBankSetup.get(othBankSetupCommand.id)
            if (!othersBankSetup) {
                flash.message = "Bank is not Availavle"
                render(view: '/coreBanking/settings/othBankSetup/othBankList')
                return
            }
            othersBankSetup.properties = othBankSetupCommand.properties
            if (!othBankSetupCommand.validate()) {
                render(view: '/coreBanking/settings/othBankSetup/othBankSetup',
                        model: [othBankSetup: othBankSetupCommand,
                                generalId: othBankSetupCommand.generalId,
                                postalId: othBankSetupCommand.postalId,
                                generalAdd: othBankSetupCommand.general.properties,
                                postalAdd: othBankSetupCommand.postal.properties])
                return
            }
            othersBankSetup.save(failOnError: true)

            Address general = Address.get(othBankSetupCommand.generalId)
            general.properties = othBankSetupCommand.general.properties
            general.addressType = AddressType.GENERAL
            general.save(failOnError: true)

            Address postal = Address.get(othBankSetupCommand.postalId)
            postal.properties = othBankSetupCommand.postal.properties
            postal.addressType = AddressType.POSTAL
            postal.save(failOnError: true)
            flash.message = "Successfully Update Bank Setup Information"
            render(view: '/coreBanking/settings/othBankSetup/othBankList')
            return
        }
        othersBankSetup = new OthersBankSetup(othBankSetupCommand.properties)
        if (!othBankSetupCommand.validate()) {
            render(view: '/coreBanking/settings/othBankSetup/othBankSetup',
                    model: [othBankSetup: othBankSetupCommand,
                            generalAdd: othBankSetupCommand.general.properties,
                            postalAdd: othBankSetupCommand.postal.properties])
            return
        }
        OthersBankSetup savedBank = othersBankSetup.save(flash: true)
        if (!savedBank) {
            render(view: '/coreBanking/settings/othBankSetup/othBankSetup',
                    model: [othBankSetup: othersBankSetup])
            return
        }
        othersBankSetup.save(failOnError: true)
        Address general = new Address(othBankSetupCommand.general.properties)
        general.addressType = AddressType.GENERAL
        general.save(failOnError: true)
        othersBankSetup.addToGeneralAdd(general)

        Address postal = new Address(othBankSetupCommand.postal.properties)
        postal.addressType = AddressType.POSTAL
        postal.save(failOnError: true)
        othersBankSetup.addToPostalAdd(postal)

        flash.message = "Successfully Save Bank Setup"
        render(view: '/coreBanking/settings/othBankSetup/othBankList')
        return
    }

    def list() {
        int sEcho = params.sEcho ? params.getInt('sEcho') : 1
        int iDisplayStart = params.iDisplayStart ? params.getInt('iDisplayStart') : 0
        int iDisplayLength = params.iDisplayLength ? params.getInt('iDisplayLength') : 10
        String sSortDir = params.sSortDir_0 ? params.sSortDir_0 : 'asc'
        int iSortingCol = params.iSortingCols ? params.getInt('iSortingCols') : 1
        //Search string, use or logic to all fields that required to include
        String sSearch = params.sSearch ? params.sSearch : null
        println("Lengthhh" + iSortingCol)
        if (sSearch) {
            sSearch = "%" + sSearch + "%"
        }
        String sortColumn = OthBankUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()
        def c = OthersBankSetup.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("status", true)
            }
            if (sSearch) {
                or {
                    ilike('bankFullName', sSearch)
                }
            }
            order(sortColumn, sSortDir)
        }

        int totalCount = results.totalCount
        int serial = iDisplayStart;
        if (totalCount > 0) {
            if (sSortDir.equalsIgnoreCase('desc')) {
                serial = (totalCount + 1) - iDisplayStart
            }
            results.each { OthersBankSetup othersBankSetup ->
                if (sSortDir.equalsIgnoreCase('asc')) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: othersBankSetup.id, 0: serial, 1: othersBankSetup.bankFullName, 2: othersBankSetup.bankShortName, 3: othersBankSetup.contactName, 4: othersBankSetup.generalAdd.country.name, 5: ''])
            }
        }
        Map gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: dataReturns]
        String result = gridData as JSON
        render result
    }

    def delete(Long id) {
        def otherBankSetup = OthersBankSetup.get(id)
        if (!otherBankSetup) {
            flash.message = "Bank not found"
            render(view: '/coreBanking/settings/othBankSetup/othBankList')
        }
        otherBankSetup.status = flash
        otherBankSetup.save(flash: true)
        flash.branchSetUpMess = "Bank deleted successfully"
        render(view: '/coreBanking/settings/othBankSetup/othBankList')
    }

    def update(Long id) {
        def othBankSetup = OthersBankSetup.read(id)
        if (!othBankSetup) {
            flash.branchSetUpMess = "Bank not found"
            render(view: '/coreBanking/settings/othBankSetup/othBankList')
        }
        render(view: '/coreBanking/settings/othBankSetup/othBankSetup',
                model: [othBankSetup: othBankSetup,
                        generalAdd: othBankSetup.generalAdd[0],
                        postalAdd: othBankSetup.postalAdd[0]]
        )
    }
}

class OthBankSetupCommand {
    Long id
    Long generalId
    Long postalId

    String bankFullName
    String bankShortName
    String iban
    String contactName
    String contactDesignation
    String contactPhone
    String contactMobile
    String contactEmail
    Boolean status = true

    Address general
    Address postal

    static constraints = {
        contactEmail nullable: true

        bankFullName nullable: false, validator: { name, othBankSetupObj ->
            def id = othBankSetupObj.id as Long
            if (id == null) {
                def bankFullName = OthersBankSetup.findByBankFullNameAndStatus(name, true)
                if (bankFullName) {
                    return 'coreBanking.setting.othBankSetup.bankFullName.unique'
                }
            } else {
                def bankFullName = OthersBankSetup.withCriteria {
                    not { 'in'('id', [othBankSetupObj.id]) }
                    and {
                        eq('status', true)
                        eq('bankFullName', name)
                    }
                }
                if (bankFullName.size() > 0) {
                    return 'coreBanking.setting.othBankSetup.bankShortName.unique'
                }
            }
        }
        bankShortName nullable: false, validator: { sortName, othBankSetupObj ->
            def id = othBankSetupObj.id as Long
            println("IDDDDDDDDDDDDD"+id)
            if (id == null) {
                def bankShortName = OthersBankSetup.findByBankShortNameAndStatus(sortName, true)
                if (bankShortName) {
                    return 'coreBanking.setting.othBankSetup.bankShortName.unique'
                }
            } else {
                def bankShortName = OthersBankSetup.withCriteria {
                    not { 'in'('id', [othBankSetupObj.id]) }
                    and {
                        eq('status', true)
                        eq('bankShortName', sortName)
                    }
                }
                if (bankShortName.size() > 0) {
                    return 'coreBanking.setting.othBankSetup.bankShortName.unique'
                }
            }
        }

    }
}

