package com.gsl.uma.saas

class ChildEvent {
    String name
    String description
    String fmenuText
    String controllerName
    String actionName
    boolean autoPermit = false
    boolean status = true
    static belongsTo = [events:Events]
    //    Long userId         //companyId
    static constraints = {
        name nullable: false, unique: true
        fmenuText nullable: false
    }
}
