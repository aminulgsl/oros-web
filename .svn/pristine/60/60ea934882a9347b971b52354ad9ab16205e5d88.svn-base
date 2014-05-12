package com.gsl.oros.core.banking.settings

import com.gsl.cbs.contraints.enums.AddressType
import com.gsl.oros.core.banking.product.settings.BranchUtility
import grails.converters.JSON

class BranchSetupController {
    def branchType = [[id: 1, type: 'Regional Branch'],
            [id: 2, type: 'Devisional Branch'],
            [id: 3, type: 'Area Branch']]
    def parentOffice = [[id: 1, parentOff: 'Oroscapital HO']]

    def index() {

        render(view: '/coreBanking/settings/branchSetup/branchList')
    }

    def create() {
        render(view: '/coreBanking/settings/branchSetup/branchSetup',
                model: [branchType: branchType.toList(),
                        parentOffice: parentOffice.toList()])
    }

    def stateList() {
        def street = State.findAllByCountry(Country.read(params.generalCountry as Long))
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

    def save(BranchSetUpCommand branchSetUpCommand) {
        if (!request.method == 'POST') {
            render(view: '/coreBanking/settings/branchSetup/branchSetup',
                    model: [branchSetup: branchSetUpCommand,
                            branchType: branchType.toList(),
                            parentOffice: parentOffice.toList()])
            return
        }
        if (branchSetUpCommand.hasErrors()) {
            render(view: '/coreBanking/settings/branchSetup/branchSetup',
                    model: [branchSetup: branchSetUpCommand,
                            generalAdd: branchSetUpCommand.general.properties,
                            postalAdd: branchSetUpCommand.postal.properties,
                            generalId: branchSetUpCommand.generalId,
                            postalId: branchSetUpCommand.postalId,
                            branchType: branchType.toList(),
                            parentOffice: parentOffice.toList()])
            return
        }
        BranchSetup branchSetup
        if (params.id) {   //Update Branch Setup
            Long branchId = params.id as Long

            branchSetup = BranchSetup.get(branchId)
            if (!branchSetup) {
                flash.message = "Branch Is Not Available"
                render(view: '/coreBanking/settings/branchSetup/branchList')
                return
            }

            branchSetup.properties = branchSetUpCommand.properties

            if (!branchSetup.validate()) {
                render(view: '/coreBanking/settings/branchSetup/branchSetup',
                        model: [branchSetup: branchSetUpCommand,
                                generalAdd: branchSetUpCommand.general.properties,
                                generalId: branchSetUpCommand.generalId,
                                postalId: branchSetUpCommand.postalId,
                                postalAdd: branchSetUpCommand.postal.properties,
                                branchType: branchType.toList(),
                                parentOffice: parentOffice.toList()])
                return
            }

            branchSetup.save(failOnError: true)



            Address general = Address.get(branchSetUpCommand.generalId)
            general.properties = branchSetUpCommand.general.properties
            general.addressType = AddressType.GENERAL
            general.save(failOnError: true)

            Address postal = Address.get(branchSetUpCommand.postalId)
            postal.properties = branchSetUpCommand.postal.properties
            postal.addressType = AddressType.POSTAL
            postal.save(failOnError: true)

            flash.message = "Successfully Update Branch Setup Information."
            render(view: '/coreBanking/settings/branchSetup/branchList')
            return
        }
        branchSetup = new BranchSetup(branchSetUpCommand.properties)
        if (!branchSetup.validate()) {
            render(view: '/coreBanking/settings/branchSetup/branchSetup',
                    model: [branchSetup: branchSetUpCommand,
                            generalAdd: branchSetUpCommand.general.properties,
                            postalAdd: branchSetUpCommand.postal.properties,
                            branchType: branchType.toList(),
                            parentOffice: parentOffice.toList()])
            return
        }
        BranchSetup savedBranch = branchSetup.save(flush: true)
        if (!savedBranch) {
            render(view: '/coreBanking/settings/branchSetup/branchSetup',
                    model: [branchSetup: branchSetUpCommand,
                            branchType: branchType.toList(),
                            parentOffice: parentOffice.toList()])
            return
        }
        branchSetup.save(failOnError: true)

        Address general = new Address(branchSetUpCommand.general.properties)
        general.addressType = AddressType.GENERAL
        general.save(failOnError: true)
        branchSetup.addToGeneralAdd(general)

        Address postal = new Address(branchSetUpCommand.postal.properties)
        postal.addressType = AddressType.POSTAL
        postal.save(failOnError: true)
        branchSetup.addToPostalAdd(postal)

        flash.message = "Successfully Save Branch Setup Info"
        render(view: '/coreBanking/settings/branchSetup/branchList')
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
        if (sSearch) {
            sSearch = "%" + sSearch + "%"
        }
        String sortColumn = BranchUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()

        def c = BranchSetup.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("status", true)
            }
            if (sSearch) {
                or {
                    ilike('branchFullName', sSearch)
                    ilike('branchType', sSearch)
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
            results.each { BranchSetup branchSetup ->
                if (sSortDir.equalsIgnoreCase('asc')) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: branchSetup.id, 0: serial, 1: branchSetup.branchFullName, 2: branchSetup.branchShortName, 3: branchSetup.branchType, 4: branchSetup.parentOffice, 5: ''])
            }
        }


