<div class=row style="background:#E8E8E8 ">
    <div class="col-sm-4" >

        <legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.cash.cashDeposit" default="Cash Deposit"/></small></legend>
        <div class="form-group">
            <label class="control-label col-md-3 " for="minCashTransaction">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCash?.depositMin}" name="minCashTransaction" id="minCashTransaction" />

        </div>

        <div class="form-group">
            <label class="control-label col-md-3 " for="maxCashTransaction">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCash?.depositMax}" name="maxCashTransaction" id="maxCashTransaction" />

        </div>

    </div>
    <div class="col-sm-8">
        <g:render template='/coreBanking/settings/product/savings/cashFees'/>
    </div>
</div>
<hr>
<br/>
<div class=row>
    <div class="col-sm-4">

        <legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.withdrawing" default="Withdrawing"/></small></legend>

        <div class="form-group">
            <label class="control-label col-md-3 " for="minCashWithdrw">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCash?.withdrawMin}" name="minCashWithdrw" id="minCashWithdrw" />

        </div>

        <div class="form-group">
            <label class="control-label col-md-3 " for="maxCashWithdrw">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCash?.withdrawMax}" name="maxCashWithdrw" id="maxCashWithdrw" />

        </div>
    </div>
    <div class="col-sm-8">
        <g:render template='/coreBanking/settings/product/savings/withdrawalFeesTable'/>
    </div>
</div>
<hr>
<div class=row style="background:#E8E8E8 ">
    <div class="col-sm-4">

        <legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.transfer" default="Transfer"/></small></legend>

        <div class="form-group">
            <label class="control-label col-md-3 " for="minCashTransfer">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCash?.transferMin}" name="minCashTransfer" id="minCashTransfer" />

        </div>


        <div class="form-group">
            <label class="control-label col-md-3 " for="maxCashTransfer">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCash?.transferMax}" name="maxCashTransfer" id="maxCashTransfer" />

        </div>
    </div>
    <div class="col-sm-8">
        <g:render template='/coreBanking/settings/product/savings/transferFeesTable'/>
    </div>



</div>
