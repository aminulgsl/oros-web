<%@ page import="com.gsl.oros.core.banking.settings.Country" %>
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
    <g:hasErrors bean="${currencys}">
        <div class='alert alert-success '>
            <ul>
                <g:eachError var="err" bean="${currencys}">
                    <li><g:message error="${err}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>
    <div class="widget-box">
        <div class="widget-header">
            <h4 class="smaller"><g:message code="coreBanking.settings.currency.title" default="Create Currency"/></h4>
        </div>

        <div class="widget-body">
            <div class="widget-main">

                <g:form class="form-horizontal" id="currencyForm" name="currencyForm"
                        method="post" role="form" url="[action: 'save', controller: 'currency']"
                        onsubmit="return false;">

                    <g:hiddenField name="id" value="${currencys?.id}"/>

                    <div class="form-group ${hasErrors(bean: currencys, field: 'name', 'has-error')}">
                        <label class="control-label col-md-3 no-padding-right" for="name">
                            <g:message code="coreBanking.settings.currency.name.label"
                                       default="Currency Name"/> *</label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">
                                <input type="text" id="name" name="name" value="${currencys?.name}"
                                       placeholder="Currency Name">
                            </div>
                        </div>
                    </div>


                    <div class="form-group ${hasErrors(bean: currencys, field: 'abbreviation', 'has-error')}">
                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="abbreviation">
                            <g:message code="coreBanking.settings.currency.abbreviation.label"
                                       default="Currency Abbreviation "/> *</label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">
                                <input type="text" id="abbreviation" name="abbreviation"
                                       value="${currencys?.abbreviation}"
                                       placeholder="Currency Abbreviation">
                            </div>
                        </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: currencys, field: 'symbol', 'has-error')}">
                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="symbol">
                            <g:message code="coreBanking.settings.currency.Symbol.label"
                                       default="Currency Symbol"/> *</label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">
                                <input type="text" id="symbol" name="symbol" value="${currencys?.symbol}"
                                       placeholder="Currency Symbol">
                            </div>
                        </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: currencys, field: 'country', 'has-error')}">
                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="country">
                            <g:message code="default.country.label" default="Country "/> *</label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">

                                <g:select id="country" name='country' required="" class="width-80"
                                          noSelection="${['': 'Select Country...']}"
                                          from='${Country.findAllByStatus(true)}'
                                          value="${currencys?.country?.id}"
                                          optionKey="id" optionValue="name"></g:select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: currencys, field: 'hundredName', 'has-error')}">
                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="hundredName">
                            <g:message code="coreBanking.settings.currency.hundredName.label"
                                       default="Hundred Name "/> *</label>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">
                                <input type="text" id="hundredName" name="hundredName"
                                       value="${currencys?.hundredName}"
                                       placeholder="Currency Hundred Name">
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
                            <g:if test="${currencys?.id}">
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
    $('#currencyForm').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            name: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            abbreviation: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            symbol: {
                required: true,
                minlength: 1,
                maxlength: 3
            },
            countryId: {
                required: true
            },
            hundredName: {
                required: true,
                minlength: 5,
                maxlength: 10
            }
        },
        messages: {
            name: {
                required: " "
            },
            abbreviation: {
                required: " "
            },
            symbol: {
                required: " "
            },
            countryId: {
                required: " "
            },
            hundredName: {
                required: " "
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#currencyForm')).show();
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
                url: "${createLink(controller: 'currency', action: 'save')}",
                type: 'post',
                data: $("#currencyForm").serialize(),
                success: function (data) {
                    $('#page-content').html(data);
                },
                failure: function (data) {
                }
            })

        }
    });
</script>
</body>
</html>