<%@ page import="com.gsl.oros.core.banking.settings.State; com.gsl.oros.core.banking.settings.Country" %>

<div class="row">
    <div class="col-xs-12">
        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="postalCountry">
                    <g:message code="default.country.label" default="Country "/> *
                </label>

                <g:select id="postalCountry" name='postal.country' class="form-control" required=""
                          noSelection="${['': 'Select Country...']}"
                          from='${Country.findAllByStatus(true)}'
                          value="${postalAdd?.country?.id}"
                          optionKey="id" optionValue="name"></g:select>
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="postalState">
                    <g:message code="default.state.label" default="State "/> *
                </label>
                <g:select id="postalState" name='postal.state' class="form-control" required=""
                          noSelection="${['': 'Select State...']}"
                          from='${State.list(sort: 'id')}' value="${postalAdd?.state?.id}"
                          optionKey="id" optionValue="name"></g:select>
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="postalCity">
                    <g:message code="default.city.label" default="City "/> *
                </label>

                <input type="text" required=""
                       value="${postalAdd?.city}" class="form-control" name="postal.city"
                       id="postalCity" data-placeholder="Choose a PostalCity...">

            </div>

        </div>
    </div>

    <div class="col-xs-12">
        <div class="col-md-4 col-sm-4">

            <div class="form-group">
                <label for="streetName">
                    <g:message code="default.address.streetName.label" default="Street Name "/>
                </label>

                <input type="text"
                       class="form-control" id="streetName" name="postal.streetName"
                       value="${postalAdd?.streetName}" placeholder="Enter Street Name">
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="postalPostCode">
                    <g:message code="default.address.postCode.label" default="Post Code "/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="postalPostCode" name="postal.postCode"
                       value="${postalAdd?.postCode}" placeholder="Enter Post Code">
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="postalAddressLine1">
                    <g:message code="default.address.label" default="Address "/>
                </label>

                <g:textArea name="postal.addressLine2" id="postalAddressLine1" class="form-control"
                            value="${postalAdd?.addressLine2}" rows="5" cols="40" placeholder="Enter Postal Address"/>
            </div>

        </div>

    </div>

</div>