package com.gsl.uma.saas

class Events {
    String name
    String description
    String fmenuText
    String controllerName
    String actionName
    boolean showOnMenu = true
//    boolean isPermitToAll = false
    boolean status =true
    static belongsTo = [feature:Feature]
    //    Long userId         //companyId
    static constraints = {
        name nullable: false, unique: true
        fmenuText nullable: false
    }
}
