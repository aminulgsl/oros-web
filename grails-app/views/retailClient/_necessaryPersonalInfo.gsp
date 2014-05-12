<g:form name="retailNecessaryPersonalInfoForm" method="post" role="form" class="form-horizontal"
        controller="retailClient" action="create">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <!-- PAGE CONTENT BEGINS -->

            <div class="form-group">
                <label for="occupation" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Occupation</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Title of the Account"
                           id="occupation" name="occupation">
                </div>
            </div>
            <div class="form-group">
                <label for="position" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Position</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Opening Date"
                           id="position" name="position">
                </div>
            </div>
            <div class="form-group">
                <label for="maritalStatus" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Marital Status</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Account Purpose"
                           id="maritalStatus" name="maritalStatus">
                </div>
            </div>
            <div class="form-group">
                <label for="expectedDateOfRetirement" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Expected Date Of Retirement</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Account Purpose"
                           id="expectedDateOfRetirement" name="expectedDateOfRetirement">
                </div>
            </div>
            <div class="form-group">
                <label for="monthlyIncome" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Monthly Income</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Monthly Income"
                           id="monthlyIncome" name="monthlyIncome">
                </div>
            </div>
            <div class="form-group">
                <label for="annualIncome" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Annual Income</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Account Purpose"
                           id="annualIncome" name="annualIncome">
                </div>
            </div>
            <div class="form-group">
                <label for="incomeTax" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Do you pay income tax at the higher rate?</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <g:radioGroup name="incomeTax" id="incomeTax" labels="['Yes','No']" values="[1,2]" value="1">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">${it.radio} <g:message code="${it.label}" /></div>
                    </g:radioGroup>
                </div>
            </div>
            <div class="form-group">
                <label for="numberOfDependentChildren" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Number Of Dependent Children</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Source Of Fund"
                           id="numberOfDependentChildren" name="numberOfDependentChildren">
                </div>
            </div>
            <div class="form-group">
                <label for="schoolfees" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Are you paying or do you expect to pay school or university fees?</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <g:radioGroup name="schoolfees" id="schoolfees" labels="['Yes','No']" values="[1,2]" value="1">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">${it.radio} <g:message code="${it.label}" /></div>
                    </g:radioGroup>
                </div>
            </div>
            <div class="form-group">
                <label for="otherDependents" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">
                    Other Dependents (Please giv details)</label>
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Source Of Fund"
                           id="otherDependents" name="otherDependents">
                </div>
            </div>
        </div><!-- /.col -->
    </div>

    <div class="clearfix form-actions">
        <div class="col-md-offset-5 col-md-9">
            <button type="submit" name="customerBasicSubmit" id="customerBasicSubmit" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Update
            </button>
        </div>
    </div>

</g:form>