package com.gsl.cbs.contraints.enums

/**
 * Created by GS on 04-Aug-14.
 */
public enum AccountType {
    SAVINGS("Savings"),
    CURRENT("Current"),
    RETAIL("Retail"),
    LOAN("Loan")

    final String value

    AccountType(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}