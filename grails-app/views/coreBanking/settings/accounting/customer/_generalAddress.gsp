<%@ page import="com.gsl.oros.core.banking.settings.State; com.gsl.oros.core.banking.settings.Country" %>

<g:form name="customerGeneralAddressForm" id="customerGeneralAddressForm" method="post" role="form" class="form-inline" onSubmit="return false;">

    <g:hiddenField name="customerId" id="customerId" value="${customerMaster?.id}"/>
    <g:hiddenField name="id" id="id" value="${generalAddress?.id}"/>
    <g:hiddenField name="postalAddressId" id="postalAddressId" value="${postalAddress?.id}"/>
    <g:hiddenField name="shippingAddressId" id="shippingAddressId" value="${shippingAddress?.id}"/>
    <g:hiddenField name="bankAccountId" id="bankAccountId" value="${savedBankAccount?.id}"/>

    <div class="form-group ${hasErrors(bean:addressCommand,field:'contactPersonName','has-error')}">
        <label for="contactPersonName">Contact Person Name*</label>
        <input type="text" id="contactPersonName" name="contactPersonName" placeholder="Enter Contact Person Name"
               value="${generalAddress?.contactPersonName}" />
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'contactPersonReference','has-error')}">
        <label for="contactPersonReference">Contact Person Reference</label>
        <input type="text" placeholder="Enter Contact Person Reference" id="contactPersonReference" name="contactPersonReference"
               value="${generalAddress?.contactPersonReference}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'contactDealType','has-error')}">
        <label for="contactDealType">Contact Deal Type</label>
        <select name="contactDealType" id="contactDealType">
            <option value="1" ${generalAddress?.contactDealType == "1" ? 'selected' : ''}>Account</option>
            <option value="2" ${generalAddress?.contactDealType == "2" ? 'selected' : ''}>Credit Card</option>
        </select>
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'mobileNo','has-error')}">
        <label for="mobileNo">Mobile No</label>
        <input type="text" placeholder="Enter Mobile No" id="mobileNo" name="mobileNo"
               value="${generalAddress?.mobileNo}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'faxNo','has-error')}">
        <label for="faxNo">Fax</label>
        <input type="text" placeholder="Enter First Name" id="faxNo" name="faxNo"
               value="${generalAddress?.faxNo}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'phoneNo','has-error')}">
        <label for="phoneNo">Phone No</label>
        <input type="text" placeholder="Enter Phone No" id="phoneNo" name="phoneNo"
               value="${generalAddress?.phoneNo}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'websiteUrl','has-error')}">
        <label for="websiteUrl">Website Address</label>
        <input type="text" placeholder="Enter Website Address" id="websiteUrl" name="websiteUrl"
               value="${generalAddress?.websiteUrl}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'addressLine1','has-error')}">
        <label for="addressLine1">Address Line1</label>
        <g:textArea name="addressLine1" id="addressLine1" placeholder="Address Line1" value="${generalAddress?.addressLine1}" />
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'addressLine2','has-error')}">
        <label for="addressLine2">Address Line2</label>
        <g:textArea name="addressLine2" id="addressLine2" placeholder="Address Line2" value="${generalAddress?.addressLine2}" />
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'email2','has-error')}">
        <label for="email2">Second Email</label>
        <input type="email" placeholder="Enter Second Email" id="email2" name="email2"
               value="${generalAddress?.email2}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'country','has-error')}">
        <label for="country">Country*</label>
        <g:select id="generalAddCountry" name='country'
                  noSelection="${['': 'Select Country...']}"
                  from='${Country.findAllByStatus(true)}'
                  value="${generalAddress?.country?.id}"
                  optionKey="id" optionValue="name">
        </g:select>
        %{--<select name="country" id="country">--}%
        %{--<option value="">- Choose One -</option>--}%
        %{--<g:each var="country" in="${countryList}">--}%
        %{--<option value="${country.id}" ${generalAddress?.country?.id == country?.id ? 'selected' : ''}>${country.name}</option>--}%
        %{--</g:each>--}%
        %{--</select>--}%
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'state','has-error')}">
        <label for="state">State*</label>
        <g:select id="state" name='state'
                  noSelection="${['': 'Select State...']}"
                  from='${generalAddress?.country != null ? State.findAllByCountry(generalAddress?.country) : State.findAllByCountry(generalAddress?.country)}'
                  value="${generalAddress?.state?.id}"
                  optionKey="id" optionValue="name">
        </g:select>
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'city','has-error')}">
        <label for="city">City*</label>
        <input type="text" placeholder="Enter City" id="city" name="city" value="${generalAddress?.city}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'postCode','has-error')}">
        <label for="postCode">Post Code*</label>
        <input type="text" placeholder="Enter Post Code" id="postCode" name="postCode"
               value="${generalAddress?.postCode}">
    </div>
    <div class="form-group ${hasErrors(bean:addressCommand,field:'status','has-error')}">
        <label for="status">Status</label>
        <select name="status" id="status">
            <option value="1" ${generalAddress?.status == 1 ? 'selected' : ''}>Active</option>
            <option value="0" ${generalAddress?.status == 0 ? 'selected' : ''}>Inactive</option>
        </select>
    </div>

    <div class="clearfix form-actions align-right">
        <g:if test="${generalAddress?.id}">
            <button type="submit" id="basicSubmit" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Update</button>
        </g:if>
        <g:else>
            <button type="submit" id="basicSubmit" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Create</button>
        </g:else>
    %{--<input type="submit" id="generalSubmit" value="${generalAddress?.id ? 'Update' : 'Create'}"--}%
    %{--class="btn btn-info"/>--}%
    </div>
</g:form>

<script type="text/javascript">
    $(".chosen-select").chosen();
    $("#generalAddCountry").change(function () {
        var id = $(this).val();
        $.ajax
        ({
            type: "POST",
            url: "${createLink(controller: "customer",action: "stateList")}",
            data: {country: id},
            cache: false,
            success: function (html) {
                $("#state").html(html);
            }
        });
    });

</script>

