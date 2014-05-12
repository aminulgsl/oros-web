package com.gsl.oros.core.banking.settings

import com.gsl.oros.core.banking.product.settings.CountryUtility
import grails.converters.JSON
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class CountryController {

    def index() {
        render(template: '/coreBanking/settings/country/countryList')
    }

    def create() {
        render(template: '/coreBanking/settings/country/createCountry')
    }

    def save(CountryCommand countryCommand) {
        if (!request.method == 'POST') {
            render(template: '/coreBanking/settings/country/createCountry')
            return
        }
        if (countryCommand.hasErrors()) {
            render(template: '/coreBanking/settings/country/createCountry', model: [country: countryCommand])
            return
        }
        Country country
        if (params.id) {     //update Country
            country = Country.get(countryCommand.id)
            if (!country) {
                flash.message = "Country not found"
                render(template: '/coreBanking/settings/country/countryList')
                return
            }
            country.properties = countryCommand.properties
            if (!countryCommand.validate()) {
                render(template: '/coreBanking/settings/country/createCountry', model: [country: country])
                return
            }
            country.save(flush: true)
            flash.message = "Country Updated successfully"
            render(template: '/coreBanking/settings/country/countryList')
            return
        }
        country = new Country(countryCommand.properties)

        if (!countryCommand.validate()) {
            render(template: '/coreBanking/settings/country/createCountry', model: [country: country])
            return
        }
        Country savedCou = country.save(flush: true)
        if (!savedCou) {
            render(template: '/coreBanking/settings/country/createCountry', model: [country: country])
        }
        flash.message = "Country created successfully"
        render(template: '/coreBanking/settings/country/countryList')
        return
    }

    def delete(Long id) {
        Country country = Country.get(id)

        if (!country) {
            flash.message = "Country not found"
            render(template: '/coreBanking/settings/country/countryList')
        }
        country.status = false
        if (country.save(flush: true)) {
            Currencys currencys = Currencys.findByCountry(country)
            currencys.status = false
            currencys.save(failOnError: true)
        }
        flash.message = "Country deleted successfully"
        render(template: '/coreBanking/settings/country/countryList')
    }

    def update(Long id) {
        Country country = Country.read(id)
        if (!country) {
            flash.message = "Country not found"
            render(template: '/coreBanking/settings/country/countryList')
        }
        render(template: '/coreBanking/settings/country/createCountry', model: [country: country])
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
        String sortColumn = CountryUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()
        def c = Country.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("status", true)
            }
            if (sSearch) {
                or {
                    ilike('name', sSearch)
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
            results.each { Country country ->
                if (sSortDir.equalsIgnoreCase('asc')) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: country.id, 0: serial, 1: country.name, 2: country.printablename, 3: country.numcode, 4: country.iso2, 5: country.iso3, 6: ''])
            }
        }

        Map gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: dataReturns]
        String result = gridData as JSON
        println(result)
        render result
    }

}

class CountryCommand {
    Long id
    String iso2
    String name
    String printablename
    String iso3
    Long numcode
    Boolean status = true

    static constraints = {
        name nullable: false, validator: { name, countryObj ->
            def id = countryObj.id as Long
            if (id == null) {
                def countryName = Country.findByNameAndStatus(name, true)
                if (countryName) {
                    return 'coreBanking.setting.country.name.unique'
                }

            } else {
                def countryName = Country.withCriteria {
                    not { 'in'("id", [countryObj.id]) }
                    and {
                        eq('name', name)
                        eq('status', true)
                    }
                }
                if (countryName.size() > 0) {
                    return 'coreBanking.setting.country.name.unique'
                }
            }
        }
        printablename nullable: false, validator: { printableName, countryObj ->
            def id = countryObj.id as Long
            if (id == null) {
                def counPrintName = Country.findByPrintablenameAndStatus(printableName, true)
                if (counPrintName) {
                    return 'coreBanking.setting.country.printableName.unique'
                }
            } else {
                def counPrintName = Country.withCriteria {
                    not { 'in'('id', [countryObj.id]) }
                    and {
                        eq('printablename', printableName)
                        eq('status', true)
                    }
                }
                if (counPrintName.size() > 0) {
                    return 'coreBanking.setting.country.printableName.unique'
                }
            }
        }
        numcode nullable: false, validator: { numcode, countryObj ->
            def id = countryObj.id as Long
            if (id == null) {
                def counNumCode = Country.findByNumcodeAndStatus(numcode, true)
                if (counNumCode) {
                    return 'coreBanking.setting.country.numberCode.unique'
                }
            } else {
                def counNumCode = Country.withCriteria {
                    not { 'in'('id', [countryObj.id]) }
                    and {
                        eq('numcode', numcode)
                        eq('status', true)
                    }
                }
                if (counNumCode.size() > 0) {
                    return 'coreBanking.setting.country.numberCode.unique'
                }
            }
        }

    }

}

