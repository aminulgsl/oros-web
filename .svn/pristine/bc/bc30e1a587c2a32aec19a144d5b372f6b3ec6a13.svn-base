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

<g:hasErrors bean="${chartClassCommand}">
    <div class='alert alert-danger'>
        <ul>
            <g:eachError var="err" bean="${chartClassCommand}">
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
            <g:form class="form-horizontal" method="post" name="chartClassForm" id="chartClassForm" role="form" url="[action: 'save', controller: 'chartClass']" onsubmit="return false;">
                <fieldset>
                    <div class="row">
                        <input type="hidden" name="id" id="id" value="${chartClass?.id}">
                        <div class="col-xs-12 col-md-12">
                            <div class="col-md-5">
                                <div class="form-group ${hasErrors(bean:chartClassCommand,field:'name','has-error')}">
                                    <label for="name" class="control-label col-md-4">Name<sup class="red">*</sup></label>
                                    <div class="col-md-6">
                                        <input type="text"
                                            required=""
                                            oninvalid="this.setCustomValidity('${message(code: 'chart.chartClass.name',default: 'Please Enter the Chart Class Name')}')"
                                            oninput="setCustomValidity('')"
                                            id="name"
                                            class="col-md-12 required "
                                            name="name"
                                            value="${chartClass?.name}" placeholder="Enter the Name" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group ${hasErrors(bean:chartClassCommand,field:'chartClassType','has-error')}">
                                    <label for="chartClassType" class="control-label col-md-6" >Class Type<sup class="red">*</sup></label>
                                    <div class="col-md-6">
                                        <select class="col-md-12 required" name="chartClassType" id="chartClassType">
                                            <option value="">-Select-</option>
                                            <g:each var="chartClassType" in="${chartClassTypeList}">

                                                <option value="${chartClassType.id}"
                                                    ${chartClass?.chartClassType?.id == chartClassType?.id ? 'selected' : ''}>
                                                    ${chartClassType.classType}</option>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>%{-- end main div xs,md--}%
                        <div class="col-xs-12 col-md-12">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="status" class="control-label col-md-4">Status</label>
                                <div class="col-md-6">
                                    <select class="col-md-12" id="status" name="status" required="">
                                        <option value="1" ${chartClass?.status == 1 ? 'selected' : ''}>Active</option>
                                        <option value="0" ${chartClass?.status == 0 ? 'selected' : ''}>In Active</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="accountantName" class="control-label col-md-6" >Accountant Name</label>
                                <div class="col-md-6">
                                    <input type="text" id="accountantName" class="col-md-12" name="accountantName" value="${chartClass?.accountantName}" placeholder="Enter the Accountant Name">
                                </div>
                            </div>
                        </div>

                        </div>
                    </div>
                    <div class="clearfix form-actions">
                        <div class="align-center">

                            <g:if test="${chartClass?.id}">
                                <button type="submit" class="btn btn-danger">
                                    <i class="icon-ok bigger-110"></i>
                                    Update
                                </button>
                                <g:remoteLink controller="chartClass" action="index" update="page-content">
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

        $('#chartClassForm').validate({

            errorElement: 'small',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                name: {
                    required: true
                },
                chartClassType: {
                    required: true
                }
            } ,
            messages: {
                name: {
                    required: " "
                },
                chartClassType: {
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
                $('.alert-danger', $('#chartClassForm')).show();
            },
            submitHandler: function (form) {
                //alert($("#chartClassForm").serialize());

                var id = $('#id').val();
                var name = $('#name').val();
                var accountantName = $('#accountantName').val();
                var chartClassType = $('#chartClassType').val();
                var status = $('#status').val();
                jQuery.ajax({
                    url:"${createLink(controller: 'chartClass', action: 'save')}",
                    type:'post',
                    data: {id:id,name:name,accountantName:accountantName,chartClassType:chartClassType,status:status},
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