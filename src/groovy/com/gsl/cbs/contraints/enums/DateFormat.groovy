package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: Mohammed Imran
 * Date: 4/20/14
 * Time: 1:05 PM
 * To change this template use File | Settings | File Templates.
 */
public enum DateFormat {
    DDMMYYYY("DDMMYYYY"),
    DDMMYY("DDMMYY")

    final String value

    DateFormat(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}