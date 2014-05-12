
<g:hasErrors bean="${customerMaster}">
    <div class='alert alert-success '>
        <ul>
            <g:eachError var="err" bean="${customerMaster}">
                <li><g:message error="${err}" /></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>

<g:form name="customerBasicForm" method="post" role="form" class="form-inline" onSubmit="return false;">

    <g:hiddenField name="id" id="id" value="${customerMaster?.id}"/>
    <g:hiddenField name="generalAddressId" id="generalAddressId" value="${generalAddress?.id}"/>
    <g:hiddenField name="postalAddressId" id="postalAddressId" value="${postalAddress?.id}"/>
    <g:hiddenField name="shippingAddressId" id="shippingAddressId" value="${shippingAddress?.id}"/>
    <g:hiddenField name="bankAccountId" id="bankAccountId" value="${savedBankAccount?.id}"/>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'customerCode','has-error')}">
        <label for="customerCode">Customer Code*</label>
        <input id="customerCode" name="customerCode" type="text" placeholder="Enter Customer Code"
               value="${customerMaster?.customerCode}" ${customerMaster?.id != null ? 'disabled' : ''} />
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'customerName','has-error')}">
        <label for="customerName">Customer Name*</label>
        <input id="customerName" name="customerName" type="text" placeholder="Enter Customer Name"
               value="${customerMaster?.customerName}">
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'gender','has-error')}">
        <label for="gender">Gender</label>
        <select name="gender" id="gender">
            <option value="Male" ${customerMaster?.gender == "Male" ? 'selected' : ''}>Male</option>
            <option value="Female" ${customerMaster?.gender == "Female" ? 'selected' : ''}>Female</option>
        </select>
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'bankName','has-error')}">
        <label for="bankName">Bank Name</label>
        <input id="bankName" name="bankName" type="text" placeholder="Enter Bank Name" value="${customerMaster?.bankName}">
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'firstName','has-error')}">
        <label for="firstName">First Name</label>
        <input id="firstName" name="firstName" type="text" placeholder="Enter First Name" value="${customerMaster?.firstName}">
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'middleName','has-error')}">
        <label for="middleName">Middle Name</label>
        <input id="middleName" name="middleName" type="text" placeholder="Enter Middle Name" value="${customerMaster?.middleName}">
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'lastName','has-error')}">
        <label for="lastName">Last Name</label>
        <input id="lastName" name="lastName" type="text" placeholder="Enter Last Name" value="${customerMaster?.lastName}">
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'email','has-error')}">
        <label for="email">Email</label>
        <input id="email" name="email" type="email" placeholder="Enter Email" value="${customerMaster?.email}">
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'defaultGlAccount','has-error')}">
        <label for="defaultGlAccount">Default Gl Account</label>
        <select name="defaultGlAccount" id="defaultGlAccount">
            <option value="1" ${customerMaster?.defaultGlAccount == "1" ? 'selected' : ''}>8000 Sales Tax Services</option>
            <option value="2" ${customerMaster?.defaultGlAccount == "2" ? 'selected' : ''}>9000 Sales Tax Services</option>
        </select>
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'momentOfSending','has-error')}">
        <label for="momentOfSending">Moment Of Sending</label>
        <input id="momentOfSending" name="momentOfSending" type="text" placeholder="Enter Moment Of Sending" value="${customerMaster?.momentOfSending}">
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'chamberOfCommerce','has-error')}">
        <label for="chamberOfCommerce">Chamber of Commerce</label>
        <input type="text" placeholder="Enter Chamber of Commerce" id="chamberOfCommerce" name="chamberOfCommerce"
               value="${customerMaster?.chamberOfCommerce}">
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'customerType','has-error')}">
        <label for="customerType">Customer Type*</label>
        <select name="customerType" id="customerType">
            <option value="">- Choose One -</option>
            <option value="Regular Customer" ${customerMaster?.customerType == "Regular Customer" ? 'selected' : ''}>Regular Customer</option>
            <option value="Guest Customer" ${customerMaster?.customerType == "Guest Customer" ? 'selected' : ''}>Guest Customer</option>
        </select>
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'vat','has-error')}">
        <label for="vat">Vat</label>
        <select name="vat" id="vat">
            <option value="">- Choose One -</option>
            <g:each var="vat" in="${vatList}">
                <option value="${vat.id}" ${customerMaster?.vat?.id == vat?.id ? 'selected' : ''}>${vat.name} (${vat.rate})</option>
            </g:each>
        </select>
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'comments','has-error')}">
        <label for="comments">Comments</label>
        <g:textArea name="comments" id="comments" placeholder="Comments" value="${customerMaster?.comments}" />
    </div>
    <div class="form-group ${hasErrors(bean:customerMaster,field:'paymentTerm','has-error')}">
        <label for="paymentTerm">Payment Term*</label>
        <select name="paymentTerm" id="paymentTerm">
            <option value="">- Choose One -</option>
            <g:each var="paymentTerm" in="${paymentTermsList}">
                <option value="${paymentTerm.id}" ${customerMaster?.paymentTerm?.id == paymentTerm?.id ? 'selected' : ''}>${paymentTerm.paymentTermName}</option>
            </g:each>
        </select>
    </div>
    <div class="form-group">
        <label for="status">Status</label>
        <select name="status" id="status">
            <option value="1" ${customerMaster?.status == 1 ? 'selected' : ''}>Active</option>
            <option value="0" ${customerMaster?.status == 0 ? 'selected' : ''}>Inactive</option>
        </select>
    </div>

    <div class="clearfix form-actions align-right">
        <g:if test="${customerMaster?.id}">
            <button type="submit" id="basicSubmit" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Update</button>
        </g:if>
        <g:else>
            <button type="submit" id="basicSubmit" class="btn btn-info">
                <i class="icon-ok bigger-110"></i>Create</button>
        </g:else>
    %{--<input type="submit" id="basicSubmit" value="${customerMaster?.id ? 'Update' : 'Create'}"--}%
    %{--class="btn btn-info"/>--}%
    </div>
</g:form>