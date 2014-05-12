<div class="row">
    <div class=" col-xs-12 ">

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'minAmountPerDay', 'has-error')}">

                <label for="minAmountPerDay">
                    <g:message code="coreBanking.setting.retailerSetup.minAmountPerDay"
                               default="Minimum Amount Per Day"/> *</label>
                <input type="text" autocomplete="off" style="text-align: right" required=""
                       value="${retailerSetup?.minAmountPerDay}" class="form-control" id="minAmountPerDay"
                       name="minAmountPerDay"
                       placeholder="0.00">
            </div>
        </div>

        <div class=" col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'maxAmountPerDay', 'has-error')}">
                <label for="maxAmountPerDay">
                    <g:message code="coreBanking.setting.retailerSetup.maxAmountPerDay"
                               default="Maximum Amount Per Day"/> *</label>
                <input type="text" autocomplete="off" style="text-align: right" required=""
                       value="${retailerSetup?.maxAmountPerDay}" class="form-control" id="maxAmountPerDay"
                       name="maxAmountPerDay"
                       placeholder="0.00">
            </div>
        </div>

    </div>

    <div class=" col-xs-12 ">

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'minDeposit', 'has-error')}">
                <label for="minDeposit">
                    <g:message code="coreBanking.setting.retailerSetup.minDeposit"
                               default="Minimum Amount Per Deposits"/>  *</label>
                <input type="text" autocomplete="off" style="text-align: right" required=""
                       value="${retailerSetup?.minDeposit}" class="form-control" id="minDeposit" name="minDeposit"
                       placeholder="0.00">
            </div>
        </div>

        <div class=" col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'maxDeposit', 'has-error')}">
                <label for="maxDeposit">
                    <g:message code="coreBanking.setting.retailerSetup.maxDeposit"
                               default="Maximum Amount Per Deposits "/> *</label>
                <input type="text" autocomplete="off" style="text-align: right" required=""
                       value="${retailerSetup?.maxDeposit}" class="form-control" id="maxDeposit" name="maxDeposit"
                       placeholder="0.00">
            </div>
        </div>

    </div>

    <div class=" col-xs-12 ">

        <div class=" col-md-4 col-sm-4 ">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'minWithdrawal', 'has-error')}">
                <label for="minWithdrawal">
                    <g:message code="coreBanking.setting.retailerSetup.minWithdrawal"
                               default="Minimum Amt Per Withdrawal"/> *</label>
                <input type="text" autocomplete="off" style="text-align: right" required=""
                       value="${retailerSetup?.minWithdrawal}" class="form-control" id="minWithdrawal"
                       name="minWithdrawal"
                       placeholder="0.00">
            </div>
        </div>

        <div class=" col-md-4 col-sm-4">
            <div class="form-group ${hasErrors(bean: retailerSetup, field: 'maxWithdrawal', 'has-error')}">
                <label for="maxWithdrawal">
                    <g:message code="coreBanking.setting.retailerSetup.maxWithdrawal"
                               default="Maximum Amt Per Withdrawal"/>  *</label>
                <input type="text" autocomplete="off" style="text-align: right" required=""
                       value="${retailerSetup?.maxWithdrawal}" class="form-control" id="maxWithdrawal"
                       name="maxWithdrawal"
                       placeholder="0.00">
            </div>
        </div>

    </div>
</div>