<html>
<head></head>
<body>
<div class="row">
<g:form name="savingsProductTermSetup" id="savingsProductTermSetup" method="post" role="form" class="form-horizontal">


%{--<g:form name="savingsProductTermSetup" id="savingsProductTermSetup" method="post" role="form" class="form-horizontal">--}%
<div class=row>

    <div class="form-group container ">
        <label for="depCheck" title="Deposit">
            <input name="termSetup"  value="1" type="checkbox" class="ace " id="depCheck"/>
            <span class="lbl padding-3">
                <g:message code="coreBanking.saving.product.termSetup.deposit.checkbox" default="Deposit"/></span>
        </label>
    </div>

    <br/>

    <div class="col-sm-5 col-md-6 col-xs-7 col-lg-5">

        <legend class="blue "><small><g:message code="coreBanking.saving.product.termSetup.numberOfPeriods.legend" default="Number of Periods"/></small></legend>

        <div class="form-group col-md-12">
            <label class="control-label col-md-3" for="minDeposit" >
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span> :
            </label>
            <div class="col-md-7 ">
                <input type="text"  class="form-control amount" name="minDeposit" id="minDeposit" placeholder="0.00"/>
            </div>
        </div>
        <div class="form-group col-md-12">
            <label class="control-label col-md-3 " for="maxDeposit">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:
            </label>
            <div class=" col-md-7 ">
                <input type="text"  class="form-control amount" name="maxDeposit" id="maxDeposit" placeholder="0.00" />
            </div>
        </div>


    </div>
    <div class="col-sm-4 col-md-4 col-xs-6 col-lg-4">
        <fieldset >
        <label for="postFreqDep">
            <legend class="blue ">
                <small><g:message code="coreBanking.saving.product.termSetup.postingFrequency.legend" default="Posting Frequency"/></small>
            </legend>
        </label>
        <div class="dropdown">
        <select id="postFreqDep" class="form-control " name="postFreqDep">
            <option>-Select-</option>
            <option value="Daily">Daily</option>
            <option value="Weekly">Weekly</option>
            <option value="Half Monthly">Half Monthly</option>
            <option value="Monthly">Monthly</option>
        </select>
        </div>
        </fieldset>
    </div>



</div>
<hr>
<div class=row>

    <div class="form-group container">
        <label for="withdrawalCheck" title="Withdrawal">
            <input name="termSetup"  value="1" type="checkbox" class="ace" id="withdrawalCheck"/>
            <span class="lbl padding-3">
                <g:message code="coreBanking.saving.product.termSetup.withdrawal.checkbox" default="Withdrawal"/></span>
        </label>
    </div>
    <br/>
    <div class="col-sm-5 col-md-6 col-xs-7 col-lg-5">

        <legend class="blue">
            <small>
                <g:message code="coreBanking.saving.product.termSetup.numberOfPeriods.legend" default="Number of Periods:"/>
            </small>
        </legend>

        <div class="form-group col-md-12">
            <label class="control-label col-md-3 " for="minWithdrawal">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:
            </label>
            <div class=" col-md-7 ">
                <input type="text"  class="form-control amount" name="minWithdrawal" id="minWithdrawal" placeholder="0.00"/>
            </div>
        </div>
        <div class="form-group col-md-12">
            <label class="control-label col-md-3 " for="maxWithdrawal">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:
            </label>
            <div class=" col-md-7 ">
                <input type="text"  class="form-control amount" name="maxWithdrawal" id="maxWithdrawal" placeholder="0.00"/>
            </div>
        </div>

    </div>
    <div class="col-sm-4 col-md-4 col-xs-6 col-lg-4">
        <fieldset >
        <label for="postFreqWithdrwl"><legend class="blue">
            <small><g:message code="coreBanking.saving.product.termSetup.postingFrequency.legend" default="Posting Frequency"/></small>
        </legend></label>
        <div class="dropdown">
        <select id="postFreqWithdrwl" class="form-control col-md-3 " name="postFreqWithdrwl">
            <option>-Select-</option>
            <option value="Daily">Daily</option>
            <option value="Weekly">Weekly</option>
            <option value="Half Monthly">Half Monthly</option>
            <option value="Monthly">Monthly</option>
        </select>
        </div>
            </fieldset>
    </div>

