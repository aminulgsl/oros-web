<g:form id="bankAccountForm" name="bankAccountForm" method="post" role="form" class="form-inline"
         onSubmit="return false;">

    <g:hiddenField name="id" id="id" value="${otherBankAccount?.id}"/>
    <g:hiddenField name="personalId" id="personalId" value="${personalInfo?.id}"/>
    <input type="hidden" name="row" id="rowBankAccount" value="">

    <div class="form-group ${hasErrors(bean:otherBankAccount,field:'bankAccountName','has-error')}">
        <label for="bankName">Bank Name*</label>
        <input type="text" placeholder="Enter Bank Name"
               id="bankName" name="bankName"  value="${otherBankAccount?.bankName}">
    </div>
    <div class="form-group ${hasErrors(bean:otherBankAccount,field:'ibanPrefix','has-error')}">
        <label for="ibanPrefix">Iban Prefix*</label>
        <input type="text" placeholder="Enter Iban Prefix"
               id="ibanPrefix" name="ibanPrefix"  value="${otherBankAccount?.ibanPrefix}">
    </div>
    <div class="form-group ${hasErrors(bean:otherBankAccount,field:'bankAccountNo','has-error')}">
        <label for="bankAccountNo">Bank Account Number*</label>
        <input type="text" placeholder="Enter Bank Account Number"
               id="bankAccountNo" name="bankAccountNo"  value="${otherBankAccount?.bankAccountNo}">
    </div>
    <div class="form-group ${hasErrors(bean:otherBankAccount,field:'bankAccountName','has-error')}">
        <label for="bankAccountName">Bank Account Name*</label>
        <input type="text" placeholder="Enter Bank Account Name"
               id="bankAccountName" name="bankAccountName"  value="${otherBankAccount?.bankAccountName}">
    </div>
    <div class="clearfix form-actions align-right">
        <g:if test="${personalInfo?.otherBankAccount}">
        <button type="submit" id="bankAccountSubmitButton" class="btn btn-info">
        <i class="icon-ok bigger-110"></i>Add More</button>
        </g:if>
        <g:else>
        <button type="submit" id="bankAccountSubmitButton" class="btn btn-info">
            <i class="icon-ok bigger-110"></i>Add</button>
        </g:else>
    </div>
</g:form>

<div class= "row" id="bankAccountListDiv">
    <div class= "row">
        <div class="col-sm-12">
            <table id="bankAccountTable" class="table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Bank Name</th>
                    <th>Iban Prefix</th>
                    <th>Bank Account No.</th>
                    <th>Bank Account Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody id="bankAccountTableId">
                <g:each in="${personalInfo?.otherBankAccount}" var="bankAccount" status="i">

                    <tr>
                        <td id="attBankName">${bankAccount.bankName}</td>
                        <td id="attIbanPrefix">${bankAccount.ibanPrefix}</td>
                        <td id="attAccountNo">${bankAccount.bankAccountNo}</td>
                        <td id="attAccountName">${bankAccount.bankAccountName}</td>

                        <td class="actions ">
                            <div class="btn-group">
                                <sec:access controller="savingsAccount" action="editBankAccount">
                                    <a class="btn btn-sm bankAccount-edit-link" href="" id="${bankAccount.id}" personalId="${personalInfo?.id}" title="Edit">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                    </a>
                                </sec:access>
                                <sec:access controller="savingsAccount" action="deleteBankAccount">
                                    <a class="btn btn-sm delete btn-danger bankAccount-delete-link" onclick="return confirm('Are you sure delete Bank Account Information?')"
                                       href="" id="${bankAccount.id}" personalId="${personalInfo?.id}" title="Delete"><i class="glyphicon glyphicon-remove"></i>
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


