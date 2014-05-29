<%--
  Created by IntelliJ IDEA.
  User: Nusrat Jahan Bhuiyan
  Date: 5/20/14
  Time: 3:18 PM
--%>

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
</head>

<body>

<div class="page-header">
    <h1>
        Savings Account Opening Form
    </h1>
</div><!-- /.page-header -->

<div class="successMsg">
    <g:if test='${flash.message}'>
        <div class='alert alert-success '>
            <i class="icon-bell green"> <b> ${flash.message} </b> </i> <a class="close" data-dismiss="alert">×</a>
        </div>
    </g:if>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

        <nav id="savingsNav" class="navbar navbar-default">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-1">
                <ul id="savingsAccountFormListTab" class="nav navbar-nav padding-12 tab-color-blue background-blue">
                    <li id="personalTab" class="active"><a href="#personalContent" data-toggle="tab">Personal Info</a></li>
                    %{--<li id="nomineeTab"><a href="#nomineeContent" data-toggle="tab">Nominee Info</a></li>--}%
                    %{--<li id="bankAccountTab"><a href="#bankAccountContent" data-toggle="tab">Other Bank Account Info</a></li>--}%
                    %{--<li id="attachmentsTab"><a href="#attachmentContent" data-toggle="tab">Attachments</a></li>--}%
                    <li id="nomineeTab" class="disabled"><a>Nominee Info</a></li>
                    <li id="bankAccountTab" class="disabled"><a>Other Bank Account Info</a></li>
                    <li id="attachmentsTab" class="disabled"><a>Attachments</a></li>
                </ul>
            </div>
        </nav>

        <div class="tab-content">
            <div class="tab-pane active" id="personalContent">
                <g:render template='personal'/>
            </div>
            <div class="tab-pane" id="nomineeContent">
                <g:render template='nominee'/>
            </div>
            <div class="tab-pane" id="bankAccountContent">
                <g:render template='bankAccounts'/>
            </div>
            <div class="tab-pane" id="attachmentContent">
                <g:render template='attachments'/>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<r:script>
    $(document).ready(function () {
        if('${personalInfo?.id}'){
            $('ul#savingsAccountFormListTab li').removeClass('disabled');
            $('li#nomineeTab a').attr('href','#nomineeContent');
            $('li#bankAccountTab a').attr('href','#bankAccountContent');
            $('li#attachmentsTab a').attr('href','#attachmentContent');
            $('ul#savingsAccountFormListTab li a').attr('data-toggle','tab');
        }
    });
</r:script>