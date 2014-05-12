
<%@ page import="com.gsl.cbs.contraints.enums.CardType; com.gsl.oros.core.banking.settings.BankSetup; com.gsl.oros.core.banking.settings.Country; com.gsl.oros.core.banking.settings.BranchSetup; com.gsl.oros.core.banking.settings.Currencys; com.gsl.cbs.contraints.enums.DepositType" contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title></title>
%{--<script src="${resource(dir: 'js/uncompressed', file: 'n2w.js')}"></script>--}%
<style>
.popover {
    width: 275px;
    height: 250px;
}
.modal-dialog {
    padding-top: 75px;
    width: 645px;
}
textarea{
    width: 225px;
    min-width:225px;
    max-width:225px;

    height:70px;
    min-height:70px;
    max-height:70px;
}
.popover{
    height: 260px;
    width: 400px;
    max-width: 400px;
}
</style>
<script type="text/javascript">
    var currentDate;
    $(document).ready(function () {
        initDefaultValue();

        $("#depositTypeCheque").click(function (e) {
            $("#depositTypeChequeDiv").find(".cheque-req").removeClass("cheque-req").addClass("required");
            $("input[type=radio]").prop('checked', false);
            $('input:radio[id="depositTypeCheque"]').prop('checked', true);
            $("#depositTypeCashDiv").hide();
            $("#depositTypeBankTransferDiv").hide();
            $("#depositTypeCardDiv").hide();
            $("#depositTypeChequeDiv").show();
            $("#deposit-button-panel").show();
        });

        $("#depositTypeBankTransfer").click(function () {
            $("#depositTypeBankTransferDiv").find(".bank-req").removeClass("bank-req").addClass("required");
            $("input[type=radio]").prop('checked', false);
            $('input:radio[id="depositTypeBankTransfer"]').prop('checked', true);
            $("#depositTypeCashDiv").hide();
            $("#depositTypeChequeDiv").hide();
            $("#depositTypeCardDiv").hide();
            $("#depositTypeBankTransferDiv").show();
            $("#deposit-button-panel").show();
        });

        $("#depositTypeCreditCard").click(function () {
            $("#depositTypeCardDiv").find(".card-req").removeClass("card-req").addClass("required");
            $("input[type=radio]").prop('checked', false);
            $('input:radio[id="depositTypeCreditCard"]').prop('checked', true);
            $("#depositTypeCashDiv").hide();
            $("#depositTypeChequeDiv").hide();
            $("#depositTypeBankTransferDiv").hide();
            $("#depositTypeCardDiv").show();
            $("#saveAndPosting").addClass("disabled");
        });

        $("#depositTypeCash").click(function () {
            $("#depositTypeChequeDiv").find("input").removeClass("required").addClass("cash-req");
            $("input[type=radio]").prop('checked', false);
            $('input:radio[id="depositTypeCash"]').prop('checked', true);
            $("#depositTypeChequeDiv").hide();
            $("#depositTypeBankTransferDiv").hide();
            $("#depositTypeCardDiv").hide();
            $("#depositTypeCashDiv").show();
            $("#deposit-button-panel").show();
        });

        $("#chequeNumber").blur(function (e) {
            $("#verified-status").hide();
            var chequeNumber = $("#chequeNumber").val();

            if (chequeNumber) {
                $("#chequeVerifiedDiv").show();
                $("#cheque-verify-link-div").show();
                $("#verify-cheque-number").text("Please click here to Verify Cheque No! " + chequeNumber);
            } else {
                $("#chequeVerifiedDiv").hide();
                $("#cheque-verify-link-div").hide();
                $("#link-message").text('');
                $("#verify-cheque-number").text('');
            }
        });


        $('#depositForm').submit(function (e) {
            onSubmitDepositForm()
            return false;
        });


        $("#receiptAccountId").bind('keypress', function (e) {
            if ((e.keyCode == 13) || ( e.keyCode == 9)) {
                e.preventDefault();
                if(!$("#receiptAccountId").valid()) return false;
                var receiptAccountId = $("#receiptAccountId").val().trim();
                jQuery.ajax({
                    type: 'post',
                    dataType: 'json',
                    url: "${createLink(controller:'accountHolderInfo', action: 'showAccountHolder')}?receiptAccountId=" + receiptAccountId,
                    success: function (data, textStatus) {
                        showAccountHolderInfo(data);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    complete: function (XMLHttpRequest, textStatus) {
                        showSpinner(false);
                    }
                });
                return false;
            }
        });


        function showAccountHolderInfo(data) {
            if (data.available == false) {
                $('.err-msg').text(data.message).show();
                $('div#error-message-div').show();

                $("#accountHolderId").val('');
                $("#accountHolderName").val('');
                $("#branchName").val('');
                $("#branchId").val('');
                $("#currencyId").val('');
                $("#recipientCurrencyCode").val('');
                $("#accHolderInfoDiv").hide();
                $("#showDetailsAccountHolderDiv").hide();
                return false;
            }
            var client = data.client
            $("#accountHolderId").val(client.accountNo);
            $("#accountHolderName").val(client.name);
            $("#branchName").val(data.brName);
            $("#branchId").val(data.brId);
            $("#currencyId").val(data.currency.id);
            $("#recipientCurrencyCode").val(data.currency.symbol);
            $("#showDetailsAccountHolderDiv").show();
            $(".depositorCurrCode").attr('disabled', false);
            $("#recipientCurrencyId").val(data.currency.symbol);

            $('.err-msg').text('');
            $('div#error-message-div').hide();
            showDepositorInfoForSame();
            return false;
        }


        $('#depositForm').validate({
            errorPlacement: function (error, element) {
            },
            focusInvalid: false,
            rules: {
                receiptAccountId: {
                    required: true
                },
                receiptCurrencyCode: {
                    required: true
                },

                depositCurrencyCode: {
                    required: true
                },
                dateOfDeposit: {
                    required: true,
                    minDate: new Date(),
                    onSelect: function () {
                        var minDate = new Date();
                        minDate.setHours(0);
                        minDate.setMinutes(0);
                        minDate.setSeconds(0, 0);
                        var currDt = $(".datepicker").val();
                        if (new Date(currDt) <= minDate) {
                            $('#dateOfDeposit').closest('.form-group').removeClass('has-info').addClass('has-error');
                            $(".datepicker").val('');
                            $('#dateOfDeposit').focus;
                            return false;
                        } else {
                            $('#dateOfDeposit').closest('.form-group').removeClass('has-error').addClass('has-info');
                        }
                    }
                },
                amount: {
                    required: true
                }
            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },
            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
                $(e).remove();
            },
            unhighlight: function (e) { // <-- fires when element is valid
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            }
        });

        $("#saveAndPosting").on('click', function (e) {
            $("#statusId").val("1001");
            jQuery("#depositForm").submit();
        });

        $("#saveAndSendForChecking").on('click', function (e) {
            $("#statusId").val("2001");
            jQuery("#depositForm").submit();
        });

    });     // end document ready


    var a = ['', 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ', 'Seven ', 'Eight ', 'Nine ', 'Ten ', 'Eleven ', 'Twelve ', 'Thirteen ', 'Fourteen ', 'fifteen ', 'sixteen ', 'seventeen ', 'eighteen ', 'nineteen '];
    var b = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];

    function inWords(num) {
        if ((num = num.toString()).length > 9) return 'overflow';
        var number = num.replace('.00', '');
        number = number.replace(/,/g, '');
//         number = number.split(',').join('');
//         number = number.replace(',','');
        var n = ('000000000' + number).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
        if (!n) return;
        var str = '';
        str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'Crore ' : '';
        str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'Lakh ' : '';
        str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'Thousand ' : '';
        str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'Hundred ' : '';
        str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'Only ' : '';
        $('span#amountInWord').text(str);
    }


    $(".depositorCurrCode").change(function () {
        $("#conversionAmount").val('');
        $("#amountInWord").text('None');
        $("#conversionAmountDiv").hide();
        $("#conversionRateDiv").hide();

        var depositorCurrCode = $("#depositorCurrCode option:selected").text();
        var conversionRate = 78
        var recipientCurrCode = $("#recipientCurrencyCode").val();
        var depositAmount = $("#depositAmount").val();

        if (depositAmount.isEmpty) {
            $("#conversionAmount").val('');
            $("#amountInWord").text('None');
            $("#conversionAmountDiv").hide();
            $("#conversionRateDiv").hide();
            return false;
        }
        if (depositorCurrCode == recipientCurrCode) {
            if (depositAmount == 0.00) {
                $("#amountInWord").text('None');
                return false
            }
            $("#amountInWord").text('None');
            $("#conversionAmount").val('');
            $("#conversionAmountDiv").hide();
            $("#conversionRateDiv").hide();
            inWords(depositAmount);
//            toWords(depositAmount);
        } else {
            if (depositAmount == 0.00) {
                $("#amountInWord").text('None');
                $("#conversionAmount").val('');
                $("#conversionAmountDiv").hide();
                $("#conversionRateDiv").hide();
                return false
            }
            var convertedAmount = parseFloat(depositAmount.replace(/[^\d\.]/g, '') * conversionRate);
            $("#conversionAmount").val(convertedAmount.toFixed(${decimalSep}));
            $("#conversionRateTxt").text("Rate :" + conversionRate);
            $("#conversionAmountDiv").show();
            $("#conversionRateDiv").show();
            inWords(convertedAmount);
//            toWords(convertedAmount);
        }
    });

    $("#depositAmount").focusout(function () {
        $("#amountInWord").text('None');
        $("#conversionAmount").val('');
        $("#conversionAmountDiv").hide();
        $("#conversionRateDiv").hide();

        var depositorCurrCode = $("#depositorCurrCode option:selected").text();
        var conversionRate = 78
        var recipientCurrCode = $("#recipientCurrencyCode").val();
        var depositAmount = $("#depositAmount").val();

        if (depositAmount == 0.00) {
            $("#amountInWord").text('None');
            return false;
        }
        if (!recipientCurrCode) {
            inWords(depositAmount);
//            toWords(depositAmount);

            return false;
        }

        if (depositorCurrCode == recipientCurrCode) {
            $("#conversionAmount").val('');
            $("#conversionAmountDiv").hide();
            $("#conversionRateDiv").hide();
            inWords(depositAmount);
//            toWords(depositAmount);
        } else {
            if (depositAmount == 0.00) {
                $("#amountInWord").text('None');
                $("#conversionAmount").val('');
                $("#conversionAmountDiv").hide();
                $("#conversionRateDiv").hide();
                return false
            }
            var convertedAmount = parseFloat(depositAmount.replace(/[^\d\.]/g, '') * conversionRate);
            $("#conversionAmount").val(convertedAmount.toFixed(${decimalSep}));
            $("#conversionRateTxt").text("Rate :" + conversionRate);
            $("#conversionAmountDiv").show();
            $("#conversionRateDiv").show();
            inWords(convertedAmount);
//            toWords(convertedAmount);
        }
    });

    function initDefaultValue() {
        var dateF = "${dateFormat}";
        var dateM = " ${dateMask}";
        currentDate = "${currentDt}";
        $(".datepicker").val(currentDate);
        $(".datepicker").inputmask(dateM);

        $('input:radio[id="depositTypeCash"]').prop('checked', true);

        $('input[name=amount]').autoNumeric("init", {mDec: ${decimalSep}});

        $('#depositAmount').autoNumeric('set', $('#depositAmount').val());

        var date = new Date();
        date.setDate(date.getDate() - 1);

        $("#dateOfDeposit").datepicker({
            format: dateF,
            startDate: date,
            gotoCurrent:true,
            stepMonths:1,
            autoclose:true,
            todayHighlight:true
        })
        jQuery.validator.messages.required = "";
    }

    $('#showDetailsAccountHolder').click(function (e) {
        var receiptAccountId = $("#accountHolderId").val();
        jQuery.ajax({
            type: 'post',
            dataType: 'json',
            url: "${createLink(controller:'accountHolderInfo', action: 'showAccountDetails')}?receiptAccountId=" + receiptAccountId,
            success: function (data, textStatus) {
                showPopoverData(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            complete: function (XMLHttpRequest, textStatus) {
                showSpinner(false);
            }
        });

        return false;
    });


    function showPopoverData(data) {
        if(data.available == false){
            $('.err-msg').text(data.message).show();
            $('div#error-message-div').show();
            return false;
        }
        $("#lblAccNum").text(data.client.accountNo);
        $("#lblAccTitle").text(data.accTitle);
        $("#lblName").text(data.client.name);
        $("#lblNamePhoto").text(data.client.name);
        $("#lblAccType").text(data.accType);
        $("#lblAccOpDate").text(data.accOpDate);

        $("#showAccountDetailsPopover").show();

        /* var offset = $(element).offset();
         $pop.css('left',offset.left + 20);
         $pop.css('top',offset.top - 25);*/
        /*    if ($("#showDetailsAccountHolder").is(":checked")) {
         $pop.show();
         }*/
    }

    function showDepositorInfoForSame() {

        if ($("#depositorAndAccHolder").is(":checked") && $("#accountHolderId").val()) {
            $("#cashDepositorAccountNo").val($("#accountHolderId").val());
            $("#cashDepositorAccountNo").attr('readOnly', true);
            $("#cashDepositorName").val($("#accountHolderName").val());
            $("#cashDepositorName").attr('readOnly', true);
            $("#cashDepositorContactNo").val();
            $("#cashDepositorAddress").val();
        } else {
            $("#cashDepositorAccountNo").val('');
            $("#cashDepositorAccountNo").attr('readOnly', false);
            $("#cashDepositorName").val('');
            $("#cashDepositorName").attr('readOnly', false);
            $("#cashDepositorAddress").val('');
        }

        return false;
    }

    function onSubmitDepositForm() {
//        trimForm('#depositForm');
        if (!$('#depositForm').valid()) return false;

        jQuery.ajax({
            type: 'post',
            data: jQuery("#depositForm").serialize(),
            url: "${createLink(controller:'bankDeposit', action: 'deposit')}",
            success: function (data, textStatus) {
                $("#page-content").html(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            complete: function (XMLHttpRequest, textStatus) {
                showSpinner(false);
            }
        });
        return false;
    }

    $('span.cheque-validate-link').click(function (e) {
        var control = this;
        var url = $(control).attr('url');
        var chequeNumber = $("#chequeNumber").val();
        jQuery.ajax({
            type: 'POST',
            url: "${createLink(controller:'bankDeposit', action: 'showChequeInfo')}?chequeNumber=" + chequeNumber,
            dataType: 'json',
//            data: {chequeNumber: chequeNumber},
            success: function (data, textStatus) {
                showModalForChequeValidation(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            }
        });
    });

    function showModalForChequeValidation(data){
        if(data){
            $("#cheque-no").text(data.chequeNo);
            $('#chequeValidationModal').modal("show");
        }
        return false;
    }

    $(".cheque-validation-btn").click(function(e){
        var control = this;
        var isValid = $(control).attr('isValid');
        var chequeNumber = $("#chequeNumber").val();

        jQuery.ajax({
            type: 'post',
//            data: {chequeNumber: chequeNumber},
            dataType: 'json',
            url: "${createLink(controller:'bankDeposit', action: 'validateCheque')}?chequeNumber= " + chequeNumber + "&isValid=" + isValid,
            success: function (data, textStatus) {
                if (data.verified == true) {
                    $("#link-message").text('');
                    $("#verified-status").show();
                    $("#verify-message").text(data.verifiedInfo);
                    $("#cheque-verify-link-div").hide();
                    $("#saveAndSendForChecking").removeClass("disabled");
                    $('#chequeValidationModal').modal("hide");
                } else if(data.verified == false) {
                    $("#link-message").text('');
                    $("#chequeNumber").val('');
                    $("#verified-status").show();
                    $("#verify-message").text("Cheque not verified!");
                    $("#cheque-verify-link-div").hide();
                    $("#close-chequeVerified-btn").show();
                    $('#chequeValidationModal').modal("hide");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            complete: function (XMLHttpRequest, textStatus) {
                showSpinner(false);
            }

        });
    });

/*    function checkPreviousDate() {
        var EnteredDate = $("#dateOfDeposit").val(); // For JQuery
        var date = EnteredDate.substring(0, 2);
        var month = EnteredDate.substring(3, 5);
        var year = EnteredDate.substring(6, 10);
        var myDate = new Date(year, month - 1, date);
        var today = new Date();
        if (myDate > today) {
            alert("Previous date not allowed");
        }
    }*/

    $("#reset").click(function (e) {
        $("#depositForm").validate().resetForm();
        $(".datepicker").val(currentDate);
        $("#accountHolderId").val('');
        $("#showDetailsAccountHolderDiv").hide();
        $("#depositorAndAccHolder").prop('checked', false);
        $('.form-group').removeClass('has-error');
        $('.form-group').removeClass('has-info');
        $("input[type=text],input[type=number], input[type=select], textarea").val('');
        $('input:radio[id="depositTypeCash"]').prop('checked', true);
        $("#depositTypeChequeDiv").find("input").removeClass("required").addClass("cheque-req");
        $("#depositTypeChequeDiv").hide();
        $("#depositTypeBankTransferDiv").hide();
        $("#depositTypeBankTransferDiv").find("input").removeClass("required").addClass("bank-req");
        $("#depositTypeCardDiv").hide();
        $("#conversionAmountDiv").hide();
        $("#amountInWord").text('None');
        $("select#depositorCurrCode").prop('selectedIndex',0).attr('disabled',true);
        $("#depositTypeCashDiv").show();
        $("#saveAndPosting").removeClass("disabled");
        $("#verified-status").remove();
    });

    function trimForm(form) {
        // iterate over all of the inputs for the form
        $(':input', form).each(function () {
            var type = this.type.toLowerCase();
            var tag = this.tagName.toLowerCase(); // normalize case

            // for inputs and textareas
            if (type == 'text' || type == 'hidden' || tag == 'textarea')
                this.value = jQuery.trim(this.value);
        });
    }

</script>
</head>

<body>
<g:if test='${flash.message}'>
    <div class='alert alert-success '>
        <i class="icon-bell green"><b>${flash.message}</b></i>
        <button data-dismiss="alert" class="close" type="button">
            <i class="icon-remove"></i>
        </button>
    </div>
</g:if>
<g:hasErrors bean="${commandObjError}">
    <div class='alert alert-success '>
        <ul>
            <g:eachError var="err" bean="${commandObjError}">
                <li><g:message error="${err}"/></li>
            </g:eachError>
            <button data-dismiss="alert" class="close" type="button"><i class="icon-remove"></i></button>
        </ul>
    </div>
</g:hasErrors>
<div class="row">
<div class="alert alert-danger" id="error-message-div" style="display: none">
    <a class="close" onclick="$('div#error-message-div').hide();">×</a>
    <span class="err-msg">&nbsp;</span>
</div>

<div class="col-md-12">
<div class="widget-box">
<div class="widget-header widget-header-blue widget-header-flat"><h4 class="lighter">
    <g:message code="coreBanking.operation.deposit.header.lbl" default="Deposit"/></h4>
</div>

<div class="widget-body">
<div class="widget-main no-padding">

<g:form name="depositForm" method="post" role="form" id="depositForm" class="form-horizontal cssform">
<fieldset>
<g:hiddenField name="branchId" id="branchId"/>
<g:hiddenField name="currencyId" id="currencyId"/>
<g:hiddenField name="accountHolderId" id="accountHolderId"/>
<g:hiddenField name="status" id="statusId"/>
<g:hiddenField name="recipientCurrency" id="recipientCurrencyId"/>

<div class="col-md-6">
    <div class="form-group col-md-12">
        <label for="receiptAccountId" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.recipient.ac.lbl" default="Recipient A/C No"/><span class="required-indicator">*</span></label>

        <div class="col-md-6">
            <input type="text" class="form-control" id="receiptAccountId" name="receiptAccountId"
                   placeholder="Receipt Account No">
        </div>

        <div class="col-md-2" id="showDetailsAccountHolderDiv"
             style="display: none; padding-left: 0px; padding-right: 0px;">
            <label for="showDetailsAccountHolder" title="Show Account Holder Details">
                <input name="showDetails" type="checkbox" class="ace showAccountDetailsPopover"
                       id="showDetailsAccountHolder"/>
                <span class="lbl">&nbsp;Details</span>
            </label>
        </div>
    </div>

    <div class="form-group col-md-12">
        <label for="accountHolderName" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.recipient.ac.holder.name.lbl" default="A/C Holder Name"/></label>

        <div class="col-md-6">
            <input type="text" class="form-control" id="accountHolderName" name="accountHolderName" value=""
                   readonly="true" placeholder="Account Holder Name">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="branchName" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.recipient.branch.name.lbl" default="Branch Name"/></label>

        <div class="col-md-6">
            <input type="text" class="form-control" id="branchName" name="branchName" value="" readonly="true"
                   placeholder="Branch Name">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="dateOfDeposit">
            <g:message code="coreBanking.operation.deposit.date.lbl" default="Date of Deposit"/><span class="required-indicator">*</span></label>

        <div class="col-md-6">
            <div class="input-append date input-group" id="dateOfDeposit">
                <input class="form-control datepicker" type="date" name="dateOfDeposit" data-date-format="dd-mm-yyyy">
                <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
            </div>
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="depositAmount" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.amount.lbl" default="Deposit Amount"/><span class="required-indicator">*</span>
        </label>

        <div class="col-md-6">
            <input type="text" class="form-control amountDouble" id="depositAmount" name="amount"
                   placeholder="Amount (0.00)" style="text-align: right">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12" id="conversionAmountDiv" style="display: none">
        <label for="conversionAmount" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.conversion.amount.lbl" default="Conversion Amount"/></label>

        <div class="col-md-6">
            <input type="text" class="form-control amountDouble" id="conversionAmount" name="conversionAmount"
                   readonly="true" style="text-align: right">
        </div>

        <div id="conversionRateDiv" class="col-md-2" style="display: none">
            <span id="conversionRateTxt"></span>
        </div>
    </div>

    <div class="form-group col-md-12" id="amountInWordDiv">
        <label for="amountInWord" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.amount.in.word.lbl" default="Amount in Word"/></label>

        <div class="col-md-8">
            <span class="control-label" id="amountInWord">None</span>
        </div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label"><g:message code="coreBanking.operation.deposit.recipient.currency.lbl" default="Recipient Currency"/></label>

        <div class="col-md-6">
            <input type="text" class="form-control" id="recipientCurrencyCode" name="recipientCurrency"
                   readonly="true" placeholder="Currency Code">
        </div>

        <div class="col-md-2"></div>
    </div>

</div>

<div class="col-md-6">
<div class="form-group col-md-12">
    <label class="control-label col-md-4">
        <g:message code="coreBanking.operation.deposit.type.lbl" default="Deposit Type"/><span class="required-indicator">*</span></label>

    <div class="col-md-8 radio">
        <label>
            <input type="radio" name="depositType" id="depositTypeCash" class="ace" value="${DepositType.CASH}">
            <span class="lbl">&nbsp;<g:message code="coreBanking.operation.deposit.type.cash.lbl" default="Cash"/></span>
        </label>
        <label>
            <input type="radio" name="depositType" id="depositTypeCheque" class="ace" value="${DepositType.CHEQUE}">
            <span class="lbl">&nbsp;<g:message code="coreBanking.operation.deposit.type.cheque.lbl" default="Cheque"/></span>
        </label>
        <label>
            <input type="radio" name="depositType" id="depositTypeBankTransfer" class="ace"
                   value="${DepositType.BANK_TRANSFER}">
            <span class="lbl">&nbsp; <g:message code="coreBanking.operation.deposit.type.transfer.lbl" default="Transfer"/></span>
        </label>
        <label>
            <input type="radio" name="depositType" id="depositTypeCreditCard" class="ace"
                   value="${DepositType.CREDIT_CARD}">
            <span class="lbl">&nbsp;<g:message code="coreBanking.operation.deposit.type.card.lbl" default="Card"/></span>
        </label>

    </div>
</div>

<div id="depositTypeCashDiv">
    <div class="form-group col-md-12">
        <label for="cashDepositorAccountNo" class="col-md-4 control-label"><g:message code="coreBanking.operation.deposit.depositor.ac.no.lbl" default="Depositor A/C No"/>
        </label>

        <div class="col-md-6">
            <input type="text" class="form-control" id="cashDepositorAccountNo" name="cash.accountNo"
                   placeholder="Depositor A/C No">
        </div>

        <div class="col-md-2">
            <label for="depositorAndAccHolder" title="Depositor & Account Holder are same">
                <input name="depositorAndAccHolder" type="checkbox" class="ace" id="depositorAndAccHolder"
                       onclick="showDepositorInfoForSame();"/>
                <span class="lbl">&nbsp;Do</span>
            </label>
        </div>
    </div>

    <div class="form-group col-md-12">
        <label for="cashDepositorName" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.name.lbl" default="Depositor Name"/></label>

        <div class="col-md-6">
            <input type="text" class="form-control" id="cashDepositorName" name="cash.name"
                   placeholder="Depositor Name">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="cashDepositorContactNo" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.phone.lbl" default="Phone No"/></label>

        <div class="col-md-6">
            <input type="text" class="form-control" id="cashDepositorContactNo" name="cash.phoneNo"
                   placeholder="Phone No">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="cashDepositorAddress" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.address.lbl" default="Address"/></label>

        <div class="col-md-6">
            <input type="text" class="form-control" id="cashDepositorAddress" name="cash.address"
                   placeholder="Address">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.currency.lbl" default="Depositor Currency"/></label>

        <div class="col-md-6">
            <select class="form-control depositorCurrCode required" name="depositorCurrency" id="depositorCurrCode" disabled="true">
                <g:each var="currCode" in="${Currencys.list()}">
                    <option value="${currCode.id}" ${currCode.id == 5 ? 'selected' : ''}>${currCode.symbol}</option>
                </g:each>
            </select>
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="commentCash" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.comment.lbl" default="Comments"/></label>

        <div class="col-md-6">
            <textarea type="text" class="form-control" id="commentCash" name="cash.comment" placeholder="Comments here"></textarea>
        </div>

        <div class="col-md-2"></div>
    </div>
</div>

<div id="depositTypeChequeDiv" style="display:none">
    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="bankId">Bank Name<span class="required-indicator">*</span>
        </label>

        <div class="col-md-6">
            %{--   <g:select class="width-40 chosen-select" id="bankId" name='bankId'
                         noSelection="${['': 'Select Bank...']}"
                         from='${Country.list()}'
                         optionKey="id" optionValue="name">
               </g:select>--}%

            <select class="form-control required" name="bankId" id="bankId" onchange="">
                <g:each var="currCode" in="${BankSetup.list()}">
                    <option value="1" class="selected">Oroscapital</option>
                </g:each>
            </select>
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="chequeDepositorAccountNo" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.ac.no.lbl" default="Depositor A/C No"/><span
                class="required-indicator">*</span></label>

        <div class="col-md-6">
            <input type="text" class="form-control cheque-req"
                   id="chequeDepositorAccountNo" name="cheque.accountNo"
                   placeholder="Depositor A/C No">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="chequeDepositorName" class="col-md-4 control-label"><g:message code="coreBanking.operation.deposit.depositor.name.lbl" default="Depositor Name"/>
        <span class="required-indicator">*</span></label>

        <div class="col-md-6">
            <input type="text" class="form-control cheque-req" id="chequeDepositorName" name="cheque.name"
                   placeholder="Depositor Name">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="branchId" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.br.name.lbl" default="Branch Name"/>
        <span class="required-indicator">*</span></label>

        <div class="col-md-6">
            <input type="text" class="form-control cheque-req" id="branchId" name="cheque.branch" placeholder="Branch Name">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="addressCheck" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.address.lbl" default="Address"/><span class="required-indicator">*</span></label>

        <div class="col-md-6">
            <input type="text" class="form-control cheque-req" id="addressCheck" name="cheque.address" placeholder="Address">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="chequeNumber">
            <g:message code="coreBanking.operation.deposit.depositor.cheque.no.lbl" default="Cheque No"/><span class="required-indicator">*</span>
        </label>

        <div class="col-md-6">
            <input id="chequeNumber" class="form-control cheque-req" type="text" name="cheque.chequeNumber"
                   placeholder="Cheque Number(205537130)" maxlength="9" min="9">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div id="chequeVerifiedDiv" class="form-group col-md-12" style="display: none">

        <div class="col-md-10">
            <div class="alert alert-warning alert-dismissable" id="cheque-verify-link-div" style="display: none">
                <span url="${createLink(controller: 'bankDeposit', action: 'validateCheque')}" id="validate-url" class="cheque-validate-link" style="cursor: pointer">
                    <strong><span id="link-message"></span>&nbsp;<span id="verify-cheque-number"></span></strong>
                </span>
            </div>

            <div class="alert alert-warning alert-dismissable" id="verified-status" style="display: none">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true" id="close-chequeVerified-btn" style="display: none"
                        onclick="$('#chequeVerifiedDiv').hide();"></button>
                <span><strong><span id="verify-message"></span>&nbsp;</strong></span>
            </div>
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.currency.lbl" default="Depositor Currency"/></label>

        <div class="col-md-6">
            <select class="form-control depositorCurrCode required" name="cheque.depositorCurrency" id="chequeDepositorCurrCode" disabled="true">
                <g:each var="currCode" in="${Currencys.list()}">
                    <option value="${currCode.id}" ${currCode.id == 5 ? 'selected' : ''}>${currCode.symbol}</option>
                </g:each>
            </select>
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="commentCheque" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.comment.lbl" default="Comments"/></label>

        <div class="col-md-6">
            <textarea type="text" class="form-control" id="commentCheque" name="cheque.comment"
                      placeholder="Comments here"></textarea>
        </div>

        <div class="col-md-2"></div>
    </div>
</div>

<div id="depositTypeBankTransferDiv" style="display:none">
    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="bankId">
            <g:message code="coreBanking.operation.deposit.depositor.bank.name.lbl" default="Bank Name"/>
            <span class="required-indicator">*</span>
        </label>

        <div class="col-md-6">
            %{--   <g:select class="width-40 chosen-select" id="bankId" name='bankId'
                         noSelection="${['': 'Select Bank...']}"
                         from='${Country.list()}'
                         optionKey="id" optionValue="name">
               </g:select>--}%

            <select class="form-control required" name="bankId" id="bankId" onchange="">
                <g:each var="currCode" in="${BankSetup.list()}">
                    <option value="1" class="selected">Oroscapital</option>
                </g:each>
            </select>
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="chequeDepositorAccountNo" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.ac.no.lbl" default="Depositor A/C No"/><span
                class="required-indicator">*</span></label>

        <div class="col-md-6">
            <input type="text" class="form-control cheque-req" id="bankDepositorAccountNo" name="bank.accountNo"
                   placeholder="Depositor A/C No">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="chequeDepositorName" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.name.lbl" default="Depositor Name"/><span class="required-indicator">*</span></label>

        <div class="col-md-6">
            <input type="text" class="form-control cheque-req" id="bankDepositorName" name="bank.name"
                   placeholder="Depositor Name">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="branchId" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.br.name.lbl" default="Branch Name"/><span class="required-indicator">*</span></label>

        <div class="col-md-6">
            <input type="text" class="form-control cheque-req" id="bankBranchId" name="bank.branch"
                   placeholder="Branch Name">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="addressCheck" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.address.lbl" default="Address"/><span class="required-indicator">*</span>
        </label>

        <div class="col-md-6">
            <input type="text" class="form-control cheque-req" id="bankAddress" name="bank.address"
                   placeholder="Address">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="pinCode">
            <g:message code="coreBanking.operation.deposit.depositor.pin.code.lbl" default="PIN Code"/><span class="required-indicator">*</span>
        </label>

        <div class="col-md-6">
            <input id="pinCode" class="form-control bank-req" type="text" name="bank.pinCode"
                   placeholder="PIN Code">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.depositor.currency.lbl" default="Depositor Currency"/></label>

        <div class="col-md-6">
            <select class="form-control depositorCurrCode required" name="bankId" id="bankTrbankId" disabled="true">
                <g:each var="currCode" in="${Currencys.list()}">
                    <option value="${currCode.id}" ${currCode.id == 5 ? 'selected' : ''}>${currCode.symbol}</option>
                </g:each>
            </select>
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label for="commentCheque" class="col-md-4 control-label">
            <g:message code="coreBanking.operation.deposit.comment.lbl" default="Comments"/></label>

        <div class="col-md-6">
            <textarea type="text" class="form-control" id="bankComment" name="bank.comment"
                      placeholder="Comments here"></textarea>
        </div>

        <div class="col-md-2"></div>
    </div>

</div>

<div id="depositTypeCardDiv" style="display:none">
    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="cardName">
            <g:message code="coreBanking.operation.deposit.depositor.card.name.lbl" default="Name of Card"/></label>
        %{--
                <div class="col-md-4">
                    <input id="nameOnCard" class="form-control card-req" type="text" name="card.nameOnCard"
                           placeholder="Name of Card">
                </div>--}%
        <div class="col-md-6">
            <select class="form-control required" name="cardName" id="cardName"
                    onchange="">
                <option value="">Select Card Type</option>
                <g:each var="cardType" in="${CardType}">
                    <option value="${cardType.value}">${cardType.value}</option>
                </g:each>
            </select>
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="cardNo">
            <g:message code="coreBanking.operation.deposit.depositor.card.holder.name.lbl" default="Card Holder Name"/></label>

        <div class="col-md-6">
            <input id="cardHolderName" class="form-control card-req" type="text"
                   name="card.cardHolderName" placeholder="Card Holder Name">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="cardNo">
            <g:message code="coreBanking.operation.deposit.depositor.card.no.lbl" default="Card No"/></label>

        <div class="col-md-6">
            <input id="cardNo" class="form-control card-req" type="text"
                   name="card.cardNo" placeholder="Card No">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="expireDate">
            <g:message code="coreBanking.operation.deposit.depositor.card.expire.dt.lbl" default="Expired Date"/></label>

        <div class="col-md-6">
            <input id="expireDate" class="form-control card-req" type="date" name="card.expireDate"
                   placeholder="Expired Date">
        </div>

        <div class="col-md-2"></div>
    </div>

    <div class="form-group col-md-12">
        <label class="col-md-4 control-label" for="securityCode">
            <g:message code="coreBanking.operation.deposit.depositor.card.security.code.lbl" default="Security Code"/></label>

        <div class="col-md-6">
            <input id="securityCode" class="form-control card-req" type="text" name="card.securityCode"
                   placeholder="Security Code">
        </div>

        <div class="col-md-2"></div>
    </div>
</div>
</div>
</g:form>
</fieldset>
</div>
</div>
</div>
</div>

<div class="clearfix form-actions col-md-12" id="deposit-button-panel" style="padding: 5px 20px; margin-top: 5px; border-top: 0px ">
    <div id="deposit-button-panel-action" class="col-md-6 col-md-offset-6 pull-left">
        <sec:access controller="bankDeposit" action="deposit">
            <button class="btn btn-primary btn-success" type="submit" id="saveAndPosting"><i
                    class="icon-ok bigger-110"></i>Save & Posting</button>
            <button class="btn btn-primary btn-success disabled" type="submit" id="saveAndSendForChecking">
                <i class="icon-ok bigger-110"></i>Save & Send for Checking
            </button>
        </sec:access>
        <button type="button" class="btn reset-button" id="reset"><i class="icon-undo bigger-110"></i>Reset</button>
    </div>
    %{--<div class="col-md-2"></div>--}%
</div>

</div>

<div id="showAccountDetailsPopover" style="display: none;">
    <div class="popover fade right in" data-placement="right" style="display: block; top: -10px; left: 640px;">
        <div class="arrow"></div>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding-right: 3px"
                onclick="$('div#showAccountDetailsPopover').hide();">×</button>

        <h3 class="popover-title">Account Holder Details</h3>

        <div class="popover-content">
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <label class="control-label">A/C No:</label>
                        <label class="align-left control-label" id="lblAccNum"></label>
                    </div>

                    <div class="form-group">
                        <label class="control-label">A/C Title:</label>
                        <label class="control-label" id="lblAccTitle"></label>
                    </div>

                    <div class="form-group"><label class="control-label">A/C Holder Name:</label>
                        <label class="control-label" id="lblName"></label>
                    </div>

                    <div class="form-group"><label class="control-label">A/C Type:</label>
                        <label class="control-label" id="lblAccType"></label>
                    </div>

                    <div class="form-group"><label class="control-label">Opening Date:</label>
                        <label class="control-label" id="lblAccOpDate"></label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="col-md-offset-2">
                        %{--<img border="1" class="img-polaroid" alt="150x150" src="/template/static/images/pic2.png" width="150"
                             height="150">
--}%
                        <span class="profile-picture">
                            <img src="/gslcbs/images/default-photo.png" width="160" height="105" alt="Client Avatar" class="img-thumbnail" id="avatar" style="display: block;"/>
                        <label class="control-label" id="lblNamePhoto" style="font-size: 10px"></label>
                        </span>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

%{--modal--}%

<div id="chequeValidationModal" role="dialog" tabindex="-1" class="bootbox modal fade in" style="display: none;" aria-hidden="false">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="padding: 10px;">
                <button class="close-button close" type="button" data-dismiss="modal" aria-hidden="true" style="font-size: 22px;">×</button>
                <h2 class="modal-title" style="font-size: 20px;">Cheque Validation</h2>
            </div>
            <div class="modal-body">
                <div class="bootbox-body">
                    <span class="bigger-110">Cheque Number <strong><span id="cheque-no"></span></strong></span></div>
            </div>

            <div class="modal-footer">
                <button id="cheque-valid" isValid="true" class="btn btn-sm btn-success cheque-validation-btn" type="button" data-bb-handler="success">
                    <i class="icon-ok"></i> Valid
                </button>
                <button id="cheque-not-valid" isValid="false" class="btn btn-sm btn-danger cheque-validation-btn" type="button" data-bb-handler="danger">Not Valid!</button>
                %{--<button class="btn btn-sm" type="button" data-bb-handler="cancel">Cancel</button>--}%
            </div>
        </div>
    </div>
</div>
</body>
</html>
