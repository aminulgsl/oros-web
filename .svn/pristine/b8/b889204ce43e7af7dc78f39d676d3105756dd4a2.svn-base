<%@ page import="com.gsl.oros.core.banking.settings.State" %>

<div class="row">
    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'general.state', 'has-error')}">
                <label for="generalState">
                    <g:message code="default.state.label" default="State"/>  *
                </label>

                <g:select id="generalState" name='general.state' class="form-control" required=""
                          noSelection="${['': 'Select State...']}"
                          from='${State.list(sort: 'id')}' value="${generalAdd?.state?.id}"
                          optionKey="id" optionValue="name"></g:select>
            </div>

        </div>


        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'general.city', 'has-error')}">
                <label for="generalCity">
                    <g:message code="default.city.label" default="City"/> *
                </label>
                <input type="text" required=""
                       class="form-control" id="generalCity" name="general.city"
                       value="${generalAdd?.city}" placeholder="Enter city Name">

            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'general.streetName', 'has-error')}">
                <label for="generalStreetName">
                    <g:message code="default.address.streetName.label" default="Street Name"/>
                </label>
                <input type="text"
                       class="form-control" id="generalStreetName" name="general.streetName"
                       value="${generalAdd?.streetName}" placeholder="Enter Street Name">
            </div>
        </div>

    </div>

    <div class="col-xs-12">


        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'general.zipCode', 'has-error')}">
                <label for="generalZipCode">
                    <g:message code="default.address.zipCode.label" default="Zip Code"/>  *
                </label>

                <input type="text" required=""
                       class="form-control" id="generalZipCode" name="general.zipCode"
                       value="${generalAdd?.zipCode}" placeholder="Enter Zip Code">
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'general.addressLine1', 'has-error')}">
                <label for="generalAddressLine1">
                    <g:message code="default.address.label" default="Address"/>
                </label>
                <g:textArea name="general.addressLine1" id="generalAddressLine1" class="form-control"
                            value="${generalAdd?.addressLine1}" rows="5" cols="40" placeholder="Enter Address"/>

            </div>

        </div>
    </div>

</div>