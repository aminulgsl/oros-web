<div class=row style="background:#E8E8E8 ">
    <div class="col-sm-4">

        <legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.card.cardDeposit" default="Card Deposit:"/></small></legend>
        <div class="form-group">
            <label class="control-label col-md-3 " for="minCardTransaction">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCard?.depositMin}" name="minCardTransaction" id="minCardTransaction" />

        </div>

        <div class="form-group">
            <label class="control-label col-md-3 " for="maxCardTransaction">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCard?.depositMax}" name="maxCardTransaction" id="maxCardTransaction" />

        </div>
    </div>
    <div class="col-sm-8">
        <g:render template='/coreBanking/settings/product/savings/cardFees'/>
    </div>
</div>
<hr>
<br/>
<div class=row >
    <div class="col-sm-4">



        <legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.withdrawing" default="Withdrawing"/></small></legend>
        <div class="form-group">
            <label class="control-label col-md-3 " for="minCardWithdrw">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCard?.withdrawMin}" name="minCardWithdrw" id="minCardWithdrw" />

        </div>

        <div class="form-group">
            <label class="control-label col-md-3 " for="maxCardWithdrw">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCard?.withdrawMax}" name="maxCardWithdrw" id="maxCardWithdrw" />

        </div>
    </div>
    <div class="col-sm-8">
        <g:render template='/coreBanking/settings/product/savings/cardWithdrawalFeesTable'/>
    </div>
</div>
<hr>
<div class=row style="background:#E8E8E8 ">
    <div class="col-sm-4">

        <legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.transfer" default="Transfer"/></small></legend>
        <div class="form-group">
            <label class="control-label col-md-3 " for="minCardTransfer">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCard?.transferMin}" name="minCardTransfer" id="minCardTransfer" />

        </div>

        <div class="form-group">
            <label class="control-label col-md-3 " for="maxCardTransfer">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:</label>

                <input type="text" placeholder="0.00" class="amount" value="${savingsProductTranCard?.transferMax}" name="maxCardTransfer" id="maxCardTransfer" />

        </div>
    </div>
    <div class="col-sm-8">
        <g:render template='/coreBanking/settings/product/savings/cardTransferFeesTable'/>
    </div>


</div>
