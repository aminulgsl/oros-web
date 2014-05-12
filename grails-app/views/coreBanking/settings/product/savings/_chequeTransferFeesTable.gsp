<legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.table.transferFees.legend" default="Transfer Fees"/></small></legend>
    <div class="table-responsive">
        <table id="chequeTransferTableData" class="display dataTable table table-striped table-bordered table-hover">
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
            <tr id="chequeTransferTr">
                <td class="sorting_1 form-group">
                    <label for="chequeTransferStartAmount">
                        <input type="text" id="chequeTransferStartAmount" name="chequeTransferStartAmountI" value="" placeholder="Start Amount" class="input-small amount">
                    </label>
                    %{--<div id="chequeTransferStartAmountMsg" class="errorMsg"><span>Please Enter Start Amount</span></div>--}%
                </td>
                <td class="form-group">
                    <label for="chequeTransferEndAmount">
                        <input type="text" id="chequeTransferEndAmount" name="chequeTransferEndAmountI" value="" placeholder="End Amount" class="input-small amount">
                    </label>
                    %{--<div id="chequeTransferEndAmountMsg" class="errorMsg"><span>Please Enter End Amount</span></div>--}%
                </td>
                <td class="form-group">
                    <label for="chequeTransferRateType">
                        <select id="chequeTransferRateType" class="form-control" name="chequeTransferRateTypeI" style="min-width:70px">
                            <option value="">- Select -</option>
                            <option value="${rateType.FLAT}">${rateType.FLAT}</option>
                            <option value="${rateType.RATE}">${rateType.RATE}</option>
                        </select>
                    </label>
                    %{--<div id="chequeTransferRateTypeMsg" class="errorMsg"><span>Please Select Rate Type</span></div>--}%
                </td>

                <td class="form-group">
                    <label for="chequeTransferRate">
                        <input type="text" id="chequeTransferRate" name="chequeTransferRateI" placeholder="0.00" class="input-small amount">
                    </label>
                    %{--<div id="chequeTransferRateMsg" class="errorMsg"><span>Please Enter Rate</span></div>--}%
                </td>

                <td class="center">
                    <button id="chequeTransferAdd" class="btn btn-default navbar-btn" type="button">
                        <g:message code="coreBanking.saving.product.button.add" default="Add"/></button>
                </td>
            </tr>
            <g:if test="${chequeTransferFeeTable?.id}">
                <g:each in="${chequeTransferFeeTable}" var="item">
                    <tr>
                        <td><div id='cheque_transfer_start'>${item.startAmount}<input type='hidden' name='chequeTransferStartAm' value='${item.startAmount}' /></div></td>
                        <td><div id='cheque_transfer_end'>${item.endAmount}<input type='hidden' name='chequeTransferEndAm' value='${item.endAmount}' /></div></td>
                        <td><div id='cheque_transfer_rate_type'>${item.rateType}<input type='hidden' name='chequeTransferRateType' value='${item.rateType}' /></div></td>
                        <td><div id='cheque_transfer_rate'>${item.rate}<input type='hidden' name='chequeTransferRate' value='${item.rate}' /></div></td>
                        <td>
                            <div class='visible-md visible-lg visible-sm visible-xs action-buttons'>
                                <a href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>
                                <a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>
                            </div>
                        </td>
                    </tr>
                </g:each>
            </g:if>
            </tbody>
        </table>
    </div>

