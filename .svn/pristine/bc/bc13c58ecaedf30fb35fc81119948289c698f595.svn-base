package com.virtualsw

import org.springframework.util.FileCopyUtils

class ImageIndirectController {

    def imageIndirectService

    def index(String imageName, String category) {
        boolean imageExists = false
        File fileToSend = new File( imageIndirectService.fullDirPath( category ) , imageName )

        fileToSend = fileToSend.exists() && fileToSend.isFile() ?
            fileToSend :
            new File( imageIndirectService.fullDirPath( category ) , imageIndirectService.lastResortImage() )

        if(!fileToSend.exists() || !fileToSend.isFile() ) {
            response.status = 404
            return
        }

        FileCopyUtils.copy new BufferedInputStream(new FileInputStream( fileToSend )), response.outputStream
    }
    /*def index(String imageName, String category, String fileDir) {
        boolean imageExists = false
        File fileToSend = null
        if(fileDir){
            fileToSend = new File( imageIndirectService.fullDirPath(fileDir, category ) , imageName )
        }else {
            fileToSend = new File( imageIndirectService.fullPath( category ) , imageName )
        }
        fileToSend = fileToSend.exists() && fileToSend.isFile() ?
                fileToSend :
                new File( imageIndirectService.fullPath( category ) , imageIndirectService.lastResortImage() )

        if(!fileToSend.exists() || !fileToSend.isFile() ) {
            response.status = 404
            return
        }

        FileCopyUtils.copy new BufferedInputStream(new FileInputStream( fileToSend )), response.outputStream
    }*/
}
