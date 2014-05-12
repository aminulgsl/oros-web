<legend class="blue"><small><g:message code="coreBanking.saving.product.transactions.table.withdrawalFees.legend" default="Withdrawal Fees"/></small></legend>
    <div class="table-responsive">
            <table id="chequeWithdrawalTableData" class="display dataTable table table-striped table-bordered table-hover">
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
                <tr id="chequeWithdrwlFeesTr">
                    <td class="sorting_1 form-group">
                        <label for="chequeWithdrwlStartAmount">
                            <input type="text" id="chequeWithdrwlStartAmount" name="chequeWithdrwlStartAmountI" value="" placeholder="Start Amount" class="input-small amount">
                        </label>
                        %{--<div id="chequeWithdrwlStartAmountMsg" class="errorMsg"><span>Please Enter Start Amount</span></div>--}%
                    </td>
                    <td class="form-group">
                        <label for="chequeWithdrwlEndAmount">
                            <input type="text" id="chequeWithdrwlEndAmount" name="chequeWithdrwlEndAmountI" placeholder="End Amount" class="input-small amount">
                        </label>
                        %{--<div id="chequeWithdrwlEndAmountMsg" class="errorMsg"><span>Please End Amount</span></div>--}%
                    </td>
                    <td class="form-group">
                        <label for="chequeWithdrwlRateType">
                            <select id="chequeWithdrwlRateType" class="form-control" name="chequeWithdrwlRateTypeI" style="min-width:70px">
                                <option value="">- Select -</option>
                                <option value="${rateType.FLAT}">${rateType.FLAT}</option>
                                <option value="${rateType.RATE}">${rateType.RATE}</option>
                            </select>
                        </label>
                        %{--<div id="chequeWithdrwlRateTypeMsg" class="errorMsg"><span>Please Select Rate Type</span></div>--}%
                    </td>

                    <td class="form-group">
                        <label for="chequeWithdrwlRate">
                            <input type="text" id="chequeWithdrwlRate" name="chequeWithdrwlRateI" placeholder="0.00" class="input-small amount">
                        </label>
                        %{--<div id="chequeWithdrwlRateMsg" class="errorMsg"><span>Please Enter Rate</span></div>--}%
                    </td>

                    <td class="center">
                        <button id="chequeWithdrawlAdd" class="btn btn-default navbar-btn" type="button">
                            <g:message code="coreBanking.saving.product.button.add" default="Add"/>
                        </button>
                    </td>
                </tr>
                <g:if test="${chequeWithdrawFeeTable?.id}">
                    <g:each in="${chequeWithdrawFeeTable}" var="item">
                        <tr>
                            <td><div id='cheque_withdrwl_start'>${item.startAmount}<input type='hidden' name='chequeWithdrwlStartAm' value='${item.startAmount}' /></div></td>
                            <td><div id='cheque_withdrwl_end'>${item.endAmount}<input type='hidden' name='chequeWithdrwlEndAm' value='${item.endAmount}' /></div></td>
                            <td><div id='cheque_withdrwl_rate_type'>${item.rateType}<input type='hidden' name='chequeWithdrwlRateType' value='${item.rateType}' /></div></td>
                            <td><div id='cheque_withdrwl_rate'>${item.rate}<input type='hidden' name='chequeWithdrwlRate' value='${item.rate}' /></div></td>
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