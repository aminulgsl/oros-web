package com.gsl.cbs.contraints.enums

public enum CardType {
    VISA("VISA"),
    MASTER("MASTER"),

    final String value

    CardType(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}
