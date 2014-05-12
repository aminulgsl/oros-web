package com.gsl.oros.core.banking.settings

import com.gsl.cbs.contraints.enums.AddressType
import com.gsl.oros.core.banking.product.settings.RetailerUtility
import grails.converters.JSON

class RetailerSetupController {
    def account = [[id: 1, code: 1001, name: 'Saving'],
            [id: 2, code: 1002, name: 'Loan'],
            [id: 3, code: 1003, name: 'Retail']]


    def index() {
        render(view: '/coreBanking/settings/retailerSetup/retailerList')
    }

    def create() {
        render(view: '/coreBanking/settings/retailerSetup/retailerSetup',
                model: [account: account.toList(),
                        decimalSep: BankSetup.properties.decimalSeparator ? BankSetup.properties.decimalSeparator : 2])
    }

    def streetList() {
        def street = State.findAllByCountry(Country.read(params.country as Long))
        for (def i = 0; i < street.size(); i++) {
            render "<option value='${street.id[i]}'>${street.name[i]}</option>"
        }
    }

    def save(RetailerCommand retailerCommand) {
        println(retailerCommand)
        if (!request.method == 'POST') {
            render(view: '/coreBanking/settings/retailerSetup/retailerSetup',
                    model: [account: account.toList(),
                            decimalSep: BankSetup.properties.decimalSeparator ? BankSetup.properties.decimalSeparator : 2])
            return
        }
        if (retailerCommand.hasErrors()) {
            render(view: '/coreBanking/settings/retailerSetup/retailerSetup',
                    model: [retailerSetup: retailerCommand,
                            address: retailerCommand.address.properties,
                            addressId: retailerCommand.addressId,
                            account: account.toList()])
            return
        }
        RetailerSetup retailerSetup

        if (params.id) { //update Retailer

            retailerSetup = RetailerSetup.get(retailerCommand.id)
            if (!retailerSetup) {
                flash.retailerMessage = "Retailer Is Not Available"
                render(view: '/coreBanking/settings/retailerSetup/retailerList')
                return
            }

            retailerSetup.properties = retailerCommand.properties
            if (!retailerSetup.validate()) {
                render(view: '/coreBanking/settings/retailerSetup/retailerSetup',
                        model: [retailerSetup: retailerSetup,
                                address: retailerCommand.address.properties,
                                addressId: retailerCommand.addressId,
                                account: account.toList()])
                return
            }
            retailerSetup.save(failOnError: true)
            Address address = Address.get(retailerCommand.addressId)
            address.properties = retailerCommand.address.properties
            address.addressType = AddressType.GENERAL
            address.save(failOnError: true)

            flash.retailerMessage = "Successfully Update Retailer Setup"
            render(view: '/coreBanking/settings/retailerSetup/retailerList',
                    model: [account: account.toList()])
            return
        }

        retailerSetup = new RetailerSetup(retailerCommand.properties)
        if (!retailerSetup.validate()) {
            render(view: '/coreBanking/settings/retailerSetup/retailerSetup',
                    model: [retailerSetup: retailerSetup,
                            address: retailerCommand.address.properties,
                            account: account.toList()])
            return
        }

        RetailerSetup savedRetailer = retailerSetup.save(flush: true)
        if (!savedRetailer) {
            render(view: '/coreBanking/settings/retailerSetup/retailerSetup',
                    model: [retailerSetup: retailerSetup,
                            account: account.toList()])
            return
        }
        Address address = new Address(retailerCommand.address.properties)
        address.addressType = AddressType.GENERAL
        address.save(failOnError: true)
        retailerSetup.addToAddresss(address)
        flash.retailerMessage = "Successfully Saved Retailer Setup"
        render(view: '/coreBanking/settings/retailerSetup/retailerList',
                model: [account: account.toList()])

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
        String sortColumn = RetailerUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()

        def c = RetailerSetup.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("status", true)
            }
            if (sSearch) {
                or {
                    ilike('retailerName', sSearch)
                    ilike('retailerCode', sSearch)
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
            results.each { RetailerSetup retailerSetup ->
                if (sSortDir.equalsIgnoreCase('asc')) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: retailerSetup.id, 0: serial, 1: retailerSetup.retailerName, 2: retailerSetup.retailerCode, 3: retailerSetup.account, 4: retailerSetup.branchSetup.branchFullName, 5: ''])

            }
        }

        Map gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: dataReturns]
        String result = gridData as JSON
        render result
    }


    def delete() {
        def retailerId = params.id as Long
        RetailerSetup retailerSetup = RetailerSetup.get(retailerId)
        if (!retailerSetup) {
            flash.retailerMessage = "Retailer not found"
            render(view: '/coreBanking/settings/retailerSetup/retailerList')
        }
        retailerSetup.status = false
        retailerSetup.save(flush: true)
        flash.retailerMessage = "Retailer deleted successfully"
        render(view: '/coreBanking/settings/retailerSetup/retailerList')

        return
    }

    def update() {
        def retailerId = params.id as Long
        def retailerSetup = RetailerSetup.read(retailerId)
        if (!retailerSetup) {
            flash.retailerMessage = "Retailer not found"
            render(view: '/coreBanking/settings/retailerSetup/retailerList')
        }
        render(view: '/coreBanking/settings/retailerSetup/retailerSetup',
                model: [retailerSetup: retailerSetup,
                        address: retailerSetup.addresss[0],
                        account: account.toList()])
    }
}

class RetailerCommand {
    Long id
    Long addressId

    String retailerName
    String retailerCode
    String account
    Currencys currencys
    BranchSetup branchSetup
    Address address
    Double minAmountPerDay
    Double maxAmountPerDay
    Double minDeposit
    Double maxDeposit
    Double minWithdrawal
    Double maxWithdrawal

    Boolean status = true
    static constraints = {
        retailerName nullable: false, validator: { name, retailerObj ->
            def id = retailerObj.id as Long

            if (id == null) {
                def retailerName = RetailerSetup.findByRetailerNameAndStatus(name, true)
                if (retailerName) {
                    return 'coreBanking.setting.retailerSetup.retailerName.unique'
                }
            } else {
                def retailerName = RetailerSetup.withCriteria {
                    not { 'in'('id', [retailerObj.id]) }
                    and {
                        eq('status', true)
                        eq('retailerName', name)
                    }
                }
                if (retailerName.size() > 0) {
                    return 'coreBanking.setting.retailerSetup.retailerName.unique'
                }
            }
        }
        retailerCode nullable: false, validator: { code, retailerObj ->
            def id = retailerObj.id as Long

            if (id == null) {
                def retailerCode = RetailerSetup.findByRetailerCodeAndStatus(code, true)
                if (retailerCode) {
                    return 'coreBanking.setting.retailerSetup.retailerCode.unique'
                }
            } else {
                def retailerCode = RetailerSetup.withCriteria {
                    not { 'in'('id', [retailerObj.id]) }
                    and {
                        eq('status', true)
                        eq('retailerCode', code)
                    }
                }
                if (retailerCode.size() > 0) {
                    return 'coreBanking.setting.retailerSetup.retailerCode.unique'
                }
            }

        }
    }
}



