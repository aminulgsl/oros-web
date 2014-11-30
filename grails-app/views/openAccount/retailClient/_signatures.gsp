<g:form class="form-horizontal" method="post" name="retailSignature" id="retailSignature" enctype="multipart/form-data"
        role="form" onsubmit="return false;">
    <div class="row">
        <input type="hidden" id="retailAccount" class="retailAccount" name="retailAccount" value="${retailAccount?.id}">

        <g:if test="${retailAccount?.retailSignature}">
            <input type="hidden" name="firstId" value="${retailAccount?.retailSignature?.id[0]}" id="firstId">
            <input type="hidden" name="secondId" value="${retailAccount?.retailSignature?.id[1]}" id="secondId">
        </g:if>
        <g:else>
            <input type="hidden" name="firstId" value="" id="firstId">
            <input type="hidden" name="secondId" value="" id="secondId">
        </g:else>

        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-xs-6 col-sm-6 col-md-7">
                <div class="form-group">
                    <label for="firstSignature" class="col-sm-4 col-md-4 col-xs-4 control-label">
                        <g:message code="retailClient.signatures.firstSignature.label" default="First Signature"/>
                    </label>

                    <div class="col-sm-8 col-md-8 col-xs-8">
                        <input type="file" class="btn btn-sm btn-file" placeholder="Signature" id="firstSignature"
                               name="firstSignature" value="">
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-sm-6 col-md-3">
                <div class="form-group pull-right">
                    <div class="col-sm-12 col-md-12 col-xs-12">
                        <g:if test="${retailAccount?.retailSignature}">
                            <div class="thumbnail">
                                <ii:imageTag id="firstPreview"
                                             indirect-category="${retailAccount?.retailSignature?.fileDir[0]}"
                                             indirect-imagename="${retailAccount?.retailSignature?.link[0]}" alt=" "
                                             width="150px" height="80px"/>
                            </div>
                        </g:if>
                        <g:else>
                            <ii:imageTag id="firstPreview" alt=" " width="150px" height="80px"/>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-xs-6 col-sm-6 col-md-7">
                <div class="form-group">
                    <label for="secondSignature" class="col-sm-4 col-md-4 col-xs-4 control-label">
                        <g:message code="retailClient.signatures.secondSignature.label" default="Second Signature"/>
                    </label>

                    <div class="col-sm-8 col-md-8 col-xs-8">
                        <input type="file" class="btn btn-sm btn-file" placeholder="Signature" id="secondSignature"
                               name="secondSignature" value="">
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-sm-6 col-md-3">
                <div class="form-group pull-right">
                    <div class="col-sm-12 col-md-12 col-xs-12">
                        <g:if test="${retailAccount?.retailSignature}">
                            <div class="thumbnail">
                                <ii:imageTag id="secondPreview"
                                             indirect-category="${retailAccount?.retailSignature?.fileDir[1]}"
                                             indirect-imagename="${retailAccount?.retailSignature?.link[1]}" alt=" "
                                             width="150px" height="80px"/>
                            </div>
                        </g:if>
                        <g:else>
                            <ii:imageTag id="secondPreview" alt=" " width="150px" height="80px"/>
                        </g:else>
                    </div>

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
    $(document).ready(function () {

        $('#firstPreview').hide();
        $('#secondPreview').hide();

        /* signature previrw */
        function firstReadURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#firstPreview').attr('src', e.target.result).show();
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#firstSignature").change(function () {
            firstReadURL(this);
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#secondPreview').attr('src', e.target.result).show();
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#secondSignature").change(function () {
            readURL(this);
        });
        /* end priview */

        // validated
        $('#retailSignature').validate({
            errorElement: 'small',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                firstSignature: {
                    required: true
                    //extension: "jpg|jpeg|gif|png|bmp|pdf"
                },
                secondSignature: {
                    required: true
                    //extension: "jpg|jpeg|gif|png|bmp|pdf"
                }
            },
            messages: {
                firstSignature: {
                    required: " ",
                    extension: "Only jpg,jpeg,gif,png,bmp or pdf is allowed."
                },
                secondSignature: {
                    required: " ",
                    extension: "Only jpg,jpeg,gif,png,bmp or pdf is allowed."
                }
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('#retailSignature')).show();
            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },
            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
                $(e).remove();
            }
        });

        $("#retailSignature").submit(function (e) {


            if (!$(this).valid())
                return false;


            var firstSignature = $('#firstSignature').val();
            var secondSignature = $('#secondSignature').val();

            if (firstSignature != '' && secondSignature != '') {
                var firstSignatureSize = $('#firstSignature').get(0).files[0].size;
                var secondSignatureSize = $('#secondSignature').get(0).files[0].size;

                if (!(firstSignatureSize <= 900000) || !(secondSignatureSize <= 900000)) {
                    alert('Please make sure your file is less than 300 KB');
                    return false;
                }
                else {
                    var formData = new FormData(this);
                    $.ajax({
                        url: "${createLink(controller: 'retailClient', action: 'saveRetailSignatures')}",
                        type: 'POST',
                        data: formData,
                        dataType: 'json',
                        mimeType: 'multipart/form-data',
                        contentType: false,
                        cache: false,
                        processData: false,
                        success: function (data) {
                            if (data.isError == false) {
                                if (data.add == true) {
                                    var success = '<div class="alert alert-success">';
                                    success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                    success += '</div>';
                                    $('.successMsg').html(success);

                                    $('#firstId').val(data.signatureList[0].id);
                                    $('#secondId').val(data.signatureList[1].id);
                                    $('#signature').html('<span class="glyphicon glyphicon-check"></span> Update');
                                }
                                else if (data.update == true) {
                                    var success = '<div class="alert alert-success">';
                                    success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                    success += '</div>';
                                    $('.successMsg').html(success);

                                    $('#firstId').val(data.signatureList[0].id);
                                    $('#secondId').val(data.signatureList[1].id);
                                    $('#signature').html('<span class="glyphicon glyphicon-check"></span> Update');
                                }
                            }
                            else {
                                var error = '<div class="alert alert-danger">';
                                error += '<i class="icon-bell red"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                                error += '</div>';
                                $('.successMsg').html(error);
                            }
                        }
                    });
                }
            }
            e.preventDefault();
            //e.unbind();
        });


        // Delete
        $('#retail-attachment-tbl').on('click', 'a.attachment-delete-link', function (e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var selectRow = $(this).parents('tr');

            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'retailClient',action: 'deleteRetailSignatures')}?id=" + id,
                success: function (data, textStatus) {
                    if (data.isError == false) {
                        var success = '<div class="alert alert-success">';
                        success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        success += '</div>';
                        $('.successMsg').html(success);
                        attachmentTable.row(selectRow).remove().draw();
                    }
                    else {
                        var error = '<div class="alert alert-danger">';
                        error += '<i class="icon-bell red"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        error += '</div>';
                        $('.successMsg').html(error);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
        });
    });
</script>