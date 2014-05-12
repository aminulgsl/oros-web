<g:form class="form-horizontal" method="post" name="retailAccountInformationForm" id="retailAccountInformationForm" role="form" url="[controller: 'retailClient',action: 'saveRetailAccount']" onsubmit="return false;">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


            <input type="hidden" name="id" value="${retailAccount?.id}">
            <input type="hidden" name="createAccountInfoId" value="111">

            <div class="form-group ${hasErrors(bean: retailAccountCommand, field: 'title', 'has-error')}">
                <label for="title" class="control-label col-sm-3 col-md-3">Title of the Account</label>
                <div class="col-xs-6 col-sm-4 col-md-4">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 required" value="${retailAccount?.title}" placeholder="Title of the Account" id="title" name="title">
                </div>
            </div>

            <div class="form-group ${hasErrors(bean: retailAccountCommand, field: 'openingDate', 'has-error')}">
                <label class="control-label col-md-3 no-padding-right" for="openingDate">Opening Date<span class="red">*</span></label>

                <div class="col-md-4 col-sm-4">
                    <div class="clearfix">
                        <div class="input-append date input-group" id="openingDate">
                            <input type="date" name="openingDate" value="${retailAccount?.openingDate?.format("dd/MM/yyyy")}" class="form-control datepicker" data-date-format="dd-mm-yyyy"/>
                            <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group ${hasErrors(bean: retailAccountCommand, field: 'accountPurpose', 'has-error')}">
                <label for="accountPurpose" class="control-label col-sm-3 col-md-3">Account Purpose</label>
                <div class="col-sm-4 col-md-4">
                    <input type="text" class="col-xs-12 col-sm-12 col-md-12 required" value="${retailAccount?.accountPurpose}" placeholder="Account Purpose" id="accountPurpose" name="accountPurpose">
                </div>
            </div>

            <div class="form-group">
                <div class="control-label col-sm-3 col-md-3">Mode Of Operation</div>
                <div class="control-label col-sm-4 col-md-4  align-left">
                    Any of Us
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3 col-md-3">Package Name</label>
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
                <label for="termAndCondition" class="control-label col-sm-3 col-md-3">Acceptance Terms & Conditions</label>
                <div class="col-sm-4 col-md-4">
                    <input type="checkbox" ${retailAccount?.termAndCondition == 1 ? 'checked' : ''} class="ace col-xs-12 col-sm-12 col-md-12 col-lg-12 required" value="1" name="termAndCondition" id="termAndCondition" ><span class="lbl"></span>
                </div>
            </div>
    </div><!-- /.col -->
</div>

    <div class="clearfix form-actions">
        <div class="align-center">
            <button type="reset" class="btn">
                <i class="icon-undo bigger-110"></i>
                Reset
            </button>
            <button type="submit" name="" id="accountInfoButton" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Create
            </button>
        </div>
    </div>

</g:form>


<script type="text/javascript">
    jQuery(function ($) {
        $(".chosen-select").chosen();

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
            } ,
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
                    url:"${createLink(controller: 'retailClient', action: 'saveRetailAccount')}",
                    type:'post',
                    data: $("#retailAccountInformationForm").serialize(),
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

