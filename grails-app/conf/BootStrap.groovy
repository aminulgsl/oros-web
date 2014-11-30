import com.gsl.oros.core.banking.operation.Client
import com.gsl.oros.core.banking.settings.Bank
import com.gsl.oros.core.banking.settings.Branch
import com.gsl.uma.security.Role
import com.gsl.uma.security.User
import com.gsl.uma.security.UserRole
import grails.plugin.springsecurity.SpringSecurityUtils

class BootStrap {
    def grailsApplication
    def init = { servletContext ->
//        mkBaseImageDir()
        createUserWithRole()
        createClientList()
        bankListWithBranch()
    }



    void createUserWithRole() {
        def superAdmin = Role.findByAuthority('ROLE_SUPER_ADMIN') ?: new Role(authority: 'ROLE_SUPER_ADMIN').save(failOnError: true)
        User supAdminUser = User.findByUsername('admin')
        if (!supAdminUser) {
            supAdminUser = new User(username: 'admin', email: 'testuser@mail.com', password: 'password', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false)
            supAdminUser.save(flush: true)
            new UserRole(user: supAdminUser, role: superAdmin).save(flush: true)
        }

        //Role admin
        def roleAdmin = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        User adminUser = User.findByUsername('admin2')
        if (!adminUser) {
            adminUser = new User(username: 'admin2', email: 'testuser2@mail.com', password: 'password', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false)
            adminUser.save(flush: true)
            new UserRole(user: adminUser, role: roleAdmin).save(flush: true)
        }

    }

    def bankListWithBranch() {

        Bank orosCap = Bank.findByName("Capital")
        if (!orosCap) {
            orosCap = new Bank(name: 'Capital').save(failOnError: true)
        }
        Branch branch1 = Branch.findByBankAndName(orosCap, 'Dhanmondi')
        if (!branch1) {
            branch1 = new Branch(bank: orosCap, name: 'Dhanmondi', branchCode: 101).save(failOnError: true)
        }
        Branch branch2 = Branch.findByBankAndName(orosCap, 'Motijheel')
        if (!branch2) {
            branch2 = new Branch(bank: orosCap, name: 'Motijheel', branchCode: 102).save(failOnError: true)
        }

        Bank hsbc = Bank.findByName("HSBC")
        if (!hsbc) {
            hsbc = new Bank(name: 'HSBC').save(failOnError: true)
        }
        Branch branch3 = Branch.findByBankAndName(hsbc, 'Gulshan')
        if (!branch3) {
            branch3 = new Branch(bank: hsbc, name: 'Gulshan', branchCode: 201).save(failOnError: true)
        }
        Branch branch4 = Branch.findByBankAndName(hsbc, 'Uttora')
        if (!branch4) {
            branch4 = new Branch(bank: hsbc, name: 'Uttora', branchCode: 202).save(failOnError: true)
        }


        Bank stanCart = Bank.findByName("Standard Charted")
        if (!stanCart) {
            stanCart = new Bank(name: 'Standard Charted').save(failOnError: true)
        }

        Branch branch5 = Branch.findByBankAndName(stanCart, 'Mirpure')
        if (!branch5) {
            branch5 = new Branch(bank: stanCart, name: 'Mirpure', branchCode: 301).save(failOnError: true)
        }
        Branch branch6 = Branch.findByBankAndName(stanCart, 'Shantinagor')
        if (!branch6) {
            branch6 = new Branch(bank: stanCart, name: 'Shantinagor', branchCode: 302).save(failOnError: true)
        }

    }


    def createRequestMap() {
        if (SpringSecurityUtils.securityConfigType != 'Requestmap') {
            return
        }
        // set the below variable to true if requestMap updated
        // and also delete/truncate your database requestmap table to update take effect
        boolean isRequestMapUpdated = true;
        if (!isRequestMapUpdated) {
            return
        }
        String requestMapClassName = SpringSecurityUtils.securityConfig.requestMap.className

        //default configuration entry required for static resources
//        '/', '/index', '/index.gsp',
        def Requestmap = grailsApplication.getClassForName(requestMapClassName)
        def reqInstance
        for (url in ['/**/js/**', '/**/css/**', '/**/images/**', '/**/imageIndirect/index/**', '/**/favicon.ico',
                     '/login', '/login/**', '/logout', '/logout/**']) {
            reqInstance = Requestmap.findByUrl(url)
            if (!reqInstance) {
                Requestmap.newInstance(url: url, configAttribute: 'permitAll').save(flush: true, failOnError: true)
            }

        }
        println "Request Map code complete"
    }

    def createClientList() {
        Client imran = new Client(name: "Imaran Hosen", accountNo: "101201", address: "Mirpur", contactNo: "0167", imageUrl: "BD", signatureUrl: "imran09049@gmail.com").save(failOnError: true)
        Client rabin = new Client(name: "Md. Robin", accountNo: "101202", address: "Mohammadpur", contactNo: "0168", imageUrl: "BD", signatureUrl: "imran09049@gmail.com").save(failOnError: true)
        Client rumi = new Client(name: "Mr. Rumi", accountNo: "101203", address: "Malibagh", contactNo: "0178", imageUrl: "BD", signatureUrl: "imran09049@gmail.com").save(failOnError: true)
        Client aminul = new Client(name: "Mr. Aminul", accountNo: "101204", address: "Shantinagor", contactNo: "0179", imageUrl: "BD", signatureUrl: "imran09049@gmail.com").save(failOnError: true)
        Client zerin = new Client(name: "Zerin Nusrat", accountNo: "101205", address: "Siddeswari", contactNo: "0188", imageUrl: "BD", signatureUrl: "imran09049@gmail.com").save(failOnError: true)
        Client sania = new Client(name: "Ms Sania Rahman", accountNo: "101206", address: "Motijheel", contactNo: "0111", imageUrl: "BD", signatureUrl: "imran09049@gmail.com").save(failOnError: true)
        Client yasin = new Client(name: "Mr. Yasin Jabed", accountNo: "101207", address: "Uttora", contactNo: "0155", imageUrl: "BD", signatureUrl: "imran09049@gmail.com").save(failOnError: true)
        Client arman = new Client(name: "Mr. Arman Shakil", accountNo: "101208", address: "Kazipara", contactNo: "0191", imageUrl: "BD", signatureUrl: "imran09049@gmail.com").save(failOnError: true)
    }

    def mkBaseImageDir() {
        try {
            def basePath = grailsApplication.config.imageindirect.basePath
            // If it doesn't exist
            File file = new File(basePath.toString())
            if (!file.exists()) {
                // Create all folders up-to and including B
                file.mkdirs()
            }
            println(basePath + " created")
        } catch (Exception ex) {
            ex.printStackTrace()
        }

    }
    def destroy = {
    }
}
