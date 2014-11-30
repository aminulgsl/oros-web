<g:form class="form-horizontal" method="post" name="retailNomineeInfoForm" id="retailNomineeInfoForm" role="form"
        url="[action: 'saveRetailNomineeInfo', controller: 'retailClient']" onsubmit="return false;">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-xs-6 col-sm-6 col-md-6">

                <input type="hidden" id="retailAccount" class="retailAccount" name="retailAccount" value="${retailAccount?.id}">
                <input type="hidden" name="id" id="retailNomineeId" value="${retailNominee?.id}"/>
                <input type="hidden" name="row" id="nomineeRow" value="">

                <div class="form-group">
                    <label for="firstName" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.firstName.label" default="First Name"/>
                    </label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="First Name" id="firstName" name="firstName"
                               value="${retailNominee?.firstName}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastName" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.lastName.label" default="Last Name"/>
                    </label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="Last Name" id="lastName" name="lastName"
                               value="${retailNominee?.lastName}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.email.label" default="Email"/>
                    </label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="email" class="" placeholder="Email" id="email" name="email"
                               value="${retailNominee?.email}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="addressLine2" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.addressLine2.label" default="Address Line2"/>
                    </label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="Second Address" id="addressLine2" name="addressLine2"
                               value="${retailNominee?.addressLine2}">
                    </div>
                </div>

                <div class="form-group ${hasErrors(bean: retailNomineeCommand, field: 'accountNo', 'has-error')}">
                    <label for="nomineeAccountNo" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.accountNo.label" default="Account No"/><span
                            class="red">*</span></label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="text" class="required" placeholder="Account No" id="nomineeAccountNo"
                               name="accountNo" value="${retailNominee?.accountNo}">
                    </div>
                </div>

                <div class="form-group ${hasErrors(bean: retailNomineeCommand, field: 'dob', 'has-error')}">
                    <label class="col-sm-5 col-xs-6 control-label" for="dob">
                        <g:message code="retailClient.nomineeInfo.dateOfBirth.label" default="Date of Birth"/>
                    </label>

                    <div class="col-sm-5 col-xs-8">
                        <div class="clearfix">
                            <div class="input-append date input-group" id="dob">
                                <input type="date" id="dobId" name="dob" class="form-control datepicker" value=""
                                       data-date-format="dd/mm/yyyy"/>
                                <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="branchName" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.branchName.label" default="Branch name"/>
                    </label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="Branch Name Where Account is Held" id="branchName"
                               name="branchName" value="${retailNominee?.branchName}">
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-sm-6 col-md-6">

                <div class="form-group">
                    <label for="middleName" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.middleName.label" default="Middle Name"/>
                    </label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="Middle Name" id="middleName" name="middleName"
                               value="${retailNominee?.middleName}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="nomineeContactNo" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.contactNo.label" default="Contact No"/>
                    </label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="Contact No" id="nomineeContactNo" name="contactNo"
                               value="${retailNominee?.contactNo}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="addressLine1" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.addressLine1.label" default="Address Line1"/>
                    </label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="First Address" id="addressLine1" name="addressLine1"
                               value="${retailNominee?.addressLine1}">
                    </div>
                </div>

                <div class="form-group ${hasErrors(bean: retailNomineeCommand, field: 'gender', 'has-error')}">
                    <label for="gender" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.gender.label" default="Gender"/><span
                            class="red">*</span></label>

                    <div class="col-sm-7 col-xs-8">
                        <select id="gender" class="required" name="gender">
                            <option value=''>- Select -</option>
                            <option value="Male" ${retailNominee?.gender == "Male" ? 'selected' : ''}><g:message
                                    code="retailClient.nomineeInfo.gender.male.option" default="Male"/></option>
                            <option value="Female" ${retailNominee?.gender == "Female" ? 'selected' : ''}><g:message
                                    code="retailClient.nomineeInfo.gender.female.option" default="Female"/></option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="type" class="col-sm-5 col-xs-6 control-label">Nature of Account</label>

                    <div class="col-sm-7 col-xs-8">
                        <select id="type" class="" name="type">
                            <option value=''>- Select -</option>
                            <option value="current" ${retailNominee?.type == "current" ? 'selected' : ''}><g:message
                                    code="retailClient.nomineeInfo.type.current.option" default="Current"/></option>
                            <option value="deposit" ${retailNominee?.type == "deposit" ? 'selected' : ''}><g:message
                                    code="retailClient.nomineeInfo.type.deposit.option" default="Deposit"/></option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="nomineeRelation" class="col-sm-5 col-xs-6 control-label">
                        <g:message code="retailClient.nomineeInfo.relationshipwithHolder.label"
                                   default="Relationship with A/C holder"/>
                    </label>

                    <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="Relationship with A/C holder" id="nomineeRelation"
                               name="relation" value="${retailNominee?.relation}">
                    </div>
                </div>

                <div class="form-group"></div>

                <div class="form-group clearfix">
                    <div class="col-sm-7 col-xs-8 pull-right">
                        <button type="submit" name="addNominee" id="addNominee" class="btn-block actionButton" value="addNominee">
                            <span class="glyphicon glyphicon-plus"></span> <g:message
                                code="retailClient.nomineeInfo.addNominee.label" default="Add Nominee"/>
                        </button>
                    </div>
                </div>

            </div>

        </div>
    </div>

