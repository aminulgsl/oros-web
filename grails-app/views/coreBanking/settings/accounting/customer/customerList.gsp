<%--
  Created by IntelliJ IDEA.
  User: Nusrat Jahan Bhuiyan
  Date: 4/23/14
  Time: 2:48 PM
--%>

<html>
<head>
    <title>OrosCapital - User List</title>
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
    <sec:access controller="customer" action="create">
        <div class="col-xs-12">
            <span class="navbar-right"><a href="${g.createLink(controller: 'customer',action: 'create')}" id="createCustomerLink" class="btn btn-success">Add customer</a></span>
        </div>
    </sec:access>
    <div class="col-xs-12">
        <div class="table-header">
            Customer List
        </div>
        <div class="table-responsive">
            <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center">Serial</th>
                    <th class="center">Customer Code</th>
                    <th class="center">Customer Name</th>
                    <th class="center">Customer Type</th>
                    <th class="center">Payment Term</th>
                    <th class="center">Action</th>
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
//            "aaSorting": [[ 1, "desc" ]],
            "bServerSide": true,
            "sAjaxSource": "${g.createLink(controller: 'customer',action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                $('td:eq(5)', nRow).html(getActionButtons(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                null,
                null,
                null,
                null,
                null,
                { "bSortable": false }
            ] });
        $('#createCustomerLink').click(function (e) {
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
        $('#sample-table-2').on('click', 'a.edit-customer', function(e) {
            var control = this;
            var customerId = $(control).attr('customerId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'customer',action: 'edit')}?id="+customerId,
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
            e.preventDefault();
        });

        $('#sample-table-2').on('click', 'a.delete-customer', function(e) {
            var control = this;
            var customerId = $(control).attr('customerId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'customer',action: 'delete')}?id="+customerId,
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
            e.preventDefault();
        });
    });
    function getActionButtons(nRow, aData) {
        var actionButtons = "";
        actionButtons += '<sec:access controller="customer" action="edit"><span class="col-xs-6"><a href="" customerId="'+aData.DT_RowId+ '" class="edit-customer" title="Edit">';
        actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
        actionButtons += '</a></span></sec:access>';
        actionButtons += '<sec:access controller="customer" action="delete"><span class="col-xs-6"><a href="" customerId="'+aData.DT_RowId+ '" class="delete-customer" title="Delete">';
        actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
        actionButtons += '</a></span></sec:access>';
        return actionButtons;
    }
</script>
</body>
</html>