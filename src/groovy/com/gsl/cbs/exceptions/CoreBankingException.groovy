package com.gsl.cbs.exceptions

/**
 * Created by GSL on 6/9/14.
 */
class CoreBankingException extends RuntimeException {
    public CoreBankingException(){
        super();
    }
    public CoreBankingException(String message){
        super(message);
    }
    public CoreBankingException(String message, Throwable cause){
        super(message,cause);
    }
    public CoreBankingException(Throwable cause){
        super(cause);
    }


}
