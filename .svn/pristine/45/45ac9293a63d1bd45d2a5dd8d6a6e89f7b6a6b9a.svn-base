<html>
<head>
    <title></title>
</head>

<body>

<div class="row">
    <div class="col-xs-12">
        <g:if test='${flash.message}'>
            <div class='alert alert-success '>
                <i class="icon-bell green"><b>${flash.message}</b></i>
            </div>
        </g:if>
        <g:hasErrors bean="${role}">
            <div class='alert alert-success '>
                <ul>
                    <g:eachError var="err" bean="${role}">
                        <li><g:message error="${err}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
        <g:form class="form-horizontal" id="roleCreateForm" method="post" role="form" url="[action: 'save', controller: 'role']" onsubmit="return false;">
            <g:hiddenField name="id" value="${role?.id}"/>
            <div class="form-group ${hasErrors(bean: role, field: 'authority', 'has-error')}">
                <label class="col-sm-3 control-label no-padding-right" for="authority">Role Name</label>

                <div class="col-xs-12 col-sm-9">
                    <div class="clearfix">
                        <g:textField id="authority" name="authority" placeholder="Role name" class="col-xs-10 col-sm-5"
                                     value="${fieldValue(bean: role, field: 'authority')}"/>
                    </div>
                </div>
            </div>

            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <g:submitButton name="resetBtn" type='reset' value='Reset' id="resetBtn" class="btn btn-info"/>
                    &nbsp; &nbsp; &nbsp;
                    <g:if test="${role?.id}">
                        <g:submitButton name="Update" id="saveBtn" class="btn btn-info"/>
                    </g:if>
                    <g:else>
                        <g:submitButton name="Save" id="saveBtn" class="btn btn-info"/>
                    </g:else>
                </div>
            </div>
        </g:form>
    </div><!-- /.col -->
</div><!-- /.row -->

<script type="text/javascript">
    jQuery(function ($) {

        $('#roleCreateForm').validate({

            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            rules: {
                authority: {
                    required: true
//                        email:true
                }
            } ,
            messages: {
                authority: {
                    required: "Please provide role name"
//                        email: "User name not valid."
                }
            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },

            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
                $(e).remove();
            },
            errorPlacement: function (error, element) {
                if(element.is(':checkbox') || element.is(':radio')) {
                    var controls = element.closest('div[class*="col-"]');
                    if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                }
                else if(element.is('.select2')) {
                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                }
                else if(element.is('.chosen-select')) {
                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                }
                else error.insertAfter(element.parent());
            },
            submitHandler: function (form) {
                $.ajax({
                    url:"${createLink(controller: 'role', action: 'save')}",
                    type:'post',
                    data: $("#roleCreateForm").serialize(),
                    success:function(data){
                        $('#page-content').html(data);
                    },
                    failure:function(data){
                    }
                })

            }
        });
    });

</script>
</body>
</html>