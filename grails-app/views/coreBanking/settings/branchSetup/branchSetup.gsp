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
        $(document).ready(function () {

            $(".chosen-select").chosen();

            $("#generalCountry").change(function () {
                var id = $(this).val();

                $.ajax
                ({
                    type: "POST",
                    url: "${createLink(controller: "branchSetup",action: "stateList")}",
                    data: {generalCountry: id},
                    cache: false,
                    success: function (html) {
                        $("#generalState").html(html);
                    }
                });
            });

            $("#postalCountry").change(function () {
                var id = $(this).val();

                $.ajax
                ({
                    type: "POST",
                    url: "${createLink(controller: "branchSetup",action: "postalStateList")}",
                    data: {postalCountry: id},
                    cache: false,
                    success: function (html) {
                        $("#postalState").html(html);
                    }
                });
            });

            $("#branchSetupForm").submit(function (e) {
                var actionUrl = "${createLink(controller: 'branchSetup', action: 'save')}";
                if (this.checkValidity()) {
                    $.ajax({
                        type: "POST",
                        dataType: "html",
                        url: actionUrl,
                        data: $(this).serialize(),
                        success: function (data) {
                            $("#page-content").html(data);
                        }
                    });
                    return false
                } else {
//                    alert($(this).find('input:invalid').size());
                    var invalidInputs = $(this).find('input:invalid');
                    var firstInvalidInput = $(invalidInputs[0]).attr('name');
                    $(this).find('input:invalid').first().closest('div.panel-collapse').collapse("show");
                    return false
                }
                e.preventDefault();
            });

        });


    </script>

</head>

<body>

<div class="row">
%{--Message--}%
    <g:if test="${flash.message}">
        <div class="alert alert-success">
            <i class="icon-bell green"><b>${flash.message}</b></i>
        </div>
    </g:if>

%{-- End --}%
    <g:hasErrors bean="${branchSetup}">
        <div class='alert alert-success '>
            <ul>
                <g:eachError var="err" bean="${branchSetup}">
                    <li><g:message error="${err}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>
    <div class="col-xs-12">
        <div class="widget-box">
            <div class="widget-header widget-header-large blue ">
                <h5><g:message code="coreBanking.setting.branchSetup.title" default="Branch Setup"/></h5>
            </div>

            <form class="" id="branchSetupForm" role="form" method="post">

                <g:hiddenField name="id" id="branchId" value="${branchSetup?.id}"/>

                <g:if test="${actionName == 'update'}">
                    <input type="hidden" value="${generalAdd?.id}" name="generalId"/>
                </g:if>
                <g:if test="${actionName == 'save'}">
                    <input type="hidden" value="${generalId}" name="generalId"/>
                </g:if>

                <g:if test="${actionName == 'update'}">
                    <input type="hidden" value="${postalAdd?.id}" name="postalId"/>
                </g:if>

                <g:if test="${actionName == 'save'}">
                    <input type="hidden" value="${postalId}" name="postalId"/>
                </g:if>



                <div id="accordion" class="accordion-style1 panel-group">

                    <div class="panel panel-default" id="">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle blue" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne">
                                    <i class="icon-angle-down bigger-110" data-icon-hide="icon-angle-down"
                                       data-icon-show="icon-angle-right"></i>
                                    &nbsp;<g:message code="coreBanking.setting.othBranchSetup.generalInfo.label" default="General Information"/>
                                </a>
                            </h4>
                        </div>

                        <div class="panel-collapse collapse in" id="collapseOne">
                            <div class="panel-body">

                                <g:render template="/coreBanking/settings/branchSetup/generalInformation"/>

                            </div>
                        </div>
                    </div>

                    %{--End of Branch Details--}%

                    <div class="panel panel-default" id="">
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

                                <g:render template="/coreBanking/settings/branchSetup/generalAddress"/>

                            </div>
                        </div>
                    </div>

                    %{--End of Branch Address--}%

                    <div class="panel panel-default" id="">
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

                                <g:render template="/coreBanking/settings/branchSetup/postalAddress"/>

                            </div>
                        </div>
                    </div>

                    %{--End of Branch Address--}%

                </div>

                <div class="widget-header widget-header-large red">
                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn" type="reset">
                                <i class="icon-undo bigger-110"></i>
                                <g:message code="default.button.reset.label" default="Reset"/>
                            </button>
                            &nbsp; &nbsp; &nbsp;
                            <g:if test="${branchSetup?.id}">
                                <g:submitButton name="Update" id="saveBtn" class="btn btn-info"/>
                            </g:if>
                            <g:else>
                                <g:submitButton name="Save" id="saveBtn" class="btn btn-info"/>
                            </g:else>
                        </div>
                    </div>
                </div>
            </form>
        </div><!-- /span -->
    </div>

</div>
<script type="text/javascript">
    $('#branchSetupForm').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            branchFullName: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            branchShortName: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            branchType: {
                required: true
            },
            parentOffice: {
                required: true
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
            "general.email2": {
                required: false,
                email: true
            },
            "general.country": {
                required: true
            },
            "general.state": {
                required: true
            },
            "general.city": {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            "general.zipCode": {
                required: true
            },
            "postal.country": {
                required: true
            },
            "postal.state": {
                required: true
            },
            "postal.city": {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            "postal.zipCode": {
                required: true
            }
        },
        messages: {
            branchFullName: {
                required: " "
            },
            branchShortName: {
                required: " "
            },
            branchType: {
                required: " "
            },
            parentOffice: {
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
            "general.email2": {
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
                required: " "
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
            "postal.zipCode": {
                required: " "
            }

        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#branchSetupForm')).show();
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