package com.gsl.oros.core.banking.attachments

import com.gsl.oros.core.banking.accountHolder.AccountHolder

class Attachments {
    String name
    String description
    String originalName
    String type
    Long size
    String extension
    String filePath
    String attachmentUrl
    String caption
    String remarks
    Boolean status
    static constraints = {
        name(nullable: false)
        description(nullable: true)
        remarks(nullable: true)
        extension(nullable: true)
        filePath(nullable: true)
    }
}
