%{--<div class="table-header">Add Item</div>--}%
<div class="table-responsive">
    <table id="agioTableData" class="display dataTable table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th><g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span></th>
            <th><g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span></th>
            <th><g:message code="coreBanking.saving.product.circleType" default="Circle Type"/><span class="red">*</span></th>
            <th><g:message code="coreBanking.saving.product.rateType" default="Rate Type"/><span class="red">*</span></th>
            <th><g:message code="coreBanking.saving.product.value" default="Value"/><span class="red">*</span></th>
            <th><g:message code="coreBanking.saving.product.action" default="Action"/></th>
        </tr>
        </thead>
        <tbody>
        <tr class="entryFormAgio odd " id="agioTr">
            <td class="sorting_1 form-group">
                <label for="agioMin">
                    <input type="text" id="agioMin" name="agioMinI"  placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="agioMinMsg" class="errorMsg"><span>Please Enter Min</span></div>--}%
            </td>
            <td class="form-group">
                <label for="agioMax">
                    <input type="text" id="agioMax" name="agioMaxI" placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="agioMaxMsg" class="errorMsg"><span>Please Enter Max</span></div>--}%
            </td>
            <td class="form-group">
                <label for="agioCircleType">
                    <select id="agioCircleType" class="form-control" name="agioCircleTypeI">
                        <option value="">- Select -</option>
                        <option value="1">Daily</option>
                        <option value="2">Weekly</option>
                        <option value="3">Half Monthly</option>
                        <option value="4">Monthly</option>
                    </select>
                </label>
                %{--<div id="agioCircleTypeMsg" class="errorMsg"><span>Please Select Circle Type</span></div>--}%
            </td>
            <td class="form-group">
                <label for="agioRateType">
                    <select id="agioRateType" class="form-control" name="agioRateTypeI">
                        <option value="">- Select -</option>
                        <option value="1">Flat</option>
                        <option value="2">Rate</option>
                    </select>
                </label>
                %{--<div id="agioRateTypeMsg" class="errorMsg"><span>Please Select Rate Type</span></div>--}%
            </td>

            </td>
            <td class="form-group">
                <label for="agioValue">
                    <input type="text" id="agioValue" name="agioValueI" placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="agioValMsg" class="errorMsg"><span>Please Enter Value</span></div>--}%
            </td>



            <td class="center">
                <button id="agioAdd" class="btn btn-default navbar-btn" type="button">
                    <g:message code="coreBanking.saving.product.button.add" default="Add"/>
                </button>
            </td>
        </tr>
        </tbody>
    </table>
</div>

