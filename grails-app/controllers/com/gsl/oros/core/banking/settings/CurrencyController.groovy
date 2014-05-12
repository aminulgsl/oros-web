package com.gsl.oros.core.banking.settings

import com.gsl.oros.core.banking.product.settings.CurrencysUtility
import grails.converters.JSON

class CurrencyController {


    def index() {
        render(view: '/coreBanking/settings/currency/_currencyList')
    }

    def create() {
        render(view: '/coreBanking/settings/currency/_createCurrency')
    }

    def save(CurrencyCommand currencyCommand) {
        if (!request.method == 'POST') {
            render(template: '/coreBanking/settings/currency/createCurrency')
            return
        }
        if (currencyCommand.hasErrors()) {
            render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencyCommand])
            return
        }
        Currencys currencys
        if (params.id) {     //update Currency
            currencys = Currencys.get(currencyCommand.id)
            if (!currencys) {
                flash.message = "Currency not found"
                render(template: '/coreBanking/settings/currency/currencyList')
                return
            }
            currencys.properties = currencyCommand.properties
            if (!currencyCommand.validate()) {
                render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
                return
            }
            currencys.save(flush: true)
            flash.message = "Currency Updated successfully"
            render(template: '/coreBanking/settings/currency/currencyList')
            return
        }
        currencys = new Currencys(currencyCommand.properties)
        if (!currencyCommand.validate()) {
            render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
            return
        }
        Currencys savedCurr = currencys.save(flush: true)
        if (!savedCurr) {
            render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
        }
        currencys.save(flush: true)
        flash.message = "Currency created successfully"
        render(template: '/coreBanking/settings/currency/currencyList')
        return

    }

    def delete(Long id) {
        Currencys currencys = Currencys.get(id)
        if (!currencys) {
            flash.message = "Currency not found"
            render(template: '/coreBanking/settings/currency/currencyList')
        }
        currencys.status = false
        currencys.save(flush: true)
        flash.message = "Currency deleted successfully"
        render(template: '/coreBanking/settings/currency/currencyList')
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
        String sortColumn = CurrencysUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()
        def c = Currencys.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("status", true)
                and {
                    country {
                        eq('status', true)
                    }
                }

            }
            if (sSearch) {
                or {
                    ilike('name', sSearch)
                    ilike('symbol', sSearch)
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
            results.each { Currencys currencys ->
                if (sSortDir.equalsIgnoreCase('asc')) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: currencys.id, 0: serial, 1: currencys.name, 2: currencys.abbreviation, 3: currencys.symbol, 4: currencys.country.name, 5: currencys.hundredName, 6: ''])
            }
        }

        Map gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: dataReturns]
        String result = gridData as JSON
        println(result)
        render result
    }

    def update(Long id) {
        Currencys currencys = Currencys.read(id)
        if (!currencys) {
            flash.message = "Currency not found"
            render(template: '/coreBanking/settings/currency/currencyList')
        }
        render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
    }


}

class CurrencyCommand {
    Long id
    String name
    String abbreviation
    String symbol
    Country country
    String hundredName
    Boolean status = true
    static constraints = {
        name nullable: false, validator: { name, currencyObj ->
            def id = currencyObj.id as Long
            if (id == null) {
                def currencyName = Currencys.findByNameAndStatus(name, true)
                if (currencyName) {
                    return 'coreBanking.setting.currency.name.unique'
                }
            } else {
                def currencyName = Currencys.withCriteria {
                    not { 'in'('id', [currencyObj.id]) }
                    and {
                        eq('status', true)
                        eq('name', name)
                    }
                }
                if (currencyName.size() > 0) {
                    return 'coreBanking.setting.currency.name.unique'
                }
            }
        }
        symbol nullable: false, validator: { symbol, currencyObj ->
            def id = currencyObj.id as Long
            if (id == null) {
                def currencySymbol = Currencys.findBySymbolAndStatus(symbol, true)
                if (currencySymbol) {
                    return 'coreBanking.setting.currency.symbol.unique'
                }
            } else {
                def currencySymbol = Currencys.withCriteria {
                    not { 'in'('id', [currencyObj.id]) }
                    and {
                        eq('status', true)
                        eq('symbol', symbol)
                    }
                }
                if (currencySymbol.size() > 0) {
                    return 'coreBanking.setting.currency.symbol.unique'
                }
            }
        }
        country nullable: false, validator: { country, currencyObj ->
            def id = currencyObj.id as Long
            def countryId = currencyObj.country.id
            if (id == null) {
                def currCountry = Currencys.findByCountryAndStatus(Country.read(countryId), true)
                if (currCountry) {
                    return 'coreBanking.setting.currency.country.unique'
                }
            } else {
                def currCountry = Currencys.withCriteria {
                    not { 'in'('id', [currencyObj.id]) }
                    and {
                        eq('status', true)
                        eq('country', Country.read(countryId))
                    }
                }
                if (currCountry.size() > 0) {
                    return 'coreBanking.setting.currency.country.unique'
                }
            }
        }
    }
}
