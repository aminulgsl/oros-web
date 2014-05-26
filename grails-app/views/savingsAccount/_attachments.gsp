%{--<div class="alert alert-block alert-success">
    <div class='alert alert-success' id="signEmptyMessage"></div>
    <div class='alert alert-success' id="signSelectedMessage"></div>
    <div class="preview">
        <img id="ImgPreview" src="#" class="preview" width="80" height="60"/>

        <div>
            <button type="button" id="removeImage" class="btn btn-success">Edit</button>
        </div>
    </div>

    <form id="imgUpload" class="imgUpload1">
        <span class="btn_upload">
            <input type="file" multiple id="imag" name="imag" title=""/>
            <input class="btn btn-sm" type="submit" value="Upload" id="uploadId"/>
        </span>
    </form>
</div>

<div id="signShow"></div>--}%

<html>
<head>
</head>
<body>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

        <div class="widget-box">
            <div class="widget-header widget-header-blue widget-header-flat">
                <h5 class="lighter">Upload your attachment</h5>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <form id="accOpenAttachment" class="" name="accOpenAttachment" enctype="multipart/form-data" role="form" >
                        <input type="hidden" name="accountObjId" value="${saveAccObj?.id}">
                        <fieldset>%{--saveAccObj--}%
                            <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-6">

                                <div class="form-group">
                                    <label class="col-sm-4 control-label no-padding-right" for="attachmentImage">Attachment</label>

                                    <div class="col-sm-8 col-xs-8">
                                        <div class="clearfix">
                                            <input type="file" id="attachmentImage" class="btn btn-sm btn-file" name="attachmentImage" placeholder="Attachment" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

                                <div class="form-group">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="clearfix">
                                            <img id="preview" height="175px" width="150px"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </fieldset>
                        <div class="clearfix form-actions">
                            <div class="col-md-6">
                                <button class="btn " type="submit"><i class="icon-cloud-upload bigger-125"></i>Upload</button>
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
        /* signature previrw */
        function readUrl(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#preview').attr('src', e.target.result).show();
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#attachmentImage").change(function () {
            readUrl(this);
        });

        /* end priview */

        // validated
        $('#accOpenAttachment').validate({
            errorElement: 'small',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                firstSignature: {
                    required: true,
                    extension: "jpg|jpeg|gif|png|bmp|pdf"
                }
            },
            messages: {
                firstSignature: {
                    required: " ",
                    extension: "Only jpg,jpeg,gif,png,bmp or pdf is allowed."
                }
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                $('.alert-danger', $('#accOpenAttachment')).show();
            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },
            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
                $(e).remove();
            }
        });

        $("#accOpenAttachment").submit(function (e) {

            if (!$(this).valid())
                return false;

            var firstSignature = $('#attachmentImage').val();

            if (firstSignature != '') {
                var attachmentImage = $('#attachmentImage').get(0).files[0].size;

                if (!(attachmentImage <= 900000)) {
                    alert('Please make sure your file is less than 300 KB');
                    return false;
                } else {
                    var formData = new FormData(this);
                    $.ajax({
                        url: "${createLink(controller: 'accountOpen', action: 'saveAttachment')}",
                        type: 'POST',
                        data: formData,
                        dataType: 'json',
                        mimeType: 'multipart/form-data',
                        contentType: false,
                        cache: false,
                        processData: false,
                        success: function (data) {
                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);
                        }
                    });
                }
            }
            e.preventDefault();
            e.unbind();
        });


    });
</script>
</body>
</html>