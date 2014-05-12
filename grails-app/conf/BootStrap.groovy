import com.gsl.cbs.contraints.enums.AddressType

import com.gsl.oros.core.banking.operation.Client
import com.gsl.oros.core.banking.settings.Address
import com.gsl.oros.core.banking.settings.Bank
import com.gsl.oros.core.banking.settings.BankSetup
import com.gsl.oros.core.banking.settings.Branch
import com.gsl.oros.core.banking.settings.BranchSetup
import com.gsl.oros.core.banking.settings.City
import com.gsl.oros.core.banking.settings.Country
import com.gsl.oros.core.banking.settings.Currencys
import com.gsl.oros.core.banking.settings.State
import com.gsl.oros.core.banking.settings.ChartClassType
import com.gsl.oros.core.banking.settings.accounting.PaymentTerms
import com.gsl.oros.core.banking.settings.accounting.VatCategory
import com.gsl.uma.saas.ChildEvent
import com.gsl.uma.saas.Events
import com.gsl.uma.saas.Feature
import com.gsl.uma.saas.Module
import com.gsl.uma.security.Role
import com.gsl.uma.security.User
import com.gsl.uma.security.UserRole
import grails.plugin.springsecurity.SpringSecurityUtils

class BootStrap {
    def grailsApplication
    def init = { servletContext ->
//        mkBaseImageDir()
        createUserWithRole()
        createAccessMapping()
        createRequestMap()
        createCountryList()
        createCurrencyList()
        createCityAndState()
        createChartClassTypeList()
        createVatCategoryList()
        createPaymentTermsList()
        createClientList()
        bankSetupInfo()
        bankListWithBranch()

    }


