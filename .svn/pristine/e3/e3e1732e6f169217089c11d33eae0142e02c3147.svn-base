<g:if test="${resultList}">
    <div id="accordion" class="accordion-style1 panel-group">

        <div class="panel panel-default" id="generalSetting">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle blue" data-toggle="collapse" data-parent="#accordion"
                       href="#collapseOne">
                        <i class="icon-angle-down bigger-110" data-icon-hide="icon-angle-down"
                           data-icon-show="icon-angle-right"></i>
                        &nbsp;&nbsp; Module&nbsp;:&nbsp;<span
                            class="pink">${module}&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Right&nbsp;:&nbsp;<span
                            class="pink">${authority}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                            class="pink" id="updateStatub"/>
                    </a>
                </h4>
            </div>

            <div class="panel-collapse collapse in" id="collapseOne">
                <div class="panel-body">
                    <g:form class="form-horizontal" method="post" id="roleRightMap"
                            url="[action: 'saveRoleRight', controller: 'role']">
                        <g:hiddenField name="authority" id="authority" value="${authority}"/>
                        <g:each in="${resultList}" var="featureList">
                            <div class="form-group alert-success">
                                <label class="col-sm-3 control-label">${featureList.fmenuText}</label>

                                <div class="col-sm-1">
                                    <label class="middle">
                                        <g:checkBox class="ace roleRigntchk parentCheckBox" name="myCheckbox"
                                                    id="${featureList.id}" value="${featureList.requestMapId}"
                                                    checked="${featureList.hasAccess}"/>
                                        <span class="lbl"></span>
                                    </label>
                                </div>
                                %{--<label class="col-sm-8 control-label">${featureList.description}</label>--}%
                            </div>
                            <g:if test="${featureList?.accessEvent?.size() > 0}">
                                <div id="childOf${featureList.id}" class="childHolder">
                                    <g:each in="${featureList.accessEvent}" var="accessEvent">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label purple">${accessEvent.fmenuText}</label>

                                            <div class="col-sm-1">
                                                <label class="middle">
                                                    <g:checkBox class="ace roleRigntchk childCB"
                                                                data-parent="${featureList.id}" name="myCheckbox"
                                                                value="${accessEvent.requestMapId}"
                                                                checked="${accessEvent.hasAccess}"/>
                                                    <span class="lbl"></span>
                                                </label>
                                            </div>
                                            <label class="col-sm-8 control-label purple">${accessEvent.description}</label>
                                        </div>
                                        <g:if test="${accessEvent?.subEvent?.size() > 0}">
                                            <div class="child-childOf">
                                                <g:each in="${accessEvent.subEvent}" var="subEvent">
                                                    <div class="form-group">
                                                        <label class="col-sm-3 col-md-offset-1 green">${subEvent.fmenuText}</label>
                                                        %{--<label class="col-sm-3 col-md-offset-1 green">&nbsp;</label>--}%

                                                        <div class="col-sm-1">
                                                            <label class="middle">
                                                                <g:checkBox class="ace roleRigntchk childCB"
                                                                            data-parent="${featureList.id}"
                                                                            name="myCheckbox"
                                                                            value="${subEvent.requestMapId}"
                                                                            checked="${subEvent.hasAccess}"/>
                                                                <span class="lbl"></span>
                                                            </label>
                                                        </div>
                                                        <label class="col-sm-7 control-label green">${subEvent.description}</label>
                                                    </div>
                                                </g:each>
                                            </div>
                                        </g:if>

                                    </g:each>
                                </div>
                            </g:if>
                        </g:each>

                        <button type="reset" id="resetButton" class="btn btn-info btn-sm">
                            <i class="icon-key bigger-110"></i>
                            Reset
                        </button>
                        <button type="submit" id="updateAccessMapBtn" class="btn btn-success btn-sm">
                            <i class="icon-key bigger-110"></i>
                            Update Access Right
                        </button>
                    </g:form>

                </div>
            </div>
        </div>
    </div>
</g:if>

<script type="text/javascript">
    $(".chosen-select").chosen();
    $(document).ready(function() {
        $('#roleRightMap .roleRigntchk').change(function() {
            if(!$(this).hasClass('rightRightChange')) {
                $(this).addClass('rightRightChange');
            }
        });
        $('#resetButton').click(function(){
            $('.rightRightChange').each(function(){
                $(this).removeClass('rightRightChange');
            });
        });
        $('.childCB').click(function(){
            var checked = $(this).prop('checked');
            var parentId = $(this).data('parent');
            if(checked){
                var parentChecked = $('#' + parentId).prop('checked');
                if(!parentChecked){
                    $('#' + parentId).prop('checked',true).addClass('rightRightChange');
                }
            } else {
                var allChild = $('#childOf'+parentId).find('input[type=checkbox]:checked');
                var count = allChild.length;
                if(count < 1){
                    $('#' + parentId).prop('checked',false).addClass('rightRightChange');
                }
            }

        });

        $('.parentCheckBox').change(function(){
            var parentId = $(this).attr('id');
            var parentChecked = $(this).prop('checked');
            var allChild = $('#childOf'+parentId).find('input[type=checkbox]');
            $(allChild).each(function(){
                $(this).prop('checked',parentChecked).trigger('change');
            });
        });

        $("#roleRightMap").submit(function(e){
            e.preventDefault();
            var authority = $('#authority').val();
            var accessMapping = "";
            $('#roleRightMap input[type=checkbox].rightRightChange').each(function () {
                var isChecked =$(this).is(':checked');
                accessMapping = accessMapping+$(this).val()+"_"+isChecked+"^"
            });
            if(accessMapping ==undefined || accessMapping ==null || accessMapping ==''){
                return false;
            }
            $('#updateAccessMapBtn').prop('disabled', true);
            $('#updateStatub').html("");
            $.ajax({
                url:"${createLink(controller: 'role', action: 'saveRoleRight')}?accessMapping="+accessMapping+"&authority="+authority,
                type:'post',
                dataType:'json',
                success:function(data){
                    $('.rightRightChange').each(function(){
                        $(this).removeClass('rightRightChange');
                    });
                    $('#updateAccessMapBtn').prop('disabled', false);
                    $('#updateStatub').html('Status: '+data.message);
                    $(window).scrollTop($("#backToTop").offset().top);
                },
                failure:function(data){
                }
            })

        });
    });
</script>