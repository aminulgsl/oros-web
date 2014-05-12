<%--
  Created by IntelliJ IDEA.
  User: Mohammed Imran
  Date: 3/4/14
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.gsl.uma.saas.Module; com.gsl.uma.security.Role" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    %{--<meta name="layout" content="oros">--}%
    <title></title>
    <style type="text/css">
    .form-horizontal .control-label{
        text-align :left;
    }
    </style>
</head>
<body>
<div class="row" id="backToTop">
    <div class="col-xs-12">
        <div class="row">
            <div class="col-sm-7">
                <div class="widget-box">
                    <div class="widget-header">
                        <h4>Role to Right Map</h4>
                    </div>

                    <div class="widget-body">
                        <div class="widget-main">
                            <g:form class="form-inline" method="post" name="loadRoleForm" id="loadRoleForm" url="[action:'roleRight',controller:'role']">
                                <g:select class="width-60 chosen-select" id="moduleId" name='moduleId'
                                          from='${Module.findAllByStatus(true)}'
                                          optionKey="id" optionValue="menuText"></g:select>
                                <g:select class="width-60 chosen-select" id="roleId" name='roleId'
                                          from='${Role.findAllByAuthorityNotIlike('ROLE_SUPER_ADMIN')}'
                                          optionKey="id" optionValue="authority"></g:select>

                                <button type="submit" class="btn btn-info btn-sm">
                                    <i class="icon-key bigger-110"></i>
                                    Load
                                </button>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>

        <div class="row" id="roleRightListDiv">

        </div>

        <!-- PAGE CONTENT ENDS -->
    </div><!-- /.col -->
</div><!-- /.row -->
<script type="text/javascript">
    $(".chosen-select").chosen();
    $(function() {
        $("#loadRoleForm").submit(function(e) {
            var actionurl = e.currentTarget.action;
            $.ajax({
                url: actionurl,
                type: 'post',
//                dataType: 'json',
                data: $("#loadRoleForm").serialize(),
                success: function(data) {
                    $('#roleRightListDiv').html(data);
                }
            });
            e.preventDefault();
        });
    });
</script>
</body>
</html>