package com.gsl.oros.core.banking

import com.gsl.cbs.exceptions.CoreBankingException
import grails.plugin.springsecurity.annotation.Secured

class OpenAccountController {
    def apiService

    @Secured(['ROLE_SUPER_ADMIN'])
    def index() {
        def accountTypeList = null
        try{
            accountTypeList = apiService.accountTypeList()
        }catch (CoreBankingException ex){
            ex.printStackTrace()
        }
        render(view: 'index', model: [accountTypeList:accountTypeList])
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def products(){
        def productList = null
        String accountType = params.accountType
        Map queryParams = new LinkedHashMap()
        queryParams.put('accountType',accountType)
        try{
            productList = apiService.productList(queryParams)
        }catch (CoreBankingException ex){
            ex.printStackTrace()
        }
        println(productList)
        render(view: 'products', model: [productList:productList, accountType:params.accountType])
//        if(params.accountType == 'SAVINGS'){
//            def savingsProductList = null
//            try{
//                savingsProductList = apiService.savingsProductList()
//            }catch (CoreBankingException ex){
//                ex.printStackTrace()
//            }
//            println(savingsProductList)
//            render(view: 'products', model: [productList:savingsProductList, accountType:params.accountType])
//        }
    }
}