    def createClientList() {
        Client imran = new Client(name: "Imaran Hosen", accountNo: "101201", address: "Mirpure", contactNo: "0167", imageUrl: "BD", signatureUrl: "BGD").save(failOnError: true)
        Client rabin = new Client(name: "Md. Robin", accountNo: "101202", address: "Mohammadpure", contactNo: "0168", imageUrl: "BD", signatureUrl: "BGD").save(failOnError: true)
        Client rumi = new Client(name: "Mr. Rumi", accountNo: "101203", address: "Malibagh", contactNo: "0178", imageUrl: "BD", signatureUrl: "BGD").save(failOnError: true)
        Client aminul = new Client(name: "Mr. Aminul", accountNo: "101204", address: "Shantinagor", contactNo: "0179", imageUrl: "BD", signatureUrl: "BGD").save(failOnError: true)
        Client jakir = new Client(name: "Mr. Jakir Hossain", accountNo: "101205", address: "Siddeswari", contactNo: "0188", imageUrl: "BD", signatureUrl: "BGD").save(failOnError: true)
        Client sania = new Client(name: "Ms Sania Rahman", accountNo: "101206", address: "Motijheel", contactNo: "0111", imageUrl: "BD", signatureUrl: "BGD").save(failOnError: true)
        Client yasin = new Client(name: "Mr. Yasin Jabed", accountNo: "101207", address: "Uttora", contactNo: "0155", imageUrl: "BD", signatureUrl: "BGD").save(failOnError: true)
        Client arman = new Client(name: "Mr. Arman Shakil", accountNo: "101208", address: "Kazipara", contactNo: "0191", imageUrl: "BD", signatureUrl: "BGD").save(failOnError: true)

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

    def createAccessMapping() {


        //1.    Core Banking part here
        Module coreBank = Module.findByName('CORE_BANKING') ?: new Module(name: 'CORE_BANKING', description: 'Core banking with reports', menuText: 'Banking', status: true).save(failOnError: true)
        Feature dashboard = Feature.findByName('DASHBOARD')
        if (!dashboard) {
            dashboard = new Feature(module: coreBank, name: 'DASHBOARD', description: 'dashboard description', fmenuText: 'Home', controllerName: 'dashboard', actionName: 'index', iconClassName: 'icon-dashboard').save(failOnError: true)
        }

        Feature settingsMgmt = Feature.findByName('SETTINGS_MGMT')
        if (!settingsMgmt) {
            settingsMgmt = new Feature(module: coreBank, name: 'SETTINGS_MGMT', description: 'Manage Different Admin settings', fmenuText: 'Settings', controllerName: 'coreBanking', actionName: 'settingMgmt', iconClassName: 'icon-dashboard').save(failOnError: true)
        }
        //  Bank Settings Show on Menu
        Events bankSetup = Events.findByName('BANK_SETTING')
        if (!bankSetup) {
            bankSetup = new Events(feature: settingsMgmt, name: 'BANK_SETTING', description: 'Bank Setting', fmenuText: 'Bank', controllerName: 'bankSetup', actionName: 'index', showOnMenu: true, isPermitToAll: false, status: true).save(failOnError: true)
        }
        //Update Bank Settings
        ChildEvent updatebankSetups = ChildEvent.findByName('UPDATE_BANK_SETTINGS')
        if (!updatebankSetups) {
            updatebankSetups = new ChildEvent(events: bankSetup, name: 'UPDATE_BANK_SETTINGS', description: 'Edit Bank Settings', fmenuText: 'Edit', controllerName: 'bankSetup', actionName: 'update', autoPermit: false).save(failOnError: true)
        }

        //Ajax ->Providing State list in Bank Settings
        ChildEvent bnkStreetList = ChildEvent.findByName('BANK_STREET_LIST')
        if (!bnkStreetList) {
            bnkStreetList = new ChildEvent(events: bankSetup, name: 'BANK_STREET_LIST', description: 'State list provide in bank setting', fmenuText: 'StreetList', controllerName: 'bankSetup', actionName: 'streetList', autoPermit: true).save(failOnError: true)
        }

        //Ajax ->Providing Postal State list in Bank Settings
        ChildEvent bnkPostStreetList = ChildEvent.findByName('BANK_POSTAL_STREET_LIST')
        if (!bnkPostStreetList) {
            bnkPostStreetList = new ChildEvent(events: bankSetup, name: 'BANK_POSTAL_STREET_LIST', description: 'Postal State list provide in bank setting', fmenuText: 'PostalStreetList', controllerName: 'bankSetup', actionName: 'postalStateList', autoPermit: true).save(failOnError: true)
        }

        //Others Bank Setup

        Events othBankSetup = Events.findByName('OTH_BANK_SETTING')
        if (!othBankSetup) {
            othBankSetup = new Events(feature: settingsMgmt, name: 'OTH_BANK_SETTING', description: 'Show Other Bank List', fmenuText: 'Other Bank', controllerName: 'othBankSetup', actionName: 'index', showOnMenu: true, isPermitToAll: false, status: true).save(failOnError: true)
        }

        //Create link to Other Bank Settings (Action :create )
        ChildEvent createOthBankSetups = ChildEvent.findByName('CREATE_OTH_BANK_SETTINGS')
        if (!createOthBankSetups) {
            createOthBankSetups = new ChildEvent(events: othBankSetup, name: 'CREATE_OTH_BANK_SETTINGS', description: 'Create Other Bank', fmenuText: 'Create', controllerName: 'othBankSetup', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        //Save Other Bank Settings Info (Action :save )
        ChildEvent saveOthBankSetups = ChildEvent.findByName('SAVE_OTH_BANK_SETTINGS')
        if (!saveOthBankSetups) {
            saveOthBankSetups = new ChildEvent(events: othBankSetup, name: 'SAVE_OTH_BANK_SETTINGS', description: 'Save Oth Bank Settings', fmenuText: 'Save', controllerName: 'othBankSetup', actionName: 'save', autoPermit: true).save(failOnError: true)
        }

        //List Other Bank Settings Info (Action :list )
        ChildEvent listOthBankSetups = ChildEvent.findByName('LIST_OTH_BANK_SETTINGS')
        if (!listOthBankSetups) {
            listOthBankSetups = new ChildEvent(events: othBankSetup, name: 'LIST_OTH_BANK_SETTINGS', description: 'List Oth Bank Settings', fmenuText: 'Save', controllerName: 'othBankSetup', actionName: 'list', autoPermit: true).save(failOnError: true)
        }

        //Update Other Bank Settings Info (Action :update )
        ChildEvent updateOthBankSetups = ChildEvent.findByName('UPDATE_OTH_BANK_SETTINGS')
        if (!updateOthBankSetups) {
            updateOthBankSetups = new ChildEvent(events: othBankSetup, name: 'UPDATE_OTH_BANK_SETTINGS', description: 'Edit Other Bank', fmenuText: 'Edit', controllerName: 'othBankSetup', actionName: 'update', autoPermit: false).save(failOnError: true)
        }

        //Delete Other Bank Settings Info  (Action :delete )
        ChildEvent deleteOthBankSetups = ChildEvent.findByName('DELETE_OTH_BANK_SETTINGS')
        if (!deleteOthBankSetups) {
            deleteOthBankSetups = new ChildEvent(events: othBankSetup, name: 'DELETE_OTH_BANK_SETTINGS', description: 'Delete Other Bank', fmenuText: 'Delete', controllerName: 'othBankSetup', actionName: 'delete', autoPermit: false).save(failOnError: true)
        }

        //Branch Setup
        //  Branch Settings Show on Menu (Action :index )
        Events branchSetup = Events.findByName('BRANCH_SETTING')
        if (!branchSetup) {
            branchSetup = new Events(feature: settingsMgmt, name: 'BRANCH_SETTING', description: 'Show Branch List', fmenuText: 'Branch', controllerName: 'branchSetup', actionName: 'index').save(failOnError: true)
        }

        //Ajax ->Providing State list in Branch Settings (Action :stateList )
        ChildEvent brnStreetList = ChildEvent.findByName('BRANCH_STREET_LIST')
        if (!brnStreetList) {
            brnStreetList = new ChildEvent(events: branchSetup, name: 'BRANCH_STREET_LIST', description: 'State list provide in Branch setting', fmenuText: 'StreetList', controllerName: 'branchSetup', actionName: 'stateList', autoPermit: true).save(failOnError: true)
        }

        //Ajax ->Providing Postal State list in Branch Settings (Action :postalStateList )
        ChildEvent brnPostStreetList = ChildEvent.findByName('BRN_POSTAL_STREET_LIST')
        if (!brnPostStreetList) {
            brnPostStreetList = new ChildEvent(events: branchSetup, name: 'BRN_POSTAL_STREET_LIST', description: 'Postal State list provide in branch setting', fmenuText: 'PostalStreetList', controllerName: 'branchSetup', actionName: 'postalStateList', autoPermit: true).save(failOnError: true)
        }

        //Create link to branch Settings (Action :create )
        ChildEvent createbranchSetups = ChildEvent.findByName('CREATE_BRANCH_SETTINGS')
        if (!createbranchSetups) {
            createbranchSetups = new ChildEvent(events: branchSetup, name: 'CREATE_BRANCH_SETTINGS', description: 'Create Branch', fmenuText: 'Create', controllerName: 'branchSetup', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        //Save branch Settings Info (Action :save )
        ChildEvent savebranchSetups = ChildEvent.findByName('SAVE_BRANCH_SETTINGS')
        if (!savebranchSetups) {
            savebranchSetups = new ChildEvent(events: branchSetup, name: 'SAVE_BRANCH_SETTINGS', description: 'Save Branch Settings', fmenuText: 'Save', controllerName: 'branchSetup', actionName: 'save', autoPermit: true).save(failOnError: true)
        }

        //List branch Settings Info (Action :list )
        ChildEvent listbranchSetups = ChildEvent.findByName('LIST_BRANCH_SETTINGS')
        if (!listbranchSetups) {
            listbranchSetups = new ChildEvent(events: branchSetup, name: 'LIST_BRANCH_SETTINGS', description: 'List Branch Settings', fmenuText: 'Save', controllerName: 'branchSetup', actionName: 'list', autoPermit: true).save(failOnError: true)
        }

        //Update branch Settings Info (Action :update )
        ChildEvent updatebranchSetups = ChildEvent.findByName('UPDATE_BRANCH_SETTINGS')
        if (!updatebranchSetups) {
            updatebranchSetups = new ChildEvent(events: branchSetup, name: 'UPDATE_BRANCH_SETTINGS', description: 'Edit Branch', fmenuText: 'Edit', controllerName: 'branchSetup', actionName: 'update', autoPermit: false).save(failOnError: true)
        }

        //Delete branch Settings Info  (Action :delete )
        ChildEvent deletebranchSetups = ChildEvent.findByName('DELETE_BRANCH_SETTINGS')
        if (!deletebranchSetups) {
            deletebranchSetups = new ChildEvent(events: branchSetup, name: 'DELETE_BRANCH_SETTINGS', description: 'Delete Branch', fmenuText: 'Delete', controllerName: 'branchSetup', actionName: 'delete', autoPermit: false).save(failOnError: true)
        }

        //Others Branch Setup

        Events othBranchSetup = Events.findByName('OTH_BRANCH_SETTING')
        if (!othBranchSetup) {
            othBranchSetup = new Events(feature: settingsMgmt, name: 'OTH_BRANCH_SETTING', description: 'Other Branch List', fmenuText: 'Other Branch', controllerName: 'othBranchSetup', actionName: 'index', showOnMenu: true, isPermitToAll: false, status: true).save(failOnError: true)
        }

        //Create link to Other Branch Settings (Action :create )
        ChildEvent createOthBranchSetups = ChildEvent.findByName('CREATE_OTH_BRANCH_SETTINGS')
        if (!createOthBranchSetups) {
            createOthBranchSetups = new ChildEvent(events: othBranchSetup, name: 'CREATE_OTH_BRANCH_SETTINGS', description: 'Create Other Branch', fmenuText: 'Create', controllerName: 'othBranchSetup', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        //Save Other Branch Settings Info (Action :save )
        ChildEvent saveOthBranchSetups = ChildEvent.findByName('SAVE_OTH_BRANCH_SETTINGS')
        if (!saveOthBranchSetups) {
            saveOthBranchSetups = new ChildEvent(events: othBranchSetup, name: 'SAVE_OTH_BRANCH_SETTINGS', description: 'Save Oth Branch Settings', fmenuText: 'Save', controllerName: 'othBranchSetup', actionName: 'save', autoPermit: true).save(failOnError: true)
        }

        //Ajax ->Providing State list in Branch Settings (Action :stateList )
        ChildEvent othBrnStreetList = ChildEvent.findByName('OTH_BRANCH_STREET_LIST')
        if (!othBrnStreetList) {
            othBrnStreetList = new ChildEvent(events: othBranchSetup, name: 'OTH_BRANCH_STREET_LIST', description: 'State list provide in Branch setting', fmenuText: 'StreetList', controllerName: 'othBranchSetup', actionName: 'stateList', autoPermit: true).save(failOnError: true)
        }

        //List Other Branch Settings Info (Action :list )
        ChildEvent listOthBranchSetups = ChildEvent.findByName('LIST_OTH_BRANCH_SETTINGS')
        if (!listOthBranchSetups) {
            listOthBranchSetups = new ChildEvent(events: othBranchSetup, name: 'LIST_OTH_BRANCH_SETTINGS', description: 'List Oth Branch Settings', fmenuText: 'Save', controllerName: 'othBranchSetup', actionName: 'list', autoPermit: true).save(failOnError: true)
        }

        //Update Other Branch Settings Info (Action :update )
        ChildEvent updateOthBranchSetups = ChildEvent.findByName('UPDATE_OTH_BRANCH_SETTINGS')
        if (!updateOthBranchSetups) {
            updateOthBranchSetups = new ChildEvent(events: othBranchSetup, name: 'UPDATE_OTH_BRANCH_SETTINGS', description: 'Edit Other Branch', fmenuText: 'Edit', controllerName: 'othBranchSetup', actionName: 'update', autoPermit: false).save(failOnError: true)
        }

        //Delete Other Branch Settings Info  (Action :delete )
        ChildEvent deleteOthBranchSetups = ChildEvent.findByName('DELETE_OTH_BRANCH_SETTINGS')
        if (!deleteOthBranchSetups) {
            deleteOthBranchSetups = new ChildEvent(events: othBranchSetup, name: 'DELETE_OTH_BRANCH_SETTINGS', description: 'Delete Other Branch', fmenuText: 'Delete', controllerName: 'othBranchSetup', actionName: 'delete', autoPermit: false).save(failOnError: true)
        }

//        End Other Branch Setup Info

        //  Retailer Settings Show on Menu  (Action : index)
        Events retailerSetup = Events.findByName('RETAILER_SETTING')
        if (!retailerSetup) {
            retailerSetup = new Events(feature: settingsMgmt, name: 'RETAILER_SETTING', description: 'Show Retailer List', fmenuText: 'Retailer', controllerName: 'retailerSetup', actionName: 'index').save(failOnError: true)
        }

        //  Create link Retailer Settings (Action : create)
        ChildEvent createRetailerSetups = ChildEvent.findByName('CREATE_RETAILER_SETTINGS')
        if (!createRetailerSetups) {
            createRetailerSetups = new ChildEvent(events: retailerSetup, name: 'CREATE_RETAILER_SETTINGS', description: 'Create Retailer', fmenuText: 'Create', controllerName: 'retailerSetup', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        //Ajax ->Providing State list in Retailer Settings (Action : streetList)
        ChildEvent retStreetList = ChildEvent.findByName('RET_STREET_LIST')
        if (!retStreetList) {
            retStreetList = new ChildEvent(events: retailerSetup, name: 'RET_STREET_LIST', description: 'State list provide in retailer setting', fmenuText: 'StreetList', controllerName: 'retailerSetup', actionName: 'streetList', autoPermit: true).save(failOnError: true)
        }

        //  Save Retailer Settings  (Action : save)
        ChildEvent saveRetailerSetups = ChildEvent.findByName('SAVE_RETAILER_SETTINGS')
        if (!saveRetailerSetups) {
            saveRetailerSetups = new ChildEvent(events: retailerSetup, name: 'SAVE_RETAILER_SETTINGS', description: 'Save Retailer Settings', fmenuText: 'Save', controllerName: 'retailerSetup', actionName: 'save', autoPermit: true).save(failOnError: true)
        }

        //  List Retailer Settings  (Action : list)
        ChildEvent listRetailerSetups = ChildEvent.findByName('LIST_RETAILER_SETTINGS')
        if (!listRetailerSetups) {
            listRetailerSetups = new ChildEvent(events: retailerSetup, name: 'LIST_RETAILER_SETTINGS', description: 'List Retailer Settings', fmenuText: 'List', controllerName: 'retailerSetup', actionName: 'list', autoPermit: true).save(failOnError: true)
        }

        //  Update Retailer Settings  (Action : update)
        ChildEvent updateRetailerSetups = ChildEvent.findByName('UPDATE_RETAILER_SETTINGS')
        if (!updateRetailerSetups) {
            updateRetailerSetups = new ChildEvent(events: retailerSetup, name: 'UPDATE_RETAILER_SETTINGS', description: 'Edit Retailer', fmenuText: 'Edit', controllerName: 'retailerSetup', actionName: 'update', autoPermit: false).save(failOnError: true)
        }

        //  Update Retailer Settings  (Action : update)
        ChildEvent deleteRetailerSetups = ChildEvent.findByName('DELETE_RETAILER_SETTINGS')
        if (!deleteRetailerSetups) {
            deleteRetailerSetups = new ChildEvent(events: retailerSetup, name: 'DELETE_RETAILER_SETTINGS', description: 'Delete Retailer', fmenuText: 'delete', controllerName: 'retailerSetup', actionName: 'delete', autoPermit: false).save(failOnError: true)
        }


        //  Create Country Event show on Menu (Action : index)
        Events createCountry = Events.findByName('CREATE_COUNTRY')
        if (!createCountry) {
            createCountry = new Events(feature: settingsMgmt, name: 'CREATE_COUNTRY', description: 'Show Country List', fmenuText: 'Country', controllerName: 'country', actionName: 'index',).save(failOnError: true)
        }

        // Link to Add Country (Action : create)
        ChildEvent addCountry = ChildEvent.findByName('Add_COUNTRY')
        if (!addCountry) {
            addCountry = new ChildEvent(events: createCountry, name: 'Add_COUNTRY', description: 'Create Country', fmenuText: 'Create', controllerName: 'country', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        //  Save Country  (Action : save)
        ChildEvent createCountrySubmit = ChildEvent.findByName('SAVE_CREATE_COUNTRY')
        if (!createCountrySubmit) {
            createCountrySubmit = new ChildEvent(events: createCountry, name: 'SAVE_CREATE_COUNTRY', description: 'Country Save', fmenuText: 'Save', controllerName: 'country', actionName: 'save', autoPermit: true).save(failOnError: true)
        }

        // Udpate country (Action : update)
        ChildEvent updateCountrySubmit = ChildEvent.findByName('UPDATE_COUNTRY')
        if (!updateCountrySubmit) {
            updateCountrySubmit = new ChildEvent(events: createCountry, name: 'UPDATE_COUNTRY', description: 'Edit Country', fmenuText: 'Edit', controllerName: 'country', actionName: 'update', autoPermit: false).save(failOnError: true)
        }

        // Delete country (Action : delete)
        ChildEvent deleteCountrySubmit = ChildEvent.findByName('DELETE_COUNTRY')
        if (!deleteCountrySubmit) {
            deleteCountrySubmit = new ChildEvent(events: createCountry, name: 'DELETE_COUNTRY', description: 'Delete country', fmenuText: 'Delete', controllerName: 'country', actionName: 'delete', autoPermit: false).save(failOnError: true)
        }

        //List of Country (Action : list)
        ChildEvent showListOfCountry = ChildEvent.findByName('SHOW_LIST_COUNTRY')
        if (!showListOfCountry) {
            showListOfCountry = new ChildEvent(events: createCountry, name: 'SHOW_LIST_COUNTRY', description: 'Show list of Country', fmenuText: 'Show', controllerName: 'country', actionName: 'list', autoPermit: true).save(failOnError: true)
        }

        // Create Currency Event Show on Menu (Action : index )
        Events createCurrency = Events.findByName('SHOW_CREATE_CURRENCY')
        if (!createCurrency) {
            createCurrency = new Events(feature: settingsMgmt, name: 'SHOW_CREATE_CURRENCY', description: 'Show Currency List', fmenuText: 'Currencies', controllerName: 'currency', actionName: 'index').save(failOnError: true)
        }

        // Link To Add Currency  (Action : create )
        ChildEvent createCurrencyLink = ChildEvent.findByName('CREATE_CURRENCY')
        if (!createCurrencyLink) {
            createCurrencyLink = new ChildEvent(events: createCurrency, name: 'CREATE_CURRENCY', description: 'Create Currency', fmenuText: 'Create', controllerName: 'currency', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        //  Save Currencys  (Action : save )
        ChildEvent createCurrencySubmit = ChildEvent.findByName('SAVE_CREATE_CURRENCY')
        if (!createCurrencySubmit) {
            createCurrencySubmit = new ChildEvent(events: createCurrency, name: 'SAVE_CREATE_CURRENCY', description: 'Currencys Save', fmenuText: 'Save', controllerName: 'currency', actionName: 'save', autoPermit: true).save(failOnError: true)
        }
        //  Currency List (Action : list )
        ChildEvent showCurrencyList = ChildEvent.findByName('SHOW_CURRENCY_LIST')
        if (!showCurrencyList) {
            /*showListOfCountry = new ChildEvent(events: createCountry, name: 'SHOW_LIST_COUNTRY', description: 'Show list of Country', fmenuText: 'Show', controllerName: 'country', actionName: 'list', autoPermit: true).save(failOnError: true)*/
            showCurrencyList = new ChildEvent(events: createCurrency, name: 'SHOW_CURRENCY_LIST', description: 'Currencys List', fmenuText: 'list', controllerName: 'currency', actionName: 'list', autoPermit: true).save(failOnError: true)
        }
        // update currency  (Action : update )
        ChildEvent updateCurrencySubmit = ChildEvent.findByName('UPDATE_CURRENCY')
        if (!updateCurrencySubmit) {
            updateCurrencySubmit = new ChildEvent(events: createCurrency, name: 'UPDATE_CURRENCY', description: 'Edit Currency', fmenuText: 'Edit', controllerName: 'currency', actionName: 'update', autoPermit: false).save(failOnError: true)
        }
        // Delete Currencys (Action : delete )
        ChildEvent deleteCurrencySubmit = ChildEvent.findByName('DELETE_CURRENCY')
        if (!deleteCurrencySubmit) {
            deleteCurrencySubmit = new ChildEvent(events: createCurrency, name: 'DELETE_CURRENCY', description: 'Delete currency', fmenuText: 'Delete', controllerName: 'currency', actionName: 'delete', autoPermit: false).save(failOnError: true)
        }

        //  Create Exchange Rate Show on Menu (Action : index )
        Events createExchangeRate = Events.findByName('EXCHANGE_RATE')
        if (!createExchangeRate) {
            createExchangeRate = new Events(feature: settingsMgmt, name: 'EXCHANGE_RATE', description: 'Show Exchange Rate List', fmenuText: 'Exchange Rate', controllerName: 'exchangeRate', actionName: 'index').save(failOnError: true)
        }

        //  Link To Create Exchange Rate  (Action : create )
        ChildEvent creatExchRate = ChildEvent.findByName('CREATE_EXCHANGE_RATE')
        if (!creatExchRate) {
            creatExchRate = new ChildEvent(events: createExchangeRate, name: 'CREATE_EXCHANGE_RATE', description: 'Create Exchange Rate', fmenuText: 'Create', controllerName: 'exchangeRate', actionName: 'create', autoPermit: false).save(failOnError: true)
        }
        //  Save Exchange Rate (Action : save )
        ChildEvent createExchangeRateSubmit = ChildEvent.findByName('SAVE_EXCHANGE_RATE')
        if (!createExchangeRateSubmit) {
            createExchangeRateSubmit = new ChildEvent(events: createExchangeRate, name: 'SAVE_EXCHANGE_RATE', description: 'Save Exchange Rate', fmenuText: 'Save', controllerName: 'exchangeRate', actionName: 'save', autoPermit: true).save(failOnError: true)
        }
        //  Exchange Rate List (Action : list )
        ChildEvent showExchangeRateList = ChildEvent.findByName('SHOW_EXCHANGE_RATE_LIST')
        if (!showExchangeRateList) {
            showExchangeRateList = new ChildEvent(events: createExchangeRate, name: 'SHOW_EXCHANGE_RATE_LIST', description: 'Exchange Rate List', fmenuText: 'list', controllerName: 'exchangeRate', actionName: 'list', autoPermit: true).save(failOnError: true)
        }
        // update exchangeRate  (Action : update )
        ChildEvent updateExchangeRate = ChildEvent.findByName('UPDATE_EXCHANGERATE')
        if (!updateExchangeRate) {
            updateExchangeRate = new ChildEvent(events: createExchangeRate, name: 'UPDATE_EXCHANGERATE', description: 'Edit Exchange Rate', fmenuText: 'Edit', controllerName: 'exchangeRate', actionName: 'update', autoPermit: false).save(failOnError: true)
        }
        // Delete Rate  (Action : delete )
        ChildEvent deleteExchangeRateSubmit = ChildEvent.findByName('DELETE_EXCHANGERATE')
        if (!deleteExchangeRateSubmit) {
            deleteExchangeRateSubmit = new ChildEvent(events: createExchangeRate, name: 'DELETE_EXCHANGERATE', description: 'Delete Exchange Rate', fmenuText: 'Delete', controllerName: 'exchangeRate', actionName: 'delete', autoPermit: false).save(failOnError: true)
        }

//        vat Category
        // Create Vat Category Year Show on Menu
        Events vatCategory = Events.findByName('VAT_CATEGORY')
        if (!vatCategory) {
            vatCategory = new Events(feature: settingsMgmt, name: 'VAT_CATEGORY', description: 'Create vat category', fmenuText: 'Create vat Category', controllerName: 'vatCategory', actionName: 'index').save(failOnError: true)
        }

        // Create Vat Category
        ChildEvent vatCategoryCreate = ChildEvent.findByName('CREATE_VAT_CATEGORY')
        if (!vatCategoryCreate) {
            vatCategoryCreate = new ChildEvent(events: vatCategory, name: 'CREATE_VAT_CATEGORY', description: 'Create vat Category', fmenuText: 'Create', controllerName: 'vatCategory', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        // Save Vat Category
        ChildEvent saveVatCategory = ChildEvent.findByName('SAVE_VAT_CATEGORY')
        if (!saveVatCategory) {
            saveVatCategory = new ChildEvent(events: vatCategory, name: 'SAVE_VAT_CATEGORY', description: 'Save vat Category', fmenuText: 'Save', controllerName: 'vatCategory', actionName: 'save', autoPermit: true).save(failOnError: true)
        }

        //  Vat Category List
        ChildEvent showVatCategory = ChildEvent.findByName('SHOW_VAT_CATEGORY_LIST')
        if (!showVatCategory) {
            showVatCategory = new ChildEvent(events: vatCategory, name: 'SHOW_VAT_CATEGORY_LIST', description: 'vat Category List', fmenuText: 'list', controllerName: 'vatCategory', actionName: 'list',autoPermit: true).save(failOnError: true)
        }

        // Delete Vat Category
        ChildEvent deleteVatCategory = ChildEvent.findByName('DELETE_VAT_CATEGORY')
        if (!deleteVatCategory) {
            deleteVatCategory = new ChildEvent(events: vatCategory, name: 'DELETE_VAT_CATEGORY', description: 'Delete vat Category event', fmenuText: 'Delete', controllerName: 'vatCategory', actionName: 'delete', autoPermit: false).save(failOnError: true)
        }

        // update Vat Category
        ChildEvent updateVatCategory = ChildEvent.findByName('UPDATE_FISCALYEAR')
        if (!updateVatCategory) {
            updateVatCategory = new ChildEvent(events: vatCategory, name: 'UPDATE_VAT_CATEGORY', description: 'Update vat Category', fmenuText: 'Update', controllerName: 'vatCategory', actionName: 'update', autoPermit: false).save(failOnError: true)
        }

        /* problem */
        // Core banking operation ie deposit, withdraw,transfer, etc..
        Feature bankMgmt = Feature.findByName('BANK_MGMT')
        if (!bankMgmt) {
            bankMgmt = new Feature(module: coreBank, name: 'BANK_MGMT', description: 'Manage banking operation ie Deposit, Withdraw, Trasfer', fmenuText: 'Banking Operation', controllerName: 'coreBanking', actionName: 'bankMgmt', showOnMenu: true, status: true, iconClassName: 'icon-dashboard').save(failOnError: true)
        }

        // deposit
        Events createBankDeposit = Events.findByName('BANK_DEPOSIT')
        if (!createBankDeposit) {
            createBankDeposit = new Events(feature: bankMgmt, name: 'BANK_DEPOSIT', description: 'Create Bank Deposit', fmenuText: 'Deposit', controllerName: 'bankDeposit', actionName: 'index').save(failOnError: true)
        }

        // check (deposit) validateCheque
        ChildEvent checkDeposit = ChildEvent.findByName('SHOW_CHEQUE_INFO')
            if (!checkDeposit) {
            checkDeposit = new ChildEvent(events: createBankDeposit, name: 'SHOW_CHEQUE_INFO', description: 'Show cheque information for deposit by cheque', fmenuText: 'Show cheque information', controllerName: 'bankDeposit', actionName: 'showChequeInfo', autoPermit: true).save(failOnError: true)
        }

        ChildEvent chequeValidate = ChildEvent.findByName('CHEQUE_VALIDATE')
        if (!chequeValidate) {
            chequeValidate = new ChildEvent(events: createBankDeposit, name: 'CHEQUE_VALIDATE', description: 'Cheque validate', fmenuText: 'Valid Cheque', controllerName: 'bankDeposit', actionName: 'validateCheque', autoPermit: true).save(failOnError: true)
        }

        // save (deposit)
        ChildEvent saveDeposit = ChildEvent.findByName('SAVE_DEPOSIT')
        if (!saveDeposit) {
            saveDeposit = new ChildEvent(events: createBankDeposit, name: 'SAVE_DEPOSIT', description: 'Save account holder deposit', fmenuText: 'Deposit', controllerName: 'bankDeposit', actionName: 'deposit', autoPermit: false).save(failOnError: true)
        }

        // bank transfer(deposit)
        ChildEvent banktransferDeposit = ChildEvent.findByName('BankTransfer_DEPOSIT')
        if (!banktransferDeposit) {
            banktransferDeposit = new ChildEvent(events: createBankDeposit, name: 'BankTransfer_DEPOSIT', description: 'Create Bank Transfer Deposit', fmenuText: 'Bank Transfer Deposit', controllerName: 'bankDeposit', actionName: 'bankTransfer', autoPermit: true).save(failOnError: true)
        }

        // creditcard(deposit)

        ChildEvent creditCard = ChildEvent.findByName('CreditCard_DEPOSIT')
        if (!creditCard) {
            creditCard = new ChildEvent(events: createBankDeposit, name: 'CreditCard_DEPOSIT', description: 'Create Credit Card Deposit', fmenuText: 'Credit Card Deposit', controllerName: 'bankDeposit', actionName: 'creditCard', autoPermit: true).save(failOnError: true)
        }

        // Account Open
        /*  Events accountOpenEvent = Events.findByName('ACCOUNT_OPEN')
          if (!accountOpenEvent) {
              accountOpenEvent = new Events(feature: bankMgmt, name: 'ACCOUNT_OPEN', description: 'Create Account Open', fmenuText: 'Account Open', controllerName: 'accountOpen', actionName: 'index').save(failOnError: true)
          }*/

        Events createAccountEvent = Events.findByName('CREATE_ACCOUNT')
        if (!createAccountEvent) {
            createAccountEvent = new Events(feature: bankMgmt, name: 'CREATE_ACCOUNT', description: 'Create Account', fmenuText: 'Create Account', controllerName: 'accountOpen', actionName: 'createAccount').save(failOnError: true)
        }

        /*save account..add by rabin*/
        ChildEvent accountSave = ChildEvent.findByName('ACC_SAVE')
        if (!accountSave) {
            accountSave = new ChildEvent(events: createAccountEvent, name: 'ACC_SAVE', description: 'Account Save', fmenuText: 'Account Save', controllerName: 'accountOpen', actionName: 'saveAccount').save(failOnError: true)
        }

        //signature upload(account open)
        ChildEvent signatureUpload = ChildEvent.findByName('SIGNATURE_UPLOAD')
        if (!signatureUpload) {
            signatureUpload = new ChildEvent(events: createAccountEvent, name: 'SIGNATURE_UPLOAD', description: 'Signature Upload', fmenuText: 'Signature Upload', controllerName: 'accountOpen', actionName: 'save', autoPermit: true).save(failOnError: true)
        }

        //accountantInfo validation
        ChildEvent acInfoValidation = ChildEvent.findByName('AccountInfo_Validation')
        if (!acInfoValidation) {
            acInfoValidation = new ChildEvent(events: createAccountEvent, name: 'AccountInfo_Validation', description: 'AccountInfo Validation', fmenuText: 'AccountInfo Validation', controllerName: 'accountOpen', actionName: 'accOpenBasicInfoSave', autoPermit: true).save(failOnError: true)
            /*showOnMenu: false, isPermitToAll: true, status: true*/
        }

        //introducerInfo validation
        ChildEvent introducerInfoValidation = ChildEvent.findByName('INTRODUCERINFO_VALIDATION')
        if (!introducerInfoValidation) {
            introducerInfoValidation = new ChildEvent(events: createAccountEvent, name: 'INTRODUCERINFO_VALIDATION', description: 'IntroducerInfo Validation', fmenuText: 'IntroducerInfo Validation', controllerName: 'accountOpen', actionName: 'introducerInfoSave', autoPermit: true).save(failOnError: true)
        }

        //otherBankInfo validation
        ChildEvent otherBankInfoValidation = ChildEvent.findByName('OTHERBANKINFO_VALIDATION')
        if (!otherBankInfoValidation) {
            otherBankInfoValidation = new ChildEvent(events: createAccountEvent, name: 'OTHERBANKINFO_VALIDATION', description: 'OtherBankInfo Validation', fmenuText: 'OtherBankInfo Validation', controllerName: 'accountOpen', actionName: 'otherBankAccInfoSave', autoPermit: true).save(failOnError: true)
        }

        ChildEvent showClientInfo = ChildEvent.findByName('SHOW_CLIENT_INFO')
        if (!showClientInfo) {
            showClientInfo = new ChildEvent(events: createAccountEvent, name: 'SHOW_CLIENT_INFO', description: 'Show client information for create a account', fmenuText: 'Show Client Info', controllerName: 'accountOpen', actionName: 'showClientInfo', autoPermit: true).save(failOnError: true)
        }
        /* end problem */

        // Accounting
        Feature accountingMgmt = Feature.findByName('ACCOUNTING_MGMT')
        if (!accountingMgmt) {
            accountingMgmt = new Feature(module: coreBank, name: 'ACCOUNTING_MGMT', description: 'Manage accounting', fmenuText: 'Accounting', controllerName: 'coreBanking', actionName: 'accountMgmt', showOnMenu: true, status: true, iconClassName: 'icon-dashboard').save(failOnError: true)
        }


        // Chart
        Events createChartClass = Events.findByName('CHART_CLASS_LIST_SHOW')
        if (!createChartClass) {
            createChartClass = new Events(feature: accountingMgmt, name: 'CHART_CLASS_LIST_SHOW', description: 'Show Chart Class in List', fmenuText: 'Chart Class', controllerName: 'chartClass', actionName: 'index').save(failOnError: true)
        }
        // chart class create
        ChildEvent addChartClass = ChildEvent.findByName('CREATE_CHART_CLASS')
        if (!addChartClass) {
            addChartClass = new ChildEvent(events: createChartClass, name: 'CREATE_CHART_CLASS', description: 'Create Chart Class', fmenuText: 'Create', controllerName: 'chartClass', actionName: 'create').save(failOnError: true)
        }
        // chart class save
        ChildEvent createChartClassSubmit = ChildEvent.findByName('SAVE_CREATE_CHART_CLASS')
        if (!createChartClassSubmit) {
            createChartClassSubmit = new ChildEvent(events: createChartClass, name: 'SAVE_CREATE_CHART_CLASS', description: 'Save Chart Class', fmenuText: 'Save', controllerName: 'chartClass', actionName: 'save', autoPermit: true).save(failOnError: true)
        }
        // chart class edit*
        ChildEvent createChartClassEditWithParams = ChildEvent.findByName('EDIT_CHART_CLASS_WITH_PARAMS')
        if (!createChartClassEditWithParams) {
            createChartClassEditWithParams = new ChildEvent(events: createChartClass, name: 'EDIT_CHART_CLASS_WITH_PARAMS', description: 'Edit Chart Class', fmenuText: 'Edit', controllerName: 'chartClass', actionName: 'edit/**').save(failOnError: true)
        }
        // chart class list
        ChildEvent createChartClassList = ChildEvent.findByName('CHART_CLASS_LIST')
        if (!createChartClassList) {
            createChartClassList = new ChildEvent(events: createChartClass, name: 'CHART_CLASS_LIST', description: 'List Chart Class', fmenuText: 'List', controllerName: 'chartClass', actionName: 'list', autoPermit: true).save(failOnError: true)
        }
        // chart class delete
        ChildEvent createChartClassDelete = ChildEvent.findByName('CHART_CLASS_DELETE')
        if (!createChartClassDelete) {
            createChartClassDelete = new ChildEvent(events: createChartClass, name: 'CHART_CLASS_DELETE', description: 'Delete Chart Class', fmenuText: 'Delete', controllerName: 'chartClass', actionName: 'delete').save(failOnError: true)
        }


        // chart group create
        Events createChartGroup = Events.findByName('SHOW_CHART_GROUP')
        if (!createChartGroup) {
            createChartGroup = new Events(feature: accountingMgmt, name: 'SHOW_CHART_GROUP', description: 'Show Chart Group', fmenuText: 'Chart Group', controllerName: 'chartGroup', actionName: 'index').save(failOnError: true)
        }

        // chart group list
        ChildEvent createChartGroupList = ChildEvent.findByName('CHART_GROUP_LIST')
        if (!createChartGroupList) {
            createChartGroupList = new ChildEvent(events: createChartGroup, name: 'CHART_GROUP_LIST', description: 'List Chart Group', fmenuText: 'List', controllerName: 'chartGroup', actionName: 'list', autoPermit: true).save(failOnError: true)
        }
        // chart group add
        ChildEvent addChartGroup = ChildEvent.findByName('ADD_CHART_GROUP')
        if (!addChartGroup) {
            addChartGroup = new ChildEvent(events: createChartGroup, name: 'ADD_CHART_GROUP', description: 'Add Chart Group', fmenuText: 'create', controllerName: 'chartGroup', actionName: 'create').save(failOnError: true)
        }

        // chart group save
        ChildEvent createChartGroupSubmit = ChildEvent.findByName('SAVE_CREATE_CHART_GROUP')
        if (!createChartGroupSubmit) {
            createChartGroupSubmit = new ChildEvent(events: createChartGroup, name: 'SAVE_CREATE_CHART_GROUP', description: 'Save Chart Group', fmenuText: 'Save', controllerName: 'chartGroup', actionName: 'save', autoPermit: true).save(failOnError: true)
        }
        // chart group edit
        ChildEvent createChartGroupEdit = ChildEvent.findByName('EDIT_CHART_GROUP')
        if (!createChartGroupEdit) {
            createChartGroupEdit = new ChildEvent(events: createChartGroup, name: 'EDIT_CHART_GROUP', description: 'Edit Chart Group', fmenuText: 'Edit', controllerName: 'chartGroup', actionName: 'edit/**').save(failOnError: true)
        }
        // chart group delete
        ChildEvent createChartGroupDelete = ChildEvent.findByName('DELETE_CHART_GROUP')
        if (!createChartGroupDelete) {
            createChartGroupDelete = new ChildEvent(events: createChartGroup, name: 'DELETE_CHART_GROUP', description: 'Delete Chart Group', fmenuText: 'Delete', controllerName: 'chartGroup', actionName: 'delete').save(failOnError: true)
        }
        /* char master */
        // .:: chart treeView ::.
        Events chartTreeView = Events.findByName('CHART_TREE_VIEW')
        if (!chartTreeView) {
            chartTreeView = new Events(feature: accountingMgmt, name: 'CHART_TREE_VIEW', description: 'Show Chart Tree View', fmenuText: 'Chart Tree View', controllerName: 'chartMaster', actionName: 'treeView').save(failOnError: true)
        }
        // chart group create with param (FK)
        ChildEvent createChartGroupWithParam = ChildEvent.findByName('CREATE_CHART_GROUP_WITH_PARAM')
        if (!createChartGroupWithParam) {
            createChartGroupWithParam = new ChildEvent(events: chartTreeView, name: 'CREATE_CHART_GROUP_WITH_PARAM', description: 'Add Sub Chart Group', fmenuText: 'Add', controllerName: 'chartGroup', actionName: 'subGroupCreate/**').save(failOnError: true)
        }

        // chart master create
        ChildEvent createChartMasterWithParam = ChildEvent.findByName('CREATE_CHART_MASTER_WITH_PARAM')
        if (!createChartMasterWithParam) {
            createChartMasterWithParam = new ChildEvent(events: chartTreeView, name: 'CREATE_CHART_MASTER_WITH_PARAM', description: 'Create Chart Master', fmenuText: 'Create', controllerName: 'chartMaster', actionName: 'create/**').save(failOnError: true)
        }
        // chart master save
        ChildEvent createChartMasterSubmit = ChildEvent.findByName('SAVE_CREATE_CHART_MASTER')
        if (!createChartMasterSubmit) {
            createChartMasterSubmit = new ChildEvent(events: chartTreeView, name: 'SAVE_CREATE_CHART_MASTER', description: 'Save Chart Master', fmenuText: 'Save', controllerName: 'chartMaster', actionName: 'save', autoPermit: true).save(failOnError: true)
        }
        // chart master edit/**
        ChildEvent createChartMasterEditWithParams = ChildEvent.findByName('EDIT_CHART_MASTER_WITH_PARAMS')
        if (!createChartMasterEditWithParams) {
            createChartMasterEditWithParams = new ChildEvent(events: chartTreeView, name: 'EDIT_CHART_MASTER_WITH_PARAMS', description: 'Edit Chart Master', fmenuText: 'Edit', controllerName: 'chartMaster', actionName: 'edit/**').save(failOnError: true)
        }
        // chart master view/**
        ChildEvent createChartMasterView = ChildEvent.findByName('VIEW_CHART_MASTER_WITH_PARAMS')
        if (!createChartMasterView) {
            createChartMasterView = new ChildEvent(events: chartTreeView, name: 'VIEW_CHART_MASTER_WITH_PARAMS', description: 'View Chart Master', fmenuText: 'View', controllerName: 'chartMaster', actionName: 'view/**', autoPermit: true).save(failOnError: true)
        }

        //vendor
        // Create list of Vendor
        Events listOfVendor = Events.findByName('LIST_VENDOR')
        if (!listOfVendor) {
            listOfVendor = new Events(feature: accountingMgmt, name: 'LIST_VENDOR', description: 'Show vendor list with search and sort', fmenuText: 'Vendor', controllerName: 'vendor', actionName: 'index').save(failOnError: true)
        }
        // Save Basic Info of Vendor
        ChildEvent createNewVendor = ChildEvent.findByName('CREATE_NEW_VENDOR')
        if (!createNewVendor) {
            createNewVendor = new ChildEvent(events: listOfVendor, name: 'CREATE_NEW_VENDOR', description: 'Create New Vendor', fmenuText: 'Add', controllerName: 'vendor', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        // Save Basic Info of Vendor
        ChildEvent saveVendorBasicInfo = ChildEvent.findByName('SAVE_VENDOR_BASIC')
        if (!saveVendorBasicInfo) {
            saveVendorBasicInfo = new ChildEvent(events: listOfVendor, name: 'SAVE_VENDOR_BASIC', description: 'Save Basic Info', fmenuText: 'Save Basic Info', controllerName: 'vendor', actionName: 'saveVendorBasic', autoPermit: true).save(failOnError: true)
        }

        //Ajax ->Providing State list in Branch Settings
        ChildEvent vendorStateList = ChildEvent.findByName('VENDOR_STATE_LIST')
        if (!vendorStateList) {
            vendorStateList = new ChildEvent(events: listOfVendor, name: 'VENDOR_STATE_LIST', description: 'State list provide in vendor account open', fmenuText: 'StateList', controllerName: 'vendor', actionName: 'stateList', autoPermit: true).save(failOnError: true)
        }

        // Save General Address of Vendor
        ChildEvent saveVendorGeneralAddress = ChildEvent.findByName('SAVE_VENDOR_GENERAL_ADDRESS')
        if (!saveVendorGeneralAddress) {
            saveVendorGeneralAddress = new ChildEvent(events: listOfVendor, name: 'SAVE_VENDOR_GENERAL_ADDRESS', description: 'Save Vendor General Address', fmenuText: 'Save Vendor General Address', controllerName: 'vendor', actionName: 'saveVendorGeneralAddress', autoPermit: true).save(failOnError: true)
        }

        // Save Postal Address of Vendor
        ChildEvent saveVendorPostalAddress = ChildEvent.findByName('SAVE_VENDOR_POSTAL_ADDRESS')
        if (!saveVendorPostalAddress) {
            saveVendorPostalAddress = new ChildEvent(events: listOfVendor, name: 'SAVE_VENDOR_POSTAL_ADDRESS', description: 'Save Vendor Postal Address', fmenuText: 'Save Vendor Postal Address', controllerName: 'vendor', actionName: 'saveVendorPostalAddress', autoPermit: true).save(failOnError: true)
        }

        // Save Bank Account Info of Vendor
        ChildEvent saveBankAccountInfo = ChildEvent.findByName('SAVE_BANK_ACCOUNT_INFO')
        if (!saveBankAccountInfo) {
            saveBankAccountInfo = new ChildEvent(events: listOfVendor, name: 'SAVE_BANK_ACCOUNT_INFO', description: 'Save Bank Account Info', fmenuText: 'Save Vendor Bank Account Info', controllerName: 'vendor', actionName: 'saveVendorBankAccountInfo', autoPermit: true).save(failOnError: true)
        }

        // Display Vendor List
        ChildEvent vendorList = ChildEvent.findByName('VENDOR_LIST')
        if (!vendorList) {
            vendorList = new ChildEvent(events: listOfVendor, name: 'VENDOR_LIST', description: 'Display Vendor list', fmenuText: 'Display Vendor list', controllerName: 'vendor', actionName: 'list', autoPermit: true).save(failOnError: true)
        }

        // Update vendor from vendor list
        ChildEvent editVendor = ChildEvent.findByName('EDIT_VENDOR')
        if (!editVendor) {
            editVendor = new ChildEvent(events: listOfVendor, name: 'EDIT_VENDOR', description: 'Edit Vendor', fmenuText: 'Edit', controllerName: 'vendor', actionName: 'update', autoPermit: false).save(failOnError: true)
        }

        // Delete vendor from vendor list
        ChildEvent deleteVendor = ChildEvent.findByName('DELETE_VENDOR')
        if (!deleteVendor) {
            deleteVendor = new ChildEvent(events: listOfVendor, name: 'DELETE_VENDOR', description: 'Delete Vendor', fmenuText: 'Delete', controllerName: 'vendor', actionName: 'deleteVendor', autoPermit: false).save(failOnError: true)
        }

        // Edit vendor bank account
        ChildEvent editBankAccount = ChildEvent.findByName('EDIT_VENDOR_BANK_ACCOUNT')
        if (!editBankAccount) {
            editBankAccount = new ChildEvent(events: listOfVendor, name: 'EDIT_VENDOR_BANK_ACCOUNT', description: 'Edit Vendor Bank Account', fmenuText: 'Edit Vendor Bank Account', controllerName: 'vendor', actionName: 'editBankAccount', autoPermit: true).save(failOnError: true)
        }

        // Edit vendor bank account
        ChildEvent vendorBankAccountList = ChildEvent.findByName('VENDOR_BANK_ACCOUNT_LIST')
        if (!vendorBankAccountList) {
            vendorBankAccountList = new ChildEvent(events: listOfVendor, name: 'VENDOR_BANK_ACCOUNT_LIST', description: 'Vendor Bank Account List', fmenuText: 'Vendor Bank Account List', controllerName: 'vendor', actionName: 'vendorBankAccountList', autoPermit: true).save(failOnError: true)
        }

        // DELETE bank account
        ChildEvent deleteBankAccount = ChildEvent.findByName('DELETE_BANK_ACCOUNT')
        if (!deleteBankAccount) {
            deleteBankAccount = new ChildEvent(events: listOfVendor, name: 'DELETE_BANK_ACCOUNT', description: 'Delete Bank Account ', fmenuText: 'Delete Bank Account ', controllerName: 'vendor', actionName: 'deleteBankAccount', autoPermit: true).save(failOnError: true)
        }
        /*Fiscal */
        // Create Fiscal Year Show on Menu
        Events createFiscalYear = Events.findByName('FISCAL_YEAR')
        if (!createFiscalYear) {
            createFiscalYear = new Events(feature: accountingMgmt, name: 'FISCAL_YEAR', description: 'Create Fiscal Year', fmenuText: 'Create Fiscal Year', controllerName: 'fiscalYear', actionName: 'index').save(failOnError: true)
        }

        // Save Fiscal Year
        ChildEvent fiscalYearCreate = ChildEvent.findByName('CREATE_FISCAL_YEAR')
        if (!fiscalYearCreate) {
            fiscalYearCreate = new ChildEvent(events: createFiscalYear, name: 'CREATE_FISCAL_YEAR', description: 'Create Fiscal Year', fmenuText: 'Create', controllerName: 'fiscalYear', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        // Save Fiscal Year
        ChildEvent saveFiscalYear = ChildEvent.findByName('SAVE_FISCAL_YEAR')
        if (!saveFiscalYear) {
            saveFiscalYear = new ChildEvent(events: createFiscalYear, name: 'SAVE_FISCAL_YEAR', description: 'Save Fiscal Year', fmenuText: 'Save', controllerName: 'fiscalYear', actionName: 'save', autoPermit: true).save(failOnError: true)
        }

        //  FiscalYear List
        ChildEvent showFiscalYearList = ChildEvent.findByName('SHOW_FISCALYEAR_LIST')
        if (!showFiscalYearList) {
            showFiscalYearList = new ChildEvent(events: createFiscalYear, name: 'SHOW_FISCALYEAR_LIST', description: 'Fiscal Year List', fmenuText: 'list', controllerName: 'fiscalYear', actionName: 'list',autoPermit: true).save(failOnError: true)
        }

        // Delete Fiscal Year
        ChildEvent deleteFiscalYearSubmit = ChildEvent.findByName('DELETE_FISCALYEAR')
        if (!deleteFiscalYearSubmit) {
            deleteFiscalYearSubmit = new ChildEvent(events: createFiscalYear, name: 'DELETE_FISCALYEAR', description: 'Delete Fiscal year event', fmenuText: 'Delete', controllerName: 'fiscalYear', actionName: 'delete', autoPermit: false).save(failOnError: true)
        }

        // update FiscalYear
        ChildEvent updateFiscalYear = ChildEvent.findByName('UPDATE_FISCALYEAR')
        if (!updateFiscalYear) {
            updateFiscalYear = new ChildEvent(events: createFiscalYear, name: 'UPDATE_FISCALYEAR', description: 'Update Fiscal Year', fmenuText: 'Update', controllerName: 'fiscalYear', actionName: 'update', autoPermit: false).save(failOnError: true)
        }

        // <-- ***customer start*** -->
        // <-- show customer -->
        Events showCustomer = Events.findByName('SHOW_CUSTOMER')
        if (!showCustomer) {
            showCustomer = new Events(feature: accountingMgmt, name: 'SHOW_CUSTOMER', description: 'Show Customer', fmenuText: 'Customer', controllerName: 'customer', actionName: 'index').save(failOnError: true)
        }

        // <-- list of customer -->
        ChildEvent customerList = ChildEvent.findByName('CUSTOMER_LIST')
        if (!customerList) {
            customerList = new ChildEvent(events: showCustomer, name: 'CUSTOMER_LIST', description: 'List method for pagination', fmenuText: 'Customer List', controllerName: 'customer', actionName: 'list', autoPermit: true).save(failOnError: true)
        }

        // <-- create customer -->
        ChildEvent createCustomer = ChildEvent.findByName('CREATE_CUSTOMER')
        if (!createCustomer) {
            createCustomer = new ChildEvent(events: showCustomer, name: 'CREATE_CUSTOMER', description: 'Create Customer', fmenuText: 'Create', controllerName: 'customer', actionName: 'create').save(failOnError: true)
        }

        // <-- edit customer -->
        ChildEvent editCustomer = ChildEvent.findByName('EDIT_CUSTOMER')
        if (!editCustomer) {
            editCustomer = new ChildEvent(events: showCustomer, name: 'EDIT_CUSTOMER', description: 'Edit Customer', fmenuText: 'Edit', controllerName: 'customer', actionName: 'edit').save(failOnError: true)
        }

        // <-- delete customer -->
        ChildEvent deleteCustomer = ChildEvent.findByName('DELETE_CUSTOMER')
        if (!deleteCustomer) {
            deleteCustomer = new ChildEvent(events: showCustomer, name: 'DELETE_CUSTOMER', description: 'Delete Customer', fmenuText: 'Delete', controllerName: 'customer', actionName: 'delete').save(failOnError: true)
        }

        // <-- customer basic info save -->
        ChildEvent customerBasicInfoSubmit = ChildEvent.findByName('SAVE_CUSTOMER_MASTER')
        if (!customerBasicInfoSubmit) {
            customerBasicInfoSubmit = new ChildEvent(events: showCustomer, name: 'SAVE_CUSTOMER_MASTER', description: 'Save Customer Master', fmenuText: 'Save Customer Master', controllerName: 'customer', actionName: 'saveCustomerMaster', autoPermit: true).save(failOnError: true)
        }

        // <-- show state list -->
        ChildEvent customerStateList = ChildEvent.findByName('SHOW_STATE_LIST')
        if (!customerStateList) {
            customerStateList = new ChildEvent(events: showCustomer, name: 'SHOW_STATE_LIST', description: 'State list provide in Customer Address', fmenuText: 'StateList', controllerName: 'customer', actionName: 'stateList', autoPermit: true).save(failOnError: true)
        }

        // <-- customer general address save -->
        ChildEvent customerGeneralAddressSubmit = ChildEvent.findByName('SAVE_CUSTOMER_GENERAL_ADDRESS')
        if (!customerGeneralAddressSubmit) {
            customerGeneralAddressSubmit = new ChildEvent(events: showCustomer, name: 'SAVE_CUSTOMER_GENERAL_ADDRESS', description: 'Save Customer General Address', fmenuText: 'Save Customer General Address', controllerName: 'customer', actionName: 'saveGeneralAddress', autoPermit: true).save(failOnError: true)
        }

        // <-- customer postal address save -->
        ChildEvent customerPostalAddressSubmit = ChildEvent.findByName('SAVE_CUSTOMER_POSTAL_ADDRESS')
        if (!customerPostalAddressSubmit) {
            customerPostalAddressSubmit = new ChildEvent(events: showCustomer, name: 'SAVE_CUSTOMER_POSTAL_ADDRESS', description: 'Save Customer Postal Address', fmenuText: 'Save Customer Postal Address', controllerName: 'customer', actionName: 'savePostalAddress', autoPermit: true).save(failOnError: true)
        }

        // <-- customer shipment address save -->
        ChildEvent customerShipmentAddressSubmit = ChildEvent.findByName('SAVE_CUSTOMER_SHIPMENT_ADDRESS')
        if (!customerShipmentAddressSubmit) {
            customerShipmentAddressSubmit = new ChildEvent(events: showCustomer, name: 'SAVE_CUSTOMER_SHIPMENT_ADDRESS', description: 'Save Customer Shipment Address', fmenuText: 'Save Customer Shipment Address', controllerName: 'customer', actionName: 'saveShipmentAddress', autoPermit: true).save(failOnError: true)
        }

        // <-- customer bank account info save -->
        ChildEvent customerBankAccountSubmit = ChildEvent.findByName('SAVE_CUSTOMER_BANK_ACCOUNT')
        if (!customerBankAccountSubmit) {
            customerBankAccountSubmit = new ChildEvent(events: showCustomer, name: 'SAVE_CUSTOMER_BANK_ACCOUNT', description: 'Save Customer Bank Account', fmenuText: 'Save Customer Bank Account', controllerName: 'customer', actionName: 'saveBankAccount', autoPermit: true).save(failOnError: true)
        }

        // <-- customer bank account info list -->
        ChildEvent customerBankAccountList = ChildEvent.findByName('CUSTOMER_BANK_ACCOUNT_LIST')
        if (!customerBankAccountList) {
            customerBankAccountList = new ChildEvent(events: showCustomer, name: 'CUSTOMER_BANK_ACCOUNT_LIST', description: 'Customer Bank Account List', fmenuText: 'Customer Bank Account List', controllerName: 'customer', actionName: 'listBankAccount', autoPermit: true).save(failOnError: true)
        }

        // <-- customer bank account info edit -->
        ChildEvent customerBankAccountEdit = ChildEvent.findByName('CUSTOMER_BANK_ACCOUNT_EDIT')
        if (!customerBankAccountEdit) {
            customerBankAccountEdit = new ChildEvent(events: showCustomer, name: 'CUSTOMER_BANK_ACCOUNT_EDIT', description: 'Customer Bank Account Edit', fmenuText: 'Customer Bank Account Edit', controllerName: 'customer', actionName: 'editBankAccount', autoPermit: true).save(failOnError: true)
        }

        // <-- customer bank account info delete -->
        ChildEvent customerBankAccountDelete = ChildEvent.findByName('CUSTOMER_BANK_ACCOUNT_DELETE')
        if (!customerBankAccountDelete) {
            customerBankAccountDelete = new ChildEvent(events: showCustomer, name: 'CUSTOMER_BANK_ACCOUNT_DELETE', description: 'Customer Bank Account Delete', fmenuText: 'Customer Bank Account Delete', controllerName: 'customer', actionName: 'deleteBankAccount', autoPermit: true).save(failOnError: true)
        }
        // <-- ***customer end*** -->

        // clients
        Feature clientsMgmt = Feature.findByName('CLIENTS_MGMT')
        if (!clientsMgmt) {
            clientsMgmt = new Feature(module: coreBank, name: 'CLIENTS_MGMT', description: 'Create Different Types of Account for Clients', fmenuText: 'Clients', controllerName: 'coreBanking', actionName: 'clientMgmt', showOnMenu: true, status: true, iconClassName: 'icon-dashboard').save(failOnError: true)
        }
        // <-- create account holder info start -->
        Events AccountHolderInfoList = Events.findByName('ACCOUNT_HOLDER_INFO_LIST')
        if (!AccountHolderInfoList) {
            AccountHolderInfoList = new Events(feature: clientsMgmt, name: 'ACCOUNT_HOLDER_INFO_LIST', description: 'Show Account Holder List', fmenuText: 'Account Holder', controllerName: 'accountHolderInfo', actionName: 'index').save(failOnError: true)
        }
            ChildEvent listAccountHolderInfo = ChildEvent.findByName('LIST_ACCOUNT_HOLDER_INFO')
            if (!listAccountHolderInfo) {
                listAccountHolderInfo = new ChildEvent(events: AccountHolderInfoList, name: 'LIST_ACCOUNT_HOLDER_INFO', description: 'Edit Account Holder Info', fmenuText: 'List Account Holder Info', controllerName: 'accountHolderInfo', actionName: 'list', autoPermit: true).save(failOnError: true)
            }

            ChildEvent createAccountHolderInfo = ChildEvent.findByName('CREATE_ACCOUNT_HOLDER_INFO')
            if (!createAccountHolderInfo) {
                createAccountHolderInfo = new ChildEvent(events: AccountHolderInfoList, name: 'CREATE_ACCOUNT_HOLDER_INFO', description: 'Create Account Holder', fmenuText: 'Create', controllerName: 'accountHolderInfo', actionName: 'create', autoPermit: false).save(failOnError: true)
            }

            ChildEvent editAccountHolderInfo = ChildEvent.findByName('EDIT_ACCOUNT_HOLDER_INFO')
            if (!editAccountHolderInfo) {
                editAccountHolderInfo = new ChildEvent(events: AccountHolderInfoList, name: 'EDIT_ACCOUNT_HOLDER_INFO', description: 'Edit Account Holder', fmenuText: 'Edit', controllerName: 'accountHolderInfo', actionName: 'edit', autoPermit: false).save(failOnError: true)
            }

            ChildEvent deleteAccountHolderInfo = ChildEvent.findByName('DELETE_ACCOUNT_HOLDER_INFO')
            if (!deleteAccountHolderInfo) {
                deleteAccountHolderInfo = new ChildEvent(events: AccountHolderInfoList, name: 'DELETE_ACCOUNT_HOLDER_INFO', description: 'Delete Account Holder', fmenuText: 'Delete', controllerName: 'accountHolderInfo', actionName: 'delete', autoPermit: false).save(failOnError: true)
            }



            // <-- create account holder personal info save -->
            ChildEvent saveAccountHolderPersonalInfo = ChildEvent.findByName('SAVE_ACCOUNTHOLDER_PERSONAL_INFO')
            if (!saveAccountHolderPersonalInfo) {
                saveAccountHolderPersonalInfo = new ChildEvent(events: AccountHolderInfoList, name: 'SAVE_ACCOUNTHOLDER_PERSONAL_INFO', description: 'Save Agent Contact Detail', fmenuText: 'Save Account Holder Personal Info', controllerName: 'accountHolderInfo', actionName: 'savePersonalInfo', autoPermit: true).save(failOnError: true)
            }

            // <-- create account holder general address save -->
            ChildEvent saveAccountHolderGeneralAddress = ChildEvent.findByName('SAVE_ACCOUNTHOLDER_GENERAL_ADDRESS')
            if (!saveAccountHolderGeneralAddress) {
                saveAccountHolderGeneralAddress = new ChildEvent(events: AccountHolderInfoList, name: 'SAVE_ACCOUNTHOLDER_GENERAL_ADDRESS', description: 'Save Account Holder General Address', fmenuText: 'Save Account Holder General Address', controllerName: 'accountHolderInfo', actionName: 'saveGeneralAddress', autoPermit: true).save(failOnError: true)
            }

            // <-- create account holder state List -->
            ChildEvent stateList = ChildEvent.findByName('ACCOUNTHOLDER_STATE_LIST')
            if (!stateList) {
                stateList = new ChildEvent(events: AccountHolderInfoList, name: 'ACCOUNTHOLDER_STATE_LIST', description: 'Account Holder State List', fmenuText: 'Account Holder State List', controllerName: 'accountHolderInfo', actionName: 'stateList', autoPermit: true).save(failOnError: true)
            }

            // <-- create account holder postal address save -->
            ChildEvent saveAccountHolderPostalAddress = ChildEvent.findByName('SAVE_ACCOUNTHOLDER_POSTAL_ADDRESS')
            if (!saveAccountHolderPostalAddress) {
                saveAccountHolderPostalAddress = new ChildEvent(events: AccountHolderInfoList, name: 'SAVE_ACCOUNTHOLDER_POSTAL_ADDRESS', description: 'Save Account Holder Postal Address', fmenuText: 'Save Account Holder Postal Address', controllerName: 'accountHolderInfo', actionName: 'savePostalAddress', autoPermit: true).save(failOnError: true)
            }

            // <-- create account holder Family Info save -->
            ChildEvent saveSpouseInfo = ChildEvent.findByName('SAVE_ACCOUNTHOLDER_SPOUSE_INFO')
            if (!saveSpouseInfo) {
                saveSpouseInfo = new ChildEvent(events: AccountHolderInfoList, name: 'SAVE_ACCOUNTHOLDER_SPOUSE_INFO', description: 'Save Account Holder spouse Info', fmenuText: 'Save Account Holder spouse Info', controllerName: 'accountHolderInfo', actionName: 'saveSpouseInfo', autoPermit: true).save(failOnError: true)
            }

            // <-- create account holder Family Info edit -->
            ChildEvent editSpouseInfo = ChildEvent.findByName('EDIT_ACCOUNTHOLDER_SPOUSE_INFO')
            if (!editSpouseInfo) {
                editSpouseInfo = new ChildEvent(events: AccountHolderInfoList, name: 'EDIT_ACCOUNTHOLDER_SPOUSE_INFO', description: 'Edit Account Holder spouse Info', fmenuText: 'Edit Account Holder spouse Info', controllerName: 'accountHolderInfo', actionName: 'editSpouseInfo', autoPermit: true).save(failOnError: true)
            }

            // <-- create account holder Family Info delete -->
            ChildEvent deleteSpouseInfo = ChildEvent.findByName('DELETE_ACCOUNTHOLDER_SPOUSE_INFO')
            if (!deleteSpouseInfo) {
                deleteSpouseInfo = new ChildEvent(events: AccountHolderInfoList, name: 'DELETE_ACCOUNTHOLDER_SPOUSE_INFO', description: 'Delete Account Holder spouse Info', fmenuText: 'Delete Account Holder spouse Info', controllerName: 'accountHolderInfo', actionName: 'deleteSpouseInfo', autoPermit: true).save(failOnError: true)
            }

            ChildEvent accountHolderInfo = ChildEvent.findByName('ACCOUNT_HOLDER_INFO')
            if (!accountHolderInfo) {
                accountHolderInfo = new ChildEvent(events: AccountHolderInfoList, name: 'ACCOUNT_HOLDER_INFO', description: 'Show Account Holder Info', fmenuText: 'Show Account Info', controllerName: 'accountHolderInfo', actionName: 'showAccountHolder', autoPermit: true).save(failOnError: true)
            }

            ChildEvent accountHolderDetails = ChildEvent.findByName('ACCOUNT_HOLDER_DETAILS')
            if (!accountHolderDetails) {
                accountHolderDetails = new ChildEvent(events: AccountHolderInfoList, name: 'ACCOUNT_HOLDER_DETAILS', description: 'Show Account Holder Details', fmenuText: 'Show Account Details', controllerName: 'accountHolderInfo', actionName: 'showAccountDetails', autoPermit: true).save(failOnError: true)
            }

            ChildEvent accountHolderEducation = ChildEvent.findByName('ACCOUNT_HOLDER_EDUCATION')
            if (!accountHolderEducation) {
                accountHolderEducation = new ChildEvent(events: AccountHolderInfoList, name: 'ACCOUNT_HOLDER_EDUCATION', description: 'Save Account Holder Education', fmenuText: 'Save Account Holder Education', controllerName: 'accountHolderInfo', actionName: 'saveEducation', autoPermit: true).save(failOnError: true)
            }

            // <-- list of education -->
            ChildEvent EducationList = ChildEvent.findByName('EDUCATION_LIST')
            if (!EducationList) {
                EducationList = new ChildEvent(events: AccountHolderInfoList, name: 'EDUCATION_LIST', description: 'List method for pagination', fmenuText: 'Education List', controllerName: 'accountHolderInfo', actionName: 'listEducationalInfo', autoPermit: true).save(failOnError: true)
            }

            // <-- edit Education -->
            ChildEvent editEducationalInfo = ChildEvent.findByName('EDIT_EDUCATION')
            if (!editEducationalInfo) {
                editEducationalInfo = new ChildEvent(events: AccountHolderInfoList, name: 'EDIT_EDUCATION', description: 'Edit Education', fmenuText: 'Edit Education', controllerName: 'accountHolderInfo', actionName: 'editEducationalInfo', autoPermit: true).save(failOnError: true)
            }

            // <-- delete education -->
            ChildEvent deleteEducationalInfo = ChildEvent.findByName('DELETE_EDUCATION')
            if (!deleteEducationalInfo) {
                deleteEducationalInfo = new ChildEvent(events: AccountHolderInfoList, name: 'DELETE_EDUCATION', description: 'Delete Education', fmenuText: 'Delete', controllerName: 'accountHolderInfo', actionName: 'deleteEducationalInfo', autoPermit: true).save(failOnError: true)
            }

            ChildEvent accountHolderAttachments = ChildEvent.findByName('ACCOUNT_HOLDER_ATTACHMENTS')
            if (!accountHolderAttachments) {
                accountHolderAttachments = new ChildEvent(events: AccountHolderInfoList, name: 'ACCOUNT_HOLDER_ATTACHMENTS', description: 'Save Account Holder Attachments', fmenuText: 'Save Account Holder Attachments', controllerName: 'accountHolderInfo', actionName: 'saveAttachment', autoPermit: true).save(failOnError: true)
            }

            ChildEvent downloadIdentification = ChildEvent.findByName('DOWNLOAD_ATTACHMENTS')
            if (!downloadIdentification) {
                downloadIdentification = new ChildEvent(events: AccountHolderInfoList, name: 'DOWNLOAD_ATTACHMENTS', description: 'Download Attachments', fmenuText: 'Download Attachments', controllerName: 'accountHolderInfo', actionName: 'downloadIdentification', autoPermit: true).save(failOnError: true)
            }

            ChildEvent editIdentification = ChildEvent.findByName('EDIT_ATTACHMENTS')
            if (!editIdentification) {
                editIdentification = new ChildEvent(events: AccountHolderInfoList, name: 'EDIT_ATTACHMENTS', description: 'Edit Attachments', fmenuText: 'Edit Attachments', controllerName: 'accountHolderInfo', actionName: 'editIdentification', autoPermit: true).save(failOnError: true)
            }

            ChildEvent deleteIdentification = ChildEvent.findByName('DELETE_ATTACHMENTS')
            if (!deleteIdentification) {
                deleteIdentification = new ChildEvent(events: AccountHolderInfoList, name: 'DELETE_ATTACHMENTS', description: 'Delete Attachments', fmenuText: 'Delete Attachments', controllerName: 'accountHolderInfo', actionName: 'deleteIdentification', autoPermit: true).save(failOnError: true)
            }

            ChildEvent accountHolderPictures = ChildEvent.findByName('ACCOUNT_HOLDER_PICTURES')
            if (!accountHolderPictures) {
                accountHolderPictures = new ChildEvent(events: AccountHolderInfoList, name: 'ACCOUNT_HOLDER_PICTURES', description: 'Save Account Holder Pictures', fmenuText: 'Save Account Holder Pictures', controllerName: 'accountHolderInfo', actionName: 'savePicture', autoPermit: true).save(failOnError: true)
            }
        // <-- create account holder info end -->

        // create retail account
        Events createRetailClient = Events.findByName('SHOW_RETAIL_CLIENT')
        if (!createRetailClient) {
            createRetailClient = new Events(feature: clientsMgmt, name: 'SHOW_RETAIL_CLIENT', description: 'Retail Client Account List', fmenuText: 'Retail Account', controllerName: 'retailClient', actionName: 'index',).save(failOnError: true)
        }
        ChildEvent addRetailClient = ChildEvent.findByName('CREATE_RETAIL_CLIENT')
        if (!addRetailClient) {
            addRetailClient = new ChildEvent(events: createRetailClient, name: 'CREATE_RETAIL_CLIENT', description: 'Create Retail Client', fmenuText: 'Create', controllerName: 'retailClient', actionName: 'create').save(failOnError: true)
        }
        ChildEvent listRetailClient = ChildEvent.findByName('LIST_RETAIL_CLIENT')
        if (!listRetailClient) {
            listRetailClient = new ChildEvent(events: createRetailClient, name: 'LIST_RETAIL_CLIENT', description: 'List Retail Client', fmenuText: 'List', controllerName: 'retailClient', actionName: 'list',autoPermit: true).save(failOnError: true)
        }
        ChildEvent editRetailClient = ChildEvent.findByName('EDIT_RETAIL_CLIENT')
        if (!editRetailClient) {
            editRetailClient = new ChildEvent(events: createRetailClient, name: 'EDIT_RETAIL_CLIENT', description: 'Edit Retail Client', fmenuText: 'Edit', controllerName: 'retailClient', actionName: 'editRetailClient').save(failOnError: true)
        }
        ChildEvent deleteRetailClient = ChildEvent.findByName('DELETE_RETAIL_CLIENT')
        if (!deleteRetailClient) {
            deleteRetailClient = new ChildEvent(events: createRetailClient, name: 'DELETE_RETAIL_CLIENT', description: 'Delete Retail Client', fmenuText: 'Delete', controllerName: 'retailClient', actionName: 'deleteRetailClient').save(failOnError: true)
        }

        // Retail Account Save
        ChildEvent saveRetailAccount = ChildEvent.findByName('SAVE_RETAIL_CLIENT_ACCOUNT_INFO')
        if (!saveRetailAccount) {
            saveRetailAccount = new ChildEvent(events: createRetailClient, name: 'SAVE_RETAIL_CLIENT_ACCOUNT_INFO', description: 'Save Client Account', fmenuText: 'Save', controllerName: 'retailClient', actionName: 'saveRetailAccount').save(failOnError: true)
        }

        // Retail Introducer Save
        ChildEvent saveRetailIntroducer = ChildEvent.findByName('SAVE_RETAIL_INTRODUCER_INFO')
        if (!saveRetailIntroducer) {
            saveRetailIntroducer = new ChildEvent(events: createRetailClient, name: 'SAVE_RETAIL_INTRODUCER_INFO', description: 'Save Introducer Information', fmenuText: 'Save', controllerName: 'retailClient', actionName: 'saveRetailIntroducer').save(failOnError: true)
        }
        ChildEvent checkAccountNo = ChildEvent.findByName('CHECH_ACCOUNT_NO')
        if (!checkAccountNo) {
            checkAccountNo = new ChildEvent(events: createRetailClient, name: 'CHECH_ACCOUNT_NO', description: 'Checking account Number', fmenuText: 'Checking Account Number in Client', controllerName: 'retailClient', actionName: 'checkAccountNo', autoPermit: true).save(failOnError: true)
        }
        // delete Introducer account
        ChildEvent deleteRetailIntroducer = ChildEvent.findByName('DELETE_RETAIL_INTRODUCER_INFO')
        if (!deleteRetailIntroducer) {
            deleteRetailIntroducer = new ChildEvent(events: createRetailClient, name: 'DELETE_RETAIL_INTRODUCER_INFO', description: 'Delete Introducer Information', fmenuText: 'Delete', controllerName: 'retailClient', actionName: 'deleteRetailIntroducer').save(failOnError: true)
        }

        // Retail Other Bank Account Save
        ChildEvent saveRetailOtherBankAccount = ChildEvent.findByName('SAVE_RETAIL_OTHER_BANK_ACCOUNT')
        if (!saveRetailOtherBankAccount) {
            saveRetailOtherBankAccount = new ChildEvent(events: createRetailClient, name: 'SAVE_RETAIL_OTHER_BANK_ACCOUNT', description: 'Save Other Bank Account', fmenuText: 'Save', controllerName: 'retailClient', actionName: 'saveRetailOtherBankAccount').save(failOnError: true)
        }
        ChildEvent fetchBranch = ChildEvent.findByName('CHECH_BANK')
        if (!fetchBranch) {
            fetchBranch = new ChildEvent(events: createRetailClient, name: 'CHECH_BANK', description: 'Check Bank', fmenuText: 'Check Bank', controllerName: 'retailClient', actionName: 'fetchBranch', autoPermit: true).save(failOnError: true)
        }
        // delete Other bank account
        ChildEvent deleteOtherBankAccount = ChildEvent.findByName('DELETE_RETAIL_OTHER_BANK_ACCOUNT')
        if (!deleteOtherBankAccount) {
            deleteOtherBankAccount = new ChildEvent(events: createRetailClient, name: 'DELETE_RETAIL_OTHER_BANK_ACCOUNT', description: 'Delete Other Bank Account', fmenuText: 'Delete', controllerName: 'retailClient', actionName: 'deleteOtherBankAccount').save(failOnError: true)
        }
        // Edit Other Bank Account
        ChildEvent editOtherBankAccount = ChildEvent.findByName('EDIT_RETAIL_OTHER_BANK_ACCOUNT')
        if (!editOtherBankAccount) {
            editOtherBankAccount = new ChildEvent(events: createRetailClient, name: 'EDIT_RETAIL_OTHER_BANK_ACCOUNT', description: 'Edit Other Bank Account Information', fmenuText: 'Edit', controllerName: 'retailClient', actionName: 'editOtherBankAccount').save(failOnError: true)
        }

        // Retail Nominee Information Save
        ChildEvent saveRetailNomineeInfo = ChildEvent.findByName('SAVE_RETAIL_NOMINEE_INFO')
        if (!saveRetailNomineeInfo) {
            saveRetailNomineeInfo = new ChildEvent(events: createRetailClient, name: 'SAVE_RETAIL_NOMINEE_INFO', description: 'Save Nominee Information', fmenuText: 'Save', controllerName: 'retailClient', actionName: 'saveRetailNomineeInfo').save(failOnError: true)
        }
        // Nominee Information Delete
        ChildEvent deleteRetailNominee = ChildEvent.findByName('DELETE_RETAIL_NOMINEE_INFO')
        if (!deleteRetailNominee) {
            deleteRetailNominee = new ChildEvent(events: createRetailClient, name: 'DELETE_RETAIL_NOMINEE_INFO', description: 'Delete Nominee Information', fmenuText: 'Delete', controllerName: 'retailClient', actionName: 'deleteRetailNominee').save(failOnError: true)
        }
        // Nominee Information Edit
        ChildEvent editRetailNominee = ChildEvent.findByName('EDIT_RETAIL_NOMINEE_INFO')
        if (!editRetailNominee) {
            editRetailNominee = new ChildEvent(events: createRetailClient, name: 'EDIT_RETAIL_NOMINEE_INFO', description: 'Edit Nominee Information', fmenuText: 'Edit', controllerName: 'retailClient', actionName: 'editRetailNominee').save(failOnError: true)
        }

        // Retail Singature
        ChildEvent saveRetailSignatures = ChildEvent.findByName('SAVE_RETAIL_CLIENT_SIGNATURE')
        if (!saveRetailSignatures) {
            saveRetailSignatures = new ChildEvent(events: createRetailClient, name: 'SAVE_RETAIL_CLIENT_SIGNATURE', description: 'Save Client Signature', fmenuText: 'Save', controllerName: 'retailClient', actionName: 'saveRetailSignatures').save(failOnError: true)
        }
        /* end retail client */


        // <-- create retail account for client end -->

        Events showRetailAgenList = Events.findByName('INDEX_AGENT_LIST')
        if (!showRetailAgenList) {
            showRetailAgenList = new Events(feature: clientsMgmt, name: 'INDEX_AGENT_LIST', description: 'Agent list with search sort and allow actions', fmenuText: 'Retail Agent', controllerName: 'agent', actionName: 'index').save(failOnError: true)
        }
        ChildEvent indexAgent = ChildEvent.findByName('CREATE_RETAIL_AGENT')
        if (!indexAgent) {
            indexAgent = new ChildEvent(events: showRetailAgenList, name: 'CREATE_RETAIL_AGENT', description: 'Create Retail Agent', fmenuText: 'Create', controllerName: 'agent', actionName: 'create', autoPermit: false).save(failOnError: true)
        }

        ChildEvent saveAgentPersonalInfo = ChildEvent.findByName('SAVE_AGENT_PERSONAL_INFO')
        if (!saveAgentPersonalInfo) {
            saveAgentPersonalInfo = new ChildEvent(events: showRetailAgenList, name: 'SAVE_AGENT_PERSONAL_INFO', description: 'Save Agent Personal Info', fmenuText: 'Save Agent Personal Info', controllerName: 'agent', actionName: 'savePersonalInfo', autoPermit: true).save(failOnError: true)
        }

        ChildEvent saveAgentContactDetail = ChildEvent.findByName('SAVE_AGENT_CONTACT_DETAIL')
        if (!saveAgentContactDetail) {
            saveAgentContactDetail = new ChildEvent(events: showRetailAgenList, name: 'SAVE_AGENT_CONTACT_DETAIL', description: 'Save Agent Contact Detail', fmenuText: 'Save Agent Contact Detail', controllerName: 'agent', actionName: 'saveContactDetail', autoPermit: true).save(failOnError: true)
        }

        ChildEvent saveAgentResidentialAddress = ChildEvent.findByName('SAVE_AGENT_RESIDENTIAL_ADDRESS')
        if (!saveAgentResidentialAddress) {
            saveAgentResidentialAddress = new ChildEvent(events: showRetailAgenList, name: 'SAVE_AGENT_RESIDENTIAL_ADDRESS', description: 'Save Agent Residential Address', fmenuText: 'Save Agent Residential Address', controllerName: 'agent', actionName: 'saveResidentialAddress', autoPermit: true).save(failOnError: true)
        }

        ChildEvent saveAgentAdditionalDetail = ChildEvent.findByName('SAVE_AGENT_ADDITIONAL_DETAIL')
        if (!saveAgentAdditionalDetail) {
            saveAgentAdditionalDetail = new ChildEvent(events: showRetailAgenList, name: 'SAVE_AGENT_ADDITIONAL_DETAIL', description: 'Save Agent Additional Detail', fmenuText: 'Save Agent Additional Detail', controllerName: 'agent', actionName: 'saveAdditionalDetail', autoPermit: true).save(failOnError: true)
        }
        ChildEvent saveAgentClientHelp = ChildEvent.findByName('SAVE_AGENT_CLIENT_HELP')
        if (!saveAgentClientHelp) {
            saveAgentClientHelp = new ChildEvent(events: showRetailAgenList, name: 'SAVE_AGENT_CLIENT_HELP', description: 'Save Agent Client Help', fmenuText: 'Save Agent Client Help', controllerName: 'agent', actionName: 'saveClientHelp', autoPermit: true).save(failOnError: true)
        }
        ChildEvent saveThirdParty = ChildEvent.findByName('SAVE_AGENT_THIRD_PARTY')
        if (!saveThirdParty) {
            saveThirdParty = new ChildEvent(events: showRetailAgenList, name: 'SAVE_AGENT_THIRD_PARTY', description: 'Save Agent Third Party', fmenuText: 'Save Agent Third Party', controllerName: 'agent', actionName: 'saveThirdParty', autoPermit: true).save(failOnError: true)
        }

        ChildEvent saveAgentAttachments = ChildEvent.findByName('SAVE_AGENT_ATTACHMENT')
        if (!saveAgentAttachments) {
            saveAgentAttachments = new ChildEvent(events: showRetailAgenList, name: 'SAVE_AGENT_ATTACHMENT', description: 'Save Agent Attachment', fmenuText: 'Save Agent Attachment', controllerName: 'agent', actionName: 'saveAttachment', autoPermit: true).save(failOnError: true)
        }

        ChildEvent downloadAgentAttachments = ChildEvent.findByName('DOWNLOAD_AGENT_ATTACHMENT')
        if (!downloadAgentAttachments) {
            downloadAgentAttachments = new ChildEvent(events: showRetailAgenList, name: 'DOWNLOAD_AGENT_ATTACHMENT', description: 'Download Agent Attachment', fmenuText: 'Download Agent Attachment', controllerName: 'agent', actionName: 'downloadAttachment', autoPermit: true).save(failOnError: true)
        }
        ChildEvent deleteAgentAttachments = ChildEvent.findByName('DELETE_AGENT_ATTACHMENT')
        if (!deleteAgentAttachments) {
            deleteAgentAttachments = new ChildEvent(events: showRetailAgenList, name: 'DELETE_AGENT_ATTACHMENT', description: 'Delete Agent Attachment', fmenuText: 'Delete Agent Attachment', controllerName: 'agent', actionName: 'deleteAttachment', autoPermit: true).save(failOnError: true)
        }
        ChildEvent deleteAgent = ChildEvent.findByName('DELETE_AGENT')
        if (!deleteAgent) {
            deleteAgent = new ChildEvent(events: showRetailAgenList, name: 'DELETE_AGENT', description: 'Delete Agent', fmenuText: 'Delete Agent', controllerName: 'agent', actionName: 'deleteAgent', autoPermit: false).save(failOnError: true)
        }
        ChildEvent updateAgent = ChildEvent.findByName('UPDATE_AGENT')
        if (!updateAgent) {
            updateAgent = new ChildEvent(events: showRetailAgenList, name: 'UPDATE_AGENT', description: 'Edit Retail Agent', fmenuText: 'Edit Agent', controllerName: 'agent', actionName: 'update', autoPermit: false).save(failOnError: true)
        }
        ChildEvent listAgent = ChildEvent.findByName('LIST_AGENT')
        if (!listAgent) {
            listAgent = new ChildEvent(events: showRetailAgenList, name: 'LIST_AGENT', description: 'List Agent', fmenuText: 'List Agent', controllerName: 'agent', actionName: 'list', autoPermit: true).save(failOnError: true)
        }


        Feature productMgmt = Feature.findByName('PRODUCT_MGMT')
        if (!productMgmt) {
            productMgmt = new Feature(module: coreBank, name: 'PRODUCT_MGMT', description: 'Manage Different products', fmenuText: 'Products', controllerName: 'coreBanking', actionName: 'productMgmt', showOnMenu: true, status: true, iconClassName: 'icon-dashboard').save(failOnError: true)
        }

        Events createProduct = Events.findByName('PRODUCT_LIST')
        if (!createProduct) {
            createProduct = new Events(feature: productMgmt, name: 'PRODUCT_LIST', description: 'Create new Product', fmenuText: 'Savings Product', controllerName: 'product', actionName: 'index').save(failOnError: true)
        }

        ChildEvent savingsProduct = ChildEvent.findByName('CREATE_PRODUCT')
        if (!savingsProduct) {
            savingsProduct = new ChildEvent(events: createProduct, name: 'CREATE_PRODUCT', description: 'Product List', fmenuText: 'Savings Product', controllerName: 'product', actionName: 'createProduct').save(failOnError: true)
        }

        ChildEvent saveProductMain = ChildEvent.findByName('SAVE_PRODUCT_MAIN')
        if (!saveProductMain) {
            saveProductMain = new ChildEvent(events: createProduct, name: 'SAVE_PRODUCT_MAIN', description: 'SAVE Product',
                    fmenuText: 'Create Savings Product', controllerName: 'product', actionName: 'saveMain',
                    autoPermit: true).save(failOnError: true)
        }

        ChildEvent saveProductTran = ChildEvent.findByName('SAVE_PRODUCT_TRAN')
        if (!saveProductTran) {
            saveProductTran = new ChildEvent(events: createProduct, name: 'SAVE_PRODUCT_TRAN', description: 'SAVE Product',
                    fmenuText: 'Create Savings Product', controllerName: 'product', actionName: 'saveTran',
                    autoPermit: true).save(failOnError: true)
        }

        ChildEvent saveProductFee = ChildEvent.findByName('SAVE_PRODUCT_FEE')
        if (!saveProductFee) {
            saveProductFee = new ChildEvent(events: createProduct, name: 'SAVE_PRODUCT_FEE', description: 'SAVE Product',
                    fmenuText: 'Create Savings Product', controllerName: 'product', actionName: 'saveFee',
                    autoPermit: true).save(failOnError: true)
        }

        ChildEvent saveProductOver = ChildEvent.findByName('SAVE_PRODUCT_OVER')
        if (!saveProductOver) {
            saveProductOver = new ChildEvent(events: createProduct, name: 'SAVE_PRODUCT_OVER', description: 'SAVE Product',
                    fmenuText: 'Create Savings Product', controllerName: 'product', actionName: 'saveOver',
                    autoPermit: true).save(failOnError: true)
        }

        ChildEvent listProduct = ChildEvent.findByName('LIST_PRODUCT')
        if (!listProduct) {
            listProduct = new ChildEvent(events: createProduct, name: 'LIST_PRODUCT', description: 'List Product',
                    fmenuText: 'List Savings Product', controllerName: 'product', actionName: 'list',
                    autoPermit: true).save(failOnError: true)
        }

        ChildEvent editProduct = ChildEvent.findByName('EDIT_PRODUCT')
        if (!editProduct) {
            editProduct = new ChildEvent(events: createProduct, name: 'EDIT_PRODUCT', description: 'Edit Product',
                    fmenuText: 'Edit Savings Product', controllerName: 'product', actionName: 'edit',
                    autoPermit: true).save(failOnError: true)
        }

        ChildEvent deleteProduct = ChildEvent.findByName('DELETE_PRODUCT')
        if (!deleteProduct) {
            deleteProduct = new ChildEvent(events: createProduct, name: 'DELETE_PRODUCT', description: 'Delete Product',
                    fmenuText: 'Delete Savings Product', controllerName: 'product', actionName: 'delete',
                    autoPermit: true).save(failOnError: true)
        }

        //3.    Insurance part here
        Module insurance = Module.findByName('INSURANCE') ?: new Module(name: 'INSURANCE', description: 'All Insurance here', menuText: 'Insurance', status: false).save(failOnError: true)

        //4.    Demo part here
        Module demoJob = Module.findByName('DEMOJOB') ?: new Module(name: 'DEMOJOB', description: 'Demo work', menuText: 'Demo', showOnMenu: false, status: false).save(failOnError: true)
        Feature demo = Feature.findByName('DEMO')
        if (!demo) {
            demo = new Feature(module: demoJob, name: 'DEMO', description: 'demo description', fmenuText: 'Demo', controllerName: 'demo', actionName: 'index', showOnMenu: true, status: true, iconClassName: 'icon-dashboard').save(failOnError: true)
        }

        // Demo part for Attachment
        Events attachment = Events.findByName('DEMO_ATTACHMENT')
        if (!attachment) {
            attachment = new Events(feature: demo, name: 'DEMO_ATTACHMENT', description: 'Attachment Demo', fmenuText: 'Attachment', controllerName: 'demo', actionName: 'attachment').save(failOnError: true)
        }

        // Demo part for Attachment Save
        Events attachmentSave = Events.findByName('DEMO_ATTACHMENT_SAVE')
        if (!attachmentSave) {
            attachmentSave = new Events(feature: demo, name: 'DEMO_ATTACHMENT_SAVE', description: 'Attachment save', fmenuText: 'Save', controllerName: 'demo', actionName: 'save', showOnMenu: false).save(failOnError: true)
        }

        // Demo part for Attachment Download
        Events attacDownload = Events.findByName('DEMO_ATTAC_DOWNLOAD')
        if (!attacDownload) {
            attacDownload = new Events(feature: demo, name: 'DEMO_ATTAC_DOWNLOAD', description: 'Attachment download', fmenuText: 'Download', controllerName: 'demo', actionName: 'download').save(failOnError: true)
        }

        // Demo part for Image preview
        Events imgPreview = Events.findByName('IMAGE_PREVIEW')
        if (!imgPreview) {
            imgPreview = new Events(feature: demo, name: 'IMAGE_PREVIEW', description: 'Image Preview', fmenuText: 'Image', controllerName: 'demo', actionName: 'imagePreview').save(failOnError: true)
        }
        //Demo part for Image save
        ChildEvent imgSave = ChildEvent.findByName('IMAGE_SAVE')
        if (!imgSave) {
            imgSave = new ChildEvent(events: imgPreview, name: 'IMAGE_SAVE', description: 'Image Save', fmenuText: 'Image Save', controllerName: 'demo', actionName: 'imgSave').save(failOnError: true)
        }

        //  1.  user Management Module
        Module userMgmtModule = Module.findByName('USER_MGMT_MODULE') ?: new Module(name: 'USER_MGMT_MODULE', description: 'User Management', menuText: 'User Mgmt').save(failOnError: true)

        // 1.1  user CURD
        Feature userMgmt = Feature.findByName('USER_MGMT')
        if (!userMgmt) {
            userMgmt = new Feature(module: userMgmtModule, name: 'USER_MGMT', description: 'Manage User with role and access', fmenuText: 'Manage User', controllerName: 'user', actionName: 'userMgmt', iconClassName: 'icon-dashboard').save(failOnError: true)
        }
        // 1.1.1    Create User
        Events userShow = Events.findByName('USER_LIST_SHOW')
        if (!userShow) {
            userShow = new Events(feature: userMgmt, name: 'USER_LIST_SHOW', description: 'Show User in List', fmenuText: 'User', controllerName: 'user', actionName: 'index').save(failOnError: true)
        }
        ChildEvent createUser = ChildEvent.findByName('CREATE_USER')
        if (!createUser) {
            createUser = new ChildEvent(events: userShow, name: 'CREATE_USER', description: 'Add a new User with role', fmenuText: 'Add User', controllerName: 'user', actionName: 'create').save(failOnError: true)
        }
        ChildEvent createUserSubmit = ChildEvent.findByName('SAVE_UPDATE_USER')
        if (!createUserSubmit) {
            createUserSubmit = new ChildEvent(events: userShow, name: 'SAVE_UPDATE_USER', description: 'Save or Update event handle', fmenuText: 'Save', controllerName: 'user', actionName: 'save', autoPermit: true).save(failOnError: true)
        }
        // 1.1.2    Update User
        ChildEvent updateUser = ChildEvent.findByName('UPDATE_USER')
        if (!updateUser) {
            updateUser = new ChildEvent(events: userShow, name: 'UPDATE_USER', description: 'Update user', fmenuText: 'Update', controllerName: 'user', actionName: 'edit').save(failOnError: true)
        }
        // 1.1.3    Delete User
        ChildEvent deleteUser = ChildEvent.findByName('DELETE_USER')
        if (!deleteUser) {
            deleteUser = new ChildEvent(events: userShow, name: 'DELETE_USER', description: 'Delete user', fmenuText: 'Delete', controllerName: 'user', actionName: 'delete').save(failOnError: true)
        }
        // 1.1.4    List User for pagination only
        ChildEvent listUserForPagination = ChildEvent.findByName('LIST_USER_PAGINATION')
        if (!listUserForPagination) {
            listUserForPagination = new ChildEvent(events: userShow, name: 'LIST_USER_PAGINATION', description: 'List method for pagination', fmenuText: 'List', controllerName: 'user', actionName: 'list', autoPermit: true).save(failOnError: true)
        }

        // 1.2.1    Create Role
        Events showRole = Events.findByName('SHOW_ROLE')
        if (!showRole) {
            showRole = new Events(feature: userMgmt, name: 'SHOW_ROLE', description: 'Create role with role List at bottom', fmenuText: 'Role', controllerName: 'role', actionName: 'index').save(failOnError: true)
        }
        ChildEvent createRole = ChildEvent.findByName('CREATE_ROLE')
        if (!createRole) {
            createRole = new ChildEvent(events: showRole, name: 'CREATE_ROLE', description: 'Create role', fmenuText: 'Create', controllerName: 'role', actionName: 'create').save(failOnError: true)
        }
        ChildEvent createRoleSubmit = ChildEvent.findByName('SAVE_UPDATE_ROLE')
        if (!createRoleSubmit) {
            createRoleSubmit = new ChildEvent(events: showRole, name: 'SAVE_UPDATE_ROLE', description: 'Create role with role List at bottom', fmenuText: 'Save', controllerName: 'role', actionName: 'save', autoPermit: true).save(failOnError: true)
        }

        // 1.2.2    Update User
        ChildEvent editRole = ChildEvent.findByName('EDIT_ROLE')
        if (!editRole) {
            editRole = new ChildEvent(events: showRole, name: 'EDIT_ROLE', description: 'Edit role', fmenuText: 'Edit', controllerName: 'role', actionName: 'edit').save(failOnError: true)
        }
        // 1.2.3    Delete User
        ChildEvent deleteRole = ChildEvent.findByName('DELETE_ROLE')
        if (!deleteRole) {
            deleteRole = new ChildEvent(events: showRole, name: 'DELETE_ROLE', description: 'Delete role', fmenuText: 'Delete', controllerName: 'role', actionName: 'delete').save(failOnError: true)
        }
        // 1.2.4    List User for pagination only
        ChildEvent listRolePagination = ChildEvent.findByName('LIST_ROLE_PAGINATION')
        if (!listRolePagination) {
            listRolePagination = new ChildEvent(events: showRole, name: 'LIST_ROLE_PAGINATION', description: 'List method for pagination', fmenuText: 'List', controllerName: 'role', actionName: 'list', autoPermit: true).save(failOnError: true)
        }


        Events showRoleRightMap = Events.findByName('SHOW_ROLE_RIGHT_MAP')
        if (!showRoleRightMap) {
            showRoleRightMap = new Events(feature: userMgmt, name: 'SHOW_ROLE_RIGHT_MAP', description: 'Show role right map', fmenuText: 'Role Right Map', controllerName: 'role', actionName: 'roleRight', showOnMenu: true).save(failOnError: true)
        }
        ChildEvent saveRoleRightMap = ChildEvent.findByName('SAVE_ROLE_RIGHT_MAP')
        if (!saveRoleRightMap) {
            saveRoleRightMap = new ChildEvent(events: showRoleRightMap, name: 'SAVE_ROLE_RIGHT_MAP', description: 'Save role right map', fmenuText: 'Update', controllerName: 'role', actionName: 'saveRoleRight', autoPermit: true).save(failOnError: true)
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
        def modules = Module.findAllByStatus(true)
        modules.each { Module module ->
            def features = Feature.findAllByModuleAndStatus(module, true)
            features.each { Feature feature ->
                reqInstance = Requestmap.findByUrl("/" + feature.controllerName + "/" + feature.actionName)
                if (!reqInstance) {
                    Requestmap.newInstance(url: "/" + feature.controllerName + "/" + feature.actionName, configAttribute: 'ROLE_SUPER_ADMIN').save(flush: true, failOnError: true)
                }
                def eventList = Events.findAllByFeature(feature)
                eventList.each { Events events ->
                    reqInstance = Requestmap.findByUrl("/" + events.controllerName + "/" + events.actionName)
                    if (!reqInstance) {
                        Requestmap.newInstance(eventId: events.id, url: "/" + events.controllerName + "/" + events.actionName, configAttribute: 'ROLE_SUPER_ADMIN').save(flush: true, failOnError: true)
                    }
                    def childEventList = ChildEvent.findAllByEvents(events)
                    childEventList.each { ChildEvent childEvent ->
                        reqInstance = Requestmap.findByUrl("/" + childEvent.controllerName + "/" + childEvent.actionName)
                        if (!reqInstance) {
                            if (childEvent.autoPermit) {
                                Requestmap.newInstance(childOf: events.id, autoPermit: true, url: "/" + childEvent.controllerName + "/" + childEvent.actionName, configAttribute: 'ROLE_SUPER_ADMIN').save(flush: true, failOnError: true)
                            } else {
                                Requestmap.newInstance(url: "/" + childEvent.controllerName + "/" + childEvent.actionName, configAttribute: 'ROLE_SUPER_ADMIN').save(flush: true, failOnError: true)
                            }
                        }

                    }

                }
            }
        }

        println "Request Map code complete"


    }

    def createCountryList() {
        def bangladesh = Country.findByName("BANGLADESH")
        if (!bangladesh) {
            bangladesh = new Country(name: "BANGLADESH", printablename: "Bangladesh", iso2: "BD", iso3: "BGD", numcode: 50,status: true).save(failOnError: true)
        }

        def afghanistan = Country.findByName("AFGHANISTAN")
        if (!afghanistan) {
            afghanistan = new Country(name: "AFGHANISTAN", printablename: "Afghanistan", iso2: "AF", iso3: "AFG", numcode: 4,status: true).save(failOnError: true)
        }

        def nigeria = Country.findByName("NIGERIA")
        if (!nigeria) {
            nigeria = new Country(name: "NIGERIA", printablename: "Nigeria", iso2: "NI", iso3: "NIG", numcode: 12,status: true).save(failOnError: true)
        }
    }

    def createCurrencyList() {
        def bangladesh = Country.findByName("BANGLADESH")
        def bangladeshiTaka = Currencys.findByNameAndCountry("Bangladeshi taka", bangladesh)
        if (!bangladeshiTaka) {
            bangladeshiTaka = new Currencys(name: "Bangladeshi taka", abbreviation: "Bangladeshi taka", symbol: "Ta", country: bangladesh, hundredName: "Paisa",status: true).save(failOnError: true)
        }

        def afghanistan = Country.findByName("AFGHANISTAN")
        def afghanAfghani = Currencys.findByNameAndCountry("Afghan afghani", afghanistan)
        if (!afghanAfghani) {
            afghanAfghani = new Currencys(name: "Afghan afghani", abbreviation: "Afghan afghani", symbol: "Af", country: afghanistan, hundredName: "Pul",status: true).save(failOnError: true)
        }

        def nigeria = Country.findByName("NIGERIA")
        def nigerianNaira = Currencys.findByNameAndCountry("Nigerian naira", nigeria)
        if (!nigerianNaira) {
            nigerianNaira = new Currencys(name: "Nigerian naira", abbreviation: "Nigerian naira", symbol: "NGN", country: nigeria, hundredName: "Kobo",status: true).save(failOnError: true)
        }
    }

    def createCityAndState() {
        //State of Bangladesh
        def bangladesh = Country.findByName("BANGLADESH")

        def dhaka = State.findByNameAndCountry("Dhaka", bangladesh) ?: new State(name: "Dhaka", country: bangladesh).save(failOnError: true)
        def chittagong = State.findByNameAndCountry("Chittagong", bangladesh) ?: new State(name: "Chittagong", country: bangladesh).save(failOnError: true)
        def shylet = State.findByNameAndCountry("Shylet", bangladesh) ?: new State(name: "Shylet", country: bangladesh).save(failOnError: true)

        //State of Afghanistan
        def afghanistan = Country.findByName("AFGHANISTAN")

        def kabul = State.findByNameAndCountry("Kabul", afghanistan) ?: new State(name: "Kabul", country: afghanistan).save(failOnError: true)
        def ghazni = State.findByNameAndCountry("Ghazni", afghanistan) ?: new State(name: "Ghazni", country: afghanistan).save(failOnError: true)
        def baghlan = State.findByNameAndCountry("Baghlan", afghanistan) ?: new State(name: "Baghlan", country: afghanistan).save(failOnError: true)

        //State of Nigeria
        def nigeria = Country.findByName("NIGERIA")

        def bauchi = State.findByNameAndCountry("Bauchi", nigeria) ?: new State(name: "Bauchi", country: nigeria).save(failOnError: true)
        def benin = State.findByNameAndCountry("Benin", nigeria) ?: new State(name: "Benin", country: nigeria).save(failOnError: true)
        def calabar = State.findByNameAndCountry("Calabar", nigeria) ?: new State(name: "Calabar", country: nigeria).save(failOnError: true)
    }

    def bankSetupInfo() {
        def bangladeshiTaka = Currencys.findByName("Bangladeshi taka")
        def nigeria = Country.findByName("NIGERIA")
        def bauchi = State.findByNameAndCountry("Bauchi", nigeria)

        def banketup = BankSetup.findByBankFullName("OrosCapital")
        if (!banketup) {
            banketup = new BankSetup(bankFullName: "OrosCapital", fileDir: 'orosCapital', bankShortName: "OrosCapital", chamberCommerceNo: "10000", currencys: bangladeshiTaka, bankDateFormat: "DDMMYYYY", amntDeciPoint: 1, dateSeparator: "/", deciRoundType: "Floor", decimalSeparator: ",", percentageDeciPoint: 1, language: "English", numOfBookingPeriod: 10, qtyDeciPoint: 1, reportPageSize: "A4", showGlCodeInReport: true, showItemCodeInReport: true, taxType: "5.0", thousandSeparator: ",", reportDateFormat: "DDMMYYYY", taxNo: "1000", vatNo: "2010", paymentTerm: "Cash", defaultVat: "10%", incomeTaxReservation: 1234, unforeseenExpenseReservation: 1245, invoiceMoment: "Invoice").save(failOnError: true)
            Address generalAdd = new Address(country: nigeria, state: bauchi, city: "Niger", email1: "oroscapital@gmail.com", email2: "oroscapital@hotmail.com", faxNo: "12457896", mobileNo: "04515548781", phoneNo: "451265789", websiteUrl: "https://www.google.com.bd", streetName: "StreetName", zipCode: "123456", addressLine1: "Address", addressType: AddressType.GENERAL).save(failOnError: true)
            banketup.addToGeneralAdd(generalAdd)
            Address postalAdd = new Address(country: nigeria, state: bauchi, city: "Niger", postCode: "123456", streetName: "StreetName", addressLine2: "Address", addressType: AddressType.POSTAL).save(failOnError: true)
            banketup.addToPostalAdd(postalAdd)
        }
    }


    def createVatCategoryList() {
        VatCategory.findByNameAndRate("High", "10%") ?: new VatCategory(name: "High", rate: "10%").save(failOnError: true)
        VatCategory.findByNameAndRate("Low", "5%") ?: new VatCategory(name: "Low", rate: "5%").save(failOnError: true)
    }

    def createChartClassTypeList() {
        ChartClassType.findByClassTypeAndStatus("Assets", 1) ?: new ChartClassType(classType: "Assets", status: 1).save(failOnError: true)
        ChartClassType.findByClassTypeAndStatus("Liabilities", 1) ?: new ChartClassType(classType: "Liabilities", status: 1).save(failOnError: true)
        ChartClassType.findByClassTypeAndStatus("Equity", 1) ?: new ChartClassType(classType: "Equity", status: 1).save(failOnError: true)
        ChartClassType.findByClassTypeAndStatus("Income", 1) ?: new ChartClassType(classType: "Income", status: 1).save(failOnError: true)
        ChartClassType.findByClassTypeAndStatus("Cost of Goods Sold", 1) ?: new ChartClassType(classType: "Cost of Goods Sold", status: 1).save(failOnError: true)
        ChartClassType.findByClassTypeAndStatus("Expanse", 1) ?: new ChartClassType(classType: "Expanse", status: 1).save(failOnError: true)

    }

    def createPaymentTermsList() {
        PaymentTerms.findByPaymentTermName("1SS week") ?: new PaymentTerms(paymentTermName: "1SS week").save(failOnError: true)
        PaymentTerms.findByPaymentTermName("2SS week") ?: new PaymentTerms(paymentTermName: "2SS week").save(failOnError: true)
        PaymentTerms.findByPaymentTermName("3SS week") ?: new PaymentTerms(paymentTermName: "3SS week").save(failOnError: true)
    }

    def bankListWithBranch(){

        Bank orosCap = Bank.findByName("OrosCapital")
        if (!orosCap) {
            orosCap = new Bank(name: 'OrosCapital').save(failOnError: true)
        }
            Branch branch1 = Branch.findByBankAndName(orosCap, 'Dhanmondi')
            if(!branch1){
                branch1 = new Branch(bank: orosCap, name: 'Dhanmondi').save(failOnError: true)
            }
            Branch branch2 = Branch.findByBankAndName(orosCap, 'Motijheel')
            if(!branch2){
                branch2 = new Branch(bank: orosCap, name: 'Motijheel').save(failOnError: true)
            }

        Bank hsbc = Bank.findByName("HSBC")
        if (!hsbc) {
            hsbc =new Bank(name: 'HSBC').save(failOnError: true)
        }
            Branch branch3 = Branch.findByBankAndName(hsbc, 'Gulshan')
            if(!branch3){
                branch3 = new Branch(bank: hsbc, name: 'Gulshan').save(failOnError: true)
            }
            Branch branch4 = Branch.findByBankAndName(hsbc, 'Uttora')
            if(!branch4){
                branch4 = new Branch(bank: hsbc, name: 'Uttora').save(failOnError: true)
            }


        Bank stanCart = Bank.findByName("Standard Charted")
        if (!stanCart) {
            stanCart =new Bank(name: 'Standard Charted').save(failOnError: true)
        }

            Branch branch5 = Branch.findByBankAndName(stanCart, 'Mirpure')
            if(!branch5){
                branch5 = new Branch(bank: stanCart, name: 'Mirpure').save(failOnError: true)
            }
            Branch branch6 = Branch.findByBankAndName(stanCart, 'Shantinagor')
            if(!branch6){
                branch6 = new Branch(bank: stanCart, name: 'Shantinagor').save(failOnError: true)
            }

    }
    def mkBaseImageDir(){
        try{
            def basePath =grailsApplication.config.imageindirect.basePath
            // If it doesn't exist
            File file = new File(basePath.toString())
            if( !file.exists() ) {
                // Create all folders up-to and including B
                file.mkdirs()
            }
            println(basePath+" created")
        }catch (Exception ex){
            ex.printStackTrace()
        }

    }







    def destroy = {
    }
}
