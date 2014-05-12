<%@ page import="com.gsl.oros.core.banking.settings.State; com.gsl.oros.core.banking.settings.Country" %>
<div class="row">
    <div class=" col-xs-12 ">
        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="country">
                    <g:message code="default.country.label" default="Country "/> *
                </label> <!--width-90 chosen-select-->

            <g:select id="country" name='general.country' class="form-control" required=""
                      noSelection="${['': 'Select Country...']}"
                      from='${Country.findAllByStatus(true)}'
                      value="${generalAdd?.country?.id}"
                      optionKey="id" optionValue="name"></g:select>
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="state">
                    <g:message code="default.state.label" default="State "/> *
                </label>

                <g:select id="state" name='general.state' class="form-control" required=""
                          noSelection="${['': 'Select State...']}"
                          from='${State.list(sort: 'id')}' value="${generalAdd?.state?.id}"
                          optionKey="id" optionValue="name"></g:select>
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="city">
                    <g:message code="default.city.label" default="City "/> *
                </label>

                <input type="text" required=""
                       class="form-control" name="general.city" id="city" value="${generalAdd?.city}"
                       placeholder="Enter City Name">
            </div>
        </div>
    </div>

    <div class=" col-xs-12 ">
        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="streetName">
                    <g:message code="default.address.streetName.label" default="Street Name "/>
                </label>

                <input type="text"
                       class="form-control" id="streetName" name="general.streetName"
                       value="${generalAdd?.streetName}" placeholder="Enter Stree Name">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="zipCode">
                    <g:message code="default.address.zipCode.label" default="Zip Code "/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="zipCode" name="general.zipCode"
                       value="${generalAdd?.zipCode}" placeholder="Enter zipCode">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="addressLine1">
                    <g:message code="default.address.label" default="Address "/>
                </label>

                <g:textArea name="general.addressLine1" id="addressLine1" class="form-control"
                            value="${generalAdd?.addressLine1}" rows="5" cols="40" placeholder="Enter Address Line"/>

            </div>
        </div>

    </div>
</div>