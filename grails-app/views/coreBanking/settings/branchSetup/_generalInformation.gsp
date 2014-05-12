<div class="row">
    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'branchFullName', 'has-error')}">
                <label for="branchFullName">
                    <g:message code="coreBanking.setting.branchSetup.branchFullName" default="Branch FullName "/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="branchFullName" name="branchFullName"
                       value="${branchSetup?.branchFullName}" placeholder="Enter Branch Name">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'branchShortName', 'has-error')}">
                <label for="branchShortName">
                    <g:message code="coreBanking.setting.branchSetup.branchShortName" default="Branch ShortName"/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="branchShortName"
                       value="${branchSetup?.branchShortName}" name="branchShortName"
                       placeholder="Enter Branch Short Name">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'branchType', 'has-error')}">
                <label for="branchType">
                    <g:message code="coreBanking.setting.branchSetup.branchType" default="Branch Type "/> *
                </label>

                <g:select id="branchType" name='branchType' class="form-control" required=""
                          noSelection="${['': 'Select Branch Type...']}"
                          from='${branchType}' value="${branchSetup?.branchType}"
                          optionKey="type" optionValue="type"></g:select>

            </div>
        </div>

    </div>

    <div class="col-xs-12">
        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'parentOffice', 'has-error')}">
                <label for="parentOffice">
                    <g:message code="coreBanking.setting.branchSetup.parentOffice" default="Parent Office "/> *
                </label>

                <g:select id="parentOffice" name='parentOffice' class="form-control" required=""
                          noSelection="${['': 'Select Parent Office...']}"
                          from='${parentOffice}' value="${branchSetup?.parentOffice}"
                          optionKey="parentOff" optionValue="parentOff"></g:select>
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'general.phoneNo', 'has-error')}">
                <label for="generalPhoneNo">
                    <g:message code="default.address.phone.label" default="Phone No "/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="generalPhoneNo" name="general.phoneNo"
                       value="${generalAdd?.phoneNo}" placeholder="Enter phone Number">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: "general.mobileNo", 'has-error')}">
                <label for="generalMobileNo">
                    <g:message code="default.address.mobile.label" default="Mobile No"/> *
                </label>

                <input type="text" required=""
                       class="form-control" id="generalMobileNo" name="general.mobileNo"
                       value="${generalAdd?.mobileNo}" placeholder="Enter Mobile Number">
            </div>
        </div>

    </div>

    <div class="col-xs-12">
        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: "general.faxNo", 'has-error')}">
                <label for="generalFaxNo">
                    <g:message code="default.address.fax.label" default="Fax No "/> *
                </label>
                <input type="text" required=""
                       class="form-control" id="generalFaxNo" name="general.faxNo"
                       value="${generalAdd?.faxNo}" placeholder="Enter Fax Number">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'general.email1', 'has-error')}">
                <label for="generalEmail1">
                    <g:message code="default.address.email" default="Email "/>
                </label>

                <input type="email"
                       class="form-control" id="generalEmail1" name="general.email1"
                       value="${generalAdd?.email1}" placeholder="Enter First Email">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: branchSetup, field: 'general.email2', 'has-error')}">
                <label for="generalEmail2">
                    <g:message code="default.address.email2" default="Second Email"/>
                </label>

                <input type="email"
                       class="form-control" id="generalEmail2" name="general.email2"
                       value="${generalAdd?.email2}" placeholder="Enter Second Email">
            </div>
        </div>
    </div>

</div>