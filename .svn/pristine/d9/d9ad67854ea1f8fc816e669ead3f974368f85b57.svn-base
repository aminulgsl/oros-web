package com.core.banking.demo

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class AttachmentService {

    static transactional = false

    def grailsApplication
    def grailsLinkGenerator

    String fullPath(String category = null, String fileDir = null) {

        String returnPath = grailsApplication.config.imageindirect.basePath
        String categoryUrl = category ? grailsApplication.config.imageindirect.category."${category}" : null

        if (categoryUrl) {
            if (categoryUrl.startsWith("/")) {
                returnPath = categoryUrl
            } else {
                returnPath += "/${categoryUrl}"
            }
        }
        if (fileDir) {
            if (fileDir.startsWith("/")) {
                returnPath = returnPath+fileDir
            } else {
                returnPath = returnPath+"/${fileDir}"
            }
        }
        try{
            File file = new File(returnPath)
            if( !file.exists() ) {
                file.mkdirs()
            }
        }catch (Exception ex){
            ex.printStackTrace()
            returnPath =grailsApplication.config.imageindirect.basePath
        }
        return returnPath
    }

   File storeImage(MultipartFile multipartFile, String desiredName = null, String category = null) {
        if (!multipartFile) {
            return null
        }

        def storagePath = fullPath(category)
        def physicalFileName = desiredName ?: multipartFile.originalFilename
        File file = new File(storagePath, physicalFileName)
        multipartFile.transferTo(file)
        return file
    }
    File storeFile(MultipartFile multipartFile, String fileDir = null, String desiredName = null,  String category = null) {
        if (!multipartFile) {
            return null
        }

        def storagePath = fullPath(category,fileDir)
        def physicalFileName = desiredName ?: multipartFile.originalFilename
        File file = new File(storagePath, physicalFileName)
        multipartFile.transferTo(file)
        return file
    }

    String imageLink(String imageName, String category) {
        grailsLinkGenerator.link(controller: 'imageIndirect', params: [imageName: imageName, category: category])
    }

    String lastResortImage() {
        grailsApplication.config.imageindirect.nophoto
    }
}
