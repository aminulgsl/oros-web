<%@ page import="com.gsl.oros.core.banking.settings.Country" %>
<div class="row">
    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'bankFullName', 'has-error')}">
                <label for="bankFullName">
                    <g:message code="coreBanking.setting.othBankSetup.bankFullName" default="Bank FullName "/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="bankFullName" name="bankFullName"
                       value="${othBankSetup?.bankFullName}" placeholder="Enter Bank Name">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'bankShortName', 'has-error')}">
                <label for="bankShortName">
                    <g:message code="coreBanking.setting.othBankSetup.bankShortName" default="Bank ShortName"/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="bankShortName"
                       value="${othBankSetup?.bankShortName}" name="bankShortName"
                       placeholder="Enter Bank Short Name">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="iban">
                    <g:message code="coreBanking.setting.othBankSetup.iban.label" default="IBAN"/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="iban"
                       value="${othBankSetup?.iban}" name="iban"
                       placeholder="Enter IBAN">
            </div>

        </div>

    </div>

    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'general.phoneNo', 'has-error')}">
                <label for="generalPhoneNo">
                    <g:message code="default.address.phone.label" default="Phone No "/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="generalPhoneNo" name="general.phoneNo"
                       value="${generalAdd?.phoneNo}" placeholder="Enter phone Number">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: "general.mobileNo", 'has-error')}">
                <label for="generalMobileNo">
                    <g:message code="default.address.mobile.label" default="Mobile No"/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="generalMobileNo" name="general.mobileNo"
                       value="${generalAdd?.mobileNo}" placeholder="Enter Mobile Number">
            </div>
        </div>

        %{--<div class="col-md-4 col-sm-4">--}%
            %{--<div class="form-group ${hasErrors(bean: othBankSetup, field: "contactPerson", 'has-error')}">--}%
                %{--<label for="contactPerson">--}%
                    %{--<g:message code="default.address.mobile.label" default="Mobile No"/> *--}%
                %{--</label>--}%

                %{--<input type="text" required=""--}%
                       %{--class="form-control" id="contactPerson" name="contactPerson"--}%
                       %{--value="${othBankSetup?.contactPerson}" placeholder="Enter Mobile Number">--}%
            %{--</div>--}%
        %{--</div>--}%

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: "general.faxNo", 'has-error')}">
                <label for="generalFaxNo">
                    <g:message code="default.address.fax.label" default="Fax No "/> *
                </label>
                <input type="text" required=""
                       class="form-control" id="generalFaxNo" name="general.faxNo"
                       value="${generalAdd?.faxNo}" placeholder="Enter Fax Number">
            </div>
        </div>

    </div>

    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group  ${hasErrors(bean: othBankSetup, field: 'general.country', 'has-error')}">
                <label for="country">
                    <g:message code="default.country.label" default="Country"/> *
                </label>

                <g:select id="country" name='general.country' class="form-control" required=""
                          noSelection="${['': 'Select Country...']}"
                          from='${Country.findAllByStatus(true)}' value="${generalAdd?.country?.id}"
                          optionKey="id" optionValue="name"></g:select>
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'general.email1', 'has-error')}">
                <label for="generalEmail1">
                    <g:message code="default.address.email" default="Email "/>
                </label>

                <input type="email"
                       class="form-control" id="generalEmail1" name="general.email1"
                       value="${generalAdd?.email1}" placeholder="Enter First Email">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'general.websiteUrl', 'has-error')}">
                <label for="websiteUrl">
                    <g:message code="default.address.websiteUrl" default="Website URL"/>
                </label>

                <input type="url"
                       class="form-control" id="websiteUrl" name="general.websiteUrl"
                       value="${generalAdd?.websiteUrl}" placeholder="Enter Second Email">
            </div>
        </div>
    </div>

</div>