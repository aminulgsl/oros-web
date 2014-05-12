
<legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.table.cashFees.legend" default="Cash Fees"/></small></legend>

<div class="table-responsive">

        <table id="cashTableData" class="display dataTable table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th><g:message code="coreBanking.saving.product.startAmount" default="Start Amount"/><span class="red">*</span></th>
                <th><g:message code="coreBanking.saving.product.endAmount" default="End Amount"/><span class="red">*</span></th>
                <th><g:message code="coreBanking.saving.product.rateType" default="Rate Type"/><span class="red">*</span></th>
                <th><g:message code="coreBanking.saving.product.rate" default="Rate"/><span class="red">*</span></th>
                <th><g:message code="coreBanking.saving.product.action" default="Action"/></th>
            </tr>
            </thead>
            <tbody>
            <tr id="cashFeesTr">
                <td class="sorting_1 form-group">
                    <label for="cashStartAmount">
                        <input type="text" id="cashStartAmount" name="cashStartAmountI" value="" placeholder="Start Amount" class="input-small amount">
                    </label>
                    %{--<div id="cashStartAmountMsg" class="errorMsg"><span>Please Enter Start Amount</span></div>--}%
                </td>
                <td class="form-group">
                    <label for="cashEndAmount">
                        <input type="text" id="cashEndAmount" name="cashEndAmountI" placeholder="End Amount" class="input-small amount">
                    </label>
                    %{--<div id="cashEndAmountMsg"  class="errorMsg"><span>Please Enter End Amount</span></div>--}%
                </td>
                <td class="form-group">
                    <label for="cashRateType">
                        <select id="cashRateType" class="form-control" name="cashRateTypeI" style="min-width:70px">
                            <option value="">- Select -</option>
                            <option value="${rateType.FLAT}">${rateType.FLAT}</option>
                            <option value="${rateType.RATE}">${rateType.RATE}</option>
                        </select>
                    </label>
                    %{--<div id="cashRateTypeMsg"  class="errorMsg"><span>Please Select Rate Type</span></div>--}%
                </td>

                <td class="form-group">
                    <label for="cashRate">
                        <input type="text" id="cashRate" name="cashRateI" placeholder="0.00" class="input-small amount">
                    </label>
                    %{--<div id="cashRateMsg"  class="errorMsg"><span>Please Enter Rate</span></div>--}%
                </td>

                <td class="center">
                    <button id="cashAdd" class="btn btn-default navbar-btn" type="button">
                        <g:message code="coreBanking.saving.product.button.add" default="Add"/></button>
                </td>
            </tr>
            <g:if test="${cashDepositFeeTable?.id}">
                <g:each in="${cashDepositFeeTable}" var="item">
                    <tr>
                        <td><div id='cash_start'>${item.startAmount}<input type='hidden' name='cashStart' value='${item.startAmount}' /></div></td>
                        <td><div id='cash_end'>${item.endAmount}<input type='hidden' name='cashEnd' value='${item.endAmount}' /></div></td>
                        <td><div id='cash_rate_type'>${item.rateType}<input type='hidden' name='cashRateType' value='${item.rateType}' /></div></td>
                        <td><div id='cash_rate'>${item.rate}<input type='hidden' name='cashRate' value='${item.rate}' /></div></td>
                        <td>
                            <div class='visible-md visible-lg visible-sm visible-xs action-buttons'>
                                <a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>
                                <a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>
                            </div>
                        </td>
                    </tr>
                </g:each>
            </g:if>
            </tbody>
        </table>
</div>



