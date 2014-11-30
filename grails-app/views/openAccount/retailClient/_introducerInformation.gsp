<g:form class="form-horizontal" method="post" name="retailIntroducerInformationForm"
        id="retailIntroducerInformationForm" role="form"
        url="[action: 'saveRetailIntroducer', controller: 'retailClient']" onsubmit="return false;">
    <div class="row">
        <input type="hidden" name="retailAccount" class="retailAccount" value="${retailAccount?.id}">
        %{--<input type="hidden" name="id" value="${retailIntroducer?.id}">--}%

        %{-- client id (hidden)--}%
        <input type="hidden" id="clientId" name="client" value="">

        <div class="form-group ${hasErrors(bean: retailIntroducerCommand, field: 'client', 'has-error')}"
             id="accountNoDiv">
            <label for="accountNo" class="control-label col-sm-3 col-lg-2">
                <g:message code="retailClient.introducerInformation.accountNo.label" default="Account No"/><span class="red">*</span>
            </label>

            <div class="col-xs-6 col-sm-4 col-md-4">
                <input type="text" class="form-control required" placeholder="Account No" id="accountNo"
                       name="accountNo">
            </div>
            <span id="errorInAccount"></span>
        </div>

        <div class="form-group">
            <label for="name" class="control-label pull-left col-sm-3 col-lg-2">
                <g:message code="retailClient.introducerInformation.name.label" default="Name"/>
            </label>

            <div class="col-xs-6 col-sm-4 col-md-4">
                <input type="text" class="form-control" placeholder="Name" value="" id="name" disabled>
            </div>
        </div>

        <div class="form-group">
            <label for="address" class="control-label pull-left col-sm-3 col-lg-2">
                <g:message code="retailClient.introducerInformation.address.label" default="Address"/>
            </label>

            <div class="col-xs-6 col-sm-4 col-md-4">
                <input type="text" class="form-control" placeholder="Address" value="" id="address" disabled>
            </div>
        </div>

        <div class="form-group">
            <label for="contactNo" class="control-label pull-left col-sm-3 col-lg-2">
                <g:message code="retailClient.introducerInformation.contactNo.label" default="Contact No"/>
            </label>

            <div class="col-xs-6 col-sm-4 col-md-4">
                <input type="text" class="form-control" placeholder="Contact No" value="" id="contactNo" disabled>
            </div>
        </div>

        <div class="form-group ${hasErrors(bean: retailIntroducerCommand, field: 'relation', 'has-error')}">
            <label for="relation" class="control-label col-sm-3 col-lg-2">
                <g:message code="retailClient.introducerInformation.relationalAccountHolder.label"
                           default="Relational Account Holder"/><span class="red">*</span>
            </label>

            <div class="col-xs-6 col-sm-4 col-md-4">
                <input type="text" class="form-control required" placeholder="Relational Account Holder" id="relation"
                       name="relation">
            </div>

            <div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
                <button type="submit" name="addIntroducer" id="addIntroducer" class="btn-block actionButton"
                        value="addIntroducer">
                    <span class="glyphicon glyphicon-plus"></span> <g:message
                        code="retailClient.introducerInformation.addIntroducer.button" default="Add Introducer"/>
                </button>
            </div>
        </div>
    </div>

</g:form>

<div class="row" id="introducerListDiv">
    <div class="row">
        <div class="col-sm-12">
            <table id="introducer-list-tbl" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th><g:message code="retailClient.introducerInformation.relationalAccountHolder.th.name" default="Name"/></th>
                    <th><g:message code="retailClient.introducerInformation.relationalAccountHolder.th.accountNo" default="Account No."/></th>
                    <th><g:message code="retailClient.introducerInformation.relationalAccountHolder.th.relation" default="Relation"/></th>
                    <th><g:message code="retailClient.introducerInformation.relationalAccountHolder.th.address" default="Address"/></th>
                    <th><g:message code="retailClient.introducerInformation.relationalAccountHolder.th.contactNo" default="Contact No."/></th>
                    <th><g:message code="retailClient.introducerInformation.relationalAccountHolder.th.action" default="Action"/></th>
                </tr>
                </thead>
                <tbody id="introducerTableId">
                <g:each in="${retailAccount?.retailIntroducer}" var="introducer" status="i">
                    <tr>
                        <td id="attCaption">${introducer.client.name}</td>
                        <td id="attName">${introducer.client.accountNo}</td>

                        <td id="attDescription">${introducer.relation}</td>
                        <td id="attSize">${introducer.client.address}</td>
                        <td id="attType">${introducer.client.contactNo}</td>


                        <td class="actions ">
                            <div class="btn-group">
                                <sec:access controller="retailClient" action="deleteRetailIntroducer">
                                    <a class="btn btn-sm delete btn-danger introducer-delete-link"
                                       onclick="return confirm('Are you sure delete Introducer Information?')"
                                       href="" id="${introducer.id}" retailAccount="${retailAccount?.id}"
                                       title="Delete"><i class="glyphicon glyphicon-remove "></i></a>
                                </sec:access>
                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    jQuery(function ($) {
        //$(".chosen-select").chosen();
        var introducerTable = $('#introducer-list-tbl').DataTable({
            "sDom": " ", //<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>> ,
            "bAutoWidth": true,
            "aoColumns": [
                null,
                null,
                null,
                null,
                null,
                { "bSortable": false, "sClass": "center"}
            ]
        });

        $('#retailIntroducerInformationForm').validate({

            errorElement: 'small',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                accountNo: {
                    required: true
                },
                relation: {
                    required: true
                }
            },
            messages: {
                accountNo: {
                    required: " "
                },
                relation: {
                    required: " "
                }
            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },

            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
                $(e).remove();
            },

            errorPlacement: function (error, element) {
                if (element.is(':checkbox') || element.is(':radio')) {
                    var controls = element.closest('div[class*="col-"]');
                    if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                }
                else if (element.is('.select2')) {
                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                }
                else if (element.is('.chosen-select')) {
                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                }
                else error.insertAfter(element.parent());
            },
            submitHandler: function (form) {
                $.ajax({
                    url: "${createLink(controller: 'retailClient', action: 'saveRetailIntroducer')}",
                    type: 'post',
                    dataType: 'json',
                    data: $("#retailIntroducerInformationForm").serialize(),
                    success: function (data) {
                        if (data.isError == false) {
                            introducerTable.row.add([
                                data.client.name,
                                data.client.accountNo,
                                data.introducer.relation,
                                data.client.address,
                                data.client.contactNo,
                                        "<a class='btn btn-sm delete btn-danger introducer-delete-link' href='' id=" + data.introducer.id + " title='Delete'><i class='glyphicon glyphicon-remove'></i></a>"
                            ]).draw();

                            $(':input', '#retailIntroducerInformationForm').not(':button, :hidden').val('');
                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);
                            $('#retail-client-list-tbl').DataTable().ajax.reload();
                        }
                        else {
                            var error = '<div class="alert alert-danger">';
                            error += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            error += '</div>';
                            $('.successMsg').html(error);
                        }

                    },
                    failure: function (data) {
                    }
                })
            }
        });


        // Account No. checking here
        $("#accountNo").blur(function () {
            var accountNo = $(this).val();
            $.ajax({
                url: "${createLink(controller: 'retailClient', action: 'checkAccountNo')}",
                type: 'post',
                dataType: 'json',
                data: {accountNo: accountNo},
                success: function (data) {
                    if (data.result) {
                        $("input#clientId").val("" + data.result.id + "");
                        $("input#name").val("" + data.result.name + "");
                        $("input#address").val("" + data.result.address + "");
                        $("input#contactNo").val("" + data.result.contactNo + "");
                        $("#errorInAccount").removeClass('help-block').hide();
                        $("#accountNoDiv").removeClass('has-error');
                    } else {
                        $("#errorInAccount").addClass('help-block').text("Account No Not Found!.").show();
                        $("#accountNoDiv").addClass('has-error');
                        $("input#clientId").val("");
                        $("input#name").val("");
                        $("input#address").val("");
                        $("input#contactNo").val("");
                    }
                }
            })
        });

        // Delete
        $('#introducer-list-tbl').on('click', 'a.introducer-delete-link', function (e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var selectRow = $(this).parents('tr');

            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'retailClient',action: 'deleteRetailIntroducer')}?id=" + id,
                success: function (data, textStatus) {
                    if (data.isError == false) {

                        var success = '<div class="alert alert-success">';
                        success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        success += '</div>';
                        $('.successMsg').html(success);
                        $('#introducer-list-tbl').DataTable().row(selectRow).remove().draw();
                    }
                    else {
                        var error = '<div class="alert alert-danger">';
                        error += '<i class="icon-bell red"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        error += '</div>';
                        $('.successMsg').html(error);
                    }


                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //                    $('#'+updateDiv).html(data);
                }
            });

        });


    });





</script>
