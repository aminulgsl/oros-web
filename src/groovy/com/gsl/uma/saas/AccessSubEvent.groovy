package com.gsl.uma.saas

/**
 * Created by aminul haque on 4/6/14.
 */
class AccessSubEvent {
    String fmenuText
    String description
    Long requestMapId
    boolean hasAccess

    AccessSubEvent() {
    }

    AccessSubEvent(String fmenuText, String description, Long requestMapId) {
        this.fmenuText = fmenuText
        this.description = description

        this.requestMapId = requestMapId
    }
}
