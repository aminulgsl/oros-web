<legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.table.withdrawalFees.legend" default="Withdrawal Fees"/></small></legend>
<div class="table-responsive">
        <table id="cardWithdrawalTableData" class="display dataTable table table-striped table-bordered table-hover">
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
            <tr id="cardWithdrwlFeesTr">
                <td class="sorting_1 form-group">
                    <label for="cardWithdrwlStartAmount">
                        <input type="text" id="cardWithdrwlStartAmount" name="cardWithdrwlStartAmountI" value="" placeholder="Start Amount" class="input-small amount">
                    </label>
                    %{--<div id="cardWithdrwlStartAmountMsg" class="errorMsg"><span>Please Enter Start Amount</span></div>--}%
                </td>
                <td class="form-group">
                    <label for="cardWithdrwlEndAmount">
                        <input type="text" id="cardWithdrwlEndAmount" name="cardWithdrwlEndAmountI" placeholder="End Amount" class="input-small amount">
                    </label>
                    %{--<div id="cardWithdrwlEndAmountMsg" class="errorMsg"><span>Please End Amount</span></div>--}%
                </td>
                <td class="form-group">
                    <label for="cardWithdrwlRateType">
                        <select id="cardWithdrwlRateType" class="form-control" name="cardWithdrwlRateTypeI" style="min-width:70px">
                            <option value="">- Select -</option>
                            <option value="${rateType.FLAT}">${rateType.FLAT}</option>
                            <option value="${rateType.RATE}">${rateType.RATE}</option>
                        </select>
                    </label>
                    %{--<div id="cardWithdrwlRateTypeMsg" class="errorMsg"><span>Please Select Rate Type</span></div>--}%
                </td>

                <td class="form-group">
                    <label for="cardWithdrwlRate">
                        <input type="text" id="cardWithdrwlRate" name="cardWithdrwlRateI" placeholder="0.00" class="input-small amount">
                    </label>
                    %{--<div id="cardWithdrwlRateMsg" class="errorMsg"><span>Please Enter Rate</span></div>--}%
                </td>

                <td class="center">
                    <button id="cardWithdrawlAdd" class="btn btn-default navbar-btn" type="button">
                        <g:message code="coreBanking.saving.product.button.add" default="Add"/>
                    </button>
                </td>
            </tr>
            <g:if test="${cardWithdrawFeeTable?.id}">
                <g:each in="${cardWithdrawFeeTable}" var="item">
                    <tr>
                        <td><div id='card_withdrwl_start'>${item.startAmount}<input type='hidden' name='cardWithdrwlStartAm' value='${item.startAmount}' /></div></td>
                        <td><div id='card_withdrwl_end'>${item.endAmount}<input type='hidden' name='cardWithdrwlEndAm' value='${item.endAmount}' /></div></td>
                        <td><div id='card_withdrwl_rate_type'>${item.rateType}<input type='hidden' name='cardWithdrwlRateType' value='${item.rateType}' /></div></td>
                        <td><div id='card_withdrwl_rate'>${item.rate}<input type='hidden' name='cardWithdrwlRate' value='${item.rate}' /></div></td>
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

