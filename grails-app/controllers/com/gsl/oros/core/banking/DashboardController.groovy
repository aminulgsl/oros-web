package com.gsl.oros.core.banking

import com.gsl.uma.security.User
import grails.plugin.springsecurity.annotation.Secured


class DashboardController {
    def springSecurityService

    @Secured(['ROLE_SUPER_ADMIN'])
    def index() {
        Long userId = springSecurityService.principal.id
        User loggedUser = User.read(userId)
        render(view: 'index', model: [user:loggedUser])
    }
}
