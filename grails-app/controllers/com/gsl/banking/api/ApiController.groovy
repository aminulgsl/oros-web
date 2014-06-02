package com.gsl.banking.api

import com.gsl.cbs.contraints.enums.RequestStatus
import com.gsl.oros.core.banking.AccOpenRequest
import grails.plugin.springsecurity.annotation.Secured
import grails.rest.RestfulController
@Secured(['permitAll'])
class ApiController extends RestfulController {
    static allowedMethods = [accOpen: "GET"]
    static responseFormats = ['json']

    def accOpen() {
        println params
        String str = params.str
        if(!str || str !='aminul'){
            render status:404
        }
        def accOpenRequest = AccOpenRequest.findAllByStatus(RequestStatus.SUBMITTED)
        if(accOpenRequest == null) {
            render status:404
        }
        respond(accOpenRequest)
    }
}
