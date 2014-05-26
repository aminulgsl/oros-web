<%@ page import="com.gsl.cbs.contraints.enums.MaritialStatus; com.gsl.cbs.contraints.enums.GenderType" %>
<html>
<head>
    <script src="${resource(dir: 'js', file: 'jquery-1.10.2.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'jquery.validate.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'jquery.dataTables.js')}"></script>
    <style>
    select, label, textarea, input[type="text"], input[type="password"],
    input[type="datetime"], input[type="datetime-local"], input[type="date"],
    input[type="month"], input[type="time"], input[type="week"], input[type="number"],
    input[type="email"], input[type="url"], input[type="search"], input[type="tel"],
    input[type="color"]{
        font-size: 12px;
    }

    div.form-group{
        margin-bottom: 10px !important;
        vertical-align: top;
    }
    .form-inline .form-group{
        vertical-align: top;
    }
    textarea{
        resize: none;
    }
    label{
        width:155px;
        padding-right:10px;
    }
    input,select,textarea{
        width: 175px;
        margin-right:20px;
    }
    .form-group.has-error label{
        border-color: #F09784;
        box-shadow: none;
        color: #D68273;
    }
    </style>
</head>
<body>
<g:hasErrors bean="${personalInfo}">
    <div class='alert alert-success '>
        <ul>
            <g:eachError var="err" bean="${personalInfo}">
                <li><g:message error="${err}" /></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>

<g:form name="personalForm" id="personalForm" method="post" role="form" class="form-inline"
        url="[action: 'savePersonalInfo', controller: 'savingsAccount']" onSubmit="return false;">

    <g:hiddenField name="id" id="id" value="${personalInfo?.id}"/>

    <div class="form-group ${hasErrors(bean:personalInfo,field:'name','has-error')}">
        <label for="name">Name*</label>
        <input id="name" name="name" type="text" placeholder="Enter Your Name"
               value="<sec:loggedInUserInfo field="username"/>" disabled>
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'fatherName','has-error')}">
        <label for="fatherName">Father's Name*</label>
        <input id="fatherName" name="fatherName" type="text" placeholder="Enter Father's Name"
               value="${personalInfo?.fatherName}">
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'motherName','has-error')}">
        <label for="motherName">Mother's Name*</label>
        <input id="motherName" name="motherName" type="text" placeholder="Enter Mother's Name"
               value="${personalInfo?.motherName}">
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'gender','has-error')}">
        <label for="gender">Gender*</label>
        <g:select name="gender" id="gender"
                  noSelection="['': 'Choose Gender']"
                  from="${GenderType.values()}"
                  value="${personalInfo?.gender}"
                  optionKey="value" optionValue="value"/>
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'maritalStatus','has-error')}">
        <label for="maritalStatus">Marital Status*</label>
        <g:select name="maritalStatus" id="maritalStatus"
                  noSelection="['': 'Choose Status']"
                  from="${MaritialStatus.values()}"
                  value="${personalInfo?.maritalStatus}"
                  optionKey="value" optionValue="value"/>
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'presentAddress','has-error')}">
        <label for="presentAddress">Present Address*</label>
        <g:textArea name="presentAddress" id="presentAddress" placeholder="Enter Present Address" value="${personalInfo?.presentAddress}" />
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'permanentAddress','has-error')}">
        <label for="permanentAddress">Permanent Address*</label>
        <g:textArea name="permanentAddress" id="permanentAddress" placeholder="Enter Permanent Address" value="${personalInfo?.permanentAddress}" />
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'nationality','has-error')}">
        <label for="nationality">Nationality*</label>
        <input id="nationality" name="nationality" type="text" placeholder="Enter Nationality"
               value="${personalInfo?.nationality}">
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'nationalId','has-error')}">
        <label for="nationalId">National ID*</label>
        <input id="nationalId" name="nationalId" type="text" placeholder="Enter National ID"
               value="${personalInfo?.nationalId}">
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'email','has-error')}">
        <label for="email">Email*</label>
        <input id="email" name="email" type="email" placeholder="Enter Email Address"
               value="${personalInfo?.email}">
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'phoneNo','has-error')}">
        <label for="phoneNo">Phone No.*</label>
        <input id="phoneNo" name="phoneNo" type="text" placeholder="Enter Phone No."
               value="${personalInfo?.phoneNo}">
    </div>
    <div class="form-group ${hasErrors(bean:personalInfo,field:'profession','has-error')}">
        <label for="profession">Profession</label>
        <input id="profession" name="profession" type="text" placeholder="Enter Profession"
               value="${personalInfo?.profession}">
    </div>
    <div class="clearfix form-actions align-right">
        <g:if test="${personalInfo?.id}">
            <button type="submit" id="personalSubmitButton" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Update</button>
        </g:if>
        <g:else>
            <button type="submit" id="personalSubmitButton" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Create</button>
        </g:else>
    </div>
</g:form>


<script type="text/javascript">
    jQuery(document).ready(function() {
        $('#personalForm').validate({
            errorPlacement: function (error, element) {
            },
            focusInvalid: false,
            rules: {
                fatherName: {
                    required: true
                },
                motherName: {
                    required: true
                },
                gender: {
                    required: true
                },
                maritalStatus: {
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
                    required: true
                },
                profession: {
                    required: false
                }
            } ,
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('#personalForm')).show();
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
                    url: "${createLink(controller: 'savingsAccount', action: 'savePersonalInfo')}",
                    type: 'post',
                    dataType: 'json',
                    data: $("#personalForm").serialize(),
                    success: function (data) {
                        if(data.isError == false){
                            if(data.add==true){
                                $('#personalForm #id').val(data.personalInfo.id);
                                $('#nomineeForm #personalId').val(data.personalInfo.id);
                                $('#bankAccountForm #personalId').val(data.personalInfo.id);
                                $('#personalSubmitButton').html('<i class="icon-ok bigger-110"></i>Update');
                                $('ul#savingsAccountFormListTab li').removeClass('disabled');
                                $('ul#savingsAccountFormListTab li a').attr('data-toggle','tab');
                                $('li#nomineeTab a').attr('href','#nomineeContent');
                                $('li#bankAccountTab a').attr('href','#bankAccountContent');
                                var success = '<div class="alert alert-success">';
                                success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                success += '</div>';
                                $('.successMsg').html(success);
                            }
                            else if(data.update == true){
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
        jQuery.validator.messages.required = "";
    });
</script>
</body>
</html>