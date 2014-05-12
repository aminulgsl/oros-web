<%@ page import="com.gsl.oros.core.banking.settings.OthersBankSetup" %>

<div class="row">
    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'branchFullName', 'has-error')}">
                <label for="branchFullName">
                    <g:message code="coreBanking.setting.branchSetup.branchFullName" default="Branch FullName "/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="branchFullName" name="branchFullName"
                       value="${othBranchSetup?.branchFullName}" placeholder="Enter Branch Name">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'branchShortName', 'has-error')}">
                <label for="branchShortName">
                    <g:message code="coreBanking.setting.branchSetup.branchShortName" default="Branch ShortName"/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="branchShortName"
                       value="${othBranchSetup?.branchShortName}" name="branchShortName"
                       placeholder="Enter Branch Short Name">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="bankName">
                    <g:message code="coreBanking.setting.othBranchSetup.bankName" default="Bank Name"/> *
                </label>

                <g:select id="bankName" name='bankName' class="form-control" required=""
                          noSelection="${['': 'Select Bank...']}"
                          from='${OthersBankSetup.findAllByStatus(true)}' value="${othBranchSetup?.bankName?.id}"
                          optionKey="id" optionValue="bankFullName"></g:select>
            </div>

        </div>

    </div>

    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'general.phoneNo', 'has-error')}">
                <label for="generalPhoneNo">
                    <g:message code="default.address.phone.label" default="Phone No "/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="generalPhoneNo" name="general.phoneNo"
                       value="${generalAdd?.phoneNo}" placeholder="Enter phone Number">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: "general.mobileNo", 'has-error')}">
                <label for="generalMobileNo">
                    <g:message code="default.address.mobile.label" default="Mobile No"/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="generalMobileNo" name="general.mobileNo"
                       value="${generalAdd?.mobileNo}" placeholder="Enter Mobile Number">
            </div>
        </div>


        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: "general.faxNo", 'has-error')}">
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
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'general.email1', 'has-error')}">
                <label for="generalEmail1">
                    <g:message code="default.address.email" default="Email "/>
                </label>

                <input type="email"
                       class="form-control" id="generalEmail1" name="general.email1"
                       value="${generalAdd?.email1}" placeholder="Enter First Email">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBranchSetup, field: 'general.websiteUrl', 'has-error')}">
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