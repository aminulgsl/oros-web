package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: Mohammed Imran
 * Date: 4/20/14
 * Time: 12:41 PM
 * To change this template use File | Settings | File Templates.
 */
public enum PaymentTerm {
    CASH("Cash"),
    CHECK("Check"),
    CREDIT_CARD("Card"),
    BANK_TRANSFER("Transfer")

    final String value

    PaymentTerm(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}