package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: gs
 * Date: 4/28/14
 * Time: 11:50 AM
 * To change this template use File | Settings | File Templates.
 */
public enum MaritialStatus {
    MARRIED("Married"),
    UNMARRIED("Unmarried")


    final String value

    MaritialStatus(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }

}