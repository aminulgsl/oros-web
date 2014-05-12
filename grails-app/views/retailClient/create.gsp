<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <style>
            .form-group, select, label, textarea, input[type="text"], input[type="password"],
            input[type="datetime"], input[type="datetime-local"], input[type="date"],
            input[type="month"], input[type="time"], input[type="week"], input[type="number"],
            input[type="email"], input[type="url"], input[type="search"], input[type="tel"],
            input[type="color"]{
                font-size: 12px;
            }
        </style>
        <title>OrosCapital - Retail Clients</title>

        <script type="text/javascript">

            $(document).ready(function () {
                var dateF = "${dateFormat}";
                var dateMask = "${dateMask}";
                $(".datepicker").inputmask(dateMask);

                $("#openingDate").datepicker({
                    format: dateF,
                    gotoCurrent: true,
                    autoclose: true
                });

                $("#dob").datepicker({
                    format: dateF,
                    gotoCurrent: true,
                    autoclose: true
                });
            });
        </script>

    </head>

<body>


    <div class="page-header">
        <h1>Retail Client</h1>
    </div><!-- /.page-header -->

    <div class="successMsg">
        <g:if test='${flash.message}'>
            <div class='alert alert-success '>
                <i class="icon-bell green"> <b> ${flash.message} </b> </i> <a class="close" data-dismiss="alert">×</a>
            </div>
        </g:if>
    </div>

    %{-- Retail Account --}%
    <g:hasErrors bean="${retailAccountCommand}">
        <div class='alert alert-danger'>
            <ul>
                <g:eachError var="err" bean="${retailAccountCommand}">
                    <li><g:message error="${err}" /></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    %{-- Retail Introducer --}%
    <g:hasErrors bean="${retailIntroducerCommand}">
        <div class='alert alert-danger'>
            <ul>
                <g:eachError var="err" bean="${retailIntroducerCommand}">
                    <li><g:message error="${err}" /></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    %{-- Retail OtherBank Account --}%
    <g:hasErrors bean="${retailOtherBankCommand}">
        <div class='alert alert-danger'>
            <ul>
                <g:eachError var="err" bean="${retailOtherBankCommand}">
                    <li><g:message error="${err}" /></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    %{-- Retail Nominee information --}%
    <g:hasErrors bean="${retailNomineeCommand}">
        <div class='alert alert-danger'>
            <ul>
                <g:eachError var="err" bean="${retailNomineeCommand}">
                    <li><g:message error="${err}" /></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <nav class="navbar navbar-default">
                <div class="collapse navbar-collapse" id="navbar-collapse-retailClient">
                    <ul id="retailClientListTab" class="nav navbar-nav padding-12 tab-color-blue background-blue">
                        <li id="retailAccountInformationTab" class="active"><a href="#retailAccountInformation" data-toggle="tab">A/C Information</a></li>
                        <li id="retailIntroducerInformationTab" class="disabled"><a>Introducer</a></li>
                        <li id="retailOtherBankAccountInformationTab" class="disabled"><a>Other Bank Account</a></li>
                        <li id="retailNomineeInfoTab" class="disabled"><a>Nominee</a></li>
                        <li id="retailAttachmentsTab" class="disabled"><a>Attachments</a></li>
                        <li id="retailDetailsInformationTab" class="disabled"><a>Details</a></li>
                    </ul>
                </div>
            </nav>

            <div class="tab-content">
                <div class="tab-pane active" id="retailAccountInformation"><g:render template='accountInformation'/></div>
                <div class="tab-pane" id="retailIntroducerInformation"><g:render template='introducerInformation'/></div>
                <div class="tab-pane" id="retailOtherBankAccountInformation"><g:render template='otherBankAccountInformation'/></div>
                <div class="tab-pane" id="retailNomineeInfo"><g:render template='nomineeInfo'/></div>
                <div class="tab-pane" id="retailAttachments"><g:render template='attachments'/></div>
                <div class="tab-pane" id="retailDetailsInformation"><g:render template='detailsInformation'/></div>
            </div>
        </div>
    </div>

