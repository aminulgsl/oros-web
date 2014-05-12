package template

import com.gsl.uma.security.User
import grails.converters.JSON
import org.springframework.security.access.annotation.Secured
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class DemoController {

    def attachmentService

    @Secured('permitAll')
    def index() {
        render(view: 'dataTable')
    }

    @Secured('permitAll')
    def emptyPage() {
        render(view: '/emptyPage')
    }

    @Secured('permitAll')
    def jqGrid() {
        render(view: 'jqGrid')
    }

    @Secured('permitAll')
    def demo() {
        render(view: 'demo')
    }


    def submit() {
        def user = new User(params)
        if (!user.validate()) {
            // User is not validate. Return to Create Form
            render(view: 'create', model: [user: user])
            return
        }
//        User savedUser = user.save() //if reference require
        user.save()
        flash.message = "User Saved Successfully"
        redirect(action: 'list')
    }

// Attachment
    def attachment() {
        render(view: '/demo/attachment')
    }

    def save() {

        String clientID = Integer.toString(10003)
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
        CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("document")
        println("hello" + file)
        def originalFilename = file.originalFilename


        long uniqueNumber = new Date().getTime()
        def fileNameToSave = uniqueNumber + "_" + originalFilename


        originalFilename = originalFilename.replaceAll(" ", "-")
        attachmentService.storeImage(file, fileNameToSave, clientID)
        def clientImage = "/clientPhotos/" + clientID + "/" + fileNameToSave
        def result = [success: true, imagePath: clientImage]
        render result as JSON
    }

    def download() {
        def url = params.url
        println(grailsApplication.config.imageindirect.basePath + params.url);
        def files = new File(grailsApplication.config.imageindirect.basePath + params.url) //Full path of a file
        if (files.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "attachment;filename=Picture.jpg")
            //Please filename must be add with its extension .jpg,.png,.pdf,.doc otherwise it cant detect the file
            response.outputStream << files.bytes
        } else {
            println("I am not a file")
            render(view: '/demo/attachment')
        }
    }

    //image preview
    def imagePreview() {
        render(view: '/demo/imagePreview')
    }

    //image save in outside web-app a folder
    def imgSave() {
        String clientID = Integer.toString(1050)
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
        CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("imag")
        println("hello" + file)
        def originalFilename = file.originalFilename

        println("the file name is>>>>" + originalFilename)

        long uniqueNumber = new Date().getTime()
        def fileNameToSave = uniqueNumber + "_" + originalFilename

        try {
            if (originalFilename.empty) {
                render(contentType: 'text/json') {
                    [success: true, message: 'Image Should Be Selected First', noImage: 1]
                }
            }
            attachmentService.storeImage(file, fileNameToSave, clientID)
            flash.message = "Saved Successfully"
            def clientImage = "/clientPhotos/" + clientID + "/" + fileNameToSave
            def result = [success: true, imagePath: clientImage, message: flash.message]
            render result as JSON


        } catch (Exception e) {
            flash.message = "Can not be Saved Successfully"
        }
    }
}

//Handling duplicate form submission
//http://grails.org/doc/2.2.1/guide/single.html#formtokens
//http://grails.org/doc/2.2.1/ref/Tags/form.html