<%@ page import="com.gsl.oros.core.banking.settings.State; com.gsl.oros.core.banking.settings.Country" %>
<div class="row">
    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'postal.country', 'has-error')}">
                <label for="postalCountry">
                    <g:message code="default.country.label" default="Country"/> *
                </label>

                <g:select id="postalCountry" name='postal.country' class="form-control" required=""
                          noSelection="${['': 'Select Country...']}"
                          from='${Country.findAllByStatus(true)}' value="${postalAdd?.country?.id}"
                          optionKey="id" optionValue="name"></g:select>
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'postal.state', 'has-error')}">
                <label for="postalState">
                    <g:message code="default.state.label" default="State"/> *
                </label>

                <g:select id="postalState" name='postal.state' class="form-control" required=""
                          noSelection="${['': 'Select State...']}"
                          from='${State.list(sort: 'id')}' value="${postalAdd?.state?.id}"
                          optionKey="id" optionValue="name"></g:select>
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group  ${hasErrors(bean: branchSetup, field: 'postal.city', 'has-error')}">
                <label for="postalCity">
                    <g:message code="default.city.label" default="City"/> *
                </label>

                <input type="text" required="" class="form-control" id="postalCity" name="postal.city"
                       value="${postalAdd?.city}" placeholder="Enter City Name">
            </div>

        </div>
    </div>

    <div class="col-xs-12">
        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'postal.streetName', 'has-error')}">
                <label for="postalStreetName">
                    <g:message code="default.address.streetName.label" default="Street Name"/>
                </label>
                <input type="text" class="form-control" id="postalStreetName" name="postal.streetName"
                       value="${postalAdd?.streetName}" placeholder="Enter Street Name">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'postal.zipCode', 'has-error')}">
                <label for="postalZipCode">
                    <g:message code="default.address.zipCode.label" default="Zip Code"/>  *
                </label>
                <input type="text" required="" class="form-control" id="postalZipCode" name="postal.zipCode"
                       value="${postalAdd?.zipCode}" placeholder="Enter Zip Code">
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'postal.addressLine2', 'has-error')}">
                <label for="postalAddressLine2">
                    <g:message code="default.address.label" default="Address"/>
                </label>
                <g:textArea name="postal.addressLine2" id="postalAddressLine2" class="form-control"
                            value="${postalAdd?.addressLine2}" rows="5" cols="40" placeholder="Enter Address"/>
            </div>

        </div>

    </div>

</div>