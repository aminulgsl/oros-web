<%@ page import="com.gsl.oros.core.banking.settings.State; com.gsl.oros.core.banking.settings.Country" %>
<style>
input[type="checkbox"]{width: 15px;margin: 2px 10px 0 0;}
</style>
<g:form name="customerPostalAddressForm" id="customerPostalAddressForm" method="post" role="form" class="form-inline" onSubmit="return false;">

    <g:hiddenField name="customerId" id="customerId" value="${customerMaster?.id}"/>
    <g:hiddenField name="generalAddressId" id="generalAddressId" value="${generalAddress?.id}"/>
    <g:hiddenField name="id" id="id" value="${postalAddress?.id}"/>
    <g:hiddenField name="shippingAddressId" id="shippingAddressId" value="${shippingAddress?.id}"/>
    <g:hiddenField name="bankAccountId" id="bankAccountId" value="${savedBankAccount?.id}"/>

    <div class="clearfix">
        <div class="form-group">
            <input type="checkbox" name="likeGeneralAddress" id="likeGeneralAddress" class="pull-left">
            <label for="likeGeneralAddress" class="pull-left">As like general address</label>
        </div>
    </div>


    <div class="form-group ${hasErrors(bean:addressCommand,field:'contactPersonName','has-error')}">
        <label for="contactPersonName">Contact Person Name*</label>
        <input type="text" placeholder="Enter Contact Person Name"
               id="contactPersonName" name="contactPersonName" value="${postalAddress?.contactPersonName}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'addressLine2','has-error')}">
        <label for="addressLine1">Address Line1</label>
        <g:textArea name="addressLine1" id="addressLine1" placeholder="Enter Address Line1" value="${postalAddress?.addressLine1}" />
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'contactPersonName','has-error')}">
        <label for="addressLine2">Address Line2</label>
        <g:textArea name="addressLine2" id="addressLine2" placeholder="Enter Address Line2" value="${postalAddress?.addressLine2}" />
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'country','has-error')}">
        <label for="country">Country*</label>
        <g:select id="postalAddCountry" name='country'
                  noSelection="${['': 'Select Country...']}"
                  from='${Country.findAllByStatus(true)}'
                  value="${postalAddress?.country?.id}"
                  optionKey="id" optionValue="name">
        </g:select>
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'state','has-error')}">
        <label for="state">State*</label>
        <g:select id="postalState" name='state'
                  noSelection="${['': 'Select State...']}"
                  from='${postalAddress?.country != null ? State.findAllByCountry(postalAddress?.country) : State.findAllByCountry(postalAddress?.country)}'
                  value="${postalAddress?.state?.id}"
                  optionKey="id" optionValue="name">
        </g:select>
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'city','has-error')}">
        <label for="city">City*</label>
        <input type="text" placeholder="Enter Postal City" id="city" name="city" value="${postalAddress?.city}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'postCode','has-error')}">
        <label for="postCode">Post Code*</label>
        <input type="text" placeholder="Enter Post Code" id="postCode" name="postCode" value="${postalAddress?.postCode}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'status','has-error')}">
        <label for="status">Status</label>
        <select name="status" id="status">
            <option value="1" ${postalAddress?.status == 1 ? 'selected' : ''}>Active</option>
            <option value="0" ${postalAddress?.status == 0 ? 'selected' : ''}>Inactive</option>
        </select>
    </div>

    <div class="clearfix form-actions align-right">
        <g:if test="${postalAddress?.id}">
            <button type="submit" id="basicSubmit" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Update</button>
        </g:if>
        <g:else>
            <button type="submit" id="basicSubmit" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Create</button>
        </g:else>
    </div>
</g:form>

<script type="text/javascript">
    $(".chosen-select").chosen();
    $(document).ready(function () {
        $('#likeGeneralAddress').change(function() {
            if($(this).is(":checked")) {
//                var contactPerson = $('#customerGeneralAddressForm :input#contactPersonName').val();
//                var addressLine1 = $('#customerGeneralAddressForm :input#addressLine1').val();
//                var addressLine2 = $('#customerGeneralAddressForm :input#addressLine2').val();
//                var country = $('#customerGeneralAddressForm :input#generalAddCountry').val();
//                var state = $('#customerGeneralAddressForm :input#state').val();
//                var city = $('#customerGeneralAddressForm :input#city').val();
//                var postCode = $('#customerGeneralAddressForm :input#postCode').val();


                $('#customerPostalAddressForm :input#contactPersonName').val('${generalAddress?.contactPersonName}');
                $('#customerPostalAddressForm :input#addressLine1').val('${generalAddress?.addressLine1}');
                $('#customerPostalAddressForm :input#addressLine2').val('${generalAddress?.addressLine2}');
                $('#customerPostalAddressForm :input#postalAddCountry').val('${generalAddress?.country?.id}');
                $('#customerPostalAddressForm :input#postalState').val('${generalAddress?.state?.id}');
                $('#customerPostalAddressForm :input#city').val('${generalAddress?.city}');
                $('#customerPostalAddressForm :input#postCode').val('${generalAddress?.postCode}');
            } else{
                $('#customerPostalAddressForm :input#contactPersonName').val('${postalAddress?.contactPersonName}');
                $('#customerPostalAddressForm :input#addressLine1').val('${postalAddress?.addressLine1}');
                $('#customerPostalAddressForm :input#addressLine2').val('${postalAddress?.addressLine2}');
                $('#customerPostalAddressForm :input#postalAddCountry').val('${postalAddress?.country?.id}');
                $('#customerPostalAddressForm :input#postalState').val('${postalAddress?.state?.id}');
                $('#customerPostalAddressForm :input#city').val('${postalAddress?.city}');
                $('#customerPostalAddressForm :input#postCode').val('${postalAddress?.postCode}');
            }
        });
    });
    $("#postalAddCountry").change(function () {
        var id = $(this).val();
        $.ajax
        ({
            type: "POST",
            url: "${createLink(controller: "customer",action: "stateList")}",
            data: {country: id},
            cache: false,
            success: function (html) {
                $("#postalState").html(html);
            }
        });
    });

</script>
