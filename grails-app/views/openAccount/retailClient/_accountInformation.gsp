<script src="${resource(dir: 'js', file: 'jquery-1.10.2.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.validate.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.dataTables.js')}"></script>

<script src="${resource(dir: 'js', file: 'ace-extra.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.dataTables.bootstrap.js')}"></script>
<script src="${resource(dir: 'js', file: 'bootstrap-datepicker.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
<script src="${resource(dir: 'js', file: 'chosen.jquery.js')}"></script>
<script src="${resource(dir: 'js', file: 'additional-methods.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'ace-elements.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'spin.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'ace.js')}"></script>
<script src="${resource(dir: 'js', file: 'ace-elements.js')}"></script>

<g:form class="form-horizontal" method="post" name="retailAccountInformationForm" id="retailAccountInformationForm"
        role="form" url="[controller: 'retailClient', action: 'saveRetailAccount']" onsubmit="return false;">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <input type="hidden" name="id" class="retailAccount" value="${retailAccount?.id}">
            <input type="hidden" name="accountHolder" value="${accountHolder}"> %{--accountHolder--}%

            <div class="form-group ${hasErrors(bean: retailAccountCommand, field: 'title', 'has-error')}">
                <label for="title" class="control-label col-sm-3 col-md-3">
                    <g:message code="retailClient.accountInformation.title.label" default="Title of the Account"/><span class="red">*</span>
                </label>

                <div class="col-xs-6 col-sm-4 col-md-4">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 required" value="${retailAccount?.title}"
                           placeholder="Title of the Account" id="title" name="title">
                </div>
            </div>

            <div class="form-group ${hasErrors(bean: retailAccountCommand, field: 'openingDate', 'has-error')}">
                <label class="control-label col-md-3" for="openingDate">
                    <g:message code="retailClient.accountInformation.operingDate.label" default="Opening Date"/><span
                        class="red">*</span>
                </label>

                <div class="col-md-4 col-sm-4">
                    <div class="clearfix">
                        <div class="input-append date input-group" id="openingDate">
                            <input type="date" name="openingDate"
                                   value="${retailAccount?.openingDate?.format("dd/MM/yyyy")}"
                                   class="form-control datepicker" data-date-format="dd-mm-yyyy"/>
                            <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group ${hasErrors(bean: retailAccountCommand, field: 'accountPurpose', 'has-error')}">
                <label for="accountPurpose" class="control-label col-sm-3 col-md-3">
                    <g:message code="retailClient.accountInformation.accountPurpose.label" default="Account Purpose"/><span class="red">*</span>
                </label>

                <div class="col-sm-4 col-md-4">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 required"
                           value="${retailAccount?.accountPurpose}" placeholder="Account Purpose" id="accountPurpose"
                           name="accountPurpose">
                </div>
            </div>

            <div class="form-group">
                <div class="control-label col-sm-3 col-md-3">
                    <g:message code="retailClient.accountInformation.modeOfOperation.label"
                               default="Mode Of Operation"/>
                </div>

                <div class="control-label col-sm-4 col-md-4  align-left">
                    <g:message code="retailClient.accountInformation.anyofUs.label" default="Any of Us"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3 col-md-3">
                    <g:message code="retailClient.accountInformation.packageName.label" default="Package Name"/>
                </label>

                <div class="col-xs-6 col-sm-4 col-md-4">
                    %{--<select name="paymentMethod" id="paymentMethod" class="form-control">
                        <option value="">- Choose One -</option>
                        <option value="1">Package 1</option>
                        <option value="2">Package 2</option>
                        <option value="3">Package 3</option>
                    </select>--}%
                    Any of Us
                </div>
            </div>

            <div class="form-group ${hasErrors(bean: retailAccountCommand, field: 'termAndCondition', 'has-error')}">
                <label for="termAndCondition" class="control-label col-sm-3 col-md-3">
                    <g:message code="retailClient.accountInformation.acceptanceTermsAndConditions.label"
                               default="Acceptance Terms & Conditions"/><span class="red">*</span>
                </label>

                <div class="col-sm-4 col-md-4">
                    <input type="checkbox" ${retailAccount?.termAndCondition == 1 ? 'checked' : ''}
                           class="ace col-xs-12 col-sm-12 col-md-12 col-lg-12 required" value="1"
                           name="termAndCondition" id="termAndCondition"><span class="lbl"></span>
                </div>
            </div>
        </div><!-- /.col -->
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


<script type="text/javascript">
//    jQuery(function ($) {
$(document).ready(function () {

alert(1);

        //$(".chosen-select").chosen();

        /*$(document).ready(function () {
            var dateFormat = "${dateFormat}";
            var dateMask = "${dateMask}";
            $(".datepicker").inputmask(dateMask);

            *//*$("#openingDate").datepicker({
                format: "dd/mm/yyyy",
                gotoCurrent: true,
                autoclose: true
            });*//*
        });*/

        $('#retailAccountInformationForm').validate({

            errorElement: 'small',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                title: {
                    required: true
                },
                openingDate: {
                    required: true
                },
                accountPurpose: {
                    required: true
                },
                termAndCondition: {
                    required: true
                }
            },
            messages: {
                title: {
                    required: " "
                },
                openingDate: {
                    required: " "
                },
                accountPurpose: {
                    required: " "
                },
                termAndCondition: {
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
                if (element.is(':checkbox') || element.is(':radio')) {
                    var controls = element.closest('div[class*="col-"]');
                    if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                }
                else if (element.is('.select2')) {
                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                }
                else if (element.is('.chosen-select')) {
                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                }
                else error.insertAfter(element.parent());
            },
            submitHandler: function (form) {

                alert("YEs");

                $.ajax({
                    url: "${createLink(controller: 'retailClient', action: 'saveRetailAccount')}",
                    type: 'post',
                    dataType: 'json',
                    data: $("#retailAccountInformationForm").serialize(),
                    success: function (data) {
                        if(data.add){
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

                            $('#retailAccountInformationTab').removeClass("active");
                            $('#retailAccountInformation').removeClass("active");
                            $('#retailIntroducerInformationTab').addClass("active");
                            $('#retailIntroducerInformation').addClass("active");
                            $('button#accountInfoButton').html('<i class="icon-ok bigger-110"></i> Update');

                            $('.retailAccount').val(data.retailAccount.id);

                            $('#retail-client-list-tbl').DataTable().ajax.reload();


                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);

                        }
                        else if(data.update == "update"){
                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);
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
                })
            }
        });

    });
    </script>
