package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: Mohammed Imran
 * Date: 4/20/14
 * Time: 1:23 PM
 * To change this template use File | Settings | File Templates.
 */
public enum DecimalSeparator {
    COMMA(","),
    DOT(".")

    final String value

    DecimalSeparator(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}