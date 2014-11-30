<!DOCTYPE html>
<html>
<head>
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

    <meta name="layout" content="oros"/>
    <title>Welcome to OrosCapital</title>
    %{--<script src="${resource(dir: 'js', file: 'jquery-1.10.2.min.js')}"></script>--}%
    %{--<script src="${resource(dir: 'js', file: 'jquery.validate.js')}"></script>--}%
</head>

<body>

<div class="page-header">
    <h1>
        ${accountType} Account Opening Form - ${productName}
    </h1>
</div><!-- /.page-header -->

<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <nav class="navbar navbar-default">
            <div class="collapse navbar-collapse" id="navbar-collapse-retailClient">
                <ul id="retailClientListTab" class="nav navbar-nav padding-12 tab-color-blue background-blue">
                    <li id="retailAccountInformationTab" class="active"><a href="#retailAccountInformation" data-toggle="tab"><g:message code="retailClient.create.label.acInformation" default="A/C Information"/></a></li>
                    <li id="retailIntroducerInformationTab" class="disabled"><a><g:message code="retailClient.create.label.introducer" default="Introducer"/></a></li>
                    <li id="retailOtherBankAccountInformationTab" class="disabled"><a><g:message code="retailClient.create.label.otherBankAccount" default="Other Bank Account"/></a></li>
                    <li id="retailNomineeInfoTab" class="disabled"><a><g:message code="retailClient.create.label.nominee" default="Nominee"/></a></li>
                    <li id="retailAdditionalDetailTab" class="disabled"><a><g:message code="retailClient.create.label.additionalDetails" default="Additional Details"/></a></li>
                    <li id="retailClientHelpTab" class="disabled"><a><g:message code="retailClient.create.label.clientHelp" default="Client Help"/></a></li>
                    <li id="retailCorrespondenceAndAdministrationTab" class="disabled"><a><g:message code="retailClient.create.label.administration" default="Administration"/></a></li>
                    <li id="retailAttachmentTab" class="disabled"><a><g:message code="retailClient.create.label.attachment" default="Attachment"/></a></li>
                    <li id="retailSignaturesTab" class="disabled"><a><g:message code="retailClient.create.label.signature" default="Signature"/></a></li>
                    <li id="retailDetailsInformationTab" class="disabled"><a><g:message code="retailClient.create.label.details" default="Details"/></a></li>
                </ul>
            </div>
        </nav>

        <div class="tab-content">
            <div class="tab-pane active" id="retailAccountInformation"><g:render template='retailClient/accountInformation'/></div>

            <div class="tab-pane" id="retailIntroducerInformation"><g:render template='retailClient/introducerInformation'/></div>

            <div class="tab-pane" id="retailOtherBankAccountInformation"><g:render
                    template='retailClient/otherBankAccountInformation'/></div>

            <div class="tab-pane" id="retailNomineeInfo"><g:render template='retailClient/nomineeInfo'/></div>

            <div class="tab-pane" id="retailAdditionalDetail"><g:render template='retailClient/additionalDetail'/></div>

            <div class="tab-pane" id="retailClientHelp"><g:render template='retailClient/clientHelp'/></div>

            <div class="tab-pane" id="retailCorrespondenceAndAdministration"><g:render
                    template='retailClient/correspondenceAndAdministration'/></div>

            <div class="tab-pane" id="retailAttachment"><g:render template='retailClient/attachment'/></div>

            <div class="tab-pane" id="retailSignatures"><g:render template='retailClient/signatures'/></div>

            <div class="tab-pane" id="retailDetailsInformation"><g:render template='retailClient/detailsInformation'/></div>
        </div>
    </div>

</body>
</html>

<r:script>
    $(document).ready(function () {


        if ('${retailAccount}') {
            $('li#retailIntroducerInformationTab a').attr('href', '#retailIntroducerInformation').attr('data-toggle', 'tab');
            $('li#retailOtherBankAccountInformationTab a').attr('href', '#retailOtherBankAccountInformation').attr('data-toggle', 'tab');
            $('li#retailNomineeInfoTab a').attr('href', '#retailNomineeInfo').attr('data-toggle', 'tab');

            $('li#retailAdditionalDetailTab a').attr('href', '#retailAdditionalDetail').attr('data-toggle', 'tab');
            $('li#retailClientHelpTab a').attr('href', '#retailClientHelp').attr('data-toggle', 'tab');
            $('li#retailCorrespondenceAndAdministrationTab a').attr('href', '#retailCorrespondenceAndAdministration').attr('data-toggle', 'tab');
            $('li#retailAttachmentTab a').attr('href', '#retailAttachment').attr('data-toggle', 'tab');

            $('li#retailSignaturesTab a').attr('href', '#retailSignatures').attr('data-toggle', 'tab');
            $('li#retailDetailsInformationTab a').attr('href', '#retailDetailsInformation').attr('data-toggle', 'tab');
            $('ul#retailClientListTab li').removeClass('disabled');
        }

        else if ('${tabSelector}' == '2') {
            $('#retailAccountInformationTab').removeClass("active");
            $('#retailAccountInformation').removeClass("active");
            $('#retailIntroducerInformationTab').addClass("active");
            $('#retailIntroducerInformation').addClass("active");
            $('button#accountInfoButton').html('<i class="icon-ok bigger-110"></i> Update');
        }

    });



</r:script>