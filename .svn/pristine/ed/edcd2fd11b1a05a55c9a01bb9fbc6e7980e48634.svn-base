<g:if test="${accountHolder?.attachments}">
    <div class= "row">
        <div class="col-sm-12">
            <table id="identificationList" class="table table-bordered table-striped table-hover table-condensed">
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
                <tbody>
                <g:each in="${accountHolder?.attachments}" var="attachment">
                    <tr>
                        <td id="attName">${attachment.originalName}</td>
                        <td id="attType">${attachment.type}</td>
                        <td id="attSize">${attachment.size}</td>
                        <td id="attCaption">${attachment.caption}</td>
                        <td id="attRemarks">${attachment.remarks}</td>
                        <td class="actions ">
                            <div class="btn-group">
                                <sec:access controller="accountHolderInfo" action="downloadIdentification">
                                    <a class="btn btn-sm identification-download-link"
                                       href="${g.createLink(controller: 'accountHolderInfo', action: 'downloadIdentification', params: [attachmentId: attachment?.id])}" attachmentId="${attachment?.id}" accountHolderId="${accountHolder?.id}"
                                       title="Download"><i class="glyphicon glyphicon-download"></i></a>
                                </sec:access>
                                <sec:access controller="accountHolderInfo" action="editIdentification">
                                    <a class="btn btn-sm identification-edit-link"
                                       href="#" attachmentId="${attachment?.id}" accountHolderId="${accountHolder?.id}"
                                       title="Edit"><i class="glyphicon glyphicon-pencil"></i></a>
                                </sec:access>
                                <sec:access controller="accountHolderInfo" action="deleteIdentification">
                                    <a class="btn btn-sm delete btn-danger identification-delete-link" onclick="return confirm('Are you sure delete Account?')"
                                       href="#" attachmentId="${attachment?.id}" accountHolderId="${accountHolder?.id}"
                                       title="Delete"><i class="glyphicon glyphicon-remove "></i></a>
                                </sec:access>
                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</g:if>

<script type="text/javascript">

    jQuery(function ($) {
        $('#identificationList').on('click', 'a.identification-edit-link', function(e) {
            e.preventDefault();
            var control = this;
            var attachmentId = $(control).attr('attachmentId');
            var accountHolderId = $(control).attr('accountHolderId');
//            alert(attachmentId);
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'accountHolderInfo',action: 'editIdentification')}?id="+attachmentId+"&accountHolderId="+accountHolderId,
                success: function (data, textStatus) {
                    clearForm('#identificationForm')
                    $('#identificationForm :input#accountHolderId').val(${accountHolder?.id});
                    $('#identificationForm :input#id').val(attachmentId);
//                    $('#identificationForm :input#document').val(data.originalName);
                    $('#caption').val(data.caption);
                    $('#remarks').val(data.remarks);
                    $('#identificationFormButton').html('<i class="icon-ok bigger-110"></i>Update');
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });

        });

        $('#identificationList').on('click', 'a.identification-delete-link', function(e) {
            e.preventDefault();
            var control = this;
            var attachmentId = $(control).attr('attachmentId');
            var accountHolderId = $(control).attr('accountHolderId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'accountHolderInfo',action: 'deleteIdentification')}?id="+attachmentId+"&accountHolderId="+accountHolderId,
                success: function (data, textStatus) {
                    $('#identificationList').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });

        });
    });
</script>