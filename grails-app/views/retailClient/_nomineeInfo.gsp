<g:form class="form-horizontal" method="post" name="retailNomineeInfoForm" id="retailNomineeInfoForm" role="form" url="[action: 'saveRetailNomineeInfo', controller: 'retailClient']" onsubmit="return false;">

    <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12">
              <div class="col-xs-6 col-sm-6 col-md-6">

                    <input type="hidden" id="retailAccount" name="retailAccount" value="${retailAccount?.id}">
                    <input type="hidden" name="id" value="${retailNominee?.id}" />

                    <div class="form-group">
                      <label for="firstName" class="col-sm-5 col-xs-6 control-label">First Name</label>
                      <div class="col-sm-7 col-xs-8">
                           <input type="text" class="" placeholder="First Name" id="firstName" name="firstName" value="${retailNominee?.firstName}">
                      </div>
                    </div>

                    <div class="form-group">
                      <label for="lastName" class="col-sm-5 col-xs-6 control-label">Last Name</label>
                      <div class="col-sm-7 col-xs-8">
                          <input type="text" class="" placeholder="Last Name" id="lastName" name="lastName" value="${retailNominee?.lastName}">
                      </div>
                    </div>

                    <div class="form-group">
                      <label for="email" class="col-sm-5 col-xs-6 control-label">Email</label>
                      <div class="col-sm-7 col-xs-8">
                           <input type="email" class="" placeholder="Email" id="email" name="email" value="${retailNominee?.email}">
                      </div>
                    </div>

                    <div class="form-group">
                      <label for="addressLine2" class="col-sm-5 col-xs-6 control-label">Address Line2</label>
                      <div class="col-sm-7 col-xs-8">
                          <input type="text" class="" placeholder="Second Address" id="addressLine2" name="addressLine2" value="${retailNominee?.addressLine2}">
                      </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: retailNomineeCommand, field: 'accountNo', 'has-error')}">
                      <label for="accountNo" class="col-sm-5 col-xs-6 control-label">Account No<span class="red">*</span></label>
                      <div class="col-sm-7 col-xs-8">
                          <input type="text" class="required" placeholder="Account No" id="accountNo" name="accountNo" value="${retailNominee?.accountNo}">
                      </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: retailNomineeCommand, field: 'dob', 'has-error')}">
                      <label class="col-sm-5 col-xs-6 control-label" for="dob">
                          Date of Birth
                      </label>

                      <div class="col-sm-5 col-xs-8">
                          <div class="clearfix">
                              <div class="input-append date input-group" id="dob">
                                  <input type="date" name="dob" class="form-control datepicker" value="${retailNominee?.dob?.format('dd/MM/yyyy')}" data-date-format="dd/mm/yyyy"/>
                                  <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
                              </div>
                          </div>
                      </div>
                  </div>

                    <div class="form-group">
                      <label for="branchName" class="col-sm-5 col-xs-6 control-label">Branch name</label>
                      <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="Branch Name Where Account is Held" id="branchName" name="branchName" value="${retailNominee?.branchName}">
                      </div>
                  </div>

                    <div class="form-group">
                      <label for="status" class="col-sm-5 col-xs-6 control-label">Status</label>
                      <div class="col-sm-7 col-xs-8">
                          <select id="status" class="" name="status">
                              <option value="">-Select-</option>
                              <option value="1" ${retailNominee?.status == 1 ? 'selected' : ''}>Active</option>
                              <option value="0" ${retailNominee?.status == 0 ? 'selected' : ''}>Inactive</option>
                          </select>
                      </div>
                  </div>

              </div>

              <div class="col-xs-6 col-sm-6 col-md-6">

                  <div class="form-group">
                      <label for="middleName" class="col-sm-5 col-xs-6 control-label">Middle Name</label>
                      <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="Middle Name" id="middleName" name="middleName" value="${retailNominee?.middleName}">
                      </div>
                  </div>

                  <div class="form-group">
                      <label for="nomineeContactNo" class="col-sm-5 col-xs-6 control-label">Contact No</label>
                        <div class="col-sm-7 col-xs-8">
                            <input type="text" class="" placeholder="Contact No" id="nomineeContactNo" name="contactNo" value="${retailNominee?.contactNo}">
                        </div>
                  </div>

                  <div class="form-group">
                      <label for="addressLine1" class="col-sm-5 col-xs-6 control-label">Address Line1</label>
                        <div class="col-sm-7 col-xs-8">
                            <input type="text" class="" placeholder="First Address" id="addressLine1" name="addressLine1" value="${retailNominee?.addressLine1}">
                        </div>
                  </div>

                  <div class="form-group ${hasErrors(bean: retailNomineeCommand, field: 'gender', 'has-error')}">
                      <label for="gender" class="col-sm-5 col-xs-6 control-label">Gender<span class="red">*</span></label>
                      <div class="col-sm-7 col-xs-8">
                          <select id="gender" class="required" name="gender">
                              <option value=''>- Select -</option>
                              <option value="Male" ${retailNominee?.gender == "Male" ? 'selected' : ''}>Male</option>
                              <option value="Female" ${retailNominee?.gender == "Female" ? 'selected' : ''}>Female</option>
                          </select>
                      </div>
                  </div>

                  <div class="form-group">
                      <label for="type" class="col-sm-5 col-xs-6 control-label">Nature of Account</label>
                      <div class="col-sm-7 col-xs-8">
                          <select id="type" class="" name="type">
                              <option value=''>- Select -</option>
                              <option value="current" ${retailNominee?.type == "current" ? 'selected' : ''}>Current</option>
                              <option value="deposit" ${retailNominee?.type == "deposit" ? 'selected' : ''}>Deposit</option>
                          </select>
                      </div>
                  </div>

                  <div class="form-group">
                      <label for="relation" class="col-sm-5 col-xs-6 control-label">Relationship with A/C holder</label>
                      <div class="col-sm-7 col-xs-8">
                        <input type="text" class="" placeholder="Relationship with A/C holder" id="relation" name="relation" value="${retailNominee?.relation}">
                      </div>
                  </div>

                  <div class="form-group"></div>

                  <div class="form-group clearfix">
                      <div class="col-sm-7 col-xs-8 pull-right">
                          <button type="submit" name="addIntroducer" id="addIntroducer" class="btn btn-info" value="addIntroducer">
                              <span class="glyphicon glyphicon-plus"></span> Add Nominee
                          </button>
                      </div>
                  </div>

              </div>

          </div>
    </div>

