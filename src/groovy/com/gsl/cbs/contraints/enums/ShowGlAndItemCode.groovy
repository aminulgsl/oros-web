package com.gsl.cbs.contraints.enums

/**
 * Created with IntelliJ IDEA.
 * User: Mohammed Imran
 * Date: 4/20/14
 * Time: 2:42 PM
 * To change this template use File | Settings | File Templates.
 */
public enum ShowGlAndItemCode {
    YES(true),
    NO(false)

    final Boolean value

    ShowGlAndItemCode(Boolean value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }
}