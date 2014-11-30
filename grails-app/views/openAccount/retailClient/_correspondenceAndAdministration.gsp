<%@ page import="com.gsl.oros.core.banking.settings.Country" %>

<input class="ace" type="checkbox" name="payType" id="same" value="1"/>
<span class="lbl"><g:message code="agent.thirdParty.label.checkbox1" default="Same As Personal Info"/></span>

<div class="space"></div>

<div id="thirdPartyContent">
    <g:form name="retailAdministrationForm" id="retailAdministrationForm" method="post" role="form"
            class="form-horizontal" url="[action: 'saveRetailAdministration', controller: 'retailClient']">
        <input type="hidden" class="retailAccount" name="retailAccount" value="${retailAccount?.id}">
        <input type="hidden" name="id" id="retailAdministrationId" value="${retailAdministration?.id}"/>

        <div class="row">
            <div class="col-md-12">

                <div class="col-md-6">

                    <div class="form-group">
                        <label for="name" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="agent.thirdParty.label.name" default="Contact Name"/>
                            <span class="red">*</span>
                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:textField name="name" id="a_name" placeholder="Contact Name"
                                         onfocus="this.placeholder = ''" onblur="this.placeholder = 'Contact Name'"
                                         class="form-control" value="${retailAdministration?.name}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="role" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="agent.thirdParty.label.role" default="Role"/>
                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:textField name="role" id="a_role" placeholder="Role" onfocus="this.placeholder = ''"
                                         onblur="this.placeholder = 'Role'" class="form-control"
                                         value="${retailAdministration?.role}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="default.address.label" default="Address"/>
                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:textArea name="address" id="a_address" placeholder="Address"
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'"
                                        class="form-control" value="${retailAdministration?.address}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="nationality" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="agent.thirdParty.label.nationality3" default="Nationality"/>
                            <span class="red">*</span>
                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:select id="a_nationality" name='nationality' class=" width-140 form-control"
                                      noSelection="${['': 'Select Country...']}"
                                      from='${Country.findAllByStatus(true)}'
                                      value="${retailAdministration?.nationality?.id}"
                                      optionKey="id" optionValue="name"/>
                            %{--${thirdParty?.nationality?.id}--}%
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firm" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="agent.thirdParty.label.firm" default="Name of Firm"/>

                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:textField name="firm" id="a_firm" placeholder="Name of Firm"
                                         onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name of Firm'"
                                         class="form-control" value="${retailAdministration?.firm}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="nationalID" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="agent.thirdParty.label.nationalID2" default="National ID"/>
                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:textField name="nationalID" id="a_nationalID" placeholder="National Identification No"
                                         onfocus="this.placeholder = ''"
                                         onblur="this.placeholder = 'National Identification No'" class="form-control"
                                         value="${retailAdministration?.nationalID}"/>
                        </div>
                    </div>

                </div>


                <div class="col-md-6">

                    <div class="form-group">
                        <label for="countryOfBirth" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="agent.thirdParty.label.countryofBirth2" default="Country of Birth"/>
                            <span class="red">*</span>
                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:select id="a_countryOfBirth" name='countryOfBirth' class=" width-140 form-control"
                                      noSelection="${['': 'Select Country...']}"
                                      from='${Country.list(sort: 'id')}'
                                      value="${retailAdministration?.countryOfBirth?.id}"
                                      optionKey="id" optionValue="name"/>
                            %{--${thirdParty?.countryOfBirth?.id}--}%
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="default.address.email" default="Email"/>

                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:textField name="email" id="a_email" placeholder="Email" class="form-control"
                                         onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'"
                                         value="${retailAdministration?.email}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="default.address.phone.label" default="Phone No"/>
                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:textField name="phone" id="a_phone" placeholder="Phone No"
                                         onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone No'"
                                         class="form-control" value="${retailAdministration?.phone}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="postCode" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="default.address.postCode.label" default=" Post Code"/>

                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:textField name="postCode" id="a_postCode" placeholder="Post Code"
                                         onfocus="this.placeholder = ''" onblur="this.placeholder = 'Post Code'"
                                         class="form-control" value="${retailAdministration?.postCode}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="residency" class="col-sm-5 col-xs-8 control-label">
                            <g:message code="agent.thirdParty.label.residency" default=" Residency for Tax Purposes"/>

                        </label>

                        <div class="col-sm-7 col-xs-10">
                            <g:textField name="residency" id="a_residency" placeholder="Residency for Tax Purposes"
                                         onfocus="this.placeholder = ''"
                                         onblur="this.placeholder = 'Residency for Tax Purposes'" class="form-control"
                                         value="${retailAdministration?.residency}"/>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <div class="modal-footer clearfix form-actions">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <span class="col-md-6"><button type="button" class="buttonClose btn-block actionButton" data-dismiss="modal">Close</button></span>
                <span class="col-md-6"><input type="submit" class="btn-block actionButton" id="countryAdd" value="Save"/></span>
            </div>
            <div class="col-md-4"></div>
        </div>



    </g:form>
