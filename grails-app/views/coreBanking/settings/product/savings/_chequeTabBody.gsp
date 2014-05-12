<div class=row style="background:#E8E8E8 ">
    <div class="col-sm-4">

        <legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.cheque.chequeDeposit" default="Cheque Deposit"/></small></legend>
        <div class="form-group">
            <label class="control-label col-md-3 " for="minChequeTransaction">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCheque?.depositMin}" name="minChequeTransaction" id="minChequeTransaction" />

        </div>

        <div class="form-group">
            <label class="control-label col-md-3 " for="maxChequeTransaction">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCheque?.depositMax}" name="maxChequeTransaction" id="maxChequeTransaction" />

        </div>
    </div>
    <div class="col-sm-8">
        <g:render template='/coreBanking/settings/product/savings/chequeFees'/>
    </div>
</div>
<hr>
<br/>
<div class=row>
    <div class="col-sm-4">

        <legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.withdrawing" default="Withdrawing"/></small></legend>
        <div class="form-group">
            <label class="control-label col-md-3 " for="minChequeWithdrw">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:</label>
                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCheque?.withdrawMin}" name="minChequeWithdrw" id="minChequeWithdrw" />

        </div>

        <div class="form-group">
            <label class="control-label col-md-3 " for="maxChequeWithdrw">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCheque?.withdrawMax}" name="maxChequeWithdrw" id="maxChequeWithdrw" />

        </div>
    </div>
    <div class="col-sm-8">
        <g:render template='/coreBanking/settings/product/savings/chequeWithdrawalFeesTable'/>
    </div>
</div>
<hr>
<div class=row style="background:#E8E8E8 ">
    <div class="col-sm-4">

        <legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.transfer" default="Transfer"/></small></legend>
        <div class="form-group">
            <label class="control-label col-md-3 " for="minChequeTransfer">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:</label>
                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCheque?.transferMin}" name="minChequeTransfer" id="minChequeTransfer" />

        </div>

        <div class="form-group">
            <label class="control-label col-md-3 " for="maxChequeTransfer">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:</label>
                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCheque?.transferMax}" name="maxChequeTransfer" id="maxChequeTransfer" />

        </div>
    </div>
    <div class="col-sm-8">
        <g:render template='/coreBanking/settings/product/savings/chequeTransferFeesTable'/>
    </div>


</div>


