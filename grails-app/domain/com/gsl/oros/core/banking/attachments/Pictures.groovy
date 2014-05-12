package com.gsl.oros.core.banking.attachments

class Pictures {
    String name
    String originalName
    String type
    Long size
    String pictureUrl

    static constraints = {
        name(nullable: false)
    }
}
