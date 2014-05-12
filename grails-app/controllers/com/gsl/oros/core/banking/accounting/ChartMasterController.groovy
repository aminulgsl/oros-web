package com.gsl.oros.core.banking.accounting

import com.gsl.oros.core.banking.settings.ChartClass
import com.gsl.oros.core.banking.settings.accounting.ChartGroup
import com.gsl.oros.core.banking.settings.accounting.ChartMaster
import com.gsl.oros.core.banking.settings.accounting.VatCategory

class ChartMasterController {

    private static final String ID = 'id'
    private static final String sortColumn = 'name'
    private static final String ASC = 'asc'



    def index() {}

    def create(){
        def chartGroup = null
        Long id = params.getLong(ID)
        if(id != null){
            chartGroup = ChartGroup.get(id)
        }

        List<VatCategory> vatCategoryList = VatCategory.list(sort :sortColumn, order : ASC, readOnly :true)
        render (template: '/coreBanking/settings/accounting/chart/createChartMaster',
                model: [chartGroup:chartGroup,vatCategoryList:vatCategoryList])
    }

    def save(ChartMasterCommand chartMasterCommand) {
        if (request.method == 'POST') {
            Long id = params.getLong(ID)
            def chartMaster = new ChartMaster(params)
            List<VatCategory> vatCategoryList = VatCategory.list(sort :sortColumn, order : ASC, readOnly :true)

            // :::: Save ::::
            if (id == null  && !chartMasterCommand.hasErrors()){
                if(chartMaster.validate() && chartMaster.save(flush: true)){
                    flash.message = "Chart Master Add Successfully"
                    redirect(action: "treeView")
                }else {
                    render (template: '/coreBanking/settings/accounting/chart/createChartMaster',
                            model: [chartMaster:chartMaster, chartMasterCommand: chartMasterCommand, vatCategoryList:vatCategoryList])
                }
            }
            // :::: Update ::::
            else if (id != null && !chartMasterCommand.hasErrors()){
                def chartMasterEdit = chartMaster.get(id)
                chartMasterEdit.properties = chartMaster
                if(chartMasterEdit.validate() && chartMasterEdit.save(flush: true)){
                    flash.message = "Chart Master Update Successfully"
                    redirect(action: 'treeView')
                }else {
                    chartMaster.id = id
                    render (template: '/coreBanking/settings/accounting/chart/createChartMaster',
                            model: [chartMaster:chartMaster, chartMasterCommand: chartMasterCommand,vatCategoryList:vatCategoryList])
                }
            }
            else {
                chartMaster.id = id
                render (template: '/coreBanking/settings/accounting/chart/createChartMaster',
                        model: [chartMaster:chartMaster, chartMasterCommand: chartMasterCommand, vatCategoryList:vatCategoryList])
            }
        }
    }

    def edit(){
        Long id = params.getLong(ID)
        ChartMaster chartMaster = ChartMaster.get(id)
        List<ChartGroup> chartGroupList = ChartGroup.list(sort :sortColumn, order : ASC, readOnly :true)
        List<VatCategory> vatCategoryList = VatCategory.list(sort :sortColumn, order : ASC, readOnly :true)
        render (template: "/coreBanking/settings/accounting/chart/createChartMaster",
                model: [chartMaster : chartMaster,chartGroupList : chartGroupList, vatCategoryList:vatCategoryList])
    }

    def view(){
        Long id = params.getLong(ID)
        ChartMaster chartMaster = ChartMaster.get(id)
        List<ChartGroup> chartGroupList = ChartGroup.list(sort :sortColumn, order : ASC, readOnly :true)
        List<VatCategory> vatCategoryList = VatCategory.list(sort :sortColumn, order : ASC, readOnly :true)
        render (template: "/coreBanking/settings/accounting/chart/viewChartMaster",
                model: [chartMaster : chartMaster,chartGroupList : chartGroupList, vatCategoryList:vatCategoryList])
    }


    def treeView(){
        List<ChartClass> chartClassLists = ChartClass.list(sort :sortColumn, order : ASC, readOnly :true)
        render (template: "/coreBanking/settings/accounting/chart/chartTreeView",
                model: [chartClassLists : chartClassLists])
    }
}

class ChartMasterCommand {
    Long id
    String accountCode
    String accountName
    Integer status
    Integer vatCategory

    static constraints = {
        accountCode blank: false, nullable: false, validator: { value, chartMaster ->
            def id = chartMaster.id as Long
            if(id == null){
                def result = ChartMaster.findByAccountCode(value)
                if(result){
                    return 'chart.chartMaster.accountCode.unique'
                }
            }
            else if(id != null){
                def result  = ChartMaster.findByAccountCodeIlikeAndIdNotEqual(value,id)
                if(result){
                    return 'chart.chartMaster.accountCode.unique'
                }
            }
        }

        accountName blank: false, nullable: false, validator: { value, chartMaster ->
            def id = chartMaster.id as Long
            if(id == null){
                def result = ChartMaster.findByAccountName(value)
                if(result){
                    return 'chart.chartMaster.accountName.unique'
                }
            }
            else if(id != null){
                def result  = ChartMaster.findByAccountNameIlikeAndIdNotEqual(value,id)
                if(result){
                    return 'chart.chartMaster.accountName.unique'
                }
            }
        }
        status blank: false, nullable: false
        vatCategory blank:false
    }
}