</g:form>


%{--<g:if test="${retailAccount?.retailNominee}">--}%
<div class="row" id="introducerListDiv">
    <div class="row">
        <div class="col-sm-12">
            <table id="nominee-info-tbl" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th><g:message code="retailClient.nomineeInfo.th.name" default="Name"/></th>
                    <th><g:message code="retailClient.nomineeInfo.th.accountNo" default="Account No."/></th>
                    <th><g:message code="retailClient.nomineeInfo.th.contactNo" default="Contact No."/></th>
                    <th><g:message code="retailClient.nomineeInfo.th.email" default="Email"/></th>
                    <th><g:message code="retailClient.nomineeInfo.th.type" default="Type"/></th>
                    <th><g:message code="retailClient.nomineeInfo.th.action" default="Action"/></th>
                </tr>
                </thead>
                <tbody id="introducerTableId">
                <g:each in="${retailAccount?.retailNominee}" var="retailNominee" status="i">
                    <tr>
                        <td id="attCaption">${retailNominee?.firstName} ${retailNominee?.middleName} ${retailNominee?.lastName}</td>
                        <td id="attName">${retailNominee?.accountNo}</td>
                        <td id="attDescription">${retailNominee?.contactNo}</td>
                        <td id="attSize">${retailNominee?.email}</td>
                        <td id="attType">${retailNominee?.type}</td>

                        <td class="actions ">
                            <div class="btn-group">
                                <sec:access controller="retailClient" action="editRetailNominee">
                                    <a class="btn btn-sm edit nominee-edit-link"
                                       href="" id="${retailNominee?.id}" title="Edit"><i
                                            class="glyphicon glyphicon-pencil"></i>
                                    </a>
                                </sec:access>
                                <sec:access controller="retailClient" action="deleteRetailNominee">
                                    <a class="btn btn-sm delete btn-danger nominee-delete-link"
                                       onclick="return confirm('Are you sure delete Nominee Information?')"
                                       href="" id="${retailNominee?.id}" title="Delete"><i class="glyphicon glyphicon-remove "></i>
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

        var nomineeTable = $('#nominee-info-tbl').DataTable({
            "sDom": " ", //<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>> ,
            "bAutoWidth": true,
            "aoColumns": [
                null,
                null,
                null,
                null,
                null,
                { "bSortable": false }
            ]
        });


        $('#retailNomineeInfoForm').validate({

            errorElement: 'small',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                accountNo: {
                    required: true
                },
                dob: {
                    required: true
                },
                gender: {
                    required: true
                }
            },
            messages: {
                accountNo: {
                    required: " "
                },
                dob: {
                    required: " "
                },
                gender: {
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
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('#retailNomineeInfoForm')).show();
            },
            submitHandler: function (form) {
                $.ajax({
                    url: "${createLink(controller: 'retailClient', action: 'saveRetailNomineeInfo')}",
                    type: 'post',
                    dataType: 'json',
                    data: $("#retailNomineeInfoForm").serialize(),
                    success: function (data) {
                        if (data.isError == false) {
                            if (data.add == true) {
                                var fullName = data.retailNominee.firstName ? data.retailNominee.firstName + " " : '';
                                fullName += data.retailNominee.middleName ? data.retailNominee.middleName + " " : '';
                                fullName += data.retailNominee.lastName ? data.retailNominee.lastName : '';

                                nomineeTable.row.add([
                                    fullName,
                                    data.retailNominee.accountNo,
                                    data.retailNominee.contactNo,
                                    data.retailNominee.email,
                                    data.retailNominee.type,
                                            "<div class='btn-group'><a class='btn btn-sm nominee-edit-link' href='' id=" + data.retailNominee.id + " title='Edit'><i class='icon-pencil'></i></a><a class='btn btn-sm delete btn-danger nominee-delete-link' href='' id=" + data.retailNominee.id + " title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                                ]).draw();

                                $(':input', '#retailNomineeInfoForm').not(':button, :hidden').val('');

                                var success = '<div class="alert alert-success">';
                                success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                success += '</div>';
                                $('.successMsg').html(success);
                                $('#retail-client-list-tbl').DataTable().ajax.reload();
                            }
                            else if (data.update == true) {
                                var row = data.row;
                                var fullName = data.retailNominee.firstName ? data.retailNominee.firstName + " " : '';
                                fullName += data.retailNominee.middleName ? data.retailNominee.middleName + " " : '';
                                fullName += data.retailNominee.lastName ? data.retailNominee.lastName : '';

                                $('#nominee-info-tbl').dataTable().fnUpdate([
                                    fullName,
                                    data.retailNominee.accountNo,
                                    data.retailNominee.contactNo,
                                    data.retailNominee.email,
                                    data.retailNominee.type,
                                            "<div class='btn-group'><a class='btn btn-sm nominee-edit-link' href='' id=" + data.retailNominee.id + " title='Edit'><i class='icon-pencil'></i></a><a class='btn btn-sm delete btn-danger nominee-delete-link' href='' id=" + data.retailNominee.id + " title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                                ], row);

                                $(':input,:hidden', '#retailNomineeInfoForm').not('#retailAccount').val('');

                                $('#addNominee').html('<span class="glyphicon glyphicon-plus"></span> Add Nominee');

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


        // Delete
        $('#nominee-info-tbl').on('click', 'a.nominee-delete-link', function (e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var selectRow = $(this).parents('tr');
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'retailClient',action: 'deleteRetailNominee')}?id=" + id,
                success: function (data, textStatus) {
                    if (data.isError == false) {
                        var success = '<div class="alert alert-success">';
                        success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        success += '</div>';
                        $('.successMsg').html(success);
                        nomineeTable.row(selectRow).remove().draw();
                    } else {
                        var error = '<div class="alert alert-danger">';
                        error += '<i class="icon-bell red"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        error += '</div>';
                        $('.successMsg').html(error);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //$('#'+updateDiv).html(data);
                }
            });

        });

        // edit
        $('#nominee-info-tbl').on('click', 'a.nominee-edit-link', function (e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var tr = $(this).parents('tr');
            var row = nomineeTable.row(tr).index();

            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'retailClient',action: 'editRetailNominee')}?id=" + id + "&row=" + row,
                success: function (data, textStatus) {
                    if (data.isError == false) {
                        $('#firstName').val(data.retailNominee.firstName);
                        $('#middleName').val(data.retailNominee.middleName);
                        $('#lastName').val(data.retailNominee.lastName);
                        $('#nomineeAccountNo').val(data.retailNominee.accountNo);
                        $('#nomineeContactNo').val(data.retailNominee.contactNo);
                        $('#email').val(data.retailNominee.email);
                        $('#type').val(data.retailNominee.type);
                        $('#gender').val(data.retailNominee.gender);
                        $('#dobId').val(data.dobDate);
                        $('#nomineeRelation').val(data.retailNominee.relation);
                        $('#addressLine1').val(data.retailNominee.addressLine1);
                        $('#branchName').val(data.retailNominee.branchName);
                        $('#addressLine2').val(data.retailNominee.addressLine2);
                        $('#retailNomineeId').val(data.retailNominee.id);
                        $('#addNominee').html('<span class="glyphicon glyphicon-check"></span> Edit Nominee');
                        $('#nomineeRow').val(data.row);
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
