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
        println("Hello"+accountTypeList)
        render(view: 'index', model: [accountTypeList:accountTypeList])
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def create(){
        println(params)
        def savingsProductList = null
        try{
            savingsProductList = apiService.savingsProductList()
        }catch (CoreBankingException ex){
            ex.printStackTrace()
        }
        println(savingsProductList)
        render(view: 'products', model: [productList:savingsProductList])
    }
}
