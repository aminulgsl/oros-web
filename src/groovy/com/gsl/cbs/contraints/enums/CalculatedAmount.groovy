package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: Sanin
 * Date: 4/29/14
 * Time: 12:55 PM
 * To change this template use File | Settings | File Templates.
 */
public enum CalculatedAmount {
    MAXIMUM("Maximum"),
    MINIMUM("Minimum")

    final String value
    CalculatedAmount(String value) {
        this.value = value
    }
    String toString() { value }
    String getKey() { name() }
}