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

<g:hasErrors bean="${chartGroupCommand}">
    <div class='alert alert-danger'>
        <ul>
            <g:eachError var="err" bean="${chartGroupCommand}">
                <li><g:message error="${err}" /></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>

<div class="widget-box">
    <div class="widget-header">
        <h4 class="widget-title">Chart Group</h4>
    </div>
    <div class="widget-body">
        <div class="widget-main no-padding">
            <g:form class="form-horizontal" method="post" name="chartGroupForm" id="chartGroupForm" role="form" url="[controller: 'chartGroup', action:'save']" onsubmit="return false;">
                <fieldset>
                    <div class="row">
                        %{-- hidden field set for edit only --}%
                        <input type="hidden" name="id" id="id" value="${chartGroup?.id}">
                        %{-- when add child group default set the parentGroup id --}%
                        <g:if test="${parentGroup}">
                            <input type="hidden" name="parentGroup" id="parentGroup" value="${parentGroup.id}">
                        </g:if>
                        %{-- when edit in child group --}%
                        <g:elseif test="${actionName == 'edit' || actionName == 'save'}">
                            <input type="hidden" name="parentGroup" id="parentGroup" value="${chartGroup?.parentGroup?.id}"/>
                        </g:elseif>

                        <div class="col-xs-12 col-md-12">
                            <div class="col-md-5">
                                <div class="form-group ${hasErrors(bean:chartGroupCommand,field:'name','has-error')}">
                                    <label for="name" class="control-label col-md-5">Name<sup class="red">*</sup></label>
                                    <div class="col-md-6">
                                        <input type="text"
                                               required=""
                                               oninvalid="this.setCustomValidity('${message(code: 'chart.chartGroup.name',default: 'Please Enter the Chart Group Name')}')"
                                               oninput="setCustomValidity('')"
                                               class="col-md-12" name="name" id="name" value="${chartGroup?.name}" placeholder="Enter the Name" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group ${hasErrors(bean:chartGroupCommand,field:'chartClass','has-error')}">
                                    <label for="chartClass" class="control-label col-md-6" >Chart Class<sup class="red">*</sup></label>
                                    <div class="col-md-6">
                                        <g:if test="${!chartGroup?.parentGroup?.id && !parentGroup}">
                                            <select class="col-md-12" name="chartClass" id="chartClass">
                                                <option value="">-Select-</option>
                                                <g:each var="chartClass" in="${chartClassList}">
                                                    <option value="${chartClass.id}"
                                                        ${chartGroup?.chartClass?.id == chartClass?.id ? 'selected' : ''}>
                                                        ${chartClass.name}</option>
                                                </g:each>
                                            </select>
                                        </g:if>
                                        <g:elseif test="${parentGroup}">
                                            <input type="hidden" value="${parentGroup?.chartClass?.id}" id="chartClass" name="chartClass"/>
                                            <input type="text" class="col-md-12" value="${parentGroup?.chartClass?.name}" disabled/>
                                        </g:elseif>
                                        <g:else>
                                            <input type="hidden" value="${chartGroup?.chartClass?.id}" id="chartClass" name="chartClass"/>
                                            <input type="text" class="col-md-12" value="${chartGroup?.chartClass?.name}" disabled/>
                                        </g:else>
                                    </div>
                                </div>
                            </div>  %{-- chart class --}%
                        </div>

                        <div class="col-xs-12 col-md-12">
                            %{-- chart Class --}%

                            <div class="col-md-5">
                                <div class="form-group ${hasErrors(bean:chartGroupCommand,field:'status','has-error')}">
                                    <label for="status" class="control-label col-md-5">Status<sup class="red">*</sup></label>
                                    <div class="col-md-6">
                                        <select class="col-md-12" name="status" id="status" required="">
                                            <option value="1" ${chartGroup?.status == 1 ? 'selected' : ''}>Active</option>
                                            <option value="0" ${chartGroup?.status == 0 ? 'selected' : ''}>In Active</option>
                                        </select>
                                    </div>
                                </div>
                            </div>  %{-- status --}%
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label for="accountantName" class="control-label col-md-6">Accountant Name</label>
                                    <div class="col-md-6">
                                        <input type="text" class="col-md-12" name="accountantName" id="accountantName" value="${chartGroup?.accountantName}" placeholder="Enter the Accountant Name">
                                    </div>
                                </div>
                            </div> %{-- accountant name --}%
                        </div>
                        <div class="col-xs-12 col-md-12">
                            %{-- Parent Group--}%
                            <div class="col-md-5">
                                <g:if test="${parentGroup}">
                                    <div class="form-group">
                                        <label class="control-label col-md-5">Chart Group</label>
                                        <div class="col-md-6">
                                            <select class="col-md-12" disabled>
                                                <g:each var="chartGroup" in="${chartGroupList}">
                                                    <option value="${chartGroup.id}"
                                                        ${chartGroup?.id == parentGroup.id ? 'selected' : ''}>
                                                        ${chartGroup.name}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </g:if>
                            </div>
                            %{-- End parents Group--}%
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="align-center">
                            <g:if test="${chartGroup?.id}">
                                <button type="submit" class="btn btn-danger">
                                    <i class="icon-ok bigger-110"></i>
                                    Update
                                </button>
                                <g:remoteLink controller="chartGroup" action="index" update="page-content">
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

    $('#chartGroupForm').validate({

        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            name: {
                required: true
            },
            status: {
                required: true
            },
            chartClass: {
                required: true
            }
        } ,
        messages: {
            name: {
                required: " "
            },
            chartClass: {
                required: " "
            },
            status: {
                required: " "
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('.chartClassForm')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },

        submitHandler: function (form) {
            var id = $('#id').val();
            var parentGroup = $('#parentGroup').val();
            var name = $('#name').val();
            var accountantName = $('#accountantName').val();
            var chartClass = $('#chartClass').val();
            var status = $('#status').val();
            jQuery.ajax({
                url:"${createLink(controller: 'chartGroup', action: 'save')}",
                type:'post',
                data: {id:id, parentGroup:parentGroup, name:name, accountantName:accountantName, chartClass:chartClass, status:status},
                success:function(data){
                    $('#page-content').html(data);
                },
                failure:function(data){
                }
            })

        }


    });

</script>

</body>
</html>