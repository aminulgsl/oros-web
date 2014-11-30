<head>
</head>

<body>

<g:form method="post" name="agentAttachmentForm" id="agentAttachmentForm" class="form-horizontal" role="form"
        enctype="multipart/form-data" onSubmit="return false;">
    <div class="row">
        <div class="col-md-12">
            <input type="hidden" id="retailAccount" class="retailAccount" name="retailAccount" value="${retailAccount?.id}">
            <fieldset>
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="caption" class="col-md-3 control-label">
                            <g:message code="default.attachment.caption.label" default="Caption"/>
                        </label>

                        <div class="col-md-4">
                            <g:textField value="" name="caption" class="form-control" id="caption"
                                         placeholder="Please enter Caption" required="required"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" for="description">
                            <g:message code="default.attachment.description.label" default="Description"/>
                        </label>

                        <div class="col-md-4">
                            <g:textArea value="" class="form-control" name="description" id="description"
                                        placeholder="Please Enter Description" required="required"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-3"></div>

                        <div class="col-md-4">
                            <input type="file" name="attachment" id="attachment" required="required"/>
                        </div>

                        <div class="col-md-3">
                            <button type="submit" name="add_more" id="addIntroducer" class="btn-block actionButton"
                                    value="addIntroducer">
                                <span class="glyphicon glyphicon-plus"></span> <g:message code="default.attachment.addMore.label" default="Add More"/>
                            </button>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</g:form>

<div class="space"></div>

<div class="row" id="attachmentListDiv">
    <div class="row">
        <div class="col-sm-12">

            <table class="table table-bordered table-striped table-hover table-condensed" id="attachmentListTable">
                <thead>
                <tr>
                    <th><g:message code="default.attachment.caption.label" default="Caption"/></th>
                    <th><g:message code="default.attachment.fileName.label" default="File Name"/></th>
                    <th><g:message code="default.attachment.description.label" default="Description"/></th>
                    <th><g:message code="default.attachment.type.label" default="Type"/></th>
                    <th><g:message code="default.attachment.size.label" default="Size"/></th>
                    <th><g:message code="default.action.label" default="Action"/></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${retailAccount?.retailAttachment}" var="attachment">

                    <tr>
                        <td id="attCaption">${attachment.caption}</td>
                        <td id="attName">${attachment.originalName}</td>

                        <td id="attDescription">${attachment.description}</td>

                        <td id="attType">${attachment.type}</td>
                        <td id="attSize">${attachment.size}</td>


                        <td class="actions ">
                            <div class="btn-group">
                                <sec:access controller="retailClient" action="downloadRetailAttachment">
                                    <a class="btn btn-sm btn-success attachment-download-link"
                                       href="${g.createLink(controller: 'retailClient', action: 'downloadRetailAttachment')}?id=${attachment?.id}"
                                       title="Download"><i class="glyphicon glyphicon-download"></i></a>
                                </sec:access>
                                <sec:access controller="retailClient" action="deleteRetailAttachment">
                                    <a class="btn btn-sm delete btn-danger attachment-delete-link"
                                       onclick="confirmBox()"
                                       href="#" id="${attachment?.id}"
                                       title="Delete"><i class="glyphicon glyphicon-trash"></i></a>
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

    $(document).ready(function () {

        //$(".chosen-select").chosen();
        var attachmentTable = $('#attachmentListTable').DataTable({
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


        $("#agentAttachmentForm").submit(function (e) {
            var formData = new FormData(this);
            $.ajax({
                url: "${createLink(controller: 'retailClient', action: 'saveRetailAttachment')}",
                type: 'POST',
                data: formData,
                dataType: 'json',
                mimeType: 'multipart/form-data',
                contentType: false,
                cache: false,
                processData: false,
                success: function (data) {
                    if (data.isError == false) {
                        var success = '<div class="alert alert-success">';
                        success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        success += '</div>';
                        $('.successMsg').html(success);

                        attachmentTable.row.add([
                            data.retailAttachment.caption,
                            data.retailAttachment.originalName,
                            data.retailAttachment.description,
                            data.retailAttachment.type,
                            data.retailAttachment.size,
                                    "<div class='btn-group'><a class='btn btn-sm btn-success attachment-download-link' href='${g.createLink(controller: "retailClient", action: "downloadRetailAttachment")}?id=" + data.retailAttachment.id + "'><i class='glyphicon glyphicon-download'></i></a><a class='btn btn-sm delete btn-danger attachment-delete-link' href='' id=" + data.retailAttachment.id + " title='Delete'><i class='glyphicon glyphicon-trash'></i></a></div>"
                        ]).draw();

                        $(':input', '#agentAttachmentForm').not(':button, :hidden').val('');
                    } else {
                        var error = '<div class="alert alert-danger">';
                        error += '<i class="icon-bell red"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                        error += '</div>';
                        $('.successMsg').html(error);
                    }
                }
            });
            e.preventDefault();
        });


        $('#attachmentListTable').on('click', 'a.attachment-delete-link', function (e) {
            var ans = confirm("Are you sure you want to delete?");
            if (ans == true) {
                var control = this;
                var attachment = $(control).attr('id');
                var selectRow = $(this).parents('tr');

                jQuery.ajax({
                    type: 'POST',
                    dataType: 'json',
                    url: "${g.createLink(controller: 'retailClient',action:'deleteRetailAttachment')}?attachment=" + attachment,
                    success: function (data, textStatus) {
                        if (data.isError == false) {
                            var success = '<div class="alert alert-success">';
                            success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);
                            attachmentTable.row(selectRow).remove().draw();
                        }
                        else {
                            var success = '<div class="alert alert-danger">';
                            success += '<i class="icon-bell green"> <b>' + data.message + '</b> </i> <a class="close" data-dismiss="alert">×</a>';
                            success += '</div>';
                            $('.successMsg').html(success);
                        }

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }
            else {

            }
            e.preventDefault();
        });


    });


</script>

</body>