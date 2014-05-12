package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: Mohammed Imran
 * Date: 4/20/14
 * Time: 2:47 PM
 * To change this template use File | Settings | File Templates.
 */
public enum ThousandSeparator {
    COMMA(",")

    final String value

    ThousandSeparator(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}