package com.gsl.oros.core.banking.settings

import com.gsl.cbs.contraints.enums.AddressType
import com.gsl.oros.core.banking.product.settings.OthBranchUtility
import grails.converters.JSON

class OthBranchSetupController {

    def index() {
        render(view: "/coreBanking/settings/othBranchSetup/branchList")
    }

    def create() {
        render(view: "/coreBanking/settings/othBranchSetup/othBranchSetup")
    }

    def stateList() {
        def id = params.getLong('bankId')
        def bank = OthersBankSetup.get(id)
        def country = bank.generalAdd.country.id[0]
        def state = State.findAllByCountry(Country.read(country))
        for (def i = 0; i < state.size(); i++) {
            render "<option value='${state.id[i]}'>${state.name[i]}</option>"
        }
    }

    def save(OthBranchCommand othBranchCommand) {
        if (!request.method == 'POST') {
            render(view: '/coreBanking/settings/othBranchSetup/othBranchSetup')
            return
        }
        if (othBranchCommand.hasErrors()) {
            render(view: '/coreBanking/settings/othBranchSetup/othBranchSetup',
                    model: [othBranchSetup: othBranchCommand,
                            generalId: othBranchCommand.generalId,
                            postalId: othBranchCommand.postalId,
                            generalAdd: othBranchCommand.general.properties,
                            postalAdd: othBranchCommand.postal.properties])
            return
        }
        OthersBranchSetup othersBranchSetup
        if (params.id) {   //update Branch
            othersBranchSetup = OthersBranchSetup.get(othBranchCommand.id)
            if (!othersBranchSetup) {
                flash.message = "Branch Is Not Available"
                render(view: '/coreBanking/settings/othBranchSetup/branchList')
                return
            }
            othersBranchSetup.properties = othBranchCommand.properties
            if (!othersBranchSetup.validate()) {
                render(view: '/coreBanking/settings/othBranchSetup/othBranchSetup',
                        model: [othBranchSetup: othersBranchSetup,
                                generalId: othBranchCommand.generalId,
                                postalId: othBranchCommand.postalId,
                                generalAdd: othBranchCommand.general.properties,
                                postalAdd: othBranchCommand.postal.properties])
                return
            }
            othersBranchSetup.save(flush: true, failOnError: true)
            Address general = Address.get(othBranchCommand.generalId)
            general.properties = othBranchCommand.general.properties
            general.addressType = AddressType.GENERAL
            general.save(failOnError: true)

            Address postal = Address.get(othBranchCommand.postalId)
            postal.properties = othBranchCommand.postal.properties
            postal.addressType = AddressType.POSTAL
            postal.save(failOnError: true)

            flash.message = "Successfully Update Branch Setup Information"
            render(view: '/coreBanking/settings/othBranchSetup/branchList')
            return

        }
        othersBranchSetup = new OthersBranchSetup(othBranchCommand.properties)
        if (!othersBranchSetup.validate()) {
            render(view: '/coreBanking/settings/othBranchSetup/othBranchSetup',
                    model: [othBranchSetup: othersBranchSetup,
                            generalId: othBranchCommand.generalId,
                            postalId: othBranchCommand.postalId,
                            generalAdd: othBranchCommand.general.properties,
                            postalAdd: othBranchCommand.postal.properties])
            return
        }
        OthersBranchSetup saveBranch = othersBranchSetup.save(flush: true)
        if (!saveBranch) {
            render(view: '/coreBanking/settings/othBranchSetup/othBranchSetup',
                    model: [othBranchSetup: othersBranchSetup])
            return
        }
        othersBranchSetup.save(failOnError: true)

        Address general = new Address(othBranchCommand.general.properties)
        general.addressType = AddressType.GENERAL
        general.save(failOnError: true)
        othersBranchSetup.addToGeneralAdd(general)

        Address postal = new Address(othBranchCommand.postal.properties)
        postal.addressType = AddressType.POSTAL
        postal.save(failOnError: true)
        othersBranchSetup.addToPostalAdd(postal)

        flash.message = "Successfully Save Branch Setup"
        render(view: '/coreBanking/settings/othBranchSetup/branchList')
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
        String sortColumn = OthBranchUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()
        def c = OthersBranchSetup.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("status", true)
            }
            if (sSearch) {
                or {
                    ilike('branchFullName', sSearch)
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
            results.each { OthersBranchSetup othersBranchSetup ->
                if (sSortDir.equalsIgnoreCase('asc')) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: othersBranchSetup.id, 0: serial, 1: othersBranchSetup.branchFullName, 2: othersBranchSetup.branchShortName, 3: othersBranchSetup.bankName.bankFullName, 4: othersBranchSetup.bankName.generalAdd.country.name, 5: othersBranchSetup.generalAdd.state.name, 6: ''])
            }
        }
        Map gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: dataReturns]
        String result = gridData as JSON
        render result
    }

    def delete(Long id) {
        def othBranchSetup = OthersBranchSetup.get(id)
        if (!othBranchSetup) {
            flash.message = "Branch not found"
            render(view: '/coreBanking/settings/othBranchSetup/branchList')
        }
        othBranchSetup.status = flash
        othBranchSetup.save(flash: true)
        flash.message = "Branch deleted successfully"
        render(view: '/coreBanking/settings/othBranchSetup/branchList')
    }

    def update(Long id) {
        def othBranchSetup = OthersBranchSetup.read(id)
        if (!othBranchSetup) {
            flash.message = "Branch not found"
            render(view: '/coreBanking/settings/othBranchSetup/branchList')
        }
        render(view: '/coreBanking/settings/othBranchSetup/othBranchSetup',
                model: [othBranchSetup: othBranchSetup,
                        generalAdd: othBranchSetup.generalAdd[0],
                        postalAdd: othBranchSetup.postalAdd[0]]
        )
    }

}

