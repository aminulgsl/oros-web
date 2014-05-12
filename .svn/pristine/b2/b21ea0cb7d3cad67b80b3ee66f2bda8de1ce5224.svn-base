<html>
<head>
    <title>OrosCapital - User List</title>
</head>
<body>

<div class="row">
    <div class="col-xs-12">
        <g:if test='${flash.message}'>
            <div class='alert alert-success '>
                <i class="icon-bell green"><b>${flash.message}</b></i> <a class="close" data-dismiss="alert">×</a>
            </div>
        </g:if>
    </div>
    <sec:access controller="user" action="create">
        <div class="col-xs-12">
            <span class="navbar-right"><a href="${g.createLink(controller: 'chartClass',action: 'create')}" id="createChartClass" class="btn btn-success">Add Chart Class</a></span>
        </div>
    </sec:access>
    <div class="col-xs-12">
        <div class="table-header">
            Chart Class List
        </div>
        <div class="table-responsive">
            <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center">Serial</th>
                    <th class="center">Name</th>
                    <th class="center">Accountant Name</th>
                    <th class="center">Class Type</th>
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
            "sAjaxSource": "${g.createLink(controller: 'chartClass',action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                $('td:eq(4)', nRow).html(getActionButtons(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                null,
                null,
                null,
                null,
                { "bSortable": false }
            ] });
        $('#createChartClass').click(function (e) {
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
        $('#sample-table-2').on('click', 'a.edit-user', function(e) {
            var control = this;
            var userId = $(control).attr('userId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'chartClass',action: 'edit')}?id="+userId,
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
            e.preventDefault();
        });

        $('#sample-table-2').on('click', 'a.delete-user', function(e) {
            var ans = confirm("Are you sure ?");
            if (ans == true) {
                var control = this;
                var userId = $(control).attr('userId');
                jQuery.ajax({
                    type: 'POST',
                    url: "${g.createLink(controller: 'chartClass',action: 'delete')}?id="+userId,
                    success: function (data, textStatus) {
                        $('#page-content').html(data);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                //                    $('#'+updateDiv).html(data);
                    }
                });
                //e.preventDefault();
                return true;
            }
            else {
                return false;
            }

        });
    });
    function getActionButtons(nRow, aData) {
        var actionButtons = "";
        actionButtons += '<span class="col-xs-6"><a href="" userId="'+aData.DT_RowId+ '" class="edit-user" title="Edit">';
        actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
        actionButtons += '</a></span>';
        actionButtons += '<span class="col-xs-6"><a href="" userId="'+aData.DT_RowId+ '" class="delete-user" title="Delete" >';
        actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
        actionButtons += '</a></span>';
        return actionButtons;
    }
</script>
</body>
</html>