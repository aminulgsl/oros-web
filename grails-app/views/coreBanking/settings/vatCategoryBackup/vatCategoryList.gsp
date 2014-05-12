<%--
  Created by IntelliJ IDEA.
  User: rabin
  Date: 5/7/14
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div class="row">
    <div class="col-xs-12">
        <g:if test='${flash.message}'>
            <div class='alert alert-success '>
                <i class="icon-bell green"><b>${flash.message}</b></i>
            </div>
        </g:if>
    </div>
    <sec:access controller="currency" action="create">
        <div class="col-xs-12">
            <span class="navbar-right">
                <a href="${g.createLink(controller: 'vatCategory', action: 'create')}" id="createVatCategory"
                   class="btn btn-success">
                    <g:message code="coreBanking.setting.vatCategory.add.button" default="Add VatCategory"/>
                    <span class="glyphicon "></span></a></span>
        </div>
    </sec:access>
    <div class="col-xs-12">
        <div class="table-header">
            <g:message code="coreBanking.setting.vatCategory.list.title" default="Vat Category List"/>
        </div>

        <div class="table-responsive">
            <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center">
                        <span class="glyphicon glyphicon-list"></span>
                        <g:message code="default.serial.label" default="Serial"/>
                    </th>
                    <th class="center">
                        <g:message code="coreBanking.setting.vatCategory.name.label" default="Category Name"/>
                    </th>
                    <th class="center">
                        <g:message code="coreBanking.setting.vatCategory.rate.label"
                                   default="Category Rate"/></th>
                    <th class="center">
                        <g:message code="coreBanking.setting.vatCategory.vatGlAccount.label" default="Vat GL Account"/>
                    </th>
                    <th class="center">
                        <g:message code="coreBanking.setting.vatCategory.purchaseGlAcc.label"
                                   default="Purchase GL Account"/>
                    </th>
                    <th class="center">
                        <g:message code="coreBanking.setting.vatCategory.salesGlAcc.label" default="Sales GL Account"/>
                    </th>
                    <th class="center">
                        <span class="glyphicon glyphicon-tasks"></span>
                        <g:message code="default.action.label" default="Action"/>
                    </th>
                </tr>
                </thead>

                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(function ($) {
        var oTable1 = $('#sample-table-2').dataTable({
            "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
            "bProcessing": false,
            "bAutoWidth": true,
            "bServerSide": true,
            "sAjaxSource": "${g.createLink(controller: 'vatCategory',action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                $('td:eq(6)', nRow).html(getActionButtons(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                { "bSortable": false },
                null,
                { "bSortable": false },
                null,
                { "bSortable": false },
                { "bSortable": false },
                { "bSortable": false }

            ]
        });
        $('#createVatCategory').click(function (e) {
            var control = this;
            var url = $(control).attr('href');
            jQuery.ajax({
                type: 'POST',
                url: url,
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
            e.preventDefault();
        });
        $('#sample-table-2').on('click', 'a.edit-vatCategory', function (e) {

            var control = this;
            var vatCategoryId = $(control).attr('vatCategoryId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'vatCategory',action: 'update')}?id=" + vatCategoryId,
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
            e.preventDefault();
        });

        $('#sample-table-2').on('click', 'a.delete-vatCategory', function (e) {
            var confirmDel = confirm("Do You Want To Delete?");
            if (confirmDel == true) {
                var control = this;
                var vatCategoryId = $(control).attr('vatCategoryId');
                jQuery.ajax({
                    type: 'POST',
                    url: "${g.createLink(controller: 'vatCategory',action: 'delete')}?id=" + vatCategoryId,
                    success: function (data, textStatus) {
                        $('#page-content').html(data);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            e.preventDefault();
        });
    });
    function getActionButtons(nRow, aData) {
        var actionButtons = "";
        actionButtons += '<sec:access controller="vatCategory" action="update"><span class="col-xs-6"><a href="" vatCategoryId="' + aData.DT_RowId + '" class="edit-vatCategory" title="Edit" >';
        actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
        actionButtons += '</a></span></sec:access>';
        actionButtons += '<sec:access controller="vatCategory" action="delete"><span class="col-xs-6"><a href="" vatCategoryId="' + aData.DT_RowId + '" class="delete-vatCategory" title="Delete">';
        actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
        actionButtons += '</a></span></sec:access>';
        return actionButtons;
    }
</script>
</body>
</html>