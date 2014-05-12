<g:if test="${accountHolder?.spouse}">
    <div class="clearfix">
        <div class="col-xs-12">
            <div class="table-header">
                Family List
            </div>
            <div class="table-responsive">
                <table id="family-info-list" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">Serial</th>
                        <th class="center">Name</th>
                        <th class="center">Birth Country</th>
                        <th class="center">Nationality</th>
                        <th class="center">Relation</th>
                        <th class="center">Action</th>
                    </tr>
                    </thead>

                    <tbody>
                    <g:each status="i" in="${accountHolder?.spouse}" var="spouseInfo">
                        <tr>
                            <td>${i+1}</td>
                            <td id="memName">${spouseInfo?.name}</td>
                            <td id="memBdCountry">${spouseInfo?.birthCountry?.name}</td>

                            <td id="memNationality">${spouseInfo?.nationality?.name}</td>

                            <td id="memRelation">${spouseInfo?.relation}</td>



                            <td class="actions ">
                                <div class="btn-group">

                                    <sec:access controller="accountHolderInfo" action="editSpouseInfo">
                                        <a class="btn btn-sm familyInfo-edit-link"
                                           href="#" memberId="${spouseInfo?.id}" accholderId="${accountHolder?.id}"
                                           title="Edit"><i class="glyphicon glyphicon-pencil orange"></i></a>
                                    </sec:access>
                                    <sec:access controller="accountHolderInfo" action="deleteSpouseInfo">
                                        <a class="btn btn-sm delete btn-danger familyInfo-delete-link" onclick="return confirm('Are you sure to delete?')"
                                           href="#" memberId="${spouseInfo?.id}" accholderId="${accountHolder?.id}"
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

    </div>
</g:if>
<script type="text/javascript">

    jQuery(function ($) {
        $('#family-info-list').on('click', 'a.familyInfo-edit-link', function(e) {
//            alert('I am on edit');
            e.preventDefault();
            var control = this;
            var memberId = $(control).attr('memberId');
            var accholderId = $(control).attr('accholderId');
            jQuery.ajax({
                type: 'POST',
                dataType: 'json',
                url: "${g.createLink(controller: 'accountHolderInfo',action: 'editSpouseInfo')}?id="+accholderId+"&memberId="+memberId,
                success: function (data, textStatus) {
                    $('#spouseId').val(data.id);
                    $('#name').val(data.name);
                    $('#email').val(data.email);
                    $('#birthCountryOfSpouse').val(data.birthCountry.id);
                    $('#nationalId').val(data.nationalId);
                    $('#spouseGender').val(data.gender);
                    $('#spousePhoneNo').val(data.phoneNo);
                    $('#nationality').val(data.nationality.id);
                    $('#relation').val(data.relation);
                    $('#addFamilyMember').html('Update');


                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });

        });

        $('#family-info-list').on('click', 'a.familyInfo-delete-link', function(e) {
            e.preventDefault();
            var control = this;
            var memberId = $(control).attr('memberId');
            var accholderId = $(control).attr('accholderId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'accountHolderInfo',action: 'deleteSpouseInfo')}?id="+accholderId+"&memberId="+memberId,
                success: function (data, textStatus) {
                    $('#familyInfoList').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    $('#'+updateDiv).html(data);
                }
            });

        });
    });
</script>