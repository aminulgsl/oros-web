package com.gsl.oros.core.banking.accounting

import com.gsl.oros.core.banking.product.accounting.ChartClassUtility
import com.gsl.oros.core.banking.settings.ChartClass
import com.gsl.oros.core.banking.settings.ChartClassType
import grails.converters.JSON


class ChartClassController {

    private static final String ID = 'id'
    private static final String CLASS_TYPE = 'classType'
    private static final String ASC = 'asc'

    def index() {
        render(template: '/coreBanking/settings/accounting/chart/chartClassList')
    }


    def create(){
        List<ChartClassType> chartClassTypeList = ChartClassType.list(sort :CLASS_TYPE, order : ASC, readOnly :true)
        render (template: '/coreBanking/settings/accounting/chart/createChartClass',
                model: [chartClassTypeList: chartClassTypeList])
    }

    def save(ChartClassCommand chartClassCommand) {
        if (request.method == "POST") {
            def chartClass = new ChartClass(params)
            Long id = params.getLong(ID)
            chartClass.id = id
            List<ChartClassType> chartClassTypeList = ChartClassType.list(sort :CLASS_TYPE, order : ASC, readOnly :true)
            // :::: Save ::::
            if (id == null && !chartClassCommand.hasErrors()) {
                    if(chartClass.validate() && chartClass.save(flush: true)){
                    flash.message = "Chart Class Add Successfully"
                    //redirect(controller: 'chartClass', action: "create")
                    render(template: '/coreBanking/settings/accounting/chart/chartClassList')
                    return
                }
            }
            else if (id != null  && !chartClassCommand.hasErrors()){
                if(chartClass.validate()){
                    def chartClassEdit = chartClass.get(id)
                    chartClassEdit.properties = chartClass
                    if (chartClassEdit.save(flush: true)){
                        flash.message = "Chart Class Update Successfully"
                        render(template: '/coreBanking/settings/accounting/chart/chartClassList')
                        return
                    }
                }
            }
            else{
                render (template: '/coreBanking/settings/accounting/chart/createChartClass',
                        model: [chartClassTypeList: chartClassTypeList, chartClassCommand: chartClassCommand,chartClass:chartClass])
            }
        }
    }


    def edit(){
        Long id = params.getLong(ID)
        ChartClass chartClass = ChartClass.get(id)
        if (!chartClass) {
            flash.message = "Chart Class not found"
            render(template: '/coreBanking/settings/accounting/chart/chartClassList')
            return
        }

        List<ChartClassType> chartClassTypeList = ChartClassType.list(sort :CLASS_TYPE, order : ASC, readOnly :true)
        render (template: "/coreBanking/settings/accounting/chart/createChartClass",
                model: [chartClass: chartClass, chartClassTypeList : chartClassTypeList ])
    }

    def delete(){
        Long id = params.getLong(ID)
        ChartClass chartClass = ChartClass.get(id)
        if (!chartClass) {
            flash.message = "Chart Class not found"
            render(template: '/coreBanking/settings/accounting/chart/chartClassList')
            return
        }
        chartClass.status = 0
        chartClass.save(flush: true)
        flash.message = "Chart Class deleted successfully"
        render(template: '/coreBanking/settings/accounting/chart/chartClassList')
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
        String sortColumn = ChartClassUtility.getSortColumn(iSortingCol)
        List dataReturns = new ArrayList()
        def c = ChartClass.createCriteria()
        def results = c.list (max: iDisplayLength, offset:iDisplayStart) {
            and {
                eq("status", 1)
            }
            if(sSearch){
                or {
                    ilike('name',sSearch)
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
            results.each {ChartClass chartClass ->
                if(sSortDir.equalsIgnoreCase('asc')){
                    serial++
                }else{
                    serial--
                }
                dataReturns.add([DT_RowId:chartClass.id,0:serial,1:chartClass.name,2:chartClass.accountantName,3:chartClass.chartClassType.classType,4:''])
            }
        }
        Map gridData =[iTotalRecords:totalCount,iTotalDisplayRecords:totalCount,aaData:dataReturns]
        String result = gridData as JSON
        println(result)
        render result
    }
}

class ChartClassCommand {
    Long id
    String name
    Integer chartClassType
    Integer status


    static constraints = {
        /*name blank: false, nullable: false*/
        name blank: false, nullable: false, validator: { value, chartClass ->
            def id = chartClass.id as Long
            if(id == null){
                def result = ChartClass.findByName(value)
                if(result){
                    return 'chart.chartClass.name.unique'
                }
            }
            else if(id != null){
                def result  = ChartClass.findByNameIlikeAndIdNotEqual(value,id)
                if(result){
                    return 'chart.chartClass.name.unique'
                }
            }
        }
        status blank:false, nullable: false
        chartClassType blank: false, nullable: false
    }
}
