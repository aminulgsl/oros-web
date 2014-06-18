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
    private static final String PRODUCT_QUERY_API ='/api/productList'
    private static final String SAVINGS_PRODUCT_QUERY_API ='/api/savingsProductList'

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
        println(optionalArgs.accountType)
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+PRODUCT_QUERY_API+queryParams,null)
        if(results){
            try{
                return results;
            }catch (Exception ex){
                throw new CoreBankingException("Unable to construct coordinate: ${ex.message}")
            }
        }
        return results
    }
    def savingsProductList(Map optionalArgs = [:]) throws CoreBankingException{
        String serverUrl=grailsApplication.config.grails.orosURL.toString()
        Map queryParams = optionalArgs.clone()
        def results = submitCoreBankRequest(serverUrl+SAVINGS_PRODUCT_QUERY_API,queryParams)
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
