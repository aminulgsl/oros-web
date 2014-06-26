package com.gsl.banking.api

import com.gsl.cbs.contraints.enums.RequestStatus
import com.gsl.cbs.webservice.ServiceResult
import com.gsl.oros.core.banking.AccOpenRequest
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
}