</div>


<script type="text/javascript">
    $('#same').attr('checked', false).change(function () {
        if (this.checked) {
            var retailAccount = $('.retailAccount').val();
            $.ajax({
                url: "${createLink(controller: 'retailClient', action: 'fetchAccountHolderInfo')}?retailAccount=" + retailAccount,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if (data.isError == false) {
                        var fullname = (data.accountHolder.firstName)? data.accountHolder.firstName + " " : " ";
                        fullname += (data.accountHolder.middleName)? data.accountHolder.middleName + " " : " ";
                        fullname += (data.accountHolder.lastName) ? data.accountHolder.lastName : "";

                        $('#a_name').val(fullname);
                        $('#a_postCode').val('1');
                        $('#a_countryOfBirth').val(data.accountHolder.birthCountry.id);
                        $('#a_nationality').val(data.accountHolder.nationality.id);
                        $('#a_nationalID').val(data.accountHolder.nationalID);
                        $('#a_residency').val(data.retailAdditionalDetail.residencyTax);
                    } else {
                        alert("Have some problem!")
                    }
                }
            });
        } else {
            $('#a_name').val('');
            $('#a_address').val('');
            $('#a_postCode').val('');
            $('#a_email').val('');
            $('#a_phone').val('');
            $('#a_countryOfBirth').val('');
            $('#a_nationality').val('');
            $('#a_nationalID').val('');
            $('#a_residency').val('');
        }
    });


    $('#retailAdministrationForm').validate({

        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            name: {
                required: true
            },
            role: {
                required: false
            },
            address: {
                required: false
            },
            firm: {
                required: false
            },
            nationality: {
                required: true
            },
            nationalID: {
                required: false
            },
            countryOfBirth: {
                required: true
            },
            email: {
                required: false
            },
            phone: {
                required: false
            },
            postCode: {
                required: false
            },
            residency: {
                required: false
            }
        },
        messages: {
            name: {
                required: " "
            },
            role: {
                required: ""
            },
            address: {
                required: ""
            },
            firm: {
                required: ""
            },
            nationality: {
                required: " "
            },
            nationalID: {
                required: " "
            },
            countryOfBirth: {
                required: " "
            },
            email: {
                required: " "
            },
            phone: {
                required: " "
            },
            postCode: {
                required: " "
            },
            residency: {
                required: " "
            }
        },
        errorPlacement: function (error, element) {
            return true
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('.loginForm')).show();
        },
        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },
        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },
        submitHandler: function (form) {
            $.ajax({
                url: "${createLink(controller: 'retailClient', action: 'saveRetailAdministration')}",
                type: 'post',
                dataType: 'json',
                data: $("#retailAdministrationForm").serialize(),
                success: function (data) {
                    if (data.isError == false) {
                        if (data.add == true) {
                            $("input#retailAdministrationId").val("" + data.retailAdministration.id + "");
                            $('button#retailCnAButton').html('<span class="glyphicon glyphicon-check"></span> Update');
                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);
                        }
                        else if (data.update == true) {
                            $("input#retailAdministrationId").val("" + data.retailAdministration.id + "");
                            $('button#retailCnAButton').html('<span class="glyphicon glyphicon-check"></span> Update');
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

</script>

