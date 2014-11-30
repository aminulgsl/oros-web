package com.gsl.cbs.contraints.enums

/**
 * Created by gs on 04-Aug-14.
 */
public enum StatusType {
    APPROVED("Approved"),
    REQUESTED("Requested"),
    DECLINED("Declined"),
    DRAFT("Draft")


    final String value

    StatusType(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }

}