<script type="text/javascript">
    jQuery(function ($) {

        var bankAccountTable = $('#bankAccountTable').DataTable({
            "sDom": " ", //<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>> ,
            "bAutoWidth": true,
            "aoColumns": [
                null,
                null,
                null,
                null,
                { "bSortable": false }
            ]
        });

        $('#bankAccountForm').validate({
            errorPlacement: function (error, element) {
            },
            focusInvalid: false,
            rules: {
                bankName: {
                    required: true
                },
                ibanPrefix: {
                    required: false
                },
                bankAccountNo: {
                    required: true
                },
                bankAccountName: {
                    required: true
                }
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('#bankAccountForm')).show();
            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },
            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
                $(e).remove();
            },
            unhighlight: function (e) { // <-- fires when element is valid
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            },
            submitHandler: function (form) {
                $.ajax({
                    url: "${createLink(controller: 'savingsAccount', action: 'saveOtherBankAccount')}",
                    type: 'post',
                    dataType: 'json',
                    data: $("#bankAccountForm").serialize(),
                    success: function (data) {
                        if(data.isError == false){
                            if(data.add==true){
                                bankAccountTable.row.add( [
                                    data.otherBankAccount.bankName,
                                    data.otherBankAccount.ibanPrefix,
                                    data.otherBankAccount.bankAccountNo,
                                    data.otherBankAccount.bankAccountNo,
                                    "<div class='btn-group'><a class='btn btn-sm bankAccount-edit-link' href='' id="+data.otherBankAccount.id+" personalId="+data.personalInfo.id+" title='Edit'><i class='glyphicon glyphicon-pencil'></i></a><a class='btn btn-sm delete btn-danger bankAccount-delete-link' href='' id="+data.otherBankAccount.id+" personalId="+data.personalInfo.id+" title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                                ] ).draw();

                                $(':input','#bankAccountForm').not(':button, :hidden').val('');
                                $('#bankAccountSubmitButton').html('<span class="glyphicon glyphicon-plus"></span> Add More');

                                var success = '<div class="alert alert-success">';
                                success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                success += '</div>';
                                $('.successMsg').html(success);
                            }
                            else if(data.update == true){
                                var row = data.row;
                                $('#bankAccountTable').dataTable().fnUpdate( [
                                    data.otherBankAccount.bankName,
                                    data.otherBankAccount.ibanPrefix,
                                    data.otherBankAccount.bankAccountNo,
                                    data.otherBankAccount.bankAccountNo,
                                    "<div class='btn-group'><a class='btn btn-sm bankAccount-edit-link' href='' id="+data.otherBankAccount.id+" personalId="+data.personalInfo.id+" title='Edit'><i class='glyphicon glyphicon-pencil'></i></a><a class='btn btn-sm delete btn-danger bankAccount-delete-link' href='' id="+data.otherBankAccount.id+" personalId="+data.personalInfo.id+" title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                                ], row );

                                $(':input,:hidden','#bankAccountForm').not('#personalId').val('');

                                $('#bankAccountSubmitButton').html('<span class="glyphicon glyphicon-plus"></span> Add More');

                                var success = '<div class="alert alert-success">';
                                success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                success += '</div>';
                                $('.successMsg').html(success);

                            }
                        }

                        else{
                            var error = '<div class="alert alert-danger">';
                            error += '<i class="icon-bell red"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            error += '</div>';
                            $('.successMsg').html(error);
                        }
                    },
                    failure: function (data) {
                    }
                });
            }
        });

        // Delete
        $('#bankAccountTable').on('click', 'a.bankAccount-delete-link', function(e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var selectRow = $(this).parents('tr');
            var personalId = $(control).attr('personalId');
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'savingsAccount',action: 'deleteOtherBankAccount')}?id="+id+"&personalId="+personalId,
                success: function (data, textStatus) {
                    if(data.isError == false){
                        var success = '<div class="alert alert-success">';
                        success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        success += '</div>';
                        $('.successMsg').html(success);
                        $('#bankAccountTable').DataTable().row( selectRow ).remove().draw();
                    }
                    else{
                        var error = '<div class="alert alert-danger">';
                        error += '<i class="icon-bell red"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        error += '</div>';
                        $('.successMsg').html(error);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
        });

        // Edit
        $('#bankAccountTable').on('click', 'a.bankAccount-edit-link', function(e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var tr = $(this).parents('tr');
            var row = bankAccountTable.row( tr ).index();

            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'savingsAccount',action: 'editOtherBankAccount')}?id="+id+"&row="+row,
                success: function (data, textStatus) {
                    if(data.isError == false){
                        $('#bankAccountForm #id').val(data.otherBankAccount.id);
                        $('#bankAccountForm #bankName').val(data.otherBankAccount.bankName);
                        $('#bankAccountForm #ibanPrefix').val(data.otherBankAccount.ibanPrefix);
                        $('#bankAccountForm #bankAccountNo').val(data.otherBankAccount.bankAccountNo);
                        $('#bankAccountForm #bankAccountName').val(data.otherBankAccount.bankAccountName);
                        $('#bankAccountSubmitButton').html('<span class="glyphicon glyphicon-check"></span>Update');
                        $('#rowBankAccount').val(data.row);
                    }
                    else{
                        var error = '<div class="alert alert-danger">';
                        error += '<i class="icon-bell red"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
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