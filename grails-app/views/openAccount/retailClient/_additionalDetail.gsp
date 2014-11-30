<body>

<g:form name="retailAdditionalDetailForm" id="retailAdditionalDetailForm" method="post" role="form"
        class="form-horizontal" url="[action: 'saveRetailAdditionalDetail', controller: 'retailClient']"
        onsubmit="return false;">
    <input type="hidden" id="retailAccount" name="retailAccount" class="retailAccount" value="${retailAccount?.id}">
    <input type="hidden" name="id" id="retailadditionalDetailId" value="${retailAdditionalDetail?.id}"/>

    <div class="row">
        <div class="col-md-6">

            <div class="form-group">
                <label for="residencyTax" class="col-sm-5 col-xs-8 control-label">
                    <g:message code="agent.additionalDetail.label.residencyTax"
                               default="Residency for Tax Purposes"/><span class="red">*</span>
                </label>

                <div class="col-sm-7 col-xs-10">
                    <g:textField name="residencyTax" id="residencyTax" placeholder="Residency for Tax Purposes"
                                 onfocus="this.placeholder = ''"
                                 onblur="this.placeholder = 'Residency for Tax Purposes'" class="form-control"
                                 value="${retailAdditionalDetail?.residencyTax}"/>
                </div>
            </div>

            <div class="form-group">
                <label for="domicile" class="col-sm-5 col-xs-8 control-label">
                    <g:message code="agent.additionalDetail.label.domicile" default="Domicile"/><span class="red">*</span>
                </label>

                <div class="col-sm-7 col-xs-10">
                    <g:textField name="domicile" id="domicile" placeholder="Domicile" onfocus="this.placeholder = ''"
                                 onblur="this.placeholder = 'Domicile'" class="form-control"
                                 value="${retailAdditionalDetail?.domicile}"/>
                </div>
            </div>

            <div class="form-group">
                <label for="incomeTax" class="col-sm-5 col-xs-8 control-label">
                    <g:message code="agent.additionalDetail.label.incomeTax" default="Income Tax Rate"/><span class="red">*</span>
                </label>

                <div class="col-sm-7 col-xs-10">
                    <g:textField name="incomeTax" id="incomeTax" class="form-control" placeholder="Income Tax Rate"
                                 onfocus="this.placeholder = ''" onblur="this.placeholder = 'Income Tax Rate'"
                                 value="${retailAdditionalDetail?.incomeTax}"/>
                </div>
            </div>

            <div class="form-group">
                <label for="insurenceNo" class="col-sm-5 col-xs-8 control-label">
                    <g:message code="agent.additionalDetail.label.insurenceNo" default="National Insurance Number"/><span class="red">*</span>
                </label>

                <div class="col-sm-7 col-xs-10">
                    <g:textField name="insurenceNo" id="insurenceNo" placeholder="National Insurance Number"
                                 onfocus="this.placeholder = ''" onblur="this.placeholder = 'National Insurance Number'"
                                 class="form-control" value="${retailAdditionalDetail?.insurenceNo}"/>
                </div>
            </div>

            <div class="form-group">
                <label for="taxReference" class="col-sm-5 col-xs-8 control-label">
                    <g:message code="agent.additionalDetail.label.taxReference" default="Tax Reference"/><span class="red">*</span>
                </label>

                <div class="col-sm-7 col-xs-10">
                    <g:textField name="taxReference" id="taxReference" placeholder="Tax Reference"
                                 onfocus="this.placeholder = ''" onblur="this.placeholder = 'Tax Reference'"
                                 class="form-control" value="${retailAdditionalDetail?.taxReference}"/>
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

    $('#retailAdditionalDetailForm').validate({

        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            residencyTax: {
                required: true
            },
            domicile: {
                required: true
            },
            incomeTax: {
                required: true
            },
            insurenceNo: {
                required: true
            },
            taxReference: {
                required: true
            }

        },
        messages: {
            residencyTax: {
                required: " "
            },
            domicile: {
                required: " "
            },
            incomeTax: {
                required: " "
            },
            insurenceNo: {
                required: " "
            },
            taxReference: {
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
                url: "${createLink(controller: 'retailClient', action: 'saveRetailAdditionalDetail')}",
                type: 'post',
                dataType: 'json',
                data: $("#retailAdditionalDetailForm").serialize(),
                success: function (data) {
                    if (data.isError == false) {
                        if (data.add == true) {
                            $("input#retailadditionalDetailId").val("" + data.retailAdditionalDetail.id + "");
                            $("input#residencyTax").val("" + data.retailAdditionalDetail.residencyTax + "");
                            $("input#domicile").val("" + data.retailAdditionalDetail.domicile + "");
                            $("input#incomeTax").val("" + data.retailAdditionalDetail.incomeTax + "");
                            $("input#insurenceNo").val("" + data.retailAdditionalDetail.insurenceNo + "");
                            $("input#taxReference").val("" + data.retailAdditionalDetail.taxReference + "");
                            $('button#additionalDetailButton').html('<span class="glyphicon glyphicon-check"></span> Update');
                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);
                        }
                        else if (data.update == true) {
                            $("input#retailadditionalDetailId").val("" + data.retailAdditionalDetail.id + "");
                            $('button#additionalDetailButton').html('<span class="glyphicon glyphicon-check"></span> Update');
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