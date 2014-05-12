<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <style>
    .form-control, label, textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"]{font-size: 12px;}
    label{max-width: 150px;}
    </style>
    <title></title>
</head>
<body>

<g:hasErrors bean="${vendorBankAccount}">
    <div class='alert alert-success '>
        <ul>
            <g:eachError var="err" bean="${vendorBankAccount}">
                <li><g:message error="${err}" /></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>
<g:form name="vendorBankAccountInfoForm" id="vendorBankAccountInfoForm" method="post" url="[controller:'vendor', action:'saveVendorBankAccountInfo']" role="form" class="form-horizontal" onsubmit="return false;">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="col-xs-6 col-sm-6 col-md-6">
                <g:hiddenField name="id" id="vendorId" value="${vendorMaster?.id}"/>
                <g:hiddenField name="accountID" id="accountID"/>

                <div class="form-group ${hasErrors(bean: vendorBankAccount, field: 'bankName','has-error')}">
                    <label for="vendorbankName" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.bankAccount.bankName" default="Bank Name"/><span class="red">*</span>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Bank Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Bank Name'" id="vendorbankName"
                                   name="bankName" value=""/>
                        </div>
                    </div>
                </div>



                <div class="form-group ${hasErrors(bean: vendorBankAccount, field: 'bankAccountNo','has-error')}">
                    <label for="vendorBankAccountNo" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.bankAccount.accountNo" default="Account Number"/><span class="red">*</span>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Bank Account No" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Bank Account No'" id="vendorBankAccountNo"
                                   name="bankAccountNo" value=""/>
                        </div>
                    </div>
                </div>

                <div class="form-group ${hasErrors(bean: vendorBankAccount, field: 'status','has-error')}">
                    <label for="vendorStatus" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.basicInfo.status" default="Status"/>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <select id="vendorStatus" class="col-sm-11 col-xs-12" name="status">
                                <g:if test="${vendorBankAccount?.status != null}">
                                    <g:if test="${vendorBankAccount?.status == 1}">
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </g:if>
                                    <g:else>
                                        <option value="0">Inactive</option>
                                        <option value="1">Active</option>
                                    </g:else>
                                </g:if>
                                <g:else>
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </g:else>
                            </select>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-xs-6 col-sm-6 col-md-6">

                <div class="form-group ${hasErrors(bean: vendorBankAccount, field: 'bankAccountName','has-error')}">
                    <label for="vendorBankAccountName" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.bankAccount.accountName" default="Account Name"/><span class="red">*</span>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Bank Account Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Bank Account Name'" id="vendorBankAccountName"
                                   name="bankAccountName" value=""/>
                        </div>
                    </div>
                </div>

                <div class="form-group ${hasErrors(bean: vendorBankAccount, field: 'ibanPrefix','has-error')}">
                    <label for="vendorIbanPrefix" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.bankAccount.ibanPrefix" default="Iban Prefix"/><span class="red">*</span>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Iban Prefix" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Iban Prefix'" id="vendorIbanPrefix"
                                   name="ibanPrefix" value=""/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="addBankAccount" class="col-sm-4 col-xs-6 control-label no-padding-right"></label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <g:if test="${vendorMaster?.bankAccountInfo}">
                                <button class="btn btn-primary btn-sm" type="submit" name="addBankAccount" id="addBankAccount">Add another Account</button>
                            </g:if>
                            <g:else>
                                <button class="btn btn-primary btn-sm" type="submit" name="addBankAccount" id="addBankAccount">Add Bank Account</button>
                            </g:else>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</g:form>
<div class= "row" id="bankAccountList">
    <g:render template="bankAccountList"/>
</div>


<script type="text/javascript">

    jQuery(function ($) {

        $('#vendorBankAccountInfoForm').validate({

            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                bankName: {
                    required: true
                },
                bankAccountName: {
                    required: true
                },
                bankAccountNo: {
                    required: true
                },
                ibanPrefix: {
                    required: true
                }
            } ,
            messages: {
                bankName: {
                    required: " "
                },
                bankAccountName: {
                    required: " "
                },
                bankAccountNo: {
                    required: " "
                },
                ibanPrefix: {
                    required: " "
                }

            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },

            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
                $(e).remove();
            },
            errorPlacement: function (error, element) {
                if(element.is(':checkbox') || element.is(':radio')) {
                    var controls = element.closest('div[class*="col-"]');
                    if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                }
                else if(element.is('.select2')) {
                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                }
                else if(element.is('.chosen-select')) {
                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                }
                else error.insertAfter(element.parent());
            },
            submitHandler: function (form) {
                $.ajax({
                    url:"${createLink(controller: 'vendor', action: 'saveVendorBankAccountInfo')}",
                    type:'post',
                    dataType: 'html',
                    data: $("#vendorBankAccountInfoForm").serialize(),
                    success:function(data){
                        var vendorId='${vendorMaster?.id}';
                        clearForm('#vendorBankAccountInfoForm');
                        $('#bankAccountList').html(data);
                        $('#vendorId').val(vendorId);
                        $('#addBankAccount').html('Add another account')
                    },
                    failure:function(data){
                    }
                })

            }
        });
    });

</script>
</body>
</html>