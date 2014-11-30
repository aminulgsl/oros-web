<html>
<head>
    <meta name="layout" content="oros">
    <title>OrosCapital - User List</title>
</head>

<body>

<div class="row">
    <div class="col-xs-12">
        <div class='alert alert-success' style="display: none">

        </div>
    </div>

    <div class="col-xs-12">
        <div class="table-header">
            <g:message code="retailClient.approvedList.header" default="Retail Account Request List"/>
        </div>

        <div class="table-responsive">
            <table id="retail-client-alist-tbl" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center"><g:message code="retailClient.approvedList.th.serial" default="Serial"/></th>
                    <th class="center"><g:message code="retailClient.approvedList.th.title" default="Title"/></th>
                    <th class="center"><g:message code="retailClient.approvedList.th.accountPurpose" default="Account Purpose"/></th>
                    <th class="center"><g:message code="retailClient.approvedList.th.openingDate" default="Opening Date"/></th>
                    <th class="center"><g:message code="retailClient.approvedList.th.status" default="Status"/></th>
                    <th class="center"><g:message code="retailClient.approvedList.th.action" default="Action"/></th>
                </tr>
                </thead>

                <tbody>
                <g:each in="${dataReturns}" var="retailAccount" status="i">
                    <tr>
                        <td>${retailAccount[0]}</td>
                        <td>${retailAccount[1]}</td>
                        <td>${retailAccount[2]}</td>
                        <td>${retailAccount[3]}</td>
                        <td>
                            <g:if test="${retailAccount[4] == "Approved"}">
                            %{--<span class="label label-success">${retailAccount[4]}</span>--}%
                                <span class="label label-success arrowed-in arrowed-in-right">${retailAccount[4]}</span>
                            </g:if>
                            <g:elseif test="${retailAccount[4] == "Requested"}">
                                <span class="label label-warning arrowed-in arrowed-in-right">${retailAccount[4]}</span>
                            </g:elseif>
                        </td>

                        <td>
                            <sec:access controller="retailClient" action="saveApprovedRetailsAccount">
                                <span class="col-xs-3"><a href="" userId="${retailAccount.DT_RowId}"
                                                          class="approve-reference"
                                                          title="approve">
                                    <span class="green bigger-140 glyphicon glyphicon-ok-sign"></span></a></span>
                            </sec:access>
                            <sec:access controller="retailClient" action="deleteRetailClient">
                                <span class="col-xs-3"><a href="" userId="${retailAccount.DT_RowId}"
                                                          class="delete-reference"
                                                          title="Delete">
                                    <span class="red bigger-140 glyphicon glyphicon-remove-sign"></span></a></span>
                            </sec:access>

                            <span class="col-xs-3"><a href="" userId="${retailAccount.DT_RowId}"
                                                      class="view-reference"
                                                      title="View">
                                <span class="green glyphicon glyphicon-folder-open bigger-140"></span></a></span>

                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

    var dataTable;

    // for current_page!
    jQuery.fn.dataTableExt.oApi.fnStandingRedraw = function (oSettings) {
        if (oSettings.oFeatures.bServerSide === false) {
            var before = oSettings._iDisplayStart;
            oSettings.oApi._fnReDraw(oSettings);
            //iDisplayStart has been reset to zero - so lets change it back
            oSettings._iDisplayStart = before;
            oSettings.oApi._fnCalculateEnd(oSettings);
        }
        //draw the 'current' page
        oSettings.oApi._fnDraw(oSettings);
    };

    jQuery(function ($) {
        dataTable = $('#retail-client-alist-tbl').dataTable({
            "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
            "bProcessing": false,
            "bAutoWidth": true,
            "bPaginate": true,
//            "aaSorting": [[ 1, "desc" ]],
            "bServerSide": true,
            "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'retailClient',action: 'approvedList')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                if (aData.DT_RowId == undefined) {
                    return true;
                }

                $('td:eq(5)', nRow).html(getActionButtons(nRow, aData));
                $('td:eq(4)', nRow).html(getStatusType(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                { "bSortable": true, "sWidth": "12%", "sClass": "center"},
                { "bSortable": true, "sWidth": "16%", "sClass": "center"},
                { "bSortable": true, "sWidth": "16%", "sClass": "center"},
                { "bSortable": true, "sWidth": "14%", "sClass": "center"},
                { "bSortable": true, "sWidth": "12%", "sClass": "center"},
                { "bSortable": false, "sWidth": "12%", "sClass": "center"}
            ]
        });

        $('#retail-client-alist-tbl').on('click', 'a.approve-reference', function (e) {
            var control = this;
            var userId = $(control).attr('userId');
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'retailClient',action: 'saveApprovedRetailsAccount')}?id=" + userId,
                success: function (data, textStatus) {
                    $(".alert-success").html("<i class='icon-bell green'><b>" + " " + data.message + "</b></i><a class='close' data-dismiss='alert'>×</a>").show();
                    if (data.isError == false) {
                        if (dataTable.fnGetData().length == 1) {
                            dataTable.fnPageChange('previous');
                        }
                        else {
                            dataTable.fnStandingRedraw();
                        }
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
            e.preventDefault();
        });

        $('#retail-client-alist-tbl').on('click', 'a.delete-reference', function (e) {
            var control = this;
            var userId = $(control).attr('userId');
            //var selectRow = $(this).parents('tr');
            var confirmDel = confirm("Do You Want To Delete?");

            if (confirmDel == true) {
                jQuery.ajax({
                    type: 'POST',
                    dataType: 'json',
                    url: "${g.createLink(controller: 'retailClient',action: 'deleteRetailClient')}?id=" + userId,
                    success: function (data, textStatus) {
                        $(".alert-success").html("<i class='icon-bell green'><b>" + " " + data.message + "</b></i><a class='close' data-dismiss='alert'>×</a>").show();
                        if (data.isError == false) {
                            if (dataTable.fnGetData().length == 1) {
                                dataTable.fnPageChange('previous');
                            }
                            else {
                                dataTable.fnStandingRedraw();
                            }
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        //                    $('#'+updateDiv).html(data);
                    }
                });
            }
            e.preventDefault();
        });

        $('#retail-client-alist-tbl').on('click', 'a.view-reference', function (e) {
            var control = this;
            var userId = $(control).attr('userId');
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'retailClient',action: 'saveApprovedRetailsAccount')}?id=" + userId,
                success: function (data, textStatus) {
                    $(".alert-success").html("<i class='icon-bell green'><b>" + " " + data.message + "</b></i><a class='close' data-dismiss='alert'>×</a>").show();
                    if (data.isError == false) {
                        if (dataTable.fnGetData().length == 1) {
                            dataTable.fnPageChange('previous');
                        }
                        else {
                            dataTable.fnStandingRedraw();
                        }
                    }
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
        actionButtons += '<span class="col-xs-6"><a href="" userId="' + aData.DT_RowId + '" class="edit-user" title="Edit">';
        actionButtons += '<span class="green bigger-140 glyphicon glyphicon-ok-sign"></span>';
        actionButtons += '</a></span>';
        actionButtons += '<span class="col-xs-6"><a href="" userId="' + aData.DT_RowId + '" class="delete-user" title="Delete">';
        actionButtons += '<span class="red bigger-140 glyphicon glyphicon-remove-sign"></span>';
        actionButtons += '</a></span>';
        return actionButtons;
    }

    function getStatusType(nRow, aData) {
        var statusType = "";
        if (aData.statusType == 'Approved') {
            statusType += '<span class="label label-success arrowed-in arrowed-in-right">' + aData.statusType + ' </span>';
            return statusType;
        }
        if (aData.statusType == 'Requested') {
            statusType += '<span class="label label-warning arrowed-in arrowed-in-right">' + aData.statusType + ' </span>';
            return statusType;
        }
    }

</script>
</body>
</html>