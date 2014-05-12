package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: Mohammed Imran
 * Date: 4/20/14
 * Time: 2:26 PM
 * To change this template use File | Settings | File Templates.
 */
public enum BookingPeriod {
    TEN("10"),
    TWENTY("20"),
    THIRTY("30")

    final String value

    BookingPeriod(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}