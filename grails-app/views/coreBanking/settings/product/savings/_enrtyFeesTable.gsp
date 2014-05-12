<div class="table-responsive">
    <table id="entryTableData" class="display dataTable table table-striped table-bordered table-hover">
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
        <tr class="entryFormEntry odd" id="entryTr">
            <td class="form-group">
                <label for="entryMin">
                    <input type="text" id="entryMin" name="entryMinI" value="" placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="entryMinMsg" class="errorMsg"><span>Please Enter Min</span></div>--}%
            </td>
            <td class="form-group">
                <label for="entryMax">
                    <input type="text" id="entryMax" name="entryMaxI" placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="entryMaxMsg" class="errorMsg"><span>Please Enter Max</span></div>--}%
            </td>

            <td class="form-group">
                <label for="entryRateType">
                    <select id="entryRateType" class="form-control" name="entryRateTypeI">
                        <option value="">- Select -</option>
                        <option value="${rateType.FLAT}">${rateType.FLAT}</option>
                        <option value="${rateType.RATE}">${rateType.RATE}</option>
                    </select>
                </label>
                %{--<div id="entryRateTypeMsg" class="errorMsg"><span>Please Select Rate Type</span></div>--}%
            </td>
            <td class="form-group">
                <label for="entryValue">
                    <input type="text" id="entryValue" name="entryValueI" placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="entryValMsg" class="errorMsg"><span>Please Enter Value</span></div>--}%
            </td>

            <td class="center">
                <button id="entryAdd" class="btn btn-default navbar-btn" type="button">
                    <g:message code="coreBanking.saving.product.button.add" default="Add"/>
                </button>
            </td>
        </tr>
        <g:if test="${entryFeeTable?.id}">
            <g:each in="${entryFeeTable}" var="item">
                <tr>
                    <td><div id='entry_min'>${item.min}<input type='hidden' name='entryMin' value='${item.min}' /></div></td>
                    <td><div id='entry_max'>${item.max}<input type='hidden' name='entryMax' value='${item.max}' /></div></td>
                    <td><div id='entry_rate_type'>${item.rateType}<input type='hidden' name='entryRateType' value='${item.rateType}' /></div></td>
                    <td><div id='entry_value'>${item.value}<input type='hidden' name='entryValue' value='${item.value}' /></div></td>
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

