<html>
<head>

</head>

<body>
<div class="col-xs-12">
    <g:if test='${flash.message}'>
        <div class='alert alert-success '>
            <i class="icon-bell green"><b>${flash.message}</b></i>
        </div>
    </g:if>
    <g:hasErrors bean="${fiscalYear}">
        <div class='alert alert-success '>
            <ul>
                <g:eachError var="err" bean="${fiscalYear}">
                    <li><g:message error="${err}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    <div class="widget-box">
        <div class="widget-header">
            <h4 class="smaller"><g:message code="coreBanking.accounting.fiscalYear.title" default="Fiscal Year"/></h4>
        </div>

        <div class="widget-body">
            <div class="widget-main">
                <g:form class="form-horizontal" id="fiscalYearForm" name="fiscalYearForm"
                        method="post" role="form" url="[action: 'save', controller: 'fiscalYear']"
                        onsubmit="return false;">

                    <g:hiddenField name="id" value="${fiscalYear?.id}"/>

                    <div class="form-group ${hasErrors(bean: fiscalYear, field: 'beginingDate', 'has-error')}">
                        <label class="control-label col-md-3 no-padding-right" for="beginingDate">
                            <g:message code="coreBanking.accounting.fiscalYear.beginDate.label"
                                       default="Begin Date"/>
                        </label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">
                                <div class="input-append date input-group" id="dateBegin">
                                    <input type="date" id="beginingDate" name="beginingDate"
                                           class="form-control datepicker" data-date-format="dd/mm/yyyy"/>
                                    <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="form-group ${hasErrors(bean: fiscalYear, field: 'endingDate', 'has-error')}">
                        <label class="control-label col-md-3 no-padding-right" for="endingDate">
                            <g:message code="coreBanking.accounting.fiscalYear.endDate.label"
                                       default="Ending Date"/>
                        </label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">
                                <div class="input-append date input-group" id="dateEnd">
                                    <input type="date" required=""
                                           id="endingDate" name="endingDate"
                                           class="form-control datepicker" data-date-format="dd/mm/yyyy"/>
                                    <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: fiscalYear, field: 'closed', 'has-error')}">
                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="closed">
                            <g:message code="coreBanking.accounting.fiscalYear.closed.label" default="Closed"/>
                        </label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">

                                <g:select id="closed" name='closed' class="form-control" required=""
                                          noSelection="${['': 'Select Closed...']}"
                                          from='${closed}'
                                          value="${fiscalYear?.closed}"
                                          optionKey="value" optionValue="status"></g:select>

                            </div>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn" type="reset">
                                <i class="icon-undo bigger-110"></i>
                                <g:message code="default.button.reset.label" default="Reset"/>
                            </button>
                            &nbsp; &nbsp; &nbsp;
                            <g:if test="${fiscalYear?.id}">
                                <g:submitButton name="Update" id="saveBtn" class="btn btn-info"/>
                            </g:if>
                            <g:else>
                                <g:submitButton name="Save" id="saveBtn" class="btn btn-info"/>
                            </g:else>
                        </div>
                    </div>

                </g:form>

            </div>
        </div>
    </div>
</div><!-- /span -->

<script type="text/javascript">
    $('#fiscalYearForm').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            beginingDate: {
                required: true
            },
            endingDate: {
                required: true
            },
            closed: {
                required: true
            }
        },
        messages: {
            beginingDate: {
                required: " "
            },
            endingDate: {
                required: " "
            },
            closed: {
                required: " "
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#fiscalYearForm')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },
        submitHandler: function (form) {
            $.ajax({
                url: "${createLink(controller: 'fiscalYear', action: 'save')}",
                type: 'post',
                data: $("#fiscalYearForm").serialize(),
                success: function (data) {
                    $('#page-content').html(data);
                },
                failure: function (data) {
                }
            })

        }
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        var dateF = "${dateFormat}";   //todo assign variable as configurable
        var dateMask = "${dateMask}";       //todo assign variable as configurable
        $(".datepicker").inputmask(dateMask);

        var beginDate = "${beginingDate}";
        $("#beginingDate").val(beginDate);

        var endingDate = "${endingDate}";
        $("#endingDate").val(endingDate);

        var date = new Date();
        date.setDate(date.getDate() - 1);

        $("#dateBegin").datepicker({
            format: dateF,
            startDate: date,
            gotoCurrent: true,
            stepMonths: 1,
            minDate: new Date(),
            autoclose: true
        });

        $("#dateEnd").datepicker({
            format: dateF,
            startDate: date,
            gotoCurrent: true,
            stepMonths: 1,
            minDate: new Date(),
            autoclose: true
        });

    });

</script>
</body>
</html>