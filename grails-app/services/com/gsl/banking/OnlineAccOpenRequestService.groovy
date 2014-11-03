package com.gsl.banking

import com.gsl.cbs.contraints.enums.RequestStatus
import com.gsl.oros.banking.common.CommonUtility
import com.gsl.oros.core.banking.AccOpenRequest
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class OnlineAccOpenRequestService {

    static final String[] sortColumns = ['id','personalInfo','accountType','productName','requestDate']

    LinkedHashMap onlineRequestPaginateList(GrailsParameterMap params){
        int iDisplayStart = params.iDisplayStart ? params.getInt('iDisplayStart') : CommonUtility.DEFAULT_PAGINATION_START
        int iDisplayLength = params.iDisplayLength ? params.getInt('iDisplayLength') : CommonUtility.DEFAULT_PAGINATION_LENGTH
        String sSortDir = params.sSortDir_0 ? params.sSortDir_0 : CommonUtility.DEFAULT_PAGINATION_SORT_ORDER
        int iSortingCol = params.iSortingCols ? params.getInt('iSortingCols') : CommonUtility.DEFAULT_PAGINATION_SORT_IDX
        //Search string, use or logic to all fields that required to include
        String sSearch = params.sSearch ? params.sSearch : null
        if (sSearch) {
            sSearch = CommonUtility.PERCENTAGE_SIGN + sSearch + CommonUtility.PERCENTAGE_SIGN
        }
        String sortColumn = CommonUtility.getSortColumn(sortColumns,iSortingCol)
        List dataReturns = new ArrayList()
        def a = AccOpenRequest.createCriteria()
        def results = a.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("status", RequestStatus.SUBMITTED)
            }
            if (sSearch) {
                or {
                    ilike('personalInfo', sSearch)
                    ilike('productName', sSearch)
//                    ilike('nationality', sSearch)
                }
            }
            order(sortColumn, sSortDir)
        }
        int totalCount = results.totalCount
        int serial = iDisplayStart;
        if (totalCount > 0) {
            if (sSortDir.equals(CommonUtility.SORT_ORDER_DESC)) {
                serial = (totalCount + 1) - iDisplayStart
            }
            results.each { AccOpenRequest accOpenRequest ->
                if (sSortDir.equals(CommonUtility.SORT_ORDER_ASC)) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: accOpenRequest.id, 0: serial, 1: accOpenRequest.personalInfo.name, 2: accOpenRequest.accountType, 3: accOpenRequest.productName, 4: accOpenRequest.requestDate, 5: ''])
            }
        }
        return [totalCount:totalCount,results:dataReturns]
    }
}
