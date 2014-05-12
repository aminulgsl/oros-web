<%@ page import="com.gsl.oros.core.banking.settings.Currencys" %>
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
    <g:hasErrors bean="${exchangeRate}">
        <div class='alert alert-success '>
            <ul>
                <g:eachError var="err" bean="${exchangeRate}">
                    <li><g:message error="${err}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>
    <div class="widget-box">
        <div class="widget-header">
            <h4 class="smaller"><g:message code="coreBanking.settings.exchangerate.title" default="Exchange Rate"/></h4>
        </div>

        <div class="widget-body">
            <div class="widget-main">

                <g:form class="form-horizontal" id="exchangeRateForm" name="exchangeRateForm"
                        method="post" role="form" url="[action: 'save', controller: 'exchangeRate']"
                        onsubmit="return false;">

                    <g:hiddenField name="id" value="${exchangeRate?.id}"/>


                    <div class="form-group ${hasErrors(bean: exchangeRate, field: 'currency', 'has-error')}">
                        <label class="control-label col-md-3 no-padding-right" for="currencyId">
                            <g:message code="default.currency.label" default="Currency"/> *</label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">

                                <g:select id="currencyId" name='currency' class="form-control" required=""
                                          noSelection="${['': 'Select Currency...']}"
                                          from='${Currencys.withCriteria {
                                              eq('status', true)
                                              and {
                                                  country {
                                                      eq('status', true)
                                                  }
                                              }
                                          }}'
                                          value="${exchangeRate?.currency?.id}"
                                          optionKey="id" optionValue="name"></g:select>

                            </div>
                        </div>
                    </div>


                    <div class="form-group ${hasErrors(bean: exchangeRate, field: 'buyPrice', 'has-error')}">
                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="buyPrice">
                            <g:message code="coreBanking.settings.exchangerate.buyPrice.label"
                                       default="Buy Price"/> *</label>

                        <div class="col-sm-2 col-sm-2">
                            <div class="clearfix">
                                <input required="" type="text" autocomplete="off" style="text-align: right"
                                       id="buyPrice" name="buyPrice" value="${exchangeRate?.buyPrice}"
                                       class="form-control"
                                       placeholder="Buying Price">
                            </div>
                        </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: exchangeRate, field: 'sellPrice', 'has-error')}">
                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="sellPrice">
                            <g:message code="coreBanking.settings.exchangerate.sellPrice.label"
                                       default="Sell Price"/> *</label>

                        <div class="col-sm-2 col-sm-2">
                            <div class="clearfix">
                                <input type="text" required="" style="text-align: right"
                                       id="sellPrice" name="sellPrice" value="${exchangeRate?.sellPrice}"
                                       class="form-control"
                                       placeholder="Selling Price">
                            </div>
                        </div>
                    </div>


                    <div class="form-group ${hasErrors(bean: exchangeRate, field: 'date', 'has-error')}">
                        <label class="control-label col-md-3 no-padding-right" for="date">
                            <g:message code="default.date.label" default="Date"/> *</label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">
                                <div class="input-append date input-group" id="date">
                                    <input type="date" name="date" class="form-control datepicker"
                                           data-date-format="dd/mm/yyyy"/>
                                    <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
                                </div>
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
                            <g:if test="${exchangeRate?.id}">
                                <g:submitButton name="Update" id="saveBtn" class="btn btn-info"/>
                            </g:if>
                            <g:else>
                                <g:submitButton name="Save" id="saveBtn" class="btn btn-info"/>
                            </g:else>
                        </div>
                    </div>

                </g:form>
                <hr/>

                <div class="row">
                    <table id="grid"></table>

                    <div id="pager"></div>
                </div>

            </div>
        </div>
    </div>
</div><!-- /span -->
<script type="text/javascript">
    $('#exchangeRateForm').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            currencyId: {
                required: true
            },
            buyPrice: {
                required: true,
                number: true

            },
            sellPrice: {
                required: true,
                number: true
            },
            date: {
                required: true
            }
        },
        messages: {
            currencyId: {
                required: " "
            },
            buyPrice: {
                required: " "
            },
            sellPrice: {
                required: " "
            },
            date: {
                required: " "
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#countryForm')).show();
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
                url: "${createLink(controller: 'exchangeRate', action: 'save')}",
                type: 'post',
                data: $("#exchangeRateForm").serialize(),
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
        var getDecimal = "${decimalSep}"; // todo assign variable as configurable
        var dateF = "${dateFormat}"
        var dateM = " ${dateMask}"

        currentDate = "${currentDt}";
        $(".datepicker").val(currentDate);
        $(".datepicker").inputmask(dateM);

        var date = new Date();
        date.setDate(date.getDate() - 1);

        $("#date").datepicker({
            format: dateF,
            startDate: date,
            gotoCurrent: true,
            stepMonths: 1,
            minDate: new Date(),
            autoclose: true
        })

        $('input:text').autoNumeric("init", {mDec: getDecimal});

        $('#buyPrice').autoNumeric('set', $('#buyPrice').val());
        $('#sellPrice').autoNumeric('set', $('#sellPrice').val());

        $(".chosen-select").chosen();
    });
</script>

</body>
</html>