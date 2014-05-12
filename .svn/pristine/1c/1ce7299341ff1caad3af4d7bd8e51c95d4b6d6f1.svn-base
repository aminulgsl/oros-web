<g:if test="${accountHolder?.educationalInfo}">
    <div class= "row">
        <div class="col-sm-12">
            <table id="educationList" class="table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Degree</th>
                    <th>Institute Name</th>
                    <th>Board Name</th>
                    <th>Result</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${accountHolder?.educationalInfo}" var="educationalInfo">
                    <tr>
                        <td id="attName">${educationalInfo.degreeName}</td>
                        <td id="attType">${educationalInfo.instituteName}</td>
                        <td id="attSize">${educationalInfo.boardName}</td>
                        <td id="attCaption">${educationalInfo.achievedResult}</td>
                        <td class="actions ">
                            <div class="btn-group">

                                <sec:access controller="accountHolderInfo" action="editEducationalInfo">
                                    <a class="btn btn-sm education-edit-link"
                                       href="#" educationId="${educationalInfo?.id}" accountHolderId="${accountHolder?.id}"
                                       title="Edit"><i class="glyphicon glyphicon-pencil"></i></a>
                                </sec:access>
                                <sec:access controller="accountHolderInfo" action="deleteEducationalInfo">
                                    <a class="btn btn-sm delete btn-danger education-delete-link" onclick="return confirm('Are you sure delete Account?')"
                                       href="#" educationId="${educationalInfo?.id}" accountHolderId="${accountHolder?.id}"
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
        $('#educationList').on('click', 'a.education-edit-link', function(e) {
            e.preventDefault();
            var control = this;
            var educationId = $(control).attr('educationId');
            var accountHolderId = $(control).attr('accountHolderId');
//            alert(attachmentId);
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'accountHolderInfo',action: 'editEducationalInfo')}?id="+educationId+"&accountHolderId="+accountHolderId,
                success: function (data, textStatus) {
                    clearForm('#educationForm')
                    $('#educationForm :input#accountHolderId').val(${accountHolder?.id});
                    $('#educationForm :input#id').val(educationId);
                    $('#educationForm :input#degreeName').val(data.degreeName);
                    $('#educationForm :input#instituteName').val(data.instituteName);
                    $('#educationForm :input#boardName').val(data.boardName);
                    $('#educationForm :input#achievedResult').val(data.achievedResult);
                    $('#educationSubmitButton').html('<i class="icon-ok bigger-110"></i>Update');
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });

        });

        $('#educationList').on('click', 'a.education-delete-link', function(e) {
            e.preventDefault();
            var control = this;
            var educationId = $(control).attr('educationId');
            var accountHolderId = $(control).attr('accountHolderId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'accountHolderInfo',action: 'deleteEducationalInfo')}?id="+educationId+"&accountHolderId="+accountHolderId,
                success: function (data, textStatus) {
                    $('#educationList').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });

        });
    });
</script>