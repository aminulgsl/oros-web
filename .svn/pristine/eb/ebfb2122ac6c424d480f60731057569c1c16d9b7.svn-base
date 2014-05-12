<div class="table-responsive">
    <table id="managementTableData" class="display dataTable table table-striped table-bordered table-hover">
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
        <tr class="entryFormManage odd" id="manageTr">
            <td class="sorting_1 form-group">
                <label for="manageMin">
                    <input type="text" id="manageMin" name="manageMinI" value="" placeholder="0.00" class="input-small amount" >
                </label>
                %{--<div id="manageMinMsg" class="errorMsg"><span>Please Enter Min</span></div>--}%
            </td>
            <td class="form-group">
                <label for="manageMax">
                    <input type="text" id="manageMax" name="manageMaxI" placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="manageMaxMsg" class="errorMsg"><span>Please Enter Max</span></div>--}%
            </td>
            <td class="form-group">
                <label for="manageCircleType">
                    <select id="manageCircleType" class="form-control " name="manageCircleTypeI">
                        <option value="">- Select -</option>
                        <option value="${circleName.DAILY}">${circleName.DAILY}</option>
                        <option value="${circleName.WEEKLY}">${circleName.WEEKLY}</option>
                        <option value="${circleName.HALFMONTHLY}">${circleName.HALFMONTHLY}</option>
                        <option value="${circleName.MONTHLY}">${circleName.MONTHLY}</option>
                    </select>
                </label>
                %{--<div id="manageCircleTypeMsg" class="errorMsg"><span>Please Select Circle Type</span></div>--}%
            </td>
            <td class="form-group">
                <label for="manageRateType">
                    <select id="manageRateType" class="form-control" name="manageRateTypeI">
                        <option value="">- Select -</option>
                        <option value="${rateType.FLAT}">${rateType.FLAT}</option>
                        <option value="${rateType.RATE}">${rateType.RATE}</option>
                    </select>
                </label>
                %{--<div id="manageRateTypeMsg" class="errorMsg"><span>Please Select Rate Type</span></div>--}%

            </td>
            <td class="form-group">
                <label for="manageValue">
                    <input type="text" id="manageValue" name="manageValueI" placeholder="0.00" class="input-small amount">
                </label>
                %{--<div id="manageValMsg" class="errorMsg"><span>Please Enter Value</span></div>--}%
            </td>

            <td class="center">
                <button id="manageAdd" class="btn btn-default navbar-btn" type="button">
                    <g:message code="coreBanking.saving.product.button.add" default="Add"/>
                </button>
            </td>
        </tr>
        <g:if test="${manageFeeTable?.id}">
            <g:each in="${manageFeeTable}" var="item">
                <tr>
                    <td><div id='manage_min'>${item.min}<input type='hidden' name='reopenMin' value='${item.min}' /></div></td>
                    <td><div id='manage_max'>${item.max}<input type='hidden' name='reopenMax' value='${item.max}' /></div></td>
                    <td><div id='manage_circle_type'>${item.circleId}<input type='hidden' name='manageCircleType' value='${item.circleId}' /></div></td>
                    <td><div id='manage_rate_type'>${item.rateType}<input type='hidden' name='manageRateType' value='${item.rateType}' /></div></td>
                    <td><div id='manage_value'>${item.value}<input type='hidden' name='manageValue' value='${item.value}' /></div></td>
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

