<head></head>

<body>
<g:form name="retailHelpingClientForm" id="retailHelpingClientForm" method="post" role="form" class="form-horizontal"
        url="[action: 'saveRetailClientHelp', controller: 'retailClient']">
    <input type="hidden" id="retailAccount" name="retailAccount" class="retailAccount" value="${retailAccount?.id}">
    <input type="hidden" name="id" id="retailClientHelpId" value="${retailClientHelp?.id}"/>

    <div class="row">
        <div class="col-md-10">

            <div class="form-group">
                <label for="gross" class="col-sm-5 col-xs-8 control-label">
                    <g:message code="agent.helpingClient.label.gross" default="Gross amount per year"/><span class="red">*</span>
                </label>

                <div class="col-md-2">
                    <g:textField name="gross" id="gross" class="form-control" placeholder="Gross amount per year"
                                 onfocus="this.placeholder = ''" onblur="this.placeholder = 'Gross amount per year'"
                                 value="${retailClientHelp?.gross}"/>
                </div>
            </div>


            <div class="form-group">
                <label class=" control-label col-sm-5 col-xs-8" name="investment">
                    <g:message code="agent.helpingClient.label.investment" default="Investment Time horizon "/>
                </label>

                <div class="input-group">
                    <label for="horizon1">
                        <input type="radio" name="timeHorizon"
                               value="1" ${retailClientHelp?.timeHorizon ? 'checked' : ''} id="horizon1">
                        <g:message code="agent.helpingClient.label.investment.horizon1" default="1-3 years"/>
                    </label>

                    <label for="horizon2">
                        <input type="radio" name="timeHorizon"
                               value="2" ${retailClientHelp?.timeHorizon ? 'checked' : ''} id="horizon2">
                        <g:message code="agent.helpingClient.label.investment.horizon2" default="3-5 years"/>
                    </label>

                    <label for="horizon3">
                        <input type="radio" name="timeHorizon"
                               value="3" ${retailClientHelp?.timeHorizon ? 'checked' : ''} id="horizon3">
                        <g:message code="agent.helpingClient.label.investment.horizon3" default="5-10 years"/>
                    </label>

                    <label for="horizon4">
                        <input type="radio" name="timeHorizon"
                               value="4" ${retailClientHelp?.timeHorizon ? 'checked' : ''} id="horizon4">
                        <g:message code="agent.helpingClient.label.investment.horizon4" default="10+ years"/>
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-5 col-xs-8 control-label">
                    <g:message code="agent.helpingClient.label.risk"
                               default="Investment Objectives & Risk Classification"/>
                </label>

                <div class="input-group">
                    <label for="risk1">
                        <input type="radio" name="risk" value="1" ${retailClientHelp?.risk ? 'checked' : ''} id="risk1">
                        <span class="lbl"><g:message code="agent.helpingClient.label.risk.risk1"
                                                     default="Income Return"/></span>
                    </label>

                    <label for="risk2">
                        <input type="radio" name="risk" value="2" ${retailClientHelp?.risk ? 'checked' : ''} id="risk2">
                        <span class="lbl"><g:message code="agent.helpingClient.label.risk.risk2"
                                                     default="Aggressive Total Return"/></span>
                    </label>

                    <label for="risk3">
                        <input type="radio" name="risk" value="3" ${retailClientHelp?.risk ? 'checked' : ''} id="risk3">
                        <span class="lbl"><g:message code="agent.helpingClient.label.risk.risk3"
                                                     default="Income and Growth Return"/></span>
                    </label>
                </div>
            </div>


            <div class="form-group">
                <label for="benchmark" class="col-sm-5 col-xs-8 control-label">
                    <g:message code="agent.helpingClient.label.benchmark" default="Benchmark"/><span class="red">*</span>
                </label>

                <div class="col-md-2">
                    <g:textField name="benchmark" id="benchmark" class="form-control" placeholder="Benchmark"
                                 onfocus="this.placeholder = ''" onblur="this.placeholder = 'Benchmark'"
                                 value="${retailClientHelp?.benchmark}"/>
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

<script type="text/javascript">
    $('#retailHelpingClientForm').validate({

        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            gross: {
                required: true
            },
            benchmark: {
                required: true
            }
        },
        messages: {
            gross: {
                required: " "
            },
            benchmark: {
                required: " "
            }
        },
        errorPlacement: function (error, element) {
            return true
        },
        invalidHandler: function (event, validator) {
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
                url: "${createLink(controller: 'retailClient', action: 'saveRetailClientHelp')}",
                type: 'post',
                dataType: 'json',
                data: $("#retailHelpingClientForm").serialize(),
                success: function (data) {
                    if (data.isError == false) {
                        if (data.add == true) {
                            $("input#retailClientHelpId").val("" + data.retailClientHelp.id + "");
                            $('button#clientHelpButton').html('<span class="glyphicon glyphicon-check"></span> Update');
                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);
                        }
                        else if (data.update == true) {
                            $("input#retailClientHelpId").val("" + data.retailClientHelp.id + "");
                            $('button#clientHelpButton').html('<span class="glyphicon glyphicon-check"></span> Update');
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
</body>