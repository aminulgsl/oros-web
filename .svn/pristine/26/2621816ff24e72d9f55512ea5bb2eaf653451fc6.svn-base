package com.gsl.uma.security

import com.gsl.uma.saas.Feature
import grails.transaction.Transactional

@Transactional
class UserService {

    def userList() {
        def criteria =Feature.createCriteria()
        def resultData = criteria.list(max: 10, offset: 10){
            order("fmenuText", "desc")
        }
        println "Rendering ${resultData.size()} Accounts of ${resultData.totalCount}"
        return resultData

    }
}
