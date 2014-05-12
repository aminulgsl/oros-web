package com.virtualsw

import org.springframework.web.multipart.MultipartFile

class ImageIndirectService {

    static transactional = false

    def grailsApplication
    def grailsLinkGenerator

    String fullPath(String category = null) {

        String returnPath = grailsApplication.config.imageindirect.basePath
        String categoryUrl = category ? grailsApplication.config.imageindirect.category."${category}" : null

        if (categoryUrl) {
            if (categoryUrl.startsWith("/")) {
                returnPath = categoryUrl
            } else {
                returnPath += "/${categoryUrl}"
            }
        }
        return returnPath
    }
    String fullDirPath(String fileDir = null, String category = null) {

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

        return returnPath
    }

    /*File storeImage(MultipartFile multipartFile, String desiredName = null, String category = null) {
        if (!multipartFile) {
            return null
        }

        def storagePath = fullPath(category)
        def physicalFileName = desiredName ?: multipartFile.originalFilename
        File file = new File(storagePath, physicalFileName)
        multipartFile.transferTo(file)
        return file
    }*/
    File storeFile(MultipartFile multipartFile, String desiredName = null, String fileDir = null, String category = null) {
        if (!multipartFile) {
            return null
        }

        String storagePath = ""
        if(fileDir){
            storagePath = fullDirPath(fileDir, category)
        }else {
            storagePath = fullPath(category)
        }
        String physicalFileName = desiredName ?: multipartFile.originalFilename.replaceAll('','_')
        File dirPath
        try{
            dirPath = new File(storagePath)
            if( !dirPath.exists() ) {
                dirPath.mkdirs()
            }
            dirPath = new File(storagePath, physicalFileName)
            multipartFile.transferTo(dirPath)
        }catch (Exception ex){
            ex.printStackTrace()
            dirPath = null
        }

        return dirPath
    }

    /*String imageLink( String imageName, String category) {
        grailsLinkGenerator.link(controller: 'imageIndirect' , params: [imageName: imageName, category:category] )
    }*/
    String imageLink( String imageName, String category, String fileDir) {
        grailsLinkGenerator.link(controller: 'imageIndirect' , params: [imageName: imageName, category:category,fileDir:fileDir] )
    }

    String lastResortImage() {
        grailsApplication.config.imageindirect.nophoto
    }
}
