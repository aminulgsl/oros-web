<%@ page import="com.gsl.oros.core.banking.settings.Country" %>
<html>
<head></head>
<body>
<g:form name="AccountHolderPersonalInfoForm" id="AccountHolderPersonalInfoForm" method="post" role="form" class="form-horizontal" url="[action: 'savePersonalInfo', controller: 'accountHolderInfo']">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <div class="col-xs-6 col-sm-6 col-md-6">
                <g:hiddenField name="id" value="${accountHolder?.id}"/>
                <div class="form-group">
                    <label for="firstName" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.basicInfo.firstName" default="First Name"/><span class="red">*</span>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="First Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" id="firstName" name="firstName" value="${accountHolder?.firstName}">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastName" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.basicInfo.lastName" default="Last Name"/><span class="red">*</span>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Last Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name'" id="lastName"
                                   name="lastName" value="${accountHolder?.lastName}" >
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="motherName" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.clients.accountHolder.basicInfo.motherName" default="Mother's Name"/>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Mother's Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Mother Name'" id="motherName"
                                   name="motherName" value="${accountHolder?.motherName}">
                        </div>
                    </div>
                </div>

                %{--<div class="form-group">--}%
                %{--<label class="col-sm-5 col-xs-6 control-label">Date of Birth<span class="red">*</span></label>--}%
                %{--<div class='input-group input-group-sm'>--}%
                %{--<input id="dateOfBirth" name="dateOfBirth" type="date"data-date-format="dd/mm/yy" class="date-picker form-control input-mask-date"/>--}%
                %{--<label for="dateOfBirth" class="input-group-addon">--}%
                %{--<i class="glyphicon glyphicon-calendar"></i>--}%
                %{--</label>--}%
                %{--</div>--}%
                %{--</div>--}%




                <div class="form-group">
                    <label for="profession" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.clients.accountHolder.basicInfo.profession" default="Profession"/>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Profession" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Profession'" id="profession"
                                   name="profession" value="${accountHolder?.profession}">
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="nationality1" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.clients.accountHolder.basicInfo.firstNationality" default="First Nationality"/><span class="red">*</span>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <g:select id="nationality1" name='nationality1' class="col-sm-11 col-xs-12"
                                      noSelection="${['': 'Select Country...']}"
                                      from='${Country.findAllByStatus(true)}' value="${accountHolder?.nationality1?.id}"
                                      optionKey="id" optionValue="name">
                            </g:select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="nationalID" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.clients.accountHolder.basicInfo.nationalID" default="National ID"/>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="National Identification No" onfocus="this.placeholder = ''" onblur="this.placeholder = 'National Identification No'" id="nationalID"
                                   name="nationalID" value="${accountHolder?.nationalID}">
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-xs-6 col-sm-6 col-md-6">

                <div class="form-group">
                    <label for="middleName" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.basicInfo.middleName" default="Middle Name"/>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Middle Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Middle Name'" id="middleName"
                                   name="middleName" value="${accountHolder?.middleName}" >
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="fatherName" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.clients.accountHolder.basicInfo.fatherName" default="Father's Name"/>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Father Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Father Name'" id="fatherName"
                                   name="fatherName" value="${accountHolder?.fatherName}">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="gender"
                           class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.basicInfo.gender" default="Gender"/>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <select id="gender" class="col-sm-11 col-xs-12" name="gender">
                                <g:if test="${accountHolder?.gender != null}">
                                    <g:if test="${accountHolder?.gender == "Male"}">
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </g:if>
                                    <g:else>
                                        <option value="Female">Female</option>
                                        <option value="Male">Male</option>
                                    </g:else>
                                </g:if>
                                <g:else>
                                    <option value="">-Select-</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </g:else>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="birthCountry" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.clients.accountHolder.basicInfo.birthCountry" default="Country of Birth"/><span class="red">*</span>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <g:select id="birthCountry" name='birthCountry' class="col-sm-11 col-xs-12"
                                      noSelection="${['': 'Select Country...']}"
                                      from='${Country.findAllByStatus(true)}' value="${accountHolder?.birthCountry?.id}"
                                      optionKey="id" optionValue="name">
                            </g:select>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="nationality2" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.clients.accountHolder.basicInfo.secondNationality" default="Second Nationality"/>
                    </label>
                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <g:select id="nationality2" name='nationality2' class="col-sm-11 col-xs-12"
                                      noSelection="${['': 'Select Country...']}"
                                      from='${Country.findAllByStatus(true)}'  value="${accountHolder?.nationality2?.id}"
                                      optionKey="id" optionValue="name">
                            </g:select>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <div class="clearfix form-actions">
        <div class="col-md-offset-10 col-md-2">
            <g:if test='${accountHolder?.id!=null}'>
                <button class="btn btn-primary btn-sm" type="submit" name="updateAccountHolderPersonalInfo" id="updateAccountHolderPersonalInfo">Update</button>
            </g:if>
            <g:else>
                <button class="btn btn-primary btn-sm" type="submit" name="saveAccountHolderPersonalInfo" id="saveAccountHolderPersonalInfo">Save</button>
            </g:else>
            %{--<button class="btn btn-primary btn-sm" type="submit" name="saveAccountHolderPersonalInfo" id="saveAccountHolderPersonalInfo">Save</button>--}%

        </div>
    </div>
</g:form>
<script type="text/javascript">

    jQuery(function ($) {
//        $("#nationality2_chosen").css( "color", "red");
        $('#AccountHolderPersonalInfoForm').validate({

            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                firstName: {
                    required: true
                },
                lastName: {
                    required: true
                },
                nationality1: {
                    required: true
                },
                birthCountry: {
                    required: true

                }
            } ,

            messages: {
                firstName: {
                    required: " "
                },
                lastName: {
                    required: " "
                },
                nationality1: {
                    required: " "
                } ,
                birthCountry: {
                    required: " "

                }
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
                    url:"${createLink(controller: 'accountHolderInfo', action: 'savePersonalInfo')}",
                    type:'post',
                    data: $("#AccountHolderPersonalInfoForm").serialize(),
                    success:function(data){
                        $('#page-content').html(data);
                    },
                    failure:function(data){
                    }
                })

            }

        });
    });
</script>
</body>
</html>
