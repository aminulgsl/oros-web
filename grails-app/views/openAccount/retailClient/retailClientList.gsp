<html>
<head>
    <meta name="layout" content="oros">
    <title>OrosCapital - Retail Account List</title>
    <script type="text/javascript">

       /*$(document).ready(function () {
            var dateFormat = "${dateFormat}";
            var dateMask = "${dateMask}";
            $(".datepicker").inputmask(dateMask);

            $("#openingDate").datepicker({
                format: "dd/mm/yyyy",
                gotoCurrent: true,
                autoclose: true
            });


            $("#dob").datepicker({
                format: dateFormat,
                gotoCurrent: true,
                autoclose: true
            });
        });*/
    </script>
</head>

<body>
<div class="row">
    %{-- modal --}%
    <div id="retailAccountModalDiv">
        <div class="modal" id="myModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-70">
                <div class="modal-content" id="responsive">
                    <div class="modal-header" id="modalHeader">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>
                        </button>
                        <h4 class="modal-title" id="modalTitle">
                            <g:message code="retailClient.retailClientList.header" default="Retail Account"/>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="successMsg"></div>
                        %{--main body--}%
                        <div class="row" id="retailAccountModal">
                            <g:render template="/retailClient/create"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    %{-- end modal --}%

    <div class="col-md-9">
        <div class="messageDiv"></div>
        <div class="table-header">
            <g:message code="retailClient.retailClientList.retailAccountList.label" default="Retail Account List"/>
        </div>
        <div class="table-responsive">
            <table id="retail-client-list-tbl" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center"><g:message code="retailClient.retailClientList.retail-client-list-tbl.th.serial" default="Serial"/></th>
                    <th class="center"><g:message code="retailClient.retailClientList.retail-client-list-tbl.th.title" default="Title"/></th>
                    <th class="center"><g:message code="retailClient.retailClientList.retail-client-list-tbl.th.accountPurpose" default="Account Purpose"/></th>
                    <th class="center"><g:message code="retailClient.retailClientList.retail-client-list-tbl.th.openingDate" default="Opening Date"/></th>
                    <th class="center"><g:message code="retailClient.retailClientList.retail-client-list-tbl.th.status" default="Status"/></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${dataReturns}" var="retailAccount" status="i">
                    <tr referenceId="${retailAccount.DT_RowId}">
                        <td>${retailAccount[0]}</td>
                        <td>${retailAccount[1]}</td>
                        <td>${retailAccount[2]}</td>
                        <td>${retailAccount[3]}</td>
                        <td>
                            <g:if test="${retailAccount[4] == "Approved"}">
                                <span class="label label-success arrowed-in arrowed-in-right">${retailAccount[4]}</span>
                            </g:if>
                            <g:elseif test="${retailAccount[4] == "Requested"}">
                                <span class="label label-warning arrowed-in arrowed-in-right">${retailAccount[4]}</span>
                            </g:elseif>
                            <g:elseif test="${retailAccount[4] == "Draft"}">
                                <span class="label label-info arrowed-in arrowed-in-right">${retailAccount[4]}</span>

                            </g:elseif>
                        </td>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>

    <div class="col-md-3 clearfix form-actions">
        <div class="col-md-12 align-center">
            <button type="submit" class="%{--btn btn-default--}%actionButton btn-block" id="addButton" data-toggle="modal" data-target="#myModal">
                <i class="icon-ok bigger-110"></i> <g:message code="retailClient.retailClientList.action.add" default="Add"/>
            </button>
            <div class="space"></div>
            <button type="submit" class="%{--btn btn-default--}% actionButton btn-block" id="editButton">
                <i class="icon-edit bigger-110"></i> <g:message code="retailClient.retailClientList.action.edit" default="Edit"/>
            </button>
            <div class="space"></div>
            <button type="submit" class="%{--btn btn-default--}% actionButton btn-block" id="deleteButton">
                <i class="icon-trash bigger-110"></i> <g:message code="retailClient.retailClientList.action.delete" default="Delete"/>
            </button>
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
        dataTable = $('#retail-client-list-tbl').DataTable({
            "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
            "bProcessing": false,
            "bAutoWidth": true,
            "bPaginate": true,
//            "aaSorting": [[ 1, "desc" ]],
            "bServerSide": true,
            "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'retailClient',action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                if (aData.DT_RowId == undefined) {
                    return true;
                }
                $(nRow).attr("referenceId", aData.DT_RowId);
                $('td:eq(4)', nRow).html(getStatusType(nRow, aData));
                return nRow;
            },
            "aoColumns": [

                { "bSortable": false, "sWidth": "10%", "sClass": "center"},
                { "bSortable": false, "sWidth": "18%", "sClass": "center"},
                { "bSortable": false, "sWidth": "18%", "sClass": "center"},
                { "bSortable": false, "sWidth": "14%", "sClass": "center"},
                { "bSortable": false, "sWidth": "12%", "sClass": "center"}
            ]
        });

        $('#retail-client-list-tbl tbody').on( 'click', 'tr', function () {
            if ( $(this).hasClass('success') ) {
                $(this).removeClass('success');
            }
            else {
                dataTable.$('tr.success').removeClass('success');
                $(this).addClass('success');
            }
        } );

        jQuery('#myModal .close,#myModal .buttonClose').click(function(e){
            location.reload();
            $('form')[0].reset();
            e.preventDefault();
        });

        $('#deleteButton').click(function (e) {
            var id = $('#retail-client-list-tbl tbody tr.success').attr('referenceId');

            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'retailClient', action: 'deleteRetailClient')}?id=" + id,
                success: function (data, textStatus) {
                    if(data.isError == true){
                        $('.messageDiv').text(data.message).show();
                        var error = '<div class="alert alert-danger">';
                        error += '<i class="icon-bell red"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        error += '</div>';
                        $('.messageDiv').html(error);
                    }
                    else{
                        $('#retail-client-list-tbl').DataTable().ajax.reload();
                        $('.messageDiv').text(data.message).show();
                        var success = '<div class="alert alert-success">';
                        success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        success += '</div>';
                        $('.messageDiv').html(success);
                    }

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
            e.preventDefault();
        });

        $('#editButton').click(function (e) {
            $("#create").html("<i class='icon-ok bigger-110'></i> Update");
            var id = $('#retail-client-list-tbl tbody tr.success').attr('referenceId');

            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'retailClient',action: 'editRetailClient')}?id=" + id,
                success: function (data, textStatus) {
                    if(data.isError == true){
                        alert(data.message);
                    }
                    else{
                        $('#retailAccountModal').html(data);
                        $('#myModal').modal('show');

                    }

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
            e.preventDefault();
        });
    });

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
        if (aData.statusType == 'Draft') {
            statusType += '<span class="label label-info arrowed-in arrowed-in-right">' + aData.statusType + ' </span>';
            return statusType;
        }
    }
</script>


</body>
</html>