class OthBranchCommand {
    Long id
    Long generalId
    Long postalId

    String branchFullName
    String branchShortName
    String contactName
    String contactDesignation
    String contactPhone
    String contactMobile
    String contactEmail
    Boolean status = true
    OthersBankSetup bankName
    Address general
    Address postal

    static constraints = {
        contactEmail nullable: true

        branchFullName nullable: false, validator: { name, othBranchSetupObj ->
            def id = othBranchSetupObj.id as Long
            println("IDDDDDDDDDDDDDDDD" + id)
            if (id == null) {
                def branchFullName = OthersBranchSetup.findByBranchFullNameAndStatus(name, true)
                if (branchFullName) {
                    return 'coreBanking.setting.othBranchSetup.branchFullName.unique'
                }
            } else {
                def branchFullName = OthersBranchSetup.withCriteria {
                    not { 'in'('id', [othBranchSetupObj.id]) }
                    and {
                        eq('status', true)
                        eq('branchFullName', name)
                    }
                }
                if (branchFullName.size() > 0) {
                    return 'coreBanking.setting.othBranchSetup.branchFullName.unique'
                }
            }
        }
        branchShortName nullable: false, validator: { shortName, othBranchSetupObj ->
            def id = othBranchSetupObj.id as Long
            if (id == null) {
                def branchShortName = OthersBranchSetup.findByBranchShortNameAndStatus(shortName, true)
                if (branchShortName) {
                    return 'coreBanking.setting.othBranchSetup.branchShortName.unique'
                }
            } else {
                def branchShortName = OthersBranchSetup.withCriteria {
                    not { 'in'('id', [othBranchSetupObj.id]) }
                    and {
                        eq('status', true)
                        eq('branchShortName', shortName)
                    }
                }
                if (branchShortName.size() > 0) {
                    return 'coreBanking.setting.othBranchSetup.branchShortName.unique'
                }
            }
        }
    }
}
