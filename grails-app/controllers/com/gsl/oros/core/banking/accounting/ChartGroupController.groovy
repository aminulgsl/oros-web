package com.gsl.oros.core.banking.accounting

import com.gsl.oros.core.banking.product.accounting.ChartGroupUtility

// import chart Class
import com.gsl.oros.core.banking.settings.accounting.ChartClass

// import chart group
import com.gsl.oros.core.banking.settings.accounting.ChartGroup
import grails.converters.JSON


class ChartGroupController {

    private static final String ID = 'id'
    private static final String sortColumn = 'name'
    private static final String ASC = 'asc'

    def index() {
        render (template: '/coreBanking/settings/accounting/chart/chartGroupList')
    }


    def create(){

        Long id = params.getLong(ID)
        def parentGroup = null
        if(id != null){
            parentGroup = ChartGroup.get(id)
        }

        List<ChartClass> chartClassList = ChartClass.list(sort :sortColumn, order : ASC, readOnly :true)
        List<ChartGroup> chartGroupList = ChartGroup.list(sort :sortColumn, order : ASC, readOnly :true)
        render (template: '/coreBanking/settings/accounting/chart/createChartGroup',
                model: [chartClassList: chartClassList, parentGroup:parentGroup, chartGroupList:chartGroupList])
    }

    def subGroupCreate(){

        Long id = params.getLong(ID)
        def parentGroup = null
        if(id != null){
            parentGroup = ChartGroup.get(id)
        }

        List<ChartClass> chartClassList = ChartClass.list(sort :sortColumn, order : ASC, readOnly :true)
        List<ChartGroup> chartGroupList = ChartGroup.list(sort :sortColumn, order : ASC, readOnly :true)
        render (template: '/coreBanking/settings/accounting/chart/createChartGroup',
                model: [chartClassList: chartClassList, parentGroup:parentGroup, chartGroupList:chartGroupList])
    }



    def save(ChartGroupCommand chartGroupCommand) {
        if (request.method == 'POST') {
            Long id = params.getLong(ID)
            def chartGroup = new ChartGroup(params)
            List<ChartClass> chartClassList = ChartClass.list(sort :sortColumn, order : ASC, readOnly :true)
            // ::: Save  :::
            if (id == null && !chartGroupCommand.hasErrors()){
                if(chartGroup.validate() && chartGroup.save(flush: true)){
                    flash.message = "Chart Group Add Successfully"
                    render (template: '/coreBanking/settings/accounting/chart/chartGroupList')
                }
            }
            // :::: Update ::::
            else if (id != null && !chartGroupCommand.hasErrors()){
                def chartGroupEdit = chartGroup.get(id)
                chartGroupEdit.properties = chartGroup
                if (chartGroupEdit.save(flush: true)){
                    flash.message = "Chart Group Update Successfully"
                    render (template: '/coreBanking/settings/accounting/chart/chartGroupList')
                }
                else {
                    chartGroup.id = id
                    render (template: '/coreBanking/settings/accounting/chart/createChartGroup',
                            model: [chartGroup:chartGroup, chartGroupCommand:chartGroupCommand, chartClassList: chartClassList]) /*chartClass:chartClass*/
                }
            }
            else{
                chartGroup.id = id
                render (template: '/coreBanking/settings/accounting/chart/createChartGroup',
                        model: [chartGroup:chartGroup, chartGroupCommand:chartGroupCommand, chartClassList: chartClassList]) /*chartClass:chartClass*/
            }
        }
    }

    def edit(){
        Long id = params.getLong(ID)
        ChartGroup chartGroup = ChartGroup.get(id)
        if (!chartGroup) {
            flash.message = "Chart Group not found"
            render (template: '/coreBanking/settings/accounting/chart/chartGroupList')
            return
        }

        List<ChartClass> chartClassList = ChartClass.list(sort: sortColumn, order : ASC, readOnly :true)
        render (template: "/coreBanking/settings/accounting/chart/createChartGroup",
                model: [chartGroup: chartGroup, chartClassList: chartClassList])
    }

    def delete(){
        Long id = params.getLong(ID)
        ChartGroup chartGroup = ChartGroup.get(id)
        if (!chartGroup) {
            flash.message = "Chart Group not found"
            render(template: '/coreBanking/settings/accounting/chart/chartGroupList')
            return
        }
        chartGroup.status = 0
        chartGroup.save(flush: true)
        flash.message = "Chart Group deleted successfully"
        render(template: '/coreBanking/settings/accounting/chart/chartGroupList')
    }

    def list(){
        println(params)
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
        String sortColumn = ChartGroupUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()
        def c = ChartGroup.createCriteria()
        def results = c.list (max: iDisplayLength, offset:iDisplayStart) {
            and {
                eq("status", 1)
            }
            if(sSearch){
                or {
                    ilike('name',sSearch)
                    ilike('accountantName',sSearch)
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
            results.each {ChartGroup chartGroup ->
                if(sSortDir.equalsIgnoreCase('asc')){
                    serial++
                }else{
                    serial--
                }
                dataReturns.add([DT_RowId:chartGroup.id,0:serial,1:chartGroup.name,2:chartGroup.accountantName,3:chartGroup.chartClass.name,4:''])
            }
        }
        Map gridData =[iTotalRecords:totalCount,iTotalDisplayRecords:totalCount,aaData:dataReturns]
        String result = gridData as JSON
        println(result)
        render result
    }


}

class ChartGroupCommand {
    Long id
    String name
    Integer status
    Integer chartClass

    static constraints = {
        name blank: false, nullable: false, validator: { value, chartGroup ->
            def id = chartGroup.id as Long
            if(id == null){
                def result = ChartGroup.findByName(value)
                if(result){
                    return 'chart.chartGroup.name.unique'
                }
            }
            else if(id != null){
                def result  = ChartGroup.findByNameIlikeAndIdNotEqual(value,id)
                if(result){
                    return 'chart.chartGroup.name.unique'
                }
            }
        }
        status blank: false, nullable: false
        chartClass blank:false,nullable: false
    }
}

