<%--
  Created by IntelliJ IDEA.
  User: rabin
  Date: 4/13/14
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#signSelectedMessage').hide();
            $('#signEmptyMessage').hide();
            $('.preview').hide();

            $("#imag").change(function () {
                 $('.preview').show();
                 var imgControlName = "#ImgPreview";
                 readURL(this, imgControlName);
            });

            function readURL(input, imgControlName) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                    $(imgControlName).attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $("#removeImage").click(function (e) {
                $('.preview').hide();
            });
             /*ajax form submit*/
            $("#imgUpload").submit(function (e) {
                var formObj = $(this);
                var formURL = formObj.attr("save");
                //var formData = new FormData(document.forms.namedItem("signUpload"));
                var formData = new FormData(this);
                $.ajax({
                    url: "${createLink(controller: 'demo', action: 'imgSave')}",
                    type: 'POST',
                    data: formData,
                    dataType: 'json',
                    mimeType: "multipart/form-data",
                    contentType: false,
                    cache: false,
                    processData: false,
                    success: function (data) {
                        var message = data.message
                        var messageValue = data.noImage
                        if (messageValue == 1) {
                            $('#signSelectedMessage').hide();
                            $('#signEmptyMessage').html('<i class="icon-bell green"></i> <b>' + data.message + '</b>').show();
                        } else {
                            $('#signEmptyMessage').html(data.message).hide();
                            $('#signSelectedMessage').html('<i class="icon-bell green"></i> <b>' + data.message + '</b>').show();
                        }
                    }
                });
                e.preventDefault();
                e.unbind();
            });
            $("#uploadId").click(function (e) {
                //$("#imag").val(null);
                $('.preview').hide();
            });
        });
    </script>
</head>

<body>
<div class="alert alert-block alert-success">
    <div class='alert alert-success' id="signEmptyMessage"></div>%{-- if error--}%
    <div class='alert alert-success' id="signSelectedMessage"></div>%{-- if success--}%
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
</body>
</html>