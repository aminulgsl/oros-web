package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: Sanin
 * Date: 4/29/14
 * Time: 12:01 PM
 * To change this template use File | Settings | File Templates.
 */
public enum CircleName {
    DAILY("Daily"),
    WEEKLY("Weekly"),
    HALFMONTHLY("Half Monthly"),
    MONTHLY("Monthly")

    final String value
    CircleName(String value) {
        this.value = value
    }
    String toString() { value }
    String getKey() { name() }
}