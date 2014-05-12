<div class="table-responsive">
    <table id="reopenTableData" class="display dataTable table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th><g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span></th>
            <th><g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span></th>
            <th><g:message code="coreBanking.saving.product.rateType" default="Rate Type"/><span class="red">*</span></th>
            <th><g:message code="coreBanking.saving.product.value" default="Value"/><span class="red">*</span></th>
            <th><g:message code="coreBanking.saving.product.action" default="Action"/></th>
        </tr>
        </thead>
        <tbody>
        <tr class="entryFormReopen odd" id="reopenTr">
            <td class="sorting_1 form-group">
                <label for="reopenMin">
                    <input type="text" id="reopenMin" name="reopenMinI" value="" placeholder="0.00" class="input-small amount" >
                </label>
                %{--<div id="reopenMinMsg" class="errorMsg"><span>Please Enter Min</span></div>--}%
            </td>
            <td class="form-group">
                <label for="reopenMax">
                    <input type="text" id="reopenMax" name="reopenMaxI" placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="reopenMaxMsg" class="errorMsg"><span>Please Enter Max</span></div>--}%
            </td>

            <td class="form-group">
                <label for="reopenRateType">
                    <select id="reopenRateType" class="form-control" name="reopenRateTypeI">
                        <option value="">- Select -</option>
                        <option value="${rateType.FLAT}">${rateType.FLAT}</option>
                        <option value="${rateType.RATE}">${rateType.RATE}</option>
                    </select>
                </label>
                %{--<div id="reopenRateTypeMsg" class="errorMsg"><span>Please Select Rate Type</span></div>--}%
            </td>
            <td class="form-group">
                <label for="reopenValue">
                    <input type="text" id="reopenValue" name="reopenValueI" placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="reopenValMsg" class="errorMsg"><span>Please Enter Value</span></div>--}%
            </td>

            <td class="center">
                <button id="reopenAdd" class="btn btn-default navbar-btn" type="button">
                    <g:message code="coreBanking.saving.product.button.add" default="Add"/>
                </button>
            </td>
        </tr>
        <g:if test="${reopenFeeTable?.id}">
            <g:each in="${reopenFeeTable}" var="item">
                <tr>
                    <td><div id='reopen_min'>${item.min}<input type='hidden' name='reopenMin' value='${item.min}' /></div></td>
                    <td><div id='reopen_max'>${item.max}<input type='hidden' name='reopenMax' value='${item.max}' /></div></td>
                    <td><div id='reopen_rate_type'>${item.rateType}<input type='hidden' name='reopenRateType' value='${item.rateType}' /></div></td>
                    <td><div id='reopen_value'>${item.value}<input type='hidden' name='reopenValue' value='${item.value}' /></div></td>
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