</g:form>


%{--<g:if test="${retailAccount?.retailNominee}">--}%
    <div class= "row" id="introducerListDiv">
        <div class= "row">
            <div class="col-sm-12">
                %{--<table class="table table-bordered table-striped table-hover table-condensed ">--}%
                <table id="nominee-info-tbl" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Account No.</th>
                        <th>Contact No.</th>
                        <th>Email</th>
                        <th>Type</th>
                        <th>Action</th>
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
                                       href="" id="${retailNominee?.id}" retailAccount = "${retailAccount?.id}"
                                       title="Edit"><i class="icon-circle-arrow-down orange"></i></a>
                                    </sec:access>
                                    <sec:access controller="retailClient" action="deleteRetailNominee">
                                    <a class="btn btn-sm delete btn-danger nominee-delete-link" onclick="return confirm('Are you sure delete Nominee Information?')"
                                       href="" id="${retailNominee?.id}" retailAccount = "${retailAccount?.id}"
                                       title="Delete"><i class="glyphicon glyphicon-remove "></i></a>
                                    </sec:access>
                                </div>
                            </td>
                        </tr>
                    %{-- </g:if>--}%
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
%{--</g:if>--}%

<script type="text/javascript">
    jQuery(function ($) {
        $(".chosen-select").chosen();
        var oTable1 = $('#nominee-info-tbl').dataTable();


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
            } ,
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
                    url:"${createLink(controller: 'retailClient', action: 'saveRetailNomineeInfo')}",
                    type:'post',
                    data: $("#retailNomineeInfoForm").serialize(),
                    success:function(data){
                        $('#page-content').html(data);
                    },
                    failure:function(data){
                    }
                })
            }
        });


        // Delete
        $('#nominee-info-tbl').on('click', 'a.nominee-delete-link', function(e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var retailAccount = $(control).attr('retailAccount');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'retailClient',action: 'deleteRetailNominee')}?id="+id+"&retailAccount="+retailAccount,
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //$('#'+updateDiv).html(data);
                }

                //$(this).parents('tr').remove();
            });

        });

        // Edit
        // Delete
        $('#nominee-info-tbl').on('click', 'a.nominee-edit-link', function(e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var retailAccount = $(control).attr('retailAccount');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'retailClient',action: 'editRetailNominee')}?id="+id+"&retailAccount="+retailAccount,
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }

                //$(this).parents('tr').remove();
            });

        });




    });
</script>
