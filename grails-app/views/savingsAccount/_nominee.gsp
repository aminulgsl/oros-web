<%@ page import="com.gsl.cbs.contraints.enums.GenderType" %>
<g:hasErrors bean="${nominee}">
    <div class='alert alert-success '>
        <ul>
            <g:eachError var="err" bean="${nominee}">
                <li><g:message error="${err}" /></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>

<g:form name="nomineeForm" id="nomineeForm" method="post" role="form" class="form-inline" onSubmit="return false;">

    <g:hiddenField name="id" id="id" value="${nominee?.id}"/>
    <g:hiddenField name="personalId" id="personalId" value="${personalInfo?.id}"/>
    <input type="hidden" name="row" id="rowNominee" value="">

    <div class="form-group ${hasErrors(bean:nominee,field:'firstName','has-error')}">
        <label for="firstName">First Name*</label>
        <input id="firstName" name="firstName" type="text" placeholder="Enter First Name"
               value="${nominee?.firstName}">
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'middleName','has-error')}">
        <label for="middleName">Middle Name</label>
        <input id="middleName" name="middleName" type="text" placeholder="Enter Middle Name"
               value="${nominee?.middleName}">
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'lastName','has-error')}">
        <label for="lastName">Last Name*</label>
        <input id="lastName" name="lastName" type="text" placeholder="Enter Last Name"
               value="${nominee?.lastName}">
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'fatherName','has-error')}">
        <label for="fatherName">Father's Name*</label>
        <input id="fatherName" name="fatherName" type="text" placeholder="Enter Father's Name"
               value="${nominee?.fatherName}">
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'motherName','has-error')}">
        <label for="motherName">Mother's Name*</label>
        <input id="motherName" name="motherName" type="text" placeholder="Enter Mother's Name"
               value="${nominee?.motherName}">
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'gender','has-error')}">
        <label for="gender">Gender*</label>
        <g:select name="gender" id="gender"
                  noSelection="['': 'Choose Gender']"
                  from="${GenderType.values()}"
                  value="${nominee?.gender}"
                  optionKey="value" optionValue="value"/>
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'presentAddress','has-error')}">
        <label for="presentAddress">Present Address*</label>
        <g:textArea name="presentAddress" id="presentAddress" placeholder="Enter Present Address" value="${nominee?.presentAddress}" />
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'permanentAddress','has-error')}">
        <label for="permanentAddress">Permanent Address*</label>
        <g:textArea name="permanentAddress" id="permanentAddress" placeholder="Enter Permanent Address" value="${nominee?.permanentAddress}" />
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'nationality','has-error')}">
        <label for="nationality">Nationality*</label>
        <input id="nationality" name="nationality" type="text" placeholder="Enter Nationality"
               value="${nominee?.nationality}">
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'nationalId','has-error')}">
        <label for="nationalId">National ID*</label>
        <input id="nationalId" name="nationalId" type="text" placeholder="Enter National ID"
               value="${nominee?.nationalId}">
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'phoneNo','has-error')}">
        <label for="phoneNo">Phone No.</label>
        <input id="phoneNo" name="phoneNo" type="text" placeholder="Enter Phone No."
               value="${nominee?.phoneNo}">
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'relation','has-error')}">
        <label for="relation">Relation*</label>
        <input id="relation" name="relation" type="text" placeholder="Enter Relation"
               value="${nominee?.relation}">
    </div>
    <div class="form-group ${hasErrors(bean:nominee,field:'profession','has-error')}">
        <label for="profession">Profession*</label>
        <input id="profession" name="profession" type="text" placeholder="Enter Profession"
               value="${nominee?.profession}">
    </div>
    <div class="clearfix form-actions align-right">
        <g:if test="${personalInfo?.nominee}">
            <button type="submit" id="nomineeSubmitButton" class="btn btn-info">
                <i class="glyphicon glyphicon-check"></i>Add More</button>
        </g:if>
        <g:else>
            <button type="submit" id="nomineeSubmitButton" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Add</button>
        </g:else>
    </div>
</g:form>

