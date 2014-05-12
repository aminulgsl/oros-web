<div class="row">
    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'contactName', 'has-error')}">
                <label for="contactName">
                    <g:message code="coreBanking.setting.othBankSetup.contactName" default="Name"/>  *
                </label>

                <input type="text" required=""
                       class="form-control" id="contactName" name="contactName"
                       value="${othBankSetup?.contactName}" placeholder="Enter Contact Name">
            </div>

        </div>


        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'contactDesignation', 'has-error')}">
                <label for="contactDesignation">
                    <g:message code="coreBanking.setting.othBankSetup.designation" default="Designation"/> *
                </label>
                <input type="text" required=""
                       class="form-control" id="contactDesignation" name="contactDesignation"
                       value="${othBankSetup?.contactDesignation}" placeholder="Enter Designation">

            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'contactPhone', 'has-error')}">
                <label for="contactPhone">
                    <g:message code="default.address.phone.label" default="Phone No"/> *
                </label>
                <input type="text" required=""
                       class="form-control" id="contactPhone" name="contactPhone"
                       value="${othBankSetup?.contactPhone}" placeholder="Enter Phone Number">
            </div>
        </div>

    </div>

    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'contactMobile', 'has-error')}">
                <label for="contactMobile">
                    <g:message code="default.address.mobile.label" default="Mobile No"/>  *
                </label>

                <input type="text" required=""
                       class="form-control" id="contactMobile" name="contactMobile"
                       value="${othBankSetup?.contactMobile}" placeholder="Enter Mobile Number">
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: othBankSetup, field: 'contactEmail', 'has-error')}">
                <label for="contactEmail">
                    <g:message code="default.address.email" default="Email"/>
                </label>

                <input type="email"
                       class="form-control" id="contactEmail" name="contactEmail"
                       value="${othBankSetup?.contactEmail}" placeholder="Enter Email Address">

            </div>

        </div>
    </div>

</div>