<script type="text/javascript">

    if('${retailAccount}'){
        $('li#retailIntroducerInformationTab a').attr('href','#retailIntroducerInformation').attr('data-toggle','tab');
        $('li#retailOtherBankAccountInformationTab a').attr('href','#retailOtherBankAccountInformation').attr('data-toggle','tab');
        $('li#retailNomineeInfoTab a').attr('href','#retailNomineeInfo').attr('data-toggle','tab');
        $('li#retailAttachmentsTab a').attr('href','#retailAttachments').attr('data-toggle','tab');
        $('li#retailDetailsInformationTab a').attr('href','#retailDetailsInformation').attr('data-toggle','tab');
        $('ul#retailClientListTab li').removeClass('disabled');
    }




    if('${tabSelector}' == '1'){

    }
    else if('${tabSelector}' == '2'){
        $('#retailAccountInformationTab').removeClass( "active" );
        $('#retailAccountInformation').removeClass( "active" );
        $('#retailIntroducerInformationTab').addClass( "active");
        $('#retailIntroducerInformation').addClass( "active");
        $('button#accountInfoButton').html('<i class="icon-ok bigger-110"></i> Update');
    }
    else if('${tabSelector}' == '3'){
        $('#retailAccountInformationTab').removeClass( "active" );
        $('#retailAccountInformation').removeClass( "active" );
        $('#retailIntroducerInformationTab').removeClass( "active");
        $('#retailIntroducerInformation').removeClass( "active");
        $('#retailOtherBankAccountInformationTab').addClass("active");
        $('#retailOtherBankAccountInformation').addClass( "active");
        $('button#accountInfoButton').html('<i class="icon-ok bigger-110"></i> Update');
    }
    else if('${tabSelector}' == 4){
        $('#retailAccountInformationTab').removeClass( "active" );
        $('#retailAccountInformation').removeClass( "active" );
        $('#retailIntroducerInformationTab').removeClass( "active");
        $('#retailIntroducerInformation').removeClass( "active");
        $('#retailOtherBankAccountInformationTab').removeClass( "active" );
        $('#retailOtherBankAccountInformation').removeClass( "active");
        $('#retailNomineeInfoTab').addClass("active");
        $('#retailNomineeInfo').addClass( "active");
        $('button#accountInfoButton').html('<i class="icon-ok bigger-110"></i> Update');
    }
    else if('${tabSelector}' == 5){
        $('#retailAccountInformationTab').removeClass( "active" );
        $('#retailAccountInformation').removeClass( "active" );
        $('#retailIntroducerInformationTab').removeClass( "active");
        $('#retailIntroducerInformation').removeClass( "active");
        $('#retailOtherBankAccountInformationTab').removeClass( "active" );
        $('#retailOtherBankAccountInformation').removeClass( "active");
        $('#retailNomineeInfoTab').removeClass("active");
        $('#retailNomineeInfo').removeClass( "active");
        $('#retailAttachmentsTab').addClass( "active");
        $('#retailAttachments').addClass( "active");
        $('#retailDetailsInformation').removeClass( "active");
        $('#retailDetailsInformationTab').removeClass( "active");

        $('button#accountInfoButton').html('<i class="icon-ok bigger-110"></i> Update');
        $('button#nomineeInfoButton').html('<i class="icon-ok bigger-110"></i> Update');
    }
    else if('${tabSelector}' == 6){
        $('#retailAccountInformationTab').removeClass( "active" );
        $('#retailAccountInformation').removeClass( "active" );
        $('#retailIntroducerInformationTab').removeClass( "active");
        $('#retailIntroducerInformation').removeClass( "active");
        $('#retailOtherBankAccountInformationTab').removeClass( "active" );
        $('#retailOtherBankAccountInformation').removeClass( "active");
        $('#retailNomineeInfoTab').removeClass("active");
        $('#retailNomineeInfo').removeClass( "active");
        $('#retailAttachmentsTab').removeClass( "active");
        $('#retailAttachments').removeClass( "active");
        $('#retailDetailsInformation').addClass( "active");
        $('#retailDetailsInformationTab').addClass( "active");

        $('button#accountInfoButton').html('<i class="icon-ok bigger-110"></i> Update');
        $('button#nomineeInfoButton').html('<i class="icon-ok bigger-110"></i> Update');
    }


</script>


</body>
</html>