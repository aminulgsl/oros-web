<%--
  Created by IntelliJ IDEA.
  User: Mohammed Imran
  Date: 3/5/14
  Time: 12:46 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <script type="text/javascript">
        $(document).ready(function () {
            var getDecimal = "${decimalSep}"; // todo assign variable as configurable
            $('#minAmountPerDay').autoNumeric('init', {mDec: getDecimal});
            $('#maxAmountPerDay').autoNumeric('init', {mDec: getDecimal});
            $('#minDeposit').autoNumeric('init', {mDec: getDecimal});
            $('#maxDeposit').autoNumeric('init', {mDec: getDecimal});
            $('#minWithdrawal').autoNumeric('init', {mDec: getDecimal});
            $('#maxWithdrawal').autoNumeric('init', {mDec: getDecimal});

            $("#country").change(function () {
                var id = $(this).val();
                $.ajax
                ({
                    type: "POST",
                    url: "${createLink(controller: "retailerSetup",action: "streetList")}",
                    data: {country: id},
                    cache: false,
                    success: function (data) {
                        $("#state").html(data);
                    }
                });
            });

            $("#retailerSetupForm").submit(function (e) {
                var actionUrl = "${createLink(controller: 'retailerSetup', action: 'save')}";
//                var retailerId = $('#retailerId').val()
//                if (retailerId > 0) {
                %{--actionUrl = "${createLink(controller: 'retailerSetup', action: 'update')}";--}%
//                }
                if (!this.checkValidity()) {
//                    alert($(this).find('input:invalid').size());
                    var invalidInputs = $(this).find('input:invalid');
                    var firstInvalidInput = $(invalidInputs[0]).attr('name');
                    $(this).find('input:invalid').first().closest('div.panel-collapse').collapse("show");
                    return false;
                } else {
                    $.ajax({
                        type: "POST",
                        dataType: "html",
                        url: actionUrl,
                        data: $(this).serialize(),
                        success: function (data) {
                            $("#page-content").html(data);
                        }
                    });
                    e.preventDefault();
                    return false;
                }

            });

        });
    </script>

    <title></title>
</head>

<body>
<div class="row">
%{--message--}%
    <g:if test="${flash.retailerMessage}">
        <div class="alert alert-success">
            <i class="icon-bell green"><b>${flash.retailerMessage}</b></i>
        </div>
    </g:if>
%{--End Message--}%

    <g:hasErrors bean="${retailerSetup}">
        <div class='alert alert-success '>
            <ul>
                <g:eachError var="err" bean="${retailerSetup}">
                    <li><g:message error="${err}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    <div class="col-xs-12">
        <div class="widget-box">
            <div class="widget-header widget-header-large blue ">
                <h5><g:message code="coreBanking.setting.retailerSetup.title" default="Retailer Setup"/></h5>
            </div>

            <div id="retailerSetup">
                <form class="" id="retailerSetupForm" role="form" method="post">

                    <g:hiddenField name="id" id="retailerId" value="${retailerSetup?.id}"/>

                    <g:if test="${actionName == 'update'}">
                        <input type="hidden" value="${address?.id}" name="addressId"/>
                    </g:if>

                    <g:if test="${actionName == 'save'}">
                        <input type="hidden" value="${addressId}" name="addressId"/>
                    </g:if>

                    <div id="accordion" class="accordion-style1 panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle blue" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseOne">
                                        <i class="icon-angle-down bigger-110" data-icon-hide="icon-angle-down"
                                           data-icon-show="icon-angle-right"></i>
                                        &nbsp;<g:message code="coreBanking.setting.retailerSetup.basicInfo.title"
                                                         default="Basic Information"/>
                                    </a>
                                </h4>
                            </div>

                            <div class="panel-collapse collapse in" id="collapseOne">
                                <div class="panel-body">

                                    <g:render template="/coreBanking/settings/retailerSetup/retailerBasicInfo"/>

                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed blue" data-toggle="collapse"
                                       data-parent="#accordion"
                                       href="#collapseTwo">
                                        <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down"
                                           data-icon-show="icon-angle-right"></i>
                                        &nbsp;<g:message code="default.address.general.title"
                                                         default="General Address"/>
                                    </a>
                                </h4>
                            </div>

                            <div class="panel-collapse collapse" id="collapseTwo">
                                <div class="panel-body">

                                    <g:render template="/coreBanking/settings/retailerSetup/retailerAddress"/>

                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed blue" data-toggle="collapse"
                                       data-parent="#accordion"
                                       href="#collapseThree">
                                        <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down"
                                           data-icon-show="icon-angle-right"></i>
                                        &nbsp;<g:message code="coreBanking.setting.retailerSetup.advanceSetup.title"
                                                         default="Advanced Setup"/>
                                    </a>
                                </h4>
                            </div>

                            <div class="panel-collapse collapse" id="collapseThree">
                                <div class="panel-body">

                                    <g:render template="/coreBanking/settings/retailerSetup/retailerAdvanceSetup"/>

                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="widget-header widget-header-large red">
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn" type="reset">
                                    <i class="icon-undo bigger-110"></i>
                                    <g:message code="default.button.reset.label" default="Reset"/>
                                </button>
                                &nbsp; &nbsp; &nbsp;
                                <g:if test="${retailerSetup?.id}">
                                    <g:submitButton name="Update" id="saveBtn" class="btn btn-info"/>
                                </g:if>
                                <g:else>
                                    <g:submitButton name="Save" id="saveBtn" class="btn btn-info"/>
                                </g:else>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('#retailerSetupForm').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            retailerName: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            retailerCode: {
                required: true,
                number: true,
                min: 5,
                max: 15
            },
            account: {
                required: true
            },
            currency: {
                required: true
            },
            branch: {
                required: true
            },
            "address.country": {
                required: true
            },
            "address.state": {
                required: true
            },
            "address.city": {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            "address.zipCode": {
                required: true
            },
            "address.postCode": {
                required: true
            },
            "address.streetName": {
                required: false,
                minlength: 5,
                maxlength: 15
            },
            "address.phoneNo": {
                required: true
            },
            minAmountPerDay: {
                required: true
            },
            maxAmountPerDay: {
                required: true
            },
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
            }
        },
        messages: {
            retailerName: {
                required: ""
            },
            retailerCode: {
                required: ""
            },
            account: {
                required: ""
            },
            currency: {
                required: ""
            },
            branch: {
                required: ""
            },
            "address.country": {
                required: ""
            },
            "address.state": {
                required: ""
            },
            "address.city": {
                required: ""
            },
            "address.zipCode": {
                required: ""
            },
            "address.postCode": {
                required: ""
            },
            "address.streetName": {
                required: ""
            },
            "address.phoneNo": {
                required: ""
            },
            minAmountPerDay: {
                required: ""
            },
            maxAmountPerDay: {
                required: ""
            },
            minDeposit: {
                required: ""
            },
            maxDeposit: {
                required: ""
            },
            minWithdrawal: {
                required: ""
            },
            maxWithdrawal: {
                required: ""
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#retailerSetupForm')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        }
    });
</script>
</body>
</html>