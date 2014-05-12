<html>
<head></head>
<body>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="widget-box">
            <div class="widget-header widget-header-blue widget-header-flat"><h5 class="lighter">Introducer Information</h5></div>
            <div class="widget-body">
                <div class="widget-main no-padding">
                    <form name="accountOpenForm" id="introducerInfoForm" class="form-horizontal">
                        <!-- <legend>Form</legend> -->

                        <fieldset>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group ${hasErrors(bean: commandObj, field: 'firstName', 'has-error')}">
                                <label class="col-sm-4 control-label no-padding-right" for="firstName">Name of Introducer</label>

                                <div class="col-sm-8 col-xs-8">
                                    <div class="clearfix">
                                        <input id="firstName" class="form-control" type="text" name="firstName" placeholder="Name of Introducer"
                                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name of Introducer'">
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="address">Address</label>

                                <div class="col-sm-8 col-xs-8">
                                    <div class="clearfix">
                                        <input id="address" class="form-control" type="text" name="address" placeholder="Address"
                                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'">
                                    </div>

                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="accNo">A/C No</label>

                                <div class="col-sm-8 col-xs-8">
                                    <div class="clearfix">
                                        <input id="accNo" class="form-control" type="text" name="accNo" placeholder="A/C No"
                                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Account No'">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="contactNo">Contact No</label>

                                <div class="col-sm-8 col-xs-8">
                                    <div class="clearfix">
                                        <input id="contactNo" class="form-control" type="text" name="contactNo" placeholder="Contact No"
                                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Contact No'">
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right" for="relAcNo">Relation of A/C Holder</label>
                                <div class="col-sm-8 col-xs-8">
                                    <div class="clearfix">
                                        <input id="relAcNo" class="form-control" type="text" name="relAcNo"
                                               placeholder="Relation Of A/C Holder" onfocus="this.placeholder = ''"
                                               onblur="this.placeholder = 'Relation Of A/C Holder'">
                                    </div>
                                </div>
                            </div>
                        </div>

                        </fieldset>

                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="submit">
                                    <i class="icon-ok bigger-110"></i>
                                    Submit
                                </button>
                                <button class="btn" type="reset">
                                    <i class="icon-undo bigger-110"></i>
                                    Reset
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#introducerInfoForm").submit(function (e) {
            if (!$("#introducerInfoForm").valid()) return false;

            $.ajax({
                type: "POST",
                dataType: "html",
                url: "${createLink(controller: "accountOpen",action: "introducerInfoSave")}",
                data: $(this).serialize(),
                success: function (data) {
                    $("#page-content").html(data);
                }
            });
            return false
            e.preventDefault();
        });

        /*Jquery validation accountOpen form(introducer information)*/
        $('#introducerInfoForm').validate({
            errorPlacement: function (error, element) {
            },
            focusInvalid: false,
            rules: {
                firstName: {
                    required: true
                },
                address: {
                    required: true
                },
                accNo: {
                    digits: true,
                    required: true

                },
                contactNo: {
                    digits: true,
                    required: true
                },
                relAcNo: {
                    digits: true,
                    required: true
                }
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('#introducerInfoForm')).show();
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
            }
        });

        jQuery.validator.messages.required = "";
    });
</script>

</body>
</html>