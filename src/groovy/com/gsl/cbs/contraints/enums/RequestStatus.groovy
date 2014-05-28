package com.gsl.cbs.contraints.enums

/**
 * Created by Nusrat Jahan Bhuiyan on 5/21/14.
 */
public enum RequestStatus {
    DRAFT("Draft"),
    SUBMITTED("Submitted"),
    PROCESSING("Processing"),
    PENDING("Pending"),
    APPROVED("Deleted"),
    REJECTED("Deleted")

    final String value
    RequestStatus(String value) {
        this.value = value
    }
    String toString() { value }
    String getKey() { name() }
}