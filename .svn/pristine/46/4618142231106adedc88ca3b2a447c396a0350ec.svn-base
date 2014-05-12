<style>
div.form-group{
    margin-bottom: 10px !important;
    vertical-align: top;
}
label{
    width:155px;
    padding-right:10px;
}
input,select,textarea{
    width: 175px;
    margin-right:20px;
}
</style>

%{--<g:form id="identificationForm" name="identificationForm" method="post" role="form" class="form-inline">--}%

%{--<g:hiddenField name="id" id="id" value="${educationalInfo?.id}"/>--}%
%{--<g:hiddenField name="customer" id="customer" value="${customerMaster?.id}"/>--}%
%{--<g:hiddenField name="generalAddressId" id="generalAddressId" value="${generalAddress?.id}"/>--}%
%{--<g:hiddenField name="postalAddressId" id="postalAddressId" value="${postalAddress?.id}"/>--}%
%{--<g:hiddenField name="shippingAddressId" id="shippingAddressId" value="${shippingAddress?.id}"/>--}%

%{--<div class="form-group ${hasErrors(bean:educationalInfoCommand,field:'document','has-error')}">--}%
%{--<label for="document">Documents*</label>--}%
%{--<input type="file" placeholder="Enter exam Name"--}%
%{--id="document" name="document"  value="${educationalInfo?.document}">--}%
%{--</div>--}%
%{--<div class="form-group ${hasErrors(bean:educationalInfoCommand,field:'degreeName','has-error')}">--}%
%{--<label for="caption">Captions*</label>--}%
%{--<input type="text" placeholder="Enter Degree Name"--}%
%{--id="caption" name="caption"  value="${educationalInfo?.caption}">--}%
%{--</div>--}%
%{--<div class="form-group ${hasErrors(bean:educationalInfoCommand,field:'boardName','has-error')}">--}%
%{--<label for="remarks">Remarks*</label>--}%
%{--<input type="text" placeholder="Enter Board Name"--}%
%{--id="remarks" name="remarks" value="${educationalInfo?.remarks}">--}%
%{--</div>--}%
%{--</g:form>--}%



<g:form name="identificationForm" method="post" role="form" class="form-horizontal" enctype="multipart/form-data" onSubmit="return false;">

    <div class="row">
        <div class="col-xs-12">
            <g:hiddenField name="accountHolderId" id="accountHolderId" value="${accountHolder?.id}"/>
            <g:hiddenField name="id" id="id" value="${attachment?.id}"/>
            <g:if test="${attachment?.id}">
                <div class="form-group col-sm-5">
                    <label for="document" class="col-sm-3">
                        Change Document</label>
                    <div class="col-sm-9">
                        <input type="file" class="col-xs-10 col-sm-12" placeholder="Document"
                               id="document" name="document" title="${attachment?.originalName}">
                    </div>
                </div>
            </g:if>
            <g:else>
                <div class="form-group col-sm-5">
                    <label for="document" class="col-sm-3">
                        Document*</label>
                    <div class="col-sm-9">
                        <input type="file" class="col-xs-10 col-sm-12" placeholder="Document"
                               id="document" name="document">
                    </div>
                </div>
            </g:else>
        %{--<div class="form-group">--}%
        %{--<label for="document" class="col-sm-1">--}%
        %{--Document*</label>--}%
        %{--<div class="col-sm-4">--}%
        %{--<input type="file" class="col-xs-10 col-sm-12" placeholder="Document"--}%
        %{--id="document" name="document">--}%
        %{--</div>--}%
        %{--</div>--}%
            <div class="form-group col-sm-4">
                <label for="caption" class="col-sm-3">
                    Caption*</label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-12" placeholder="Caption"
                           id="caption" name="caption">
                </div>
            </div>
            <div class="form-group col-sm-4">
                <label for="remarks" class="col-sm-3">
                    Remarks*</label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-12" placeholder="Remarks"
                           id="remarks" name="remarks">
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix form-actions align-right">
        %{--<button type="reset" class="btn"><i class="icon-undo bigger-110"></i>Reset</button>--}%
        <g:if test="${accountHolder?.attachments}">
            <button type="submit" name="identificationFormButton" id="identificationFormButton" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Add More</button>
        </g:if>
    %{--<g:elseif test="${attachment?.id}">--}%
    %{--<button type="submit" name="identificationFormButton" id="identificationFormButton" class="btn btn-info">--}%
    %{--<i class="icon-ok bigger-110"></i>Update</button>--}%
    %{--</g:elseif>--}%
        <g:else>
            <button type="submit" name="identificationFormButton" id="identificationFormButton" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Add</button>
        </g:else>
    </div>
</g:form>

<div class= "row" id="identificationListDiv">
    <g:render template="identificationListTable"/>
</div>

<script type="text/javascript">

    $('#identificationForm').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            document: {
                required: true
            },
            caption: {
                required: true
            },
            remarks: {
                required: true
            }
        } ,
        messages: {
            document: {
                required: "Choose a file"
            },
            caption: {
                required: "Provide caption"
            },
            remarks: {
                required: "Provide remarks"
            }
        },
        errorPlacement: function(error, element){
            return true
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#identificationForm')).show();
        },
        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },
        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        }
    });
    $("#identificationForm").submit(function (e) {
        var formData = new FormData(this);
        $.ajax({
            url: '${createLink(controller: 'accountHolderInfo', action: 'saveAttachment')}',
            type: 'post',
            data: formData,
            dataType: 'html',
            mimeType: 'multipart/form-data',
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                $('#identificationListDiv').html(data);
                clearForm('#identificationForm');
                $('#identificationForm :input#document').val('');
                $('#identificationForm :input#accountHolderId').val('${accountHolder?.id}');
                $('#identificationFormButton').html('<i class="icon-ok bigger-110"></i>Add More');

            }
        });
        e.preventDefault();
    });

</script>