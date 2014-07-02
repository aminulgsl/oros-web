package com.gsl.banking.api

import com.gsl.cbs.contraints.enums.RequestStatus
import com.gsl.cbs.webservice.ServiceResult
import com.gsl.oros.core.banking.AccOpenRequest
import com.gsl.oros.core.banking.PersonalInfo
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugins.rest.client.RestBuilder
import grails.rest.RestfulController

@Secured(['permitAll'])
class ApiController extends RestfulController {
    static allowedMethods = [accOpen: "GET"]
    static responseFormats = ['json']

    def accOpenRequest() {
        ServiceResult accOpenRequestResult = new ServiceResult()
        def accOpenRequest = AccOpenRequest.findAllByStatus(RequestStatus.SUBMITTED)
        if(accOpenRequest == null) {
            accOpenRequestResult.count=0
            accOpenRequestResult.shortMessage="No account found"
            accOpenRequestResult.statusCode=200
            accOpenRequestResult.traceId="1254"
            accOpenRequestResult.results=null
            respond(accOpenRequestResult)
        }
        respond(accOpenRequest)
    }

    def personalInfo() {
        ServiceResult personalInfoResult = new ServiceResult()
        if(!params.personalId){
            render status:404
        }
        def personalInfo = PersonalInfo.findById(params.personalId)
        if(personalInfo == null) {
            personalInfoResult.count=0
            personalInfoResult.shortMessage="No account found"
            personalInfoResult.statusCode=200
            personalInfoResult.traceId="1254"
            personalInfoResult.results=null
            respond(personalInfoResult)
        }
        respond(personalInfo)
    }
}
