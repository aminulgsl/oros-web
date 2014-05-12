package com.gsl.oros.core.banking.product.accounting

import org.apache.commons.lang.ArrayUtils
import org.apache.commons.lang.StringUtils

/**
 * Created with IntelliJ IDEA.
 * User: GS
 * Date: 4/27/14
 * Time: 3:19 PM
 * To change this template use File | Settings | File Templates.
 */
class ChartClassUtility {
    static final String[] sortColumns = ['id','name','accountantName','chartClassType']
    public static String getSortColumn(int idx){
        int columnCounts = sortColumns.length
        if(idx>0 && idx<columnCounts){
            return sortColumns[idx]
        }
        return sortColumns[0]
    }

    public static String buildAccessUrl(String original, boolean allowAccess, String authority){
        String returnStr = "permitAll"
        String[] returnArray = null
        try{
            String[] arrayFromOriginal = StringUtils.split(original,",")
            if(!allowAccess){
                returnArray = ArrayUtils.removeElement(arrayFromOriginal,authority)
            } else {
                if(!ArrayUtils.contains(arrayFromOriginal,authority)){
                    returnArray = ArrayUtils.removeElement(arrayFromOriginal,"permitAll")
                    returnArray= ArrayUtils.add(arrayFromOriginal,authority)
                }
            }
            if(returnArray !=null && returnArray.length>0){
                returnStr = StringUtils.join(returnArray,",")
            }
        }catch(Exception ex){
            println(ex.message)
        }
        return returnStr
    }
}
