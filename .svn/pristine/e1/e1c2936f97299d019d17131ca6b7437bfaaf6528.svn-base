<%@ page import="com.gsl.oros.core.banking.settings.State; com.gsl.oros.core.banking.settings.Country" %>
<div class="row">
    <div class=" col-xs-12 ">

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: "address.country", 'has-error')}">
                <label for="country"><g:message code="default.country.label" default="Country "/> *</label>

                <div class="">
                    <g:select id="country" name='address.country' class="form-control" required=""
                              noSelection="${['': 'Select Country...']}"
                              from='${Country.findAllByStatus(true)}'
                              value="${address?.country?.id}"
                              optionKey="id" optionValue="name"></g:select>
                </div>
            </div>
        </div>


        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'address.state', 'has-error')}">
                <label for="state"><g:message code="default.state.label" default="State "/> *</label>

                <div class="">
                    <g:select id="state" name='address.state' class="form-control" required=""
                              noSelection="${['': 'Select State...']}"
                              from='${State.list(sort: 'id')}' value="${address?.state?.id}"
                              optionKey="id" optionValue="name"></g:select>
                </div>
            </div>

        </div>

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group  ${hasErrors(bean: retailerSetup, field: "address.city", 'has-error')}">
                <label for="city"><g:message code="default.city.label" default="City "/> *</label>

                <div class="">
                    <input name="address.city" id="city" type="text" required="" class="form-control custom"
                           value="${address?.city}" placeholder="Enter City Name">
                </div>
            </div>

        </div>

    </div>

    <div class=" col-xs-12 ">

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group  ${hasErrors(bean: retailerSetup, field: "address.zipCode", 'has-error')}">
                <label for="zipCode"><g:message code="default.address.zipCode.label" default="Zip Code "/> *</label>

                <div class="">
                    <input name="address.zipCode" id="zipCode" type="text" required=""
                           class="form-control"
                           value="${address?.zipCode}" placeholder="Enter Zip Code">
                </div>
            </div>

        </div>

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: "address.postCode", 'has-error')}">
                <label for="postCode"><g:message code="default.address.postCode.label" default="Post Code "/> *</label>

                <div class="">
                    <input name="address.postCode" id="postCode" type="text" required=""
                           class="form-control"
                           value="${address?.postCode}" placeholder="Enter postCode Number">
                </div>
            </div>

        </div>

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: "address.streetName", 'has-error')}">
                <label for="streetName"><g:message code="default.address.streetName.label"
                                                   default="Street Name "/></label>

                <div class="">
                    <input name="address.streetName" id="streetName" type="text"
                           class="form-control"
                           value="${address?.streetName}" placeholder="Enter Street Name">
                </div>
            </div>

        </div>

    </div>

    <div class=" col-xs-12 ">
        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: "address.phoneNo", 'has-error')}">
                <label for="phoneNo"><g:message code="default.address.phone.label" default="Phone No "/> *</label>

                <div class="">
                    <input name="address.phoneNo" id="phoneNo" type="text" required=""
                           class="form-control"
                           value="${address?.phoneNo}" placeholder="Enter phoneNo Number">
                </div>
            </div>

        </div>
    </div>

</div>