<html>
<head>
    <title>OrosCapital - Role List</title>
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
    <sec:access controller="role" action="create">
        <div class="col-xs-12">
            <span class="navbar-right"><a href="${g.createLink(controller: 'role',action: 'create')}" id="createRoleLink" class="btn btn-success">Add Role</a></span>
        </div>
    </sec:access>
    <div class="col-xs-12">
        <div class="table-header">
            Role List
        </div>

        <div class="table-responsive">
            <table id="role-list-table" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center"><span class="glyphicon glyphicon-list"></span>Serial</th>
                    <th class="center">Role Name</th>
                    <th class="center"><span class="glyphicon glyphicon-tasks"></span>Action</th>
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
        var oTable1 = $('#role-list-table').dataTable({
            "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
            "bProcessing": false,
            "bAutoWidth": true,
//            "aaSorting": [[ 1, "desc" ]],
            "bServerSide": true,
            "sAjaxSource": "${g.createLink(controller: 'role',action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                $('td:eq(2)', nRow).html(getActionButtons(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                { "bSortable": false },
                null,
                { "bSortable": false }
            ] });
        $('#createRoleLink').click(function (e) {
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
        $('#role-list-table').on('click', 'a.edit-role', function(e) {
            var control = this;
            var roleId = $(control).attr('roleId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'role',action: 'edit')}?id="+roleId,
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
            e.preventDefault();
        });

        $('#role-list-table').on('click', 'a.delete-role', function(e) {
            var control = this;
            var roleId = $(control).attr('roleId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'role',action: 'delete')}?id="+roleId,
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
        actionButtons += '<sec:access controller="role" action="edit"><span class="col-xs-6"><a href="" roleId="'+aData.DT_RowId+ '" class="edit-role" title="Edit">';
        actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
        actionButtons += '</a></span></sec:access>';
        %{--actionButtons += '<sec:access controller="user" action="delete"><span class="col-xs-6"><a href="" roleId="'+aData.DT_RowId+ '" class="delete-role" title="Delete">';--}%
//        actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
        %{--actionButtons += '</a></span></sec:access>';--}%
        return actionButtons;
    }
</script>
</body>
</html>