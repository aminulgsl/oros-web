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
        render(view: 'products', model: [productList:productList, accountType:accountType])
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def productInfo() {
        def fixedFeeList = null
        def entryFeeList = null
        def closedFeeList = null
        def reopenFeeList = null
        def agioFeeList = null
        def managementFeeList = null
        def overdraftFeeList = null
        String accountType = params.accountType
        String productId = params.productId
        Map queryParams = new LinkedHashMap()
        queryParams.put('accountType',accountType)
        queryParams.put('productId',productId)
        try{
            fixedFeeList = apiService.fixedFeeList(queryParams)
            entryFeeList = apiService.entryFeeList(queryParams)
            closedFeeList = apiService.closedFeeList(queryParams)
            reopenFeeList = apiService.reopenFeeList(queryParams)
            agioFeeList = apiService.agioFeeList(queryParams)
            managementFeeList = apiService.managementFeeList(queryParams)
            overdraftFeeList = apiService.overdraftFeeList(queryParams)
        }catch (CoreBankingException ex){
            ex.printStackTrace()
        }
        render(view: '/savingsAccount/savingsAccountInfo', model: [accountType:accountType, productId:productId,
                fixedFeeList:fixedFeeList, entryFeeList:entryFeeList, closedFeeList:closedFeeList,
                reopenFeeList:reopenFeeList, agioFeeList:agioFeeList, managementFeeList:managementFeeList,
                overdraftFeeList:overdraftFeeList])
    }
}
