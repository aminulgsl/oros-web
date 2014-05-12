package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: gs
 * Date: 4/28/14
 * Time: 11:31 AM
 * To change this template use File | Settings | File Templates.
 */
public enum GenderType {
    MALE("Male"),
    FEMALE("Female")


    final String value

    GenderType(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }

}