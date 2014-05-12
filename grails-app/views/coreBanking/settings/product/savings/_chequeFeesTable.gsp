<legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.table.chequeFees.legend" default="Cheque Fees"/></small></legend>
<div class="table-responsive">
            <table id="chequeTableData" class="display dataTable table table-striped table-bordered table-hover">
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
                <tr id="chequeFeesTr">
                    <td class="sorting_1 form-group">
                        <label for="chequeStartAmount">
                            <input type="text" id="chequeStartAmount" name="chequeStartAmountI" value="" placeholder="Start Amount" class="input-small amount">
                        </label>
                        %{--<div id="chequeStartAmountMsg" class="errorMsg"><span>Please Enter Start Amount</span></div>--}%
                    </td>
                    <td class="form-group">
                        <label for="chequeEndAmount">
                            <input type="text" id="chequeEndAmount" name="chequeEndAmountI" placeholder="End Amount" class="input-small amount">
                        </label>
                        %{--<div id="chequeEndAmountMsg"  class="errorMsg"><span>Please Enter End Amount</span></div>--}%
                    </td>
                    <td class="form-group">
                        <label for="chequeRateType">
                            <select id="chequeRateType" class="form-control" name="chequeRateTypeI" style="min-width:70px">
                                <option value="">- Select -</option>
                                <option value="${rateType.FLAT}">${rateType.FLAT}</option>
                                <option value="${rateType.RATE}">${rateType.RATE}</option>
                            </select>
                        </label>
                        %{--<div id="chequeRateTypeMsg"  class="errorMsg"><span>Please Select Rate Type</span></div>--}%
                    </td>

                    <td class="form-group">
                        <label for="chequeRate">
                            <input type="text" id="chequeRate" name="chequeRateI" placeholder="0.00" class="input-small amount">
                        </label>
                        %{--<div id="chequeRateMsg"  class="errorMsg"><span>Please Enter Rate</span></div>--}%
                    </td>

                    <td class="center">
                        <button id="chequeAdd" class="btn btn-default navbar-btn" type="button">
                            <g:message code="coreBanking.saving.product.button.add" default="Add"/></button>
                    </td>
                </tr>
                <g:if test="${chequeDepositFeeTable?.id}">
                    <g:each in="${chequeDepositFeeTable}" var="item">
                        <tr>
                            <td><div id='cheque_start'>${item.startAmount}<input type='hidden' name='chequeStart' value='${item.startAmount}' /></div></td>
                            <td><div id='cheque_end'>${item.endAmount}<input type='hidden' name='chequeEnd' value='${item.endAmount}' /></div></td>
                            <td><div id='cheque_rate_type'>${item.rateType}<input type='hidden' name='chequeRateType' value='${item.rateType}' /></div></td>
                            <td><div id='cheque_rate'>${item.rate}<input type='hidden' name='chequeRate' value='${item.rate}' /></div></td>
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

