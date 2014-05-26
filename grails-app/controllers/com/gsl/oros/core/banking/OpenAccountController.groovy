package com.gsl.oros.core.banking

import grails.plugin.springsecurity.annotation.Secured

class OpenAccountController {

    @Secured(['ROLE_SUPER_ADMIN'])
    def index() {
        render(view: 'index')
    }
}
