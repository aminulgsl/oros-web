package com.gsl.oros.core.banking.product

/**
 * Created with IntelliJ IDEA.
 * User: Sanin
 * Date: 4/21/14
 * Time: 6:57 PM
 * To change this template use File | Settings | File Templates.
 */
class ProductUtility {
    static final String[] templateList = ['mainParameters', 'transactions', 'fees', 'overdraft','termSetup'];
    static final String[] sortColumns = ['id','productName','productCode']
    public static String getSortColumn(int idx){
        int columnCounts = sortColumns.length
        if(idx>0 && idx<columnCounts){
            return sortColumns[idx]
        }
        return sortColumns[0]
    }
}
