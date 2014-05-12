<%@ page import="com.gsl.oros.core.banking.settings.Country" %>
<html>
<head>
    <style>
    .form-control, label, textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"]{font-size: 12px;}
    label{max-width: 150px;}
    </style>
    <title></title>
</head>
<body>




<g:form name="AccountHolderSpouseInfoForm" id="AccountHolderSpouseInfoForm" method="post" role="form" class="form-horizontal" url="[action: 'saveSpouseInfo', controller: 'accountHolderInfo']">



<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12">
<div class="col-xs-6 col-sm-6 col-md-6">
    <g:hiddenField name="id" id="accHolderId" value="${accountHolder?.id}"/>
    <g:hiddenField name="spouseId" id="spouseId"/>

    <div class="form-group">
        <label for="name" class="col-sm-4 col-xs-6 control-label no-padding-right">
            <g:message code="coreBanking.clients.accountHolder.familyInfo.name" default="Name"/><span class="red">*</span>
        </label>
        <div class="col-sm-8 col-xs-12">
            <div class="clearfix">
                <input type="text" class="col-sm-11 col-xs-12" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" id="name"
                       name="name" value="${spouseInfo?.name}"/>
            </div>
        </div>
    </div>



    <div class="form-group ">
        <label for="email" class="col-sm-4 col-xs-6 control-label no-padding-right">
            <g:message code="coreBanking.accounting.vendor.basicInfo.email" default="Email"/>
        </label>
        <div class="col-sm-8 col-xs-12">
            <div class="clearfix">
                <input type="email" class="col-sm-11 col-xs-12" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'" id="email"
                       name="email" value="${spouseInfo?.email}"/>
            </div>
        </div>
    </div>



    <div class="form-group ">
        <label for="birthCountryOfSpouse" class="col-sm-4 col-xs-6 control-label no-padding-right">
            <g:message code="coreBanking.clients.accountHolder.basicInfo.birthCountry" default="Country of Birth"/><span class="red">*</span>
        </label>
        <div class="col-sm-8 col-xs-12">
            <div class="clearfix">
                <g:select id="birthCountryOfSpouse" name='birthCountry' class="col-sm-11 col-xs-12"
                          noSelection="${['': 'Select Country...']}"
                          from='${Country.findAllByStatus(true)}' value="${spouseInfo?.birthCountry?.id}"
                          optionKey="id" optionValue="name">
                </g:select>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label for="nationalId" class="col-sm-4 col-xs-6 control-label no-padding-right">
            <g:message code="coreBanking.clients.accountHolder.basicInfo.nationalID" default="National ID"/>
        </label>
        <div class="col-sm-8 col-xs-12">
            <div class="clearfix">
                <input type="text" class="col-sm-11 col-xs-12" placeholder="National Identification No" onfocus="this.placeholder = ''" onblur="this.placeholder = 'National Identification No'" id="nationalId"
                       name="nationalId" value="${spouseInfo?.nationalId}">
            </div>
        </div>
    </div>

</div>

<div class="col-xs-6 col-sm-6 col-md-6">

    <div class="form-group ">
        <label for="spouseGender"
               class="col-sm-4 col-xs-6 control-label no-padding-right">
            <g:message code="coreBanking.accounting.vendor.basicInfo.gender" default="Gender"/>
        </label>
        <div class="col-sm-8 col-xs-12">
            <div class="clearfix">
                <select id="spouseGender" class="col-sm-11 col-xs-12" name="gender">
                    <g:if test="${spouseInfo?.gender != null}">
                        <g:if test="${spouseInfo?.gender == "Male"}">
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
        <label for="spousePhoneNo" class="col-sm-4 col-xs-6 control-label no-padding-right">
            <g:message code="default.address.phone.label" default="Phone No"/>
        </label>
        <div class="col-sm-8 col-xs-12">
            <div class="clearfix">
                <input type="tel" class="col-sm-11 col-xs-12" placeholder="Phone No" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone No'" id="spousePhoneNo"
                       name="phoneNo" value="${spouseInfo?.phoneNo}"/>
            </div>
        </div>
    </div>

    <div class="form-group ">
        <label for="nationality" class="col-sm-4 col-xs-6 control-label no-padding-right">
            <g:message code="coreBanking.clients.accountHolder.basicInfo.firstNationality" default="First Nationality"/><span class="red">*</span>
        </label>
        <div class="col-sm-8 col-xs-12">
            <div class="clearfix">
                <g:select id="nationality" name='nationality' class="col-sm-11 col-xs-12"
                          noSelection="${['': 'Select Country...']}"
                          from='${Country.findAllByStatus(true)}' value="${spouseInfo?.nationality?.id}"
                          optionKey="id" optionValue="name">
                </g:select>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label for="relation" class="col-sm-4 col-xs-6 control-label no-padding-right">
            <g:message code="coreBanking.clients.accountHolder.familyInfo.relation" default="Relation"/><span class="red">*</span>
        </label>
        <div class="col-sm-8 col-xs-12">
            <div class="clearfix">
                <input type="text" class="col-sm-11 col-xs-12" placeholder="Relation with Account Holder" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Relation with Account Holder'" id="relation"
                       name="relation" value="${spouseInfo?.relation}">
            </div>
        </div>
    </div>

    <div class="form-group">
        <label for="addFamilyMember" class="col-sm-4 col-xs-6 control-label no-padding-right"></label>
        <div class="col-sm-8 col-xs-12">
            <div class="clearfix">
                <g:if test="${accountHolder?.spouse}">
                    <button class="btn btn-primary btn-sm" type="submit" name="addFamilyMember" id="addFamilyMember">Add another Member</button>
                </g:if>
                <g:else>
                    <button class="btn btn-primary btn-sm" type="submit" name="addFamilyMember" id="addFamilyMember">Add Family Member</button>
                </g:else>

            </div>
        </div>
    </div>

</div>
</div><!-- /.col -->
</div><!-- /.row -->



</g:form>
<div class= "row" id="familyInfoList">
    <g:render template="familyInfoList"/>
</div>

%{--</div>--}%

<script type="text/javascript">
    $(".chosen-select").chosen();

    jQuery(function ($) {
        $('#AccountHolderSpouseInfoForm').validate({

            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                name: {
                    required: true
                },
                birthCountry: {
                    required: true
                },
                nationality: {
                    required: true
                },
                relation: {
                    required: true
                }

            } ,
            messages: {
                name: {
                    required: " "
                },
                birthCountry: {
                    required: " "
                },
                nationality: {
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
                if(element.is(':checkbox') || element.is(':radio')) {
                    var controls = element.closest('div[class*="col-"]');
                    if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                }
                else if(element.is('.select2')) {
                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                }
                else if(element.is('.chosen-select')) {
                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                }
                else error.insertAfter(element.parent());
            },
            submitHandler: function (form) {
                $.ajax({
                    url:"${createLink(controller: 'accountHolderInfo', action: 'saveSpouseInfo')}",
                    type:'post',
                    data: $("#AccountHolderSpouseInfoForm").serialize(),
                    success:function(data){
                        var accholderid='${accountHolder?.id}';
                        clearForm('#AccountHolderSpouseInfoForm');
                        $('#accHolderId').val(accholderid);
                        $('#familyInfoList').html(data);
                        $('#addFamilyMember').html('Add another Member')
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