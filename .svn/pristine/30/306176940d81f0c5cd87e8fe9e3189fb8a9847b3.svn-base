<style>
#sample-table-2_length label{width: inherit;}
</style>

<g:form id="customerAccountInfoForm" name="customerAccountInfoForm" method="post" role="form" class="form-inline"  onSubmit="return false;">

    <g:hiddenField name="id" id="id" value="${bankAccountInfo?.id}"/>
    <g:hiddenField name="customerId" id="customerId" value="${customerMaster?.id}"/>
    <g:hiddenField name="generalAddressId" id="generalAddressId" value="${generalAddress?.id}"/>
    <g:hiddenField name="postalAddressId" id="postalAddressId" value="${postalAddress?.id}"/>
    <g:hiddenField name="shippingAddressId" id="shippingAddressId" value="${shippingAddress?.id}"/>

    <div class="form-group ${hasErrors(bean:customerBankAccountCommand,field:'bankAccountName','has-error')}">
        <label for="bankName">Bank Name*</label>
        <input type="text" placeholder="Enter Bank Name"
               id="bankName" name="bankName"  value="${bankAccountInfo?.bankName}">
    </div>
    <div class="form-group ${hasErrors(bean:customerBankAccountCommand,field:'ibanPrefix','has-error')}">
        <label for="ibanPrefix">Iban Prefix*</label>
        <input type="text" placeholder="Enter Iban Prefix"
               id="ibanPrefix" name="ibanPrefix"  value="${bankAccountInfo?.ibanPrefix}">
    </div>
    <div class="form-group ${hasErrors(bean:customerBankAccountCommand,field:'bankAccountNo','has-error')}">
        <label for="bankAccountNo">Bank Account Number*</label>
        <input type="text" placeholder="Enter Bank Account Number"
               id="bankAccountNo" name="bankAccountNo"  value="${bankAccountInfo?.bankAccountNo}">
    </div>
    <div class="form-group ${hasErrors(bean:customerBankAccountCommand,field:'bankAccountName','has-error')}">
        <label for="bankAccountName">Bank Account Name*</label>
        <input type="text" placeholder="Enter Bank Account Name"
               id="bankAccountName" name="bankAccountName"  value="${bankAccountInfo?.bankAccountName}">
    </div>
    <div class="form-group ${hasErrors(bean:customerBankAccountCommand,field:'status','has-error')}">
        <label for="status">Bank Account Status</label>
        <select name="status" id="status">
            <option value="1" ${bankAccountInfo?.status == 1 ? 'selected' : ''}>Active</option>
            <option value="0" ${bankAccountInfo?.status == 0 ? 'selected' : ''}>Inactive</option>
        </select>
    </div>
    <div class="clearfix form-actions align-right">
        <g:if test="${customerMaster?.bankAccounts}">
            <button type="submit" id="bankAccountSubmit" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Add More</button>
        </g:if>
        <g:else>
            <button type="submit" id="bankAccountSubmit" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Add</button>
        </g:else>
    </div>
</g:form>

<div class= "row" id="bankAccountListDiv">
    <g:render template="/coreBanking/settings/accounting/customer/bankAccountList"/>
</div>
