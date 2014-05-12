package com.gsl.oros.core.banking

import grails.plugin.springsecurity.annotation.Secured


class DashboardController {
    @Secured(['ROLE_SUPER_ADMIN'])
    def index() {
        render(view: 'index')
    }
}
