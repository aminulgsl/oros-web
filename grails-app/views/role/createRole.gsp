<%--
  Created by IntelliJ IDEA.
  User: Mohammed Imran
  Date: 3/4/14
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    %{--<meta name="layout" content="oros">--}%
    <title></title>
</head>
<body>
<div class="page-header">
    <h1>
        Manage Role
        <small>
            <i class="icon-double-angle-right"></i>
            Role Name must start with 'ROLE_'. i.e ROLE_ADMIN, ROLE_BANK_ADMIN
        </small>
    </h1>
</div><!-- /.page-header -->

        <div class="row">
            <sec:access controller='role' action='index'>
                <div class="col-xs-12">
                    <g:if test='${flash.message}'>
                        <div class='alert alert-success '>
                            <i class="icon-bell green"> <b> ${flash.message} </b> </i>
                        </div>
                    </g:if>
                    <g:hasErrors bean="${roleCommand}">
                        <div class='alert alert-success '>
                        <ul>
                            <g:eachError var="err" bean="${roleCommand}">
                                <li><g:message error="${err}" /></li>
                            </g:eachError>
                        </ul>
                        </div>
                    </g:hasErrors>
                      <!-- PAGE CONTENT BEGINS -->
                    <g:form  class="form-horizontal" method="post" role="form" url="[action:'save',controller:'role']">
                        <div class="form-group ${hasErrors(bean:roleCommand,field:'authority','has-error')}">
                            <label class="col-sm-3 control-label no-padding-right" for="authority"> Role Name </label>
                            <div class='col-xs-12 col-sm-9'>
                                <g:textField id="authority" name="authority" placeholder="ROLE_ADMIN.." class="col-xs-10 col-sm-5" value="${fieldValue(bean:roleCommand,field:'authority')}"/>
                            </div>
                        </div>
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <g:submitButton name="Save" id="saveBtn"  class="btn btn-info"/>
                                %{--<button class="btn btn-info" type="button">
                                    <i class="icon-ok bigger-110"></i>
                                    Submit
                                </button>--}%
                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="reset">
                                    <i class="icon-undo bigger-110"></i>
                                    Reset
                                </button>
                            </div>
                        </div>
                    </g:form>
                    <!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
                <div class="col-xs-12">
                    <h4>Here is Role list grid</h4>
                </div>
            </sec:access>

        </div><!-- /.row -->



</body>
</html>