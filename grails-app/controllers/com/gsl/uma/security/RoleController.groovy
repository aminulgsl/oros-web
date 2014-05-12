package com.gsl.uma.security

import grails.converters.JSON

class RoleController {
    def springSecurityService
    def index() {
        render (template: 'roleList')
    }
    def create() {
        render (template: 'showRoleCreate')
    }
    def save(RoleCommand roleCommand) {
        if (request.method == 'POST') {
                if (roleCommand.hasErrors()) {
                    render (template: 'showRoleCreate',model:[role: roleCommand])
                    return
                }
            if(params.id){
                Role role = Role.get(roleCommand.id)
                if(!role){
                    flash.message = "Role not found"
                    render (template: 'roleList')
                }
                role.properties = roleCommand.properties
                if (!role.validate()) {
                    render (template: 'showRoleCreate',model:[role: roleCommand])
                    return
                }
                Role savedRole = role.save(flush: true)
                if (!savedRole) {
                    render (template: 'showRoleCreate',model:[role: role])
                    return
                }
                flash.message = "Role Updated successfully"
                render (template: 'roleList')
                return
            }
            Role role = new Role(authority: roleCommand.authority.toUpperCase())
             if (!role.validate() || !role.save()) {
                 render (template: 'showRoleCreate',model:[role: roleCommand])
                 return
             }
             flash.message = "Role Saved successfully"
            render (template: 'roleList')
            return
        }
        render (template: 'roleList')
    }
    def edit(Long id) {
        Role role = Role.read(id)
        if (!role){
            flash.message = "Role not found"
            render (template: 'roleList')
        }
        render (template: 'showRoleCreate', model: [role: role])
    }
    def delete(Long id) {
        Role role =Role.get(id)
        if (!role){
            flash.message = "Role not found"
            render (template: 'roleList')
        }
        role.status = false
        role.save()
        flash.message = "Role deleted successfully"
        render (template: 'userList')
    }
    def list() {
        int sEcho = params.sEcho?params.getInt('sEcho'):1
        int iDisplayStart = params.iDisplayStart? params.getInt('iDisplayStart'):0
        int iDisplayLength = params.iDisplayLength? params.getInt('iDisplayLength'):10
        String sSortDir = params.sSortDir_0? params.sSortDir_0:'asc'
        int iSortingCol = params.iSortingCols? params.getInt('iSortingCols'):1
        String sortColumn = 'authority'
        List dataReturns = new ArrayList()
//        String loggedUserName = springSecurityService.principal.username
        List<Role> roles = Role.withCriteria {
            eq('status',true)
            firstResult(iDisplayStart)
            maxResults(iDisplayLength)
            order(sortColumn, sSortDir)
        }

        //list(status:true, offset: iDisplayStart, max: iDisplayLength)
        roles.each {Role role ->
            dataReturns.add([DT_RowId:role.id,0:++iDisplayStart,1:role.authority,2:''])
        }
        Map gridData =[iTotalRecords:Role.count,iTotalDisplayRecords:Role.count,aaData:dataReturns]
        String result = gridData as JSON
        render result
    }

    def roleRight(Long moduleId, Long roleId){
        render (view: 'roleRightForm')
    }
    def saveRoleRight(){

        /*boolean available = false
        if (request.method == 'POST') {
            def startTime = System.nanoTime()
            String accessMapping = params.accessMapping
            String authority = params.authority
            Role forRole = Role.findByAuthority(authority)
            if(!forRole){
                String output = [available:true] as JSON
                render output
                return
            }
            if(StringUtils.isNotEmpty(accessMapping)){
               String[] requestObjs = StringUtils.split(accessMapping,"^")
                Long reObjId
                Boolean accessRight
                RequestMap domainObj
                RequestMap childObj
                int requestObjLenght =requestObjs.length
                for(int i=0; i<requestObjLenght; i++){
                    String[] requestObj = StringUtils.split(requestObjs[i],"_")
                    reObjId = requestObj[0].toLong()
                    accessRight = requestObj[1].toBoolean()
                    domainObj = RequestMap.get(reObjId)
//                  //Code to replace the authority
                      domainObj.configAttribute = UmaUtility.buildAccessUrl(domainObj.configAttribute,accessRight,forRole.authority)
                    domainObj.save()
                    if (domainObj.eventId){
                        def subEvents = RequestMap.findAllByChildOfAndAutoPermit(domainObj.eventId,true)
                        subEvents.each {RequestMap rMap ->
                            childObj = RequestMap.get(rMap.id)
                            if (childObj){
                                childObj.configAttribute = UmaUtility.buildAccessUrl(childObj.configAttribute,accessRight,forRole.authority)
                                childObj.save()
                            }
                        }
                    }
                }
                springSecurityService.clearCachedRequestmaps()
                def endTime = System.nanoTime()
                def diff = (endTime-startTime)/1000000000
                println("Total time taken for updating ${requestObjLenght} request map object: ${diff} s")
            }

            String output = [available:true,message:"Updated Access Right successfully"] as JSON
            render output
            return
        }
        String output = [available:false] as JSON
        render output*/
    }

}
class RoleCommand {
    Long id
    String authority

    static constraints = {
        authority nullable: false, unique: true, validator: { val, obj ->
            if( !val.toUpperCase().startsWith('ROLE_') ){
                return "com.gsl.uma.security.authority.name.invalid"
            }
            /*if (obj.id == null && Role.findAllByAuthority(val.toUpperCase())!=null){
                return "com.gsl.uma.security.authority.already.exist"
            }*/
        }
    }
}
