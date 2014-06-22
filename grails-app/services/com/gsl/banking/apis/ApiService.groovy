package com.gsl.banking.apis

import com.gsl.cbs.exceptions.CoreBankingException
import grails.transaction.Transactional
import groovyx.net.http.HTTPBuilder
import org.apache.http.HttpStatus
import org.codehaus.groovy.grails.commons.GrailsApplication
import static groovyx.net.http.Method.GET
import static groovyx.net.http.ContentType.TEXT
import static groovyx.net.http.ContentType.JSON

import javax.annotation.PostConstruct

class ApiService {
    static transactional = false
    GrailsApplication grailsApplication
    private HTTPBuilder  httpBuilder
    private static final Integer SUCCESS_STATUS_CODES = 200
    private static final String ACCOUNT_QUERY_API ='/api/accountTypeList'
    private static final String PRODUCT_LIST_QUERY_API ='/api/productList'
    private static final String FIXED_FEE_QUERY_API ='/api/fixedFeeList'
    private static final String ENTRY_FEE_QUERY_API ='/api/entryFeeList'
    private static final String CLOSED_FEE_QUERY_API ='/api/closedFeeList'
    private static final String REOPEN_FEE_QUERY_API ='/api/reopenFeeList'
    private static final String AGIO_FEE_QUERY_API ='/api/agioFeeList'
    private static final String MANAGEMENT_FEE_QUERY_API ='/api/managementFeeList'
    private static final String OVERDRAFT_FEE_QUERY_API ='/api/overdraftFeeList'
    private static final String PRODUCT_INFO_QUERY_API ='/api/productInfo'

//    @PostConstruct
//    private void initializeBuilder() {
        /* if (grailsApplication.config.grails.orosURL) {
             httpBuilder = new HTTPBuilder(grailsApplication.config.grails.orosURL.toString())
         }*/
//        httpBuilder = new HTTPBuilder('http://localhost:8080/gslcbs')//('http://192.168.10.185:8080/gslcbs')
//    }
    def accountTypeList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+ACCOUNT_QUERY_API,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def productList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+PRODUCT_LIST_QUERY_API+'?accountType='+optionalArgs.accountType,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def fixedFeeList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+FIXED_FEE_QUERY_API+'?accountType='+optionalArgs.accountType+'&productId='+optionalArgs.productId,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def entryFeeList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+ENTRY_FEE_QUERY_API+'?accountType='+optionalArgs.accountType+'&productId='+optionalArgs.productId,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def closedFeeList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+CLOSED_FEE_QUERY_API+'?accountType='+optionalArgs.accountType+'&productId='+optionalArgs.productId,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def reopenFeeList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+REOPEN_FEE_QUERY_API+'?accountType='+optionalArgs.accountType+'&productId='+optionalArgs.productId,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def agioFeeList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+AGIO_FEE_QUERY_API+'?accountType='+optionalArgs.accountType+'&productId='+optionalArgs.productId,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def managementFeeList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+MANAGEMENT_FEE_QUERY_API+'?accountType='+optionalArgs.accountType+'&productId='+optionalArgs.productId,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def overdraftFeeList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+OVERDRAFT_FEE_QUERY_API+'?accountType='+optionalArgs.accountType+'&productId='+optionalArgs.productId,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def productInfo(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+PRODUCT_INFO_QUERY_API+'?accountType='+optionalArgs.accountType+'&productId='+optionalArgs.productId,queryParams)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }

    private submitCoreBankRequest(String pathUrl, Map queryParams) throws CoreBankingException {

        new HTTPBuilder(pathUrl).request(GET,JSON) { req ->
            response.success = { resp, json ->
                println "response status: ${resp.statusLine}"
                println 'request was successful'
                println(resp.status)
                return json
            }

            response.failure = { resp ->
                println 'request failed'
                println(resp.status)
            }
        }
    }
}
