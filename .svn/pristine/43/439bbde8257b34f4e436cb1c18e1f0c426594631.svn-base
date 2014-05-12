package com.gsl.oros.core.banking.settings

import com.gsl.oros.core.banking.product.settings.VatCategoryUtility
import grails.converters.JSON

class VatCategoryController {
    def vatGlAccount = [[id: 1, account: 'Loan Account', accountNum: 10001],
            [id: 2, account: 'Saving Account', accountNum: 10002],
            [id: 3, account: 'Deposit Account', accountNum: 10003]]

    def purchaseGlAc = [[id: 1, account: 'PurchaseAcc A', accountNum: 20001],
            [id: 2, account: 'PurchaseAcc B', accountNum: 20002],
            [id: 3, account: 'PurchaseAcc C', accountNum: 20003]]

    def salesGlAc = [[id: 1, account: 'SalesAcc A', accountNum: 30001],
            [id: 2, account: 'SalesAcc B', accountNum: 30002],
            [id: 3, account: 'SalesAcc C', accountNum: 30003]]

    def index() {
        render(view: '/coreBanking/settings/vatCategoryBackup/vatCategoryList')
    }

    def create() {
        render(view: '/coreBanking/settings/vatCategoryBackup/vatCategory',
                model: [vatGlAcc: vatGlAccount.asList(),
                        purchaseAcc: purchaseGlAc.asList(),
                        salesGlAcc: salesGlAc.asList()])
    }

    def save(VatCatagoryCommand vatCatagoryCommand) {
        println(vatCatagoryCommand)
        if (!request.method == 'POST') {
            render(view: '/coreBanking/settings/vatCategoryBackup/vatCategory')
            return
        }
        if (vatCatagoryCommand.hasErrors()) {
            render(view: '/coreBanking/settings/vatCategoryBackup/vatCategory',
                    model: [vatCategory: vatCatagoryCommand,
                            vatGlAcc: vatGlAccount.asList(),
                            purchaseAcc: purchaseGlAc.asList(),
                            salesGlAcc: salesGlAc.asList()])
            return
        }
        VatCategoryBackup vatCategoryBackup
        if (params.id) {
            vatCategoryBackup = VatCategoryBackup.get(vatCatagoryCommand.id)
            if (!vatCategoryBackup) {
                flash.message = "Vat Category Is not Available"
                render(view: '/coreBanking/settings/vatCategoryBackup/vatCategory',
                        model: [vatCategory: vatCatagoryCommand,
                                vatGlAcc: vatGlAccount.asList(),
                                purchaseAcc: purchaseGlAc.asList(),
                                salesGlAcc: salesGlAc.asList()])
                return
            }
            vatCategoryBackup.properties = vatCatagoryCommand.properties
            if (!vatCategoryBackup.validate()) {
                render(view: '/coreBanking/settings/vatCategoryBackup/vatCategory',
                        model: [vatCategory: vatCatagoryCommand,
                                vatGlAcc: vatGlAccount.asList(),
                                purchaseAcc: purchaseGlAc.asList(),
                                salesGlAcc: salesGlAc.asList()])
                return
            }
            vatCategoryBackup.save(failOnError: true)
            flash.message = "SuccessFully Update Vat Category"
            render(view: '/coreBanking/settings/vatCategoryBackup/vatCategoryList')
            return
        }
        vatCategoryBackup = new VatCategoryBackup(vatCatagoryCommand.properties)
        if (!vatCategoryBackup.validate()) {
            render(view: '/coreBanking/settings/vatCategoryBackup/vatCategory',
                    model: [vatCategory: vatCatagoryCommand,
                            vatGlAcc: vatGlAccount.asList(),
                            purchaseAcc: purchaseGlAc.asList(),
                            salesGlAcc: salesGlAc.asList()])
            return
        }
        VatCategoryBackup vatCatSaved = vatCategoryBackup.save(failOnError: true)
        if (!vatCatSaved) {
            render(view: '/coreBanking/settings/vatCategoryBackup/vatCategory',
                    model: [vatCategory: vatCatagoryCommand,
                            vatGlAcc: vatGlAccount.asList(),
                            purchaseAcc: purchaseGlAc.asList(),
                            salesGlAcc: salesGlAc.asList()])
            return
        }
        flash.message = "SuccessFully Saved Vat Category"
        render(view: '/coreBanking/settings/vatCategoryBackup/vatCategoryList')
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
        String sortColumn = VatCategoryUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()
        def c = VatCategoryBackup.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("status", true)
            }
            if (sSearch) {
                or {
                    ilike('name', sSearch)
                    ilike('vatGlAccount', sSearch)
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
            results.each { VatCategoryBackup vatCategoryBackup ->
                if (sSortDir.equalsIgnoreCase('asc')) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: vatCategoryBackup.id, 0: serial, 1: vatCategoryBackup.name, 2: vatCategoryBackup.rate, 3: vatCategoryBackup.vatGlAccount, 4: vatCategoryBackup.purchaseGlAcc, 5: vatCategoryBackup.salesGlAcc, 6: ''])
            }
        }

        Map gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: dataReturns]
        String result = gridData as JSON
        println(result)
        render result
    }

    def delete(Long id) {
        def vatCategory = VatCategoryBackup.get(id)
        if (!vatCategory) {
            flash.message = "Vat Category Is Not Available"
            render(view: '/coreBanking/settings/vatCategoryBackup/vatCategoryList')
            return
        }
        vatCategory.status = false
        vatCategory.save(failOnError: true, flush: true)
        flash.message = "Successfully Delete Vat Category"
        render(view: '/coreBanking/settings/vatCategoryBackup/vatCategoryList')
        return
    }

    def update(Long id) {
        def vatCategory = VatCategoryBackup.get(id)
        if (!vatCategory) {
            flash.message = "Vat Category Is Not Available"
            render(view: '/coreBanking/settings/vatCategoryBackup/vatCategoryList')
            return
        }
        render(view: '/coreBanking/settings/vatCategoryBackup/vatCategory',
                model: [vatCategory: vatCategory,
                        vatGlAcc: vatGlAccount.asList(),
                        purchaseAcc: purchaseGlAc.asList(),
                        salesGlAcc: salesGlAc.asList()])
        return
    }
}

class VatCatagoryCommand {
    Long id
    String name
    String rate
    String vatGlAccount
    String purchaseGlAcc
    String salesGlAcc
    Boolean status = true
    static constraints = {

    }
}
