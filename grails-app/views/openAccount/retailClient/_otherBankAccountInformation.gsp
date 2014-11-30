<%@ page import="com.gsl.oros.core.banking.settings.Bank; com.gsl.oros.core.banking.settings.Branch" %>
<g:form class="form-horizontal" method="post" name="retailOtherBankAccountInformationForm"
        id="retailOtherBankAccountInformationForm" role="form"
        url="[action: 'saveRetailOtherBankAccount', controller: 'retailClient']" onsubmit="return false;">

    <input type="hidden" name="retailAccount" id="retailAccount" class="retailAccount" value="${retailAccount?.id}">
    <input type="hidden" name="id" id="retailOtherBankId" value="">
    <input type="hidden" name="row" id="rowBank" value="">

    <div class="form-group ${hasErrors(bean: retailOtherBankCommand, field: 'bank', 'has-error')}">
        <label for="obBank" class="control-label col-sm-3 col-md-3">
            <g:message code="retailClient.otherBankAccountInformation.bankName.label" default="Bank Name"/><span class="red">*</span>
        </label>

        <div class="col-sm-4 col-md-4">
            <g:select id="obBank" name='bank' class="form-control" required=""
                      noSelection="${['': 'Select bank...']}"
                      from='${Bank.list(sort: 'name')}' value=""
                      optionKey="id" optionValue="name">
            </g:select>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: retailOtherBankCommand, field: 'accountNo', 'has-error')}">
        <label for="obAccountNo" class="col-sm-3 col-md-3 control-label">
            <g:message code="retailClient.otherBankAccountInformation.accountNo.label" default="Account No"/><span class="red">*</span>
        </label>

        <div class="col-sm-4 col-md-4">
            <input type="text" class="form-control required" placeholder="Account No" value="" id="obAccountNo"
                   name="accountNo">
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: retailOtherBankCommand, field: 'accountName', 'has-error')}">
        <label for="obAccountName" class="control-label col-sm-3 col-md-3">
            <g:message code="retailClient.otherBankAccountInformation.accountName.label" default="Account Name"/><span class="red">*</span>
        </label>

        <div class="col-xs-6 col-sm-4 col-md-4">
            <input type="text" class="form-control required" value="" placeholder="Account Name" id="obAccountName"
                   name="accountName">
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: retailOtherBankCommand, field: 'branch', 'has-error')}">
        <label for="obBranch" class="control-label col-sm-3 col-md-3">
            <g:message code="retailClient.otherBankAccountInformation.branch.label" default="Branch"/><span class="red">*</span>
        </label>

        <div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
            <g:select id="obBranch" name='branch' class="form-control" required=""
                      noSelection="${['': 'Select branch...']}"
                      from='' value=""
                      optionKey="id" optionValue="name">
            </g:select>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: retailOtherBankCommand, field: 'type', 'has-error')}">
        <label for="obType" class="control-label col-sm-3 col-md-3">
            <g:message code="retailClient.otherBankAccountInformation.type.label" default="Type"/><span class="red">*</span>
        </label>

        <div class="col-xs-6 col-sm-4 col-md-4">
            <input type="text" class="form-control required" value="" placeholder="Type" id="obType" name="type">
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: retailOtherBankCommand, field: 'sortCode', 'has-error')}">
        <label for="obSortCode" class="col-xs-12 col-sm-3 col-md-3 control-label">
            <g:message code="retailClient.otherBankAccountInformation.sortCode.label" default="Sort Code"/><span class="red">*</span>
        </label>

        <div class="col-xs-6 col-sm-4 col-md-4">
            <input type="text" class="form-control required" placeholder="Sort Code" value="" id="obSortCode"
                   name="sortCode">
        </div>

        <div class="col-xs-6 col-sm-4 col-md-4">
            <button type="submit" name="addOtherBankAccount" id="addOtherBankAccount" value="addOtherBankAccount"
                    class="btn-block actionButton">
                <span class="glyphicon glyphicon-plus"></span> <g:message
                    code="retailClient.otherBankAccountInformation.addBankAccount.button" default="Add Bank Account"/>
            </button>
        </div>
    </div>

</g:form>

