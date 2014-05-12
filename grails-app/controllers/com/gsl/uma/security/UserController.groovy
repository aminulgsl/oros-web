package com.gsl.uma.security

import grails.converters.JSON

class UserController {
    def springSecurityService

    def index() {
        render (template: 'userList')
    }
    def create() {
        /*if(true){
            response.sendError(403)
            return
        }*/
        render (template: 'showUserCreate')
    }
    def save(UserCommand userCommand) {
        if (!request.method == 'POST') {
            render (template: 'userList')
            return
        }
        if (userCommand.hasErrors()) {
            render (view: '_showUserCreate',model:[user: userCommand])
            return
        }
        User user
        User savedUser
        if(params.id){      // Update User
            user = User.get(userCommand.id)
            if(!user){
                flash.message = "User not found"
                render (template: 'userList')
            }
            user.properties = userCommand.properties
            if (!user.validate()) {
                render (view: '_showUserCreate',model:[user: user])
                return
            }
            savedUser = user.save(flush: true)
            if (!savedUser) {
                render (view: '_showUserCreate',model:[user: savedUser])
                return
            }
            flash.message = "User Updated successfully"
            render (template: 'userList')
            return
        }


        user = new User(userCommand.properties)
            if (!user.validate()) {
                render (view: '_showUserCreate',model:[user: user])
                return
            }


        savedUser = user.save(flush: true)
        if (!savedUser) {
            render (view: '_showUserCreate',model:[user: savedUser])
            return
        }
        Role role = userCommand.role

        new UserRole(user: savedUser,role: role).save()
        flash.message = "User created successfully"
        render (template: 'userList')
    }
    def edit(Long id) {
        User user = User.read(id)
        if (!user){
            flash.message = "User not found"
            render (template: 'userList')
        }
        render (template: 'showUserCreate', model: [user:user])
    }
    def delete(Long id) {
        User user = User.get(id)
        if (!user){
            flash.message = "User not found"
            render (template: 'userList')
        }
        user.status = false
        user.save()
        flash.message = "User deleted successfully"
        render (template: 'userList')
    }

    def list() {
        int sEcho = params.sEcho?params.getInt('sEcho'):1
        int iDisplayStart = params.iDisplayStart? params.getInt('iDisplayStart'):0
        int iDisplayLength = params.iDisplayLength? params.getInt('iDisplayLength'):10
        String sSortDir = params.sSortDir_0? params.sSortDir_0:'asc'
        int iSortingCol = params.iSortingCols? params.getInt('iSortingCols'):1
        //Search string, use or logic to all fields that required to include
        String sSearch = params.sSearch?params.sSearch:null
        if(sSearch){
            sSearch = "%"+sSearch+"%"
        }
        String sortColumn = UmaUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()
        String loggedUserName = springSecurityService.principal.username
        def c = User.createCriteria()
        def results = c.list (max: iDisplayLength, offset:iDisplayStart) {
            and {
                'ne'('username',loggedUserName)
                eq("status", true)
            }
            if(sSearch){
                or {
                    ilike('username',sSearch)
                    ilike('email',sSearch)
                }
            }
            order(sortColumn, sSortDir)
        }
        int totalCount = results.totalCount
        int serial = iDisplayStart;
        if(totalCount>0){
            if(sSortDir.equalsIgnoreCase('desc')){
                serial =(totalCount+1)-iDisplayStart
            }
            results.each {User user ->
                if(sSortDir.equalsIgnoreCase('asc')){
                    serial++
                }else{
                    serial--
                }
                dataReturns.add([DT_RowId:user.id,0:serial,1:user.username,2:user.email,3:user.enabled?"Enabled":"Disabled",4:user.accountLocked?"Lock":"Open",5:''])
            }
        }

        Map gridData =[iTotalRecords:totalCount,iTotalDisplayRecords:totalCount,aaData:dataReturns]
        String result = gridData as JSON
        render result
    }

}

class UserCommand {
    Long id
    String username
    String email
    String password
    String confirm
    boolean enabled
    Role role

    static constraints = {
        username nullable: false
        /*, validator: { val, obj ->
            if (User.findAllByUsername(val)!=null){
                return "uma.security.user.username.already.exist"
            }
        }*/
        email nullable: false, email: true/*, validator: { val, obj ->
            if (User.findAllByEmail(val)!=null){
                return "uma.security.user.email.already.exist"
            }
        }*/
        password blank: false, nullable: false
        confirm blank: false, nullable: false, validator: {val, obj ->
            if (val != obj.password){
                return "uma.security.user.confirm.not.match"
            }
        }
      /*  role validator: {val, obj ->
            if (UserRole.findAllByRoleAndUser(val,User.findByUsername(obj.username))!=null){
                return "uma.security.user.with.role.exist"
            }
        }*/
    }
}
