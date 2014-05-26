<g:form name="identificationForm" id="identificationForm" method="post" role="form" class="form-horizontal" enctype="multipart/form-data" onSubmit="return false;">

    <div class="row">
        <div class="col-xs-12">
            <g:hiddenField name="id" id="attachmentId" value=""/>
            <g:hiddenField name="personalId" id="personalId" value="${personalInfo?.id}"/>
            <input type="hidden" name="row" id="rowAttachment" value="">

            <div class="form-group col-sm-5" id="documentDiv">
                <label for="document" class="col-sm-3">
                    Document*</label>
                <div class="col-sm-9">
                    <input type="file" class="col-xs-10 col-sm-12" placeholder="Document"
                           id="document" name="document">
                </div>
            </div>
            <div class="form-group col-sm-4">
                <label for="caption" class="col-sm-3">
                    Caption*</label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-12" placeholder="Enter Caption"
                           id="caption" name="caption">
                </div>
            </div>
            <div class="form-group col-sm-4">
                <label for="remarks" class="col-sm-3">
                    Remarks*</label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-12" placeholder="Enter Remarks"
                           id="remarks" name="remarks">
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix form-actions align-right">
        <g:if test="${personalInfo?.attachments}">
            <button type="submit" name="identificationFormButton" id="identificationFormButton" class="btn btn-info">
                <i class="glyphicon glyphicon-plus"></i>Add More</button>
        </g:if>
        <g:else>
            <button type="submit" name="identificationFormButton" id="identificationFormButton" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Add</button>
        </g:else>
    </div>
</g:form>