        Map gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: dataReturns]
        String result = gridData as JSON
        render result
    }



    def delete() {
        def branchId = params.id as Long
        BranchSetup branchSetup = BranchSetup.get(branchId)
        if (!branchSetup) {
            flash.message = "Branch not found"
            render(view: '/coreBanking/settings/branchSetup/branchList')
        }
        branchSetup.status = false
        branchSetup.save(flush: true)
        flash.message = "Branch deleted successfully"
        render(view: '/coreBanking/settings/branchSetup/branchList')

    }

    def update() {
        def branchId = params.id as Long
        def branchSetup = BranchSetup.read(branchId)
        if (!branchSetup) {
            flash.message = "Branch not found"
            render(template: '/coreBanking/settings/branchSetup/branchList')
        }
        render(view: '/coreBanking/settings/branchSetup/branchSetup',
                model: [branchSetup: branchSetup,
                        generalAdd: branchSetup.generalAdd[0],
                        postalAdd: branchSetup.postalAdd[0],
                        branchType: branchType.toList(),
                        parentOffice: parentOffice.toList()])
    }
}

class BranchSetUpCommand {
    Long id
    Long generalId
    Long postalId

    Address general
    Address postal
    String branchFullName
    String branchShortName
    String branchType
    String parentOffice
    Boolean status = true
    static constraints = {
        branchFullName nullable: false, validator: { name, branchSetupObj ->
            def id = branchSetupObj.id as Long

            if (id == null) {
                def branchFullName = BranchSetup.findByBranchFullNameAndStatus(name, true)
                if (branchFullName) {
                    return 'coreBanking.setting.branchSetup.branchFullName.unique'
                }
            } else {
                def branchFullName = BranchSetup.withCriteria {
                    not { 'in'('id', [branchSetupObj.id]) }
                    and {
                        eq('status', true)
                        eq('branchFullName', name)
                    }
                }
                if (branchFullName.size() > 0) {
                    return 'coreBanking.setting.branchSetup.branchFullName.unique'
                }
            }
        }
        branchShortName nullable: false, validator: { sortName, branchSetupObj ->
            def id = branchSetupObj.id as Long
            if (id == null) {
                def branchSortName = BranchSetup.findByBranchFullNameAndStatus(sortName, true)
                if (branchSortName) {
                    return 'coreBanking.setting.branchSetup.branchShortName.unique'
                }
            } else {
                def branchSortName = BranchSetup.withCriteria {
                    not { 'in'('id', [branchSetupObj.id]) }
                    and {
                        eq('status', true)
                        eq('branchShortName', sortName)
                    }
                }
                if (branchSortName.size() > 0) {
                    return 'coreBanking.setting.branchSetup.branchShortName.unique'
                }
            }
        }
        generalId nullable: true
        postalId nullable: true
        id nullable: true
    }


}
