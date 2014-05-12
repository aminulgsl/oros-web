<%@ page import="com.gsl.oros.core.banking.settings.BranchSetup; com.gsl.oros.core.banking.settings.Currencys" %>


<div class="row">
    <div class=" col-xs-12 ">

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'retailerName', 'has-error')}">
                <label for="retailerName"><g:message code="coreBanking.setting.retailerSetup.retailerName"
                                                     default="Retailer Name "/> *</label>

                <div class="">
                    <input type="text" required=""
                           value="${retailerSetup?.retailerName}" class="form-control" id="retailerName"
                           name="retailerName"
                           placeholder="Enter Retailer Name">
                </div>
            </div>
        </div>

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'retailerCode', 'has-error')}">
                <label for="retailerCode"><g:message code="coreBanking.setting.retailerSetup.retailerCode"
                                                     default="Retailer Code"/> *</label>

                <div class="">
                    <input type="text" required=""
                           value="${retailerSetup?.retailerCode}" class="form-control" id="retailerCode"
                           name="retailerCode"
                           placeholder="Enter Retailer Code">
                </div>
            </div>
        </div>

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group  ${hasErrors(bean: retailerSetup, field: 'account', 'has-error')}">
                <label for="account"><g:message code="coreBanking.setting.retailerSetup.account"
                                                default="Account"/> *</label>

                <div class="">
                    <g:select id="account" name='account' class="form-control" required=""
                              noSelection="${['': 'Select Account...']}"
                              from='${account}'
                              value="${retailerSetup?.account}"
                              optionKey="name" optionValue="name"></g:select>

                </div>
            </div>
        </div>

    </div>

    <div class=" col-xs-12">

        <div class="col-md-4 col-sm-4 ">
            <div class="form-group  ${hasErrors(bean: retailerSetup, field: 'currencys', 'has-error')}">
                <label for="currency"><g:message code="default.currency.label"
                                                 default="Currency"/> *</label>

                <div class="">
                    <g:select id="currency" name='currencys' class="form-control" required=""
                              noSelection="${['': 'Select Currency...']}"
                              from='${Currencys.findAllByStatus(true)}'
                              value="${retailerSetup?.currencys?.id}"
                              optionKey="id" optionValue="name"></g:select>

                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'branchSetup', 'has-error')}">
                <label for="branch"><g:message code="coreBanking.setting.retailerSetup.branch"
                                               default="Branch"/> *</label>

                <div class="">
                    <g:select id="branch" name='branchSetup' class="form-control" required=""
                              noSelection="${['': 'Select Branch...']}"
                              from='${BranchSetup.findAllByStatus(true)}'
                              value="${retailerSetup?.branchSetup?.id}"
                              optionKey="id" optionValue="branchFullName"></g:select>

                </div>
            </div>
        </div>

    </div>

</div>