<div class= "row" id="identificationListDiv">
    <div class= "row">
        <div class="col-sm-12">
            <table id="identificationTable" class="table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Document</th>
                    <th>Type</th>
                    <th>Size</th>
                    <th>Caption</th>
                    <th>Remarks</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody id="identificationTableId">
                <g:each in="${personalInfo?.attachments}" var="attachments" status="i">

                    <tr>
                        <td id="attName">${attachments.originalName}</td>
                        <td id="attType">${attachments.type}</td>
                        <td id="attSize">${attachments.size}</td>
                        <td id="attCaption">${attachments.caption}</td>
                        <td id="attRemarks">${attachments.remarks}</td>

                        <td class="actions ">
                            <div class="btn-group">
                                <sec:access controller="savingsAccount" action="downloadIdentification">
                                    <a class="btn btn-sm identification-download-link" href="${g.createLink(controller: 'savingsAccount', action: 'downloadIdentification', params: [attachmentId: attachments?.id])}" id="${attachments.id}" personalId="${personalInfo?.id}" title="Download">
                                        <i class="glyphicon glyphicon-download"></i>
                                    </a>
                                </sec:access>
                                <sec:access controller="savingsAccount" action="editIdentification">
                                    <a class="btn btn-sm identification-edit-link" href="" id="${attachments.id}" personalId="${personalInfo?.id}" title="Edit">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                    </a>
                                </sec:access>
                                <sec:access controller="savingsAccount" action="deleteIdentification">
                                    <a class="btn btn-sm delete btn-danger identification-delete-link" onclick="return confirm('Are you sure delete Bank Account Information?')"
                                       href="" id="${attachments.id}" personalId="${personalInfo?.id}" title="Delete"><i class="glyphicon glyphicon-remove"></i>
                                    </a>
                                </sec:access>
                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    jQuery(function ($) {
        var identificationTable = $('#identificationTable').DataTable({
            "sDom": " ", //<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>> ,
            "bAutoWidth": true,
            "aoColumns": [
                null,
                null,
                null,
                null,
                null,
                { "bSortable": false }
            ]
        });

        $('#identificationForm').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                document: {
                    required: true,
                    extension: "jpg|jpeg|gif|png|bmp|pdf"
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
                    required: " ",
                    extension: "Only jpg,jpeg,gif,png,bmp or pdf is allowed."
                },
                caption: {
                    required: " "
                },
                remarks: {
                    required: " "
                }
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
            var attachmentId = $('#identificationForm #attachmentId').val();
            if(attachmentId != ''){
                $('#document').rules('remove','required');}
            if(attachmentId == ''){
                $('#identificationForm :input#document').rules('add',{
                    required: true,
                    messages: {
                        required: " "
                    }
                });
            }
            if(!$(this).valid())
                return;
            var document = $('#document').val();
            if(document != '')
            {
                var fileSize = $('#document').get(0).files[0].size;
                if(!(fileSize<=900000))
                {
                    alert('Please make sure your file is less than 300 KB');
                    return false;
                }
            }
            var formData = new FormData(this);
            $.ajax({
                url: '${createLink(controller: 'savingsAccount', action: 'saveAttachment')}',
                type: 'post',
                data: formData,
                dataType: 'json',
                mimeType: 'multipart/form-data',
                contentType: false,
                cache: false,
                processData: false,
                success: function (data) {
                    if(data.isError == false){
                        if(data.add==true){
                            identificationTable.row.add( [
                                data.attachments.originalName,
                                data.attachments.type,
                                data.attachments.size,
                                data.attachments.caption,
                                data.attachments.remarks,
                                "<div class='btn-group'><a class='btn btn-sm identification-download-link' href='${g.createLink(controller: 'savingsAccount', action: 'downloadIdentification')}?attachmentId="+data.attachments.id+"' id="+data.attachments.id+" personalId="+data.personalInfo.id+" title='Download'><i class='glyphicon glyphicon-download'></i></a><a class='btn btn-sm identification-edit-link' href='' id="+data.attachments.id+" personalId="+data.personalInfo.id+" title='Edit'><i class='glyphicon glyphicon-pencil'></i></a><a class='btn btn-sm delete btn-danger identification-delete-link' href='' id="+data.attachments.id+"  personalId="+data.personalInfo.id+" title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                            ] ).draw();

                            $(':input','#identificationForm').not(':button, :hidden').val('');
                            $('#identificationForm .form-group').removeClass('has-info');
                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);
                        }
                        else if(data.update == true){
                            var row = data.row;
                            $('#identificationTable').dataTable().fnUpdate( [
                                data.attachments.originalName,
                                data.attachments.type,
                                data.attachments.size,
                                data.attachments.caption,
                                data.attachments.remarks,
                                "<div class='btn-group'><a class='btn btn-sm identification-download-link' href='${g.createLink(controller: 'savingsAccount', action: 'downloadIdentification')}?attachmentId="+data.attachments.id+"' id="+data.attachments.id+" personalId="+data.personalInfo.id+" title='Download'><i class='glyphicon glyphicon-download'></i></a><a class='btn btn-sm identification-edit-link' href='' id="+data.attachments.id+" personalId="+data.personalInfo.id+" title='Edit'><i class='glyphicon glyphicon-pencil'></i></a><a class='btn btn-sm delete btn-danger identification-delete-link' href='' id="+data.attachments.id+" personalId="+data.personalInfo.id+" title='Delete'><i class='glyphicon glyphicon-remove'></i></a></div>"
                            ], row );

                            $(':input,:hidden','#identificationForm').not('#personalId').val('');
                            $('#documentDiv').html('<label for="document" class="col-sm-3">Document*</label><div class="col-sm-9"><input type="file" class="col-xs-10 col-sm-12" placeholder="Document" id="document" name="document"></div>');
                            $('#identificationFormButton').html('<span class="glyphicon glyphicon-plus"></span> Add More');
                            $('#identificationForm .form-group').removeClass('has-error').removeClass('has-info');

                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);

                        }
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
            });
            e.preventDefault();
        });

        // Delete
        $('#identificationTable').on('click', 'a.identification-delete-link', function(e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var selectRow = $(this).parents('tr');
            var personalId = $(control).attr('personalId');
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'savingsAccount',action: 'deleteIdentification')}?id="+id+"&personalId="+personalId,
                success: function (data, textStatus) {
                    if(data.isError == false){
                        var success = '<div class="alert alert-success">';
                        success += '<i class="icon-bell green"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        success += '</div>';
                        $('.successMsg').html(success);
                        $('#identificationTable').DataTable().row( selectRow ).remove().draw();
                    }
                    else{
                        var error = '<div class="alert alert-danger">';
                        error += '<i class="icon-bell red"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        error += '</div>';
                        $('.successMsg').html(error);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
        });

        // edit
        $('#identificationTable').on('click', 'a.identification-edit-link', function(e) {
            e.preventDefault();
            var control = this;
            var id = $(control).attr('id');
            var tr = $(this).parents('tr');
            var row = identificationTable.row( tr ).index();

            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'savingsAccount',action: 'editIdentification')}?id="+id+"&row="+row,
                success: function (data, textStatus) {
                    if(data.isError == false){
                        $('#documentDiv').html('<label for="document" class="col-sm-3">Change Document?</label><div class="col-sm-9">'+data.attachments.originalName+'<input type="file" class="col-xs-10 col-sm-12 no-padding-left" placeholder="Document" id="document" name="document"></div>');
                        $('#caption').val(data.attachments.caption);
                        $('#remarks').val(data.attachments.remarks);
                        $('#attachmentId').val(data.attachments.id);
                        $('#identificationFormButton').html('<span class="glyphicon glyphicon-check"></span>Update');
                        $('#rowAttachment').val(data.row);
                    }
                    else{
                        var error = '<div class="alert alert-danger">';
                        error += '<i class="icon-bell red"> <b>'+ data.message +'</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        error += '</div>';
                        $('.successMsg').html(error);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });
        });
        jQuery.validator.messages.required = "";
    });
</script>