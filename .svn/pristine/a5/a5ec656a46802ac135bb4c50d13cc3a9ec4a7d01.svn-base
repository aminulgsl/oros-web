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
</head>

<body>
<div class="page-header">
    <h1>Chart Master : <span class="green">"${chartMaster?.accountName}"</span> </h1>
</div><!-- /.page-header -->

    <div class="form-horizontal">

    <input type="hidden" name="id" value="${chartMaster?.id}">
    <input type="hidden" name="ordering" value=1 />

    <div class="col-xs-12 col-md-12">
        <div class="col-md-5">
            <div class="form-group">
                <label for="accountCode" class="control-label col-md-6">Account code <sup class="red">*</sup></label>

                <div class="col-md-6">
                    <input type="text" id="accountCode" class="col-md-12" name="accountCode" value="${chartMaster?.accountCode}" disabled />
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="form-group">
                <label for="accountName" class="control-label col-md-6">Account Name<sup class="red">*</sup></label>

                <div class="col-md-6">
                    <input type="text" class="col-md-12" id="accountName" name="accountName" value="${chartMaster?.accountName}" disabled />
                </div>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-md-12">
        <div class="col-md-5">
            <div class="form-group">
                <label for="accountantName" class="control-label col-md-6">Accountant Name</label>

                <div class="col-md-6">
                    <input type="text" class="col-md-12" id="accountantName" name="accountantName" value="${chartMaster?.accountantName}" disabled />
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="form-group">
                <label for="accountCode2" class="control-label col-md-6">Account Code2</label>
                <div class="col-md-6">
                    <input type="text" id="accountCode2" class="col-md-12" name="accountCode2" value="${chartMaster?.accountCode2}" disabled/>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-md-12">
        <div class="col-md-5">
            <div class="form-group">
                <label for="status" class="control-label col-md-6">Status <sup class="red">*</sup></label>
                <div class="col-md-6">
                    <select class="col-md-12" name="status" id="status" disabled>
                        <option value="1" ${chartMaster?.status == 1 ? 'selected' : ''}>Active</option>
                        <option value="0" ${chartMaster?.status == 0 ? 'selected' : ''}>In Active</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="form-group">
                <label for="vatCategory" class="control-label col-md-6">Vat Category <sup class="red">*</sup></label>
                <div class="col-md-6">
                    <select class="col-md-12" name="vatCategory" id="vatCategory" disabled>
                        <g:each in="${vatCategoryList}" var="vatCategory">
                            <option value="${vatCategory?.id}" ${vatCategory?.id == chartMaster?.vatCategory?.id ? 'selected' : ''}>${vatCategory?.name}</option>
                        </g:each>
                    </select>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-md-12">
        <div class="col-md-11 col-md-offset-1">
            <div class="pull-right">
                <g:remoteLink controller="chartMaster" action="treeView" update="page-content">
                    <button class="btn btn-success"><i class="icon-arrow-left"></i>Prev</button>
                </g:remoteLink>
            </div>
        </div>
    </div>

    </div>
</body>
</html>