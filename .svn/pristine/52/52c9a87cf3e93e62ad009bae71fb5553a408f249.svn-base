<legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.table.cardFees.legend" default="Card Fees"/></small></legend>


<div class="table-responsive">

        <table id="cardTableData" class="display dataTable table table-striped table-bordered table-hover">
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
            <tr id="cardFeesTr">
                <td class="sorting_1 form-group">
                    <label for="cardStartAmount">
                        <input type="text" id="cardStartAmount" name="cardStartAmountI" value="" placeholder="Start Amount" class="input-small amount">
                    </label>
                    %{--<div id="cardStartAmountMsg" class="errorMsg"><span>Please Enter Start Amount</span></div>--}%
                </td>
                <td class="form-group">
                    <label for="cardEndAmount">
                        <input type="text" id="cardEndAmount" name="cardEndAmountI" placeholder="End Amount" class="input-small amount">
                    </label>
                    %{--<div id="cardEndAmountMsg"  class="errorMsg"><span>Please Enter End Amount</span></div>--}%
                </td>
                <td class="form-group">
                    <label for="cardRateType">
                        <select id="cardRateType" class="form-control" name="cardRateTypeI" style="min-width:70px">
                            <option value="">- Select -</option>
                            <option value="${rateType.FLAT}">${rateType.FLAT}</option>
                            <option value="${rateType.RATE}">${rateType.RATE}</option>
                        </select>
                    </label>
                    %{--<div id="cardRateTypeMsg"  class="errorMsg"><span>Please Select Rate Type</span></div>--}%
                </td>

                <td class="form-group">
                    <label for="cardRate">
                        <input type="text" id="cardRate" name="cardRateI" placeholder="0.00" class="input-small amount">
                    </label>
                    %{--<div id="cardRateMsg"  class="errorMsg"><span>Please Enter Rate</span></div>--}%
                </td>



                <td class="center">
                    <button id="cardAdd" class="btn btn-default navbar-btn" type="button">
                        <g:message code="coreBanking.saving.product.button.add" default="Add"/>
                    </button>
                </td>
            </tr>
            <g:if test="${cardDepositFeeTable?.id}">
                <g:each in="${cardDepositFeeTable}" var="item">
                    <tr>
                        <td><div id='card_start'>${item.startAmount}<input type='hidden' name='cardStart' value='${item.startAmount}' /></div></td>
                        <td><div id='card_end'>${item.endAmount}<input type='hidden' name='cardEnd' value='${item.endAmount}' /></div></td>
                        <td><div id='card_rate_type'>${item.rateType}<input type='hidden' name='cardRateType' value='${item.rateType}' /></div></td>
                        <td><div id='card_rate'>${item.rate}<input type='hidden' name='cardRate' value='${item.rate}' /></div></td>
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