</div>
<hr>
<div class=row>

    <div class="form-group container">
        <label for="transferCheck" title="Transfer">
            <input name="termSetup"  value="1" type="checkbox" class="ace" id="transferCheck"/>
            <span class="lbl padding-3">
                <g:message code="coreBanking.saving.product.termSetup.transfer.checkbox" default="Transfer"/></span>
        </label>
   </div>
    <br/>
    <div class="col-sm-5 col-md-6 col-xs-7 col-lg-5">

        <legend class="blue"><small><g:message code="coreBanking.saving.product.termSetup.numberOfPeriods.legend" default="Number of Periods"/></small></legend>

        <div class="form-group col-md-12">
            <label class="control-label col-md-3 " for="minTransfer">
                <g:message code="coreBanking.saving.product.min" default="Min"/><span class="red">*</span>:
            </label>
            <div class=" col-md-7 ">
                <input type="text"  class="form-control amount" name="minTransfer" id="minTransfer" placeholder="0.00"/>
            </div>
        </div>
        <div class="form-group col-md-12">
            <label class="control-label col-md-3 " for="maxTransfer">
                <g:message code="coreBanking.saving.product.max" default="Max"/><span class="red">*</span>:
            </label>
            <div class="col-md-7">
                <input type="text"  class="form-control amount" name="maxTransfer" id="maxTransfer" placeholder="0.00"/>
            </div>
        </div>

    </div>
    <div class="col-sm-4 col-md-4 col-xs-6 col-lg-4">
        <fieldset>
        <label for="postFreqTransfer">
            <legend class="blue">
                <small><g:message code="coreBanking.saving.product.termSetup.postingFrequency.legend" default="Posting Frequency"/></small>
            </legend>
        </label>
        <div class="dropdown">
        <select id="postFreqTransfer" class="form-control  col-md-3" name="postFreqTransfer">
            <option>-Select-</option>
            <option value="Daily">Daily</option>
            <option value="Weekly">Weekly</option>
            <option value="Half Monthly">Half Monthly</option>
            <option value="Monthly">Monthly</option>
        </select>
        </div>
            </fieldset>
    </div>

</div>
<div class="clearfix">
    <div class="col-md-offset-3 col-md-9">
        <input type="hidden" name="templateNo" value="4" />
        <button class="btn btn-info" type="submit" id="savingProducts"><i class="icon-ok bigger-110"></i>
            <g:if test="${savingsProduct?.id}"><g:message code="default.button.update.label" default="Update"/></g:if>
            <g:else><g:message code="default.button.submit.label" default="Submit"/></g:else>
        </button>
        %{--<input type="submit" name="save" value="Submit" /> --}%
        <button class="btn" type="reset"><i class="icon-undo bigger-110"></i>
        <g:message code="default.button.reset.label" default="Reset"/>
    </button>
    </div>
</div>
%{--</g:form>--}%

    </g:form>
</div>
<script type="text/javascript">
    $('#savingsProductTermSetup').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            minDeposit: {
                required: true
            },

            maxDeposit: {
                required: true
            },

            minWithdrawal: {
                required: true
            },
            maxWithdrawal: {
                required: true
            },

            minTransfer: {
                required: true
            },
            maxTransfer: {
                required: true
            }


        },
        messages: {
            minDeposit: {
                required: " "
            },

            maxDeposit: {
                required: " "
            },
            minWithdrawal: {
                required: " "
            },
            maxWithdrawal: {
                required: " "
            },
            minTransfer: {
                required: " "
            },
            maxTransfer: {
                required: " "
            }
        },


        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('.depositForm')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },
        %{--submitHandler: function (form) {--}%
            %{--$.ajax({--}%
                %{--type: 'post',--}%
                %{--data: jQuery("#savingsProductTran").serialize(),--}%
                %{--url: "${createLink(controller:'product', action: 'saveTran')}",--}%
                %{--success: function (data, textStatus) {--}%
                    %{--$("#page-content").html(data);--}%
                %{--},--}%
                %{--error: function (XMLHttpRequest, textStatus, errorThrown) {--}%
                %{--},--}%
                %{--complete: function (XMLHttpRequest, textStatus) {--}%
                %{--}--}%
            %{--});--}%
//        }

    });
    </script>
</body></html>
