<%--
  Created by IntelliJ IDEA.
  User: GS
  Date: 2/23/14
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    %{--<meta name="layout" content="oros">--}%
    <title>OrosCapital - Client</title>
    <script src="${resource(dir: 'js/validate', file: 'jquery.validate.min.js')}"></script>
</head>

<body>

<g:if test="${flash.message}">
    <div class="alert alert-success">
        <i class="icon-bell green"> <b> ${flash.message} </b> </i> <a class="close" data-dismiss="alert">×</a>
    </div>
</g:if>

<g:hasErrors bean="${chartMasterCommand}">
    <div class='alert alert-danger'>
        <ul>
            <g:eachError var="err" bean="${chartMasterCommand}">
                <li><g:message error="${err}" /></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>

<div class="widget-box">
    <div class="widget-header">
        <h4 class="widget-title">Chart Class</h4>
    </div>
    <div class="widget-body">
        <div class="widget-main no-padding">
            <g:form class="form-horizontal" method="post" name="chartMasterForm" role="form" id="chartMasterForm" url="[controller:'chartMaster',action:'save']" onsubmit="return false;">
                <fieldset>
                    <div class="row">
                        <input type="hidden" name="id" id="id" value="${chartMaster?.id}">
                        <input type="hidden" name="ordering" id="ordering" value=1 />
                        <div class="col-xs-12 col-md-12">
                            <div class="col-md-5">
                                <div class="form-group ${hasErrors(bean:chartMasterCommand,field:'accountCode','has-error')}">
                                    <label for="accountCode" class="control-label col-md-6">Account code<sup class="red">*</sup></label>

                                    <div class="col-md-6">
                                        <input type="text" id="accountCode" class="col-md-12 required" name="accountCode" placeholder="Account Code"
                                           required=""
                                           oninvalid="this.setCustomValidity('${message(code: 'chart.chartMaster.accountCode',default: 'Please Enter the Account Code')}')"
                                           oninput="setCustomValidity('')"
                                            value="${chartMaster?.accountCode}" ${chartMaster?.id != null ? 'disabled' : ''} />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group ${hasErrors(bean:chartMasterCommand,field:'accountName','has-error')}">
                                    <label for="accountName" class="control-label col-md-6">Account Name<sup class="red">*</sup></label>

                                    <div class="col-md-6">
                                        <input type="text" class="col-md-12 required" id="accountName" name="accountName" placeholder="Account Name"
                                               required=""
                                               oninvalid="this.setCustomValidity('${message(code: 'chart.chartMaster.accountName',default: 'Please Enter the Account Name')}')"
                                               oninput="setCustomValidity('')"
                                               value="${chartMaster?.accountName}" />
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-xs-12 col-md-12">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label for="accountantName" class="control-label col-md-6">Accountant Name</label>

                                    <div class="col-md-6">
                                        <input type="text" class="col-md-12" id="accountantName" placeholder="Enter the Accountant Name" name="accountantName" value="${chartMaster?.accountantName}" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label for="accountCode2" class="control-label col-md-6">Account Code2</label>
                                    <div class="col-md-6">
                                        <input type="text" id="accountCode2" class="col-md-12" placeholder="Enter the Account Code2" name="accountCode2" value="${chartMaster?.accountCode2}"/>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-xs-12 col-md-12">
                            <div class="col-md-5">
                                <div class="form-group ${hasErrors(bean:chartMasterCommand,field:'status','has-error')}">
                                    <label for="status" class="control-label col-md-6">Status <sup class="red">*</sup></label>
                                    <div class="col-md-6">
                                        <select class="col-md-12" name="status" id="status" required="">
                                            %{--<option value="">-Select-</option>--}%
                                            <option value="1" ${chartMaster?.status == 1 ? 'selected' : ''}>Active</option>
                                            <option value="0" ${chartMaster?.status == 0 ? 'selected' : ''}>In Active</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group ${hasErrors(bean:chartMasterCommand,field:'vatCategory','has-error')}">
                                    <label for="vatCategory" class="control-label col-md-6">Vat Category <sup class="red">*</sup></label>
                                    <div class="col-md-6">
                                        <select class="col-md-12 required" name="vatCategory" id="vatCategory" required="">
                                            <option value="">- Select -</option>
                                            <g:each in="${vatCategoryList}" var="vatCategory">
                                                <option value="${vatCategory?.id}" ${vatCategory?.id == chartMaster?.vatCategory?.id ? 'selected' : ''}>${vatCategory?.name}</option>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-xs-12 col-md-12">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="control-label col-md-6">Chart Group</label>
                                    <div class="col-md-6">
                                        <g:if test="${actionName == 'create'}">
                                            <input type="hidden" value="${chartGroup.id}" id="chartGroup" name="chartGroup"/>
                                            <input type="text" class="col-md-12" value="${chartGroup.name}" disabled/>
                                        </g:if>
                                        <g:elseif test="${actionName == 'edit' || actionName == 'save' } ">
                                            <input type="hidden" name="chartGroup" id="chartGroup" value="${chartMaster?.chartGroup?.id}"/>
                                            <input type="text" class="col-md-12" value="${chartMaster?.chartGroup?.name}" disabled/>
                                        </g:elseif>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="clearfix form-actions">
                        <div class="align-center">
                            <g:if test="${chartMaster?.id}">
                                <button type="submit" class="btn btn-danger">
                                    <i class="icon-ok bigger-110"></i>
                                    Update
                                </button>
                                <g:remoteLink controller="chartMaster" action="treeView" update="page-content">
                                    <button class="btn btn-success"><i class="icon-arrow-left"></i>Back</button>
                                </g:remoteLink>
                            </g:if>
                            <g:else>
                                <button type="reset" class="btn">
                                    <i class="icon-undo bigger-110"></i>
                                    Reset
                                </button>
                                <button type="submit" class="btn btn-info">
                                        <i class="icon-ok bigger-110"></i>
                                        Create
                                </button>
                            </g:else>
                        </div>
                    </div>
                </fieldset>
            </g:form>
        </div>
    </div>
</div>

<script type="text/javascript">

    jQuery(function ($) {

        $('#chartMasterForm').validate({

            errorElement: 'small',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                accountCode: {
                    required: true
                },
                accountName: {
                    required: true
                },
                status: {
                    required: true
                },
                vatCategory: {
                    required: true
                }
            } ,
            messages: {
                accountCode: {
                    required: " "
                },
                accountName: {
                    required: " "
                },
                status: {
                    required: " "
                },
                vatCategory: {
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
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('#chartMasterForm')).show();
            },
            submitHandler: function (form) {
                var id = $('#id').val();
                var ordering = $('#ordering').val();
                var chartGroup = $('#chartGroup').val();
                var accountCode = $('#accountCode').val();
                var accountName = $('#accountName').val();
                var accountantName = $('#accountantName').val();
                var accountCode2 = $('#accountCode2').val();
                var status = $('#status').val();
                var vatCategory = $('#vatCategory').val();

                jQuery.ajax({
                    url:"${createLink(controller: 'chartMaster', action: 'save')}",
                    type:'post',
                    data: {id:id,ordering:ordering,chartGroup:chartGroup,accountCode:accountCode,accountName:accountName,accountantName:accountantName,accountCode2:accountCode2,status:status,vatCategory:vatCategory},
                    success:function(data){
                        $('#page-content').html(data);
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