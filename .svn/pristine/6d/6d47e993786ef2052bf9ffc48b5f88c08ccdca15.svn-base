<%--
  Created by IntelliJ IDEA.
  User: Mohammed Imran
  Date: 2/15/14
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        jQuery(function ($) {

            $(".chosen-select").chosen();
//            $('#phoneNo').mask('(999) 999-9999');
//            $('#mobileNo').mask('(999) 999-9999');
//            $('#faxNo').mask('(999) 999-9999');
//            $('#postalZipCode').mask('99999-9999');


        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#preview").addClass('img-thumbnail');
            $("#country").change(function () {
                var id = $(this).val();

                $.ajax
                ({
                    type: "POST",
                    url: "${createLink(controller: "bankSetup",action: "streetList")}",
                    data: {country: id},
                    cache: false,
                    success: function (html) {
                        $("#state").html(html);
                    }
                });
            });


            $("#postalCountry").change(function () {
                var id = $(this).val();

                $.ajax
                ({
                    type: "POST",
                    url: "${createLink(controller: "bankSetup",action: "postalStateList")}",
                    data: {postalCountry: id},
                    cache: false,
                    success: function (html) {
                        $("#postalState").html(html);
                    }
                });
            });


            $("#bankSetUpform").submit(function (e) {
                var formData = new FormData(this);
                if (this.checkValidity()) {
                    $.ajax({
                        type: "POST",
                        dataType: "html",
                        mimeType: 'multipart/form-data',
                        contentType: false,
                        cache: false,
                        processData: false,
                        url: "${createLink(controller: "bankSetup",action: "update")}",
                        data: formData,
                        success: function (data) {
                            $("#page-content").html(data);
                        }
                    });
                    return false
                } else {
                    var invalidInputs = $(this).find('input:invalid');
                    var firstInvalidInput = $(invalidInputs[0]).attr('name');
                    $(this).find('input:invalid').first().closest('div.panel-collapse').collapse("show");
                    return false
                }
                e.preventDefault();


            });

            $(document).ready(function () {

                function readURL(input) {

                    if (input.files && input.files[0]) {

                        var reader = new FileReader();

                        reader.onload = function (e) {
                            $('#preview').attr('src', e.target.result);
                        }

                        reader.readAsDataURL(input.files[0]);
                    }
                }

                $("#logo").change(function () {
                    readURL(this);
                });
            });


        });
    </script>
</head>

<body>

<sec:access controller='bankSetup' action='index'>
    <div class="row">
    %{--message--}%
        <g:if test="${flash.message}">
            <div class="alert alert-success">
                <i class="icon-bell green"><b>${flash.message}</b></i>
            </div>
        </g:if>
    %{--End Message--}%
        <g:hasErrors bean="${bankSetupData}">
            <div class='alert alert-success '>
                <ul>
                    <g:eachError var="err" bean="${bankSetupData}">
                        <li><g:message error="${err}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>

        <div class="col-xs-12">
            <div class="widget-box ">
                <div class="widget-header widget-header-large blue ">
                    <h5><g:message code="coreBanking.setting.bankSetup.title" default="Bank Setting"/></h5>
                </div>

                <form class="" id="bankSetUpform" role="form" enctype="multipart/form-data" method="post">
                    <g:hiddenField name="bankId" value="${bankSetupData?.id}"/>
                    <g:hiddenField name="generalId" value="${generalAdd?.id}"/>
                    <g:hiddenField name="postalId" value="${postalAdd?.id}"/>

                    <div id="accordion" class="accordion-style1 panel-group">

                        <div class="panel panel-default" id="generalSetting">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle blue" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseOne">
                                        <i class="icon-angle-down bigger-110" data-icon-hide="icon-angle-down"
                                           data-icon-show="icon-angle-right"></i>
                                        &nbsp;<g:message code="coreBanking.setting.bankSetup.generalInfo.title"
                                                         default="General Information"/>
                                    </a>
                                </h4>
                            </div>

                            <div class="panel-collapse collapse in" id="collapseOne">
                                <div class="panel-body">

                                    <g:render template="/coreBanking/settings/bankSetup/generalInformation"/>

                                </div>
                            </div>
                        </div>

                        %{--End of General Information--}%
                        <div class="panel panel-default" id="generalAddress">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed blue" data-toggle="collapse"
                                       data-parent="#accordion"
                                       href="#collapseTwo">
                                        <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down"
                                           data-icon-show="icon-angle-right"></i>
                                        &nbsp;<g:message code="default.address.general.title" default="General Address"/>
                                    </a>
                                </h4>
                            </div>

                            <div class="panel-collapse collapse" id="collapseTwo">
                                <div class="panel-body">

                                    <g:render template="/coreBanking/settings/bankSetup/generalAddress"/>

                                </div>
                            </div>
                        </div>
                        %{--End of general Address--}%

                        <div class="panel panel-default" id="postalAddress">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed blue" data-toggle="collapse"
                                       data-parent="#accordion"
                                       href="#collapseThree">
                                        <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down"
                                           data-icon-show="icon-angle-right"></i>
                                        &nbsp;<g:message code="default.address.postal.title" default="Postal Address"/>
                                    </a>
                                </h4>
                            </div>

                            <div class="panel-collapse collapse" id="collapseThree">
                                <div class="panel-body">

                                    <g:render template="/coreBanking/settings/bankSetup/postalAddress"/>

                                </div>
                            </div>
                        </div>

                        %{--End of Postal Address--}%

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed blue" data-toggle="collapse"
                                       data-parent="#accordion"
                                       href="#collapseFour">
                                        <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down"
                                           data-icon-show="icon-angle-right"></i>
                                        &nbsp;<g:message code="coreBanking.setting.bankSetup.vatTax.title" default="VAT & TAX"/>
                                    </a>
                                </h4>
                            </div>

                            <div class="panel-collapse collapse" id="collapseFour">
                                <div class="panel-body">

                                    <g:render template="/coreBanking/settings/bankSetup/vatAndTax"/>

                                </div>
                            </div>
                        </div>

                        %{--End Of Vat and Tax--}%

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed blue" data-toggle="collapse"
                                       data-parent="#accordion"
                                       href="#collapseFive">
                                        <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down"
                                           data-icon-show="icon-angle-right"></i>
                                        &nbsp;<g:message code="coreBanking.setting.bankSetup.defaultSet.title" default="Default Setting"/>
                                    </a>
                                </h4>
                            </div>

                            <div class="panel-collapse collapse" id="collapseFive">
                                <div class="panel-body">
                                    <g:render template="/coreBanking/settings/bankSetup/defaultSetting"/>
                                </div>
                            </div>
                        </div>

                        %{--End Of Default Setting--}%

                    </div>

                    <sec:access controller='bankSetup' action='update'>
                        <div class="widget-header widget-header-large blue">
                            <div class="col-lg-push-1 right">
                                <input type="submit" class="btn btn-info" id="submit" value="Update"/>
                            </div>
                        </div>
                    </sec:access>
                </form>

            </div><!-- /span -->
        </div>

    </div>
</sec:access>
<script type="text/javascript">
    $('#bankSetUpform').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            bankFullName: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            bankShortName: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            chamberCommerceNo: {
                required: true,
                minlength: 5,
                maxlength: 10
            },
            "general.phoneNo": {
                required: true
            },
            "general.mobileNo": {
                required: true
            },
            "general.faxNo": {
                required: true
            },
            "general.email1": {
                required: false,
                email: true
            },
            "general.websiteUrl": {
                required: true,
                url: true
            },
            "general.country": {
                required: true
            },
            "general.state": {
                required: true
            },
            "general.city": {
                required: true,
                minlength: 4,
                maxlength: 20
            },
            "general.zipCode": {
                required: true,
                number: true

            },
            "postal.country": {
                required: true
            },
            "postal.state": {
                required: true
            },
            "postal.city": {
                required: true,
                minlength: 10,
                maxlength: 20
            },
            "postal.postCode": {
                required: true
            },
            incomeTaxReservation: {
                required: true,
                number: true

            },
            unforeseenExpenseReservation: {
                required: true,
                number: true

            },
            paymentTerm: {
                required: true
            },
            invoiceMoment: {
                required: true
            },
            currencys: {
                required: true
            },
            bankDateFormat: {
                required: true
            },
            amntDeciPoint: {
                required: true
            },
            dateSeparator: {
                required: true
            },
            deciRoundType: {
                required: true
            },
            decimalSeparator: {
                required: true
            },
            language: {
                required: true
            },
            numOfBookingPeriod: {
                required: true
            },
            showGlCodeInReport: {
                required: true
            },
            showItemCodeInReport: {
                required: true
            },
            thousandSeparator: {
                required: true
            },
            reportDateFormat: {
                required: true
            }
        },
        messages: {
            bankFullName: {
                required: " "
            },
            bankShortName: {
                required: " "
            },
            chamberCommerceNo: {
                required: " "
            },
            "general.phoneNo": {
                required: " "
            },
            "general.mobileNo": {
                required: " "
            },
            "general.faxNo": {
                required: " "
            },
            "general.email1": {
                required: " "
            },
            "general.websiteUrl": {
                required: " "
            },
            "general.country": {
                required: " "
            },
            "general.state": {
                required: " "
            },
            "general.city": {
                required: " "
            },
            "general.zipCode": {
                required: ""
            },
            "postal.country": {
                required: " "
            },
            "postal.state": {
                required: " "
            },
            "postal.city": {
                required: " "
            },
            "postal.postCode": {
                required: " "
            },
            paymentTerm: {
                required: " "
            },
            incomeTaxReservation: {
                required: " "
            },
            unforeseenExpenseReservation: {
                required: " "
            },
            invoiceMoment: {
                required: " "
            },
            currencys: {
                required: " "
            },
            bankDateFormat: {
                required: " "
            },
            amntDeciPoint: {
                required: " "
            },
            dateSeparator: {
                required: " "
            },
            deciRoundType: {
                required: " "
            },
            decimalSeparator: {
                required: " "
            },
            language: {
                required: " "
            },
            numOfBookingPeriod: {
                required: " "
            },
            showGlCodeInReport: {
                required: " "
            },
            showItemCodeInReport: {
                required: " "
            },
            thousandSeparator: {
                required: " "
            },
            reportDateFormat: {
                required: " "
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#bankSetUpform')).show();
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