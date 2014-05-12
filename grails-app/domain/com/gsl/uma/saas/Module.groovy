package com.gsl.uma.saas

class Module {
    String name
    String description
    String menuText
    String iconClassName;
//    String requestUrl
//    String controllerName
//    String actionName
    boolean status = true
//    boolean showOnMenu = false
//    Long userId         //companyId

//    static hasMany = [feature:Feature]
    static constraints = {
        name nullable: false, unique: true
        iconClassName nullable: true
    }
}
