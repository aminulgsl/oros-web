package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: Mohammed Imran
 * Date: 4/20/14
 * Time: 1:12 PM
 * To change this template use File | Settings | File Templates.
 */
public enum DecimalPoint {
    ONE("1"),
    TWO("2"),
    THREE("3"),
    FOUR("4")

    final String value

    DecimalPoint(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}