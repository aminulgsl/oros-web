<div class="col-xs-12 col-md-12 col-sm-12 col-lg-12">
    <div class="col-md-6">
        <div class="form-group">
            <label class="col-md-4 control-label no-padding-right" for="creditCardHolderFirstName">Credit Card Holder First Name:</label>
            <div class="col-md-8">
                <input id="creditCardHolderFirstName" class="col-md-12" type="text"
                       name="creditCardHolderFirstName" placeholder="Credit Card Holder First Name" required>
            </div>
        </div>


        <div class="form-group">
            <label class="col-md-4 control-label no-padding-right" for="creditCardHolderLastName">Last Name:</label>
            <div class="col-md-8">
                <input id="creditCardHolderLastName" class="col-md-12" type="text"
                       name="creditCardHolderLastName" placeholder="Last Name" onfocus="this.placeholder=''" onblur="this.placeholder = 'Last Name'" required>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label no-padding-right" for="creditCardExpiredDate">Expired Date:</label>
            <div class="col-md-8">
                <input id="creditCardExpiredDate" class="col-md-12" type="text" name="creditCardExpiredDate"
                       placeholder="Expired Date" onfocus="this.placeholder=''" onblur="this.placeholder = 'Expired Date'" required="">
            </div>
        </div>


        <div class="form-group">
            <label class="col-md-4 control-label no-padding-right" for="creditCardSecurityCode">Security Code:</label>
            <div class="col-md-8">
                <input id="creditCardSecurityCode" class="col-md-12" type="text" name="creditCardSecurityCode"
                       placeholder="Security Code" onfocus="this.placeholder=''" onblur="this.placeholder = 'Security Code'" required>
            </div>
        </div>
    </div>

    <div class="" style="" id="creditCardResult">
        <div id="creditErrorMessage">
        </div>
    </div>
</div>