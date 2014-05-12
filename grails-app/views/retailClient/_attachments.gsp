<g:form class="form-horizontal" method="post" name="retailSignature" id="retailSignature" role="form" url="[action: 'saveRetailSignatures', controller: 'retailClient']" onsubmit="return false;">
    <div class="row">
        <input type="hidden" name="retailAccount" class="retailAccountId" value="${retailAccountId}">
        <input type="hidden" name="id" value="${signaturesList?.id}" id="signatureId">

        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-xs-6 col-sm-6 col-md-7">
                <div class="form-group">
                    <label for="firstSignature" class="col-sm-4 col-md-4 col-xs-4 control-label">First Signature</label>
                    <div class="col-sm-8 col-md-8 col-xs-8">
                            <input type="file" class="btn btn-sm btn-file" placeholder="Signature" id="firstSignature" name="firstSignature" value="${signaturesList?.firstSignatureName}">
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-sm-6 col-md-3">
                <div class="form-group pull-right">
                    <div class="col-sm-12 col-md-12 col-xs-12">
                        <ii:imageTag id="firstPreview" indirect-imagename="${signaturesList?.firstSignatureName}" title="${signaturesList?.firstSignatureName}" alt=" " width="100px" height="100px" />
                    </div>

                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-xs-6 col-sm-6 col-md-7">
                <div class="form-group">
                    <label for="secondSignature" class="col-sm-4 col-md-4 col-xs-4 control-label">Second Signature</label>
                    <div class="col-sm-8 col-md-8 col-xs-8">
                        <input type="file" class="btn btn-sm btn-file" placeholder="Signature" id="secondSignature" name="secondSignature" value="${signaturesList?.secondSignatureName}">
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-sm-6 col-md-3">
                <div class="form-group pull-right">
                    <div class="col-sm-12 col-md-12 col-xs-12">
                        <ii:imageTag id="secondPreview" indirect-imagename="${signaturesList?.secondSignatureName}" alt=" " width="100px" height="100px" />
                    </div>

                </div>
            </div>
        </div>

    </div>

    <div class="clearfix form-actions">
        <div class="align-center">
            %{--<button type="reset" class="btn">
                <i class="icon-undo bigger-110"></i>
                Reset
            </button>--}%
            <button type="submit" name="signature" id="signature" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Create
            </button>
        </div>
    </div>
</g:form>

<script type="text/javascript">
    $(document).ready(function () {

        /* signature previrw */
        function firstReadURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#firstPreview').attr('src', e.target.result).show();
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#firstSignature").change(function(){
            firstReadURL(this);
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#secondPreview').attr('src', e.target.result).show();
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#secondSignature").change(function(){
            readURL(this);
        });
        /* end priview */

//        $('#firstPreview').hide();
//        $('#secondPreview').hide();

        $("#retailSignature").submit(function(e)  {
            var formData = new FormData(this);
            //alert(formData);
            $.ajax({
                url:"${createLink(controller: 'retailClient', action: 'saveRetailSignatures')}",
                type: 'POST',
                data:  formData,
                mimeType:'multipart/form-data',
                contentType: false,
                cache: false,
                processData:false,
                success: function (data) {
                    $('.alert').show();
                    $('#retailAttachments').html(data);
                    $('.alert-success i b').text("Signature Add Successfully !");
                    $('button#signature').html('<i class="icon-ok bigger-110"></i> Update');
                }
            });
            e.preventDefault();
            e.unbind();
        });

        $('.retailAccountId').val('${retailAccountId}');
        $('#signatureId').val('${signaturesList?.id}');
        var tabSelector = '${tabSelector}';
        if(tabSelector == 5){
            $('#retailAttachmentsTab').removeClass( "active" );
            $('#retailAttachments').removeClass( "active");
            $('#retailDetailsInformationTab').addClass( "active" );
            $('#retailDetailsInformation').addClass( "active" );
        }
    });
</script>