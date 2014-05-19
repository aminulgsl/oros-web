package com.gsl.banking.web

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class RegisterController {

    def index() {
        render(view: 'register')
    }
}
