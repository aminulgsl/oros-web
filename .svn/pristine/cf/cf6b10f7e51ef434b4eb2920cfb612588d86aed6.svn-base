<%@ page import="com.gsl.oros.core.banking.settings.State; com.gsl.oros.core.banking.settings.Country" %>
<html>
<head></head>

<body>
<p>
    <input class="ace" type="checkbox" name="payType" id="accSame" value="1">
    <span class="lbl">Same As Contact Address</span>

   %{-- <input type="checkbox" class="ace" name="payType" id="accDifferent" value="2">
    <span class="lbl">Different From General Address</span>--}%
</p>
&nbsp;


<g:form name="AccountHolderPostalAddressForm" id="AccountHolderPostalAddressForm" method="post" role="form"
        class="form-horizontal" url="[action: 'savePostalAddress', controller: 'accountHolderInfo']">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <div class="col-xs-6 col-sm-6 col-md-6">
                <g:hiddenField name="id" value="${accountHolder?.id}"/>
                <g:hiddenField name="postalAddressId" value="${postalAddress?.id}"/>

                <div class="form-group">
                    <label for="AccholderContactPersonName" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.generalAddress.contactPersonName"
                                   default="Contact Person Name"/><span class="red">*</span>
                    </label>

                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Contact Person Name"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Contact Person Name'"
                                   id="AccholderContactPersonName"
                                   name="contactPersonName" value="${postalAddress?.contactPersonName}">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="AccholderAddressLine2" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.generalAddress.addressLine2"
                                   default="Address Line2"/>
                    </label>

                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <textarea class="col-sm-11 col-xs-12" placeholder="Second Postal Address"
                                      onfocus="this.placeholder = ''"
                                      onblur="this.placeholder = 'Second Postal Address'" id="AccholderAddressLine2"
                                      name="addressLine2">${postalAddress?.addressLine2}</textarea>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="accpostalAddressState" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="default.state.label" default="State"/>
                    </label>

                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <g:select id="accpostalAddressState" name='state' class="col-sm-11 col-xs-12"
                                      noSelection="${['': 'Select State...']}"
                                      from='${postalAddress?.country != null ? State.findAllByCountry(postalAddress?.country) : State.findAllByCountry(postalAddress?.country)}'
                                      value="${postalAddress?.state?.id}"
                                      optionKey="id" optionValue="name">
                            </g:select>

                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="AccholderPostCode" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="default.address.postCode.label" default="Post Code"/><span class="red">*</span>
                    </label>

                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Postal Postcode"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Postal Postcode'"
                                   id="AccholderPostCode"
                                   name="postCode" value="${postalAddress?.postCode}">
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-xs-6 col-sm-6 col-md-6">

                <div class="form-group">
                    <label for="AccholderAddressLine1" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.generalAddress.addressLine1"
                                   default="Address Line1"/>
                    </label>

                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <textarea class="col-sm-11 col-xs-12" placeholder="First Postal Address"
                                      onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Postal Address'"
                                      id="AccholderAddressLine1"
                                      name="addressLine1">${postalAddress?.addressLine1}</textarea>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="accountHolderPostalAddressCountry"
                           class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="default.country.label" default="Country"/><span class="red">*</span>
                    </label>

                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <g:select id="accountHolderPostalAddressCountry" name='country' class="col-sm-11 col-xs-12"
                                      noSelection="${['': 'Select Country...']}"
                                      from='${Country.findAllByStatus(true)}' value="${postalAddress?.country?.id}"
                                      optionKey="id" optionValue="name">
                            </g:select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="AccholderCity" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="default.city.label" default="City"/><span class="red">*</span>
                    </label>

                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <input type="text" class="col-sm-11 col-xs-12" placeholder="Postal City"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Postal City'"
                                   id="AccholderCity"
                                   name="city" value="${postalAddress?.city}">
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="AccholderStatus" class="col-sm-4 col-xs-6 control-label no-padding-right">
                        <g:message code="coreBanking.accounting.vendor.basicInfo.status" default="Status"/>
                    </label>

                    <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                            <select id="AccholderStatus" class="col-sm-11 col-xs-12" name="status">
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <div class="clearfix form-actions">
        <div class="col-md-offset-10 col-md-2">
            <g:if test='${postalAddress?.id != null}'>
                <button class="btn btn-primary btn-sm" type="submit" name="updateAccountHolderPostalAddress"
                        id="updateAccountHolderPostalAddress">Update</button>
            </g:if>
            <g:else>
                <button class="btn btn-primary btn-sm" type="submit" name="saveAccountHolderPostalAddress"
                        id="saveAccountHolderPostalAddress">Next</button>
            </g:else>
        %{--<g:actionSubmit class="btn btn-primary btn-sm"  name="create" value="Create" id="button-create" controller="" action="" />--}%
        %{--<button class="btn btn-primary btn-sm" type="submit" name="saveAccountHolderPostalAddress" id="saveAccountHolderPostalAddress">Next</button>--}%
        </div>
    </div>
</g:form>

<script type="text/javascript">

    $('#accSame').attr('checked', false).change(function () {
        if (this.checked) {
            $('#AccholderContactPersonName').val('${generalAddress?.contactPersonName}');
            $('#AccholderAddressLine2').val('${generalAddress?.addressLine2}');
            $('#AccholderAddressLine1').val('${generalAddress?.addressLine1}');
            $('#accountHolderPostalAddressCountry').val('${generalAddress?.country?.id}');
            var stateid = '${generalAddress?.state?.id}';
            var statename = '${generalAddress?.state?.name}';
            $('#accpostalAddressState').find("option").remove();
            // Create option
            var $option = $("<option />");
            // Add value and text to option
            $option.attr("value", stateid).text(statename);
            // Add option to drop down list
            $('#accpostalAddressState').append($option);

            $('#AccholderPostCode').val('${generalAddress?.postCode}');
            $('#AccholderCity').val('${generalAddress?.city}');
        }else{
            $('#AccholderContactPersonName').val('');
            $('#AccholderAddressLine2').val('');
            $('#AccholderAddressLine1').val('');
            $('#accountHolderPostalAddressCountry').val('');
            $('#accpostalAddressState').val('');
            $('#AccholderPostCode').val('');
            $('#AccholderCity').val('');
        }
    });


    $("#accountHolderPostalAddressCountry").change(function () {
        var id = $(this).val();
        $.ajax({
            type: "POST",
            url: "${createLink(controller: "accountHolderInfo",action: "stateList")}",
            data: {country: id},
            cache: false,
            success: function (html) {
                $("#accpostalAddressState").html(html);
            }
        });
    });

    $('#AccountHolderPostalAddressForm').validate({

        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            contactPersonName: {
                required: true
            },
            postCode: {
                required: true
            },
            city: {
                required: true
            },
            country: {
                required: true

            }
        },

        messages: {
            contactPersonName: {
                required: " "
            },
            postCode: {
                required: " "
            },
            city: {
                required: " "
            },
            country: {
                required: " "

            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('.loginForm')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },
        errorPlacement: function (error, element) {
            if (element.is(':checkbox') || element.is(':radio')) {
                var controls = element.closest('div[class*="col-"]');
                if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            }
            else if (element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            }
            else if (element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            }
            else error.insertAfter(element.parent());
        },
        submitHandler: function (form) {
            $.ajax({
                url: "${createLink(controller: 'accountHolderInfo', action: 'savePostalAddress')}",
                type: 'post',
                data: $("#AccountHolderPostalAddressForm").serialize(),
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