%{--<g:if test="${retailAccount?.retailOtherBank}">--}%
<div class="row" id="otherBankAccountListDiv">
    <div class="row">
        <div class="col-sm-12">
            <table id="retail-Other-Bank-tbl" class="table table-bordered table-striped table-hover table-condensed ">
                <thead>
                <tr>
                    <th><g:message code="retailClient.otherBankAccountInformation.th.bankName" default="Bank Name"/></th>
                    <th><g:message code="retailClient.otherBankAccountInformation.th.accountNo" default="Account No."/></th>
                    <th><g:message code="retailClient.otherBankAccountInformation.th.accountName" default="Account Name"/></th>
                    <th><g:message code="retailClient.otherBankAccountInformation.th.branch" default="Branch"/></th>
                    <th><g:message code="retailClient.otherBankAccountInformation.th.type" default="Type"/></th>
                    <th><g:message code="retailClient.otherBankAccountInformation.th.sortCode" default="Sort Code"/></th>
                    <th><g:message code="retailClient.otherBankAccountInformation.th.action" default="Action"/></th>
                </tr>
                </thead>
                <tbody id="otherBankAccountTableId">
                <g:each in="${retailAccount?.retailOtherBank}" var="otherBank" status="i">

                    <tr>
                        <td id="bank">${otherBank.bank.name}</td>
                        <td id="accountNo">${otherBank.accountNo}</td>
                        <td id="accountName">${otherBank.accountName}</td>
                        <td id="branch">${otherBank.branch.name}</td>
                        <td id="type">${otherBank.type}</td>
                        <td id="sortCode">${otherBank.sortCode}</td>


                        <td class="actions ">
                            <div class="btn-group">
                                <sec:access controller="retailClient" action="editOtherBankAccount">
                                    <a class="btn btn-sm otherBankAccount-edit-link" href="" id="${otherBank.id}"
                                       title="Edit">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                    </a>
                                </sec:access>
                                <sec:access controller="retailClient" action="deleteOtherBankAccount">
                                    <a class="btn btn-sm delete btn-danger otherBankAccount-delete-link"
                                       onclick="return confirm('Are you sure delete Other Bank Account Information?')"
                                       href="" id="${otherBank.id}" title="Delete"><i
                                            class="glyphicon glyphicon-remove "></i>
                                    </a>
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
%{--</g:if>--}%


<script type="text/javascript">
    jQuery(function ($) {
        //$(".chosen-select").chosen();

        //var oTable2 = $('#retail-Other-Bank-tbl').dataTable();

        var otherBankTable = $('#retail-Other-Bank-tbl').DataTable({
            "sDom": " ", //<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>> ,
            "bAutoWidth": true,
            "aoColumns": [
                null,
                null,
                null,
                null,
                null,
                null,
                { "bSortable": false }
            ]
        });

        $('#retailOtherBankAccountInformationForm').validate({

            errorElement: 'small',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                bank: {
                    required: true
                },
                accountNo: {
                    required: true
                },
                accountName: {
                    required: true
                },
                branch: {
                    required: true
                },
                type: {
                    required: true
                },
                sortCode: {
                    required: true
                }
            },
            messages: {
                bank: {
                    required: " "
                },
                accountNo: {
                    required: " "
                },
                accountName: {
                    required: " "
                },
                branch: {
                    required: " "
                },
                type: {
                    required: " "
                },
                sortCode: {
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
                    url: "${createLink(controller: 'retailClient', action: 'saveRetailOtherBankAccount')}",
                    type: 'post',
                    dataType: 'json',
                    data: $("#retailOtherBankAccountInformationForm").serialize(),
                    success: function (data) {
                        if (data.isError == false) {
                            if (data.add == true) {
                                otherBankTable.row.add([
                                    data.bank,
                                    data.retailOtherBank.accountNo,
                                    data.retailOtherBank.accountName,
                                    data.branch,
                                    data.retailOtherBank.type,
                                    data.retailOtherBank.sortCode,
                                            "<div class='btn-group'><a class='btn btn-sm otherBankAccount-edit-link' href='' id=" + data.retailOtherBank.id + " title='Edit'><i class='icon-pencil'></i></a><a class='btn btn-sm delete btn-danger otherBankAccount-delete-link' href='' id=" + data.retailOtherBank.id + " title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                                ]).draw();

                                $(':input', '#retailOtherBankAccountInformationForm').not(':button, :hidden').val('');
                                $("#obBranch").html('');
                                var success = '<div class="alert alert-success">';
                                success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                success += '</div>';
                                $('.successMsg').html(success);
                                $('#retail-client-list-tbl').DataTable().ajax.reload();
                            }
                            else if (data.update == true) {
                                var row = data.row;
                                $('#retail-Other-Bank-tbl').dataTable().fnUpdate([
                                    data.bank,
                                    data.retailOtherBank.accountNo,
                                    data.retailOtherBank.accountName,
                                    data.branch,
                                    data.retailOtherBank.type,
                                    data.retailOtherBank.sortCode,
                                            "<div class='btn-group'><a class='btn btn-sm otherBankAccount-edit-link' href='' id=" + data.retailOtherBank.id + " title='Edit'><i class='icon-pencil'></i></a><a class='btn btn-sm delete btn-danger otherBankAccount-delete-link' href='' id=" + data.retailOtherBank.id + " title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                                ], row);

                                $(':input,:hidden', '#retailOtherBankAccountInformationForm').not('#retailAccount').val('');
                                $("#obBranch").html('');
                                $('#addOtherBankAccount').html('<span class="glyphicon glyphicon-plus"></span> Add Bank Account');

                                var success = '<div class="alert alert-success">';
                                success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                success += '</div>';
                                $('.successMsg').html(success);

                            }
                        }

                        else {
                            var error = '<div class="alert alert-danger">';
                            error += '<i class="icon-bell red"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            error += '</div>';
                            $('.successMsg').html(error);
                        }
                    },
                    failure: function (data) {
                    }
                })
            }
        });

        $("#obBank").change(function () {
            var bankId = $(this).val();
            $.ajax({
                url: "${createLink(controller: 'retailClient', action: 'fetchBranch')}?id=" + bankId,
                type: 'post',
                success: function (data) {
                    $("#obBranch").html(data);
                }
            })
        });

        function getAllBranch(bankId) {
            $.ajax({
                url: "${createLink(controller: 'retailClient', action: 'fetchBranch')}?id=" + bankId,
                type: 'post',
                success: function (data) {
                    $("#obBranch").html(data);
                }
            })
        }


        // Delete
        $('#retail-Other-Bank-tbl').on('click', 'a.otherBankAccount-delete-link', function (e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var selectRow = $(this).parents('tr');
            //var retailAccount = $(control).attr('retailAccount');
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'retailClient',action: 'deleteOtherBankAccount')}?id=" + id,
                success: function (data, textStatus) {
                    if (data.isError == false) {
                        var success = '<div class="alert alert-success">';
                        success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        success += '</div>';
                        $('.successMsg').html(success);
                        $('#retail-Other-Bank-tbl').DataTable().row(selectRow).remove().draw();
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

        // edit
        $('#retail-Other-Bank-tbl').on('click', 'a.otherBankAccount-edit-link', function (e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            //var retailAccount = $(control).attr('retailAccount');
            var tr = $(this).parents('tr');
            var row = otherBankTable.row(tr).index();

            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'retailClient',action: 'editOtherBankAccount')}?id=" + id + "&row=" + row,
                success: function (data, textStatus) {
                    if (data.isError == false) {


                        $('#obBank').val(data.bank.id);
                        $('#obAccountNo').val(data.retailOtherBank.accountNo);
                        $('#obAccountName').val(data.retailOtherBank.accountName);
                        $('#obBranch').val(data.branch.id);
                        $('#obType').val(data.retailOtherBank.type);
                        $('#obSortCode').val(data.retailOtherBank.sortCode);
                        $('#retailOtherBankId').val(data.retailOtherBank.id);
                        $('#addOtherBankAccount').html('<span class="glyphicon glyphicon-check"></span>Edit Bank Account');
                        $('#rowBank').val(data.row);

                        var bankId = data.bank.id;
                        getAllBranch(bankId);

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