<div class= "row" id="nomineeListDiv">
    <div class= "row">
        <div class="col-sm-12">
            <table id="nomineeTable" class="table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Present Address</th>
                    <th>Permanent Address</th>
                    <th>National ID</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody id="nomineeId">
                <g:each in="${personalInfo?.nominee}" var="nominee" status="i">

                    <tr>
                        <td id="attName">${nominee.firstName} ${nominee.middleName} ${nominee.lastName}</td>
                        <td id="attPresent">${nominee.presentAddress}</td>
                        <td id="attPermanent">${nominee.permanentAddress}</td>
                        <td id="attNational">${nominee.nationalId}</td>

                        <td class="actions ">
                            <div class="btn-group">
                                <sec:access controller="savingsAccount" action="editNominee">
                                    <a class="btn btn-sm nominee-edit-link" href="" id="${nominee.id}" personalId="${personalInfo?.id}" title="Edit">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                    </a>
                                </sec:access>
                                <sec:access controller="savingsAccount" action="deleteNominee">
                                    <a class="btn btn-sm delete btn-danger nominee-delete-link" onclick="return confirm('Are you sure delete Nominee Information?')"
                                       href="" id="${nominee.id}" personalId="${personalInfo?.id}" title="Delete"><i class="glyphicon glyphicon-remove "></i>
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

        var nomineeTable = $('#nomineeTable').DataTable({
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

        $('#nomineeForm').validate({
            errorPlacement: function (error, element) {
            },
            focusInvalid: false,
            rules: {
                firstName: {
                    required: true
                },
                middleName: {
                    required: false
                },
                lastName: {
                    required: true
                },
                fatherName: {
                    required: true
                },
                motherName: {
                    required: true
                },
                gender: {
                    required: true
                },
                presentAddress: {
                    required: true
                },
                permanentAddress: {
                    required: true
                },
                nationality: {
                    required: true
                },
                nationalId: {
                    required: true
                },
                phoneNo: {
                    required: false
                },
                relation: {
                    required: true
                },
                profession: {
                    required: true
                }
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('#nomineeForm')).show();
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
                    url: "${createLink(controller: 'savingsAccount', action: 'saveNominee')}",
                    type: 'post',
                    dataType: 'json',
                    data: $("#nomineeForm").serialize(),
                    success: function (data) {
                        if(data.isError == false){
                            if(data.add==true){
                                nomineeTable.row.add( [
                                    data.nominee.firstName,
                                    data.nominee.presentAddress,
                                    data.nominee.permanentAddress,
                                    data.nominee.nationalId,
                                    "<div class='btn-group'><a class='btn btn-sm nominee-edit-link' href='' id="+data.nominee.id+" personalId="+data.personalInfo.id+" title='Edit'><i class='glyphicon glyphicon-pencil'></i></a><a class='btn btn-sm delete btn-danger nominee-delete-link' href='' id="+data.nominee.id+" personalId="+data.personalInfo.id+" title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                                ] ).draw();

                                $(':input','#nomineeForm').not(':button, :hidden').val('');
                                $('#nomineeSubmitButton').html('<span class="glyphicon glyphicon-plus"></span> Add More');

                                var success = '<div class="alert alert-success">';
                                success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                success += '</div>';
                                $('.successMsg').html(success);
                            }
                            else if(data.update == true){
                                var row = data.row;
                                $('#nomineeTable').dataTable().fnUpdate( [
                                    data.nominee.firstName,
                                    data.nominee.presentAddress,
                                    data.nominee.permanentAddress,
                                    data.nominee.nationalId,
                                    "<div class='btn-group'><a class='btn btn-sm nominee-edit-link' href='' id="+data.nominee.id+" personalId="+data.personalInfo.id+" title='Edit'><i class='glyphicon glyphicon-pencil'></i></a><a class='btn btn-sm delete btn-danger nominee-delete-link' href='' id="+data.nominee.id+" personalId="+data.personalInfo.id+" title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                                ], row );

                                $(':input,:hidden','#nomineeForm').not('#personalId').val('');

                                $('#nomineeSubmitButton').html('<span class="glyphicon glyphicon-plus"></span> Add More');

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
        $('#nomineeTable').on('click', 'a.nominee-delete-link', function(e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var selectRow = $(this).parents('tr');
            var personalId = $(control).attr('personalId');
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'savingsAccount',action: 'deleteNominee')}?id="+id+"&personalId="+personalId,
                success: function (data, textStatus) {
                    if(data.isError == false){
                        var success = '<div class="alert alert-success">';
                        success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        success += '</div>';
                        $('.successMsg').html(success);
                        $('#nomineeTable').DataTable().row( selectRow ).remove().draw();
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
        $('#nomineeTable').on('click', 'a.nominee-edit-link', function(e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var tr = $(this).parents('tr');
            var row = nomineeTable.row( tr ).index();

            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'savingsAccount',action: 'editNominee')}?id="+id+"&row="+row,
                success: function (data, textStatus) {
                    if(data.isError == false){
                        $('#nomineeForm #id').val(data.nominee.id);
                        $('#nomineeForm #firstName').val(data.nominee.firstName);
                        $('#nomineeForm #middleName').val(data.nominee.middleName);
                        $('#nomineeForm #lastName').val(data.nominee.lastName);
                        $('#nomineeForm #fatherName').val(data.nominee.fatherName);
                        $('#nomineeForm #motherName').val(data.nominee.motherName);
                        $('#nomineeForm #gender').val(data.nominee.gender);
                        $('#nomineeForm #presentAddress').val(data.nominee.presentAddress);
                        $('#nomineeForm #permanentAddress').val(data.nominee.permanentAddress);
                        $('#nomineeForm #nationality').val(data.nominee.nationality);
                        $('#nomineeForm #nationalId').val(data.nominee.nationalId);
                        $('#nomineeForm #phoneNo').val(data.nominee.phoneNo);
                        $('#nomineeForm #relation').val(data.nominee.relation);
                        $('#nomineeForm #profession').val(data.nominee.profession);
                        $('#nomineeSubmitButton').html('<span class="glyphicon glyphicon-check"></span>Update');
                        $('#rowNominee').val(data.row);
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

