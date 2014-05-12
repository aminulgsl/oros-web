<%@ page import="com.gsl.cbs.contraints.enums.DefaultVat; com.gsl.cbs.contraints.enums.PaymentTerm" %>
<div class="row">
    <div class="col-xs-12">

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="taxNo">
                    <g:message code="coreBanking.setting.bankSetup.taxCertificationNo" default="Tax Certificate No "/>
                </label>

                <input type="text" class="form-control" id="taxNo" name="taxNo"
                       value="${bankSetupData?.taxNo}" placeholder="EnterTaxCertificate">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="vatNo">
                    <g:message code="coreBanking.setting.bankSetup.vatCertificateNo" default="Vat Certificate No"/>
                </label>

                <input type="text" class="form-control" id="vatNo"
                       value="${bankSetupData?.vatNo}" name="vatNo" placeholder="Enter Vat Certificate">
            </div>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="paymentTerm">
                    <g:message code="coreBanking.setting.bankSetup.paymentTerm" default="Payment Term "/> *
                </label>

                <g:select name="paymentTerm" id="paymentTerm" class="form-control" required=""
                          noSelection="['': 'Choose Payment Term']"
                          from="${PaymentTerm.values()}"
                          value="${bankSetupData?.paymentTerm}"
                          optionKey="value" optionValue="key"></g:select>
            </div>
        </div>

    </div>

    <div class="col-xs-12">
        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="defaultVat">
                    <g:message code="coreBanking.setting.bankSetup.defaultVat" default="Default Vat"/>
                </label>

                <g:select name="defaultVat" id="defaultVat" class="form-control"
                          noSelection="['': 'Choose Default Vat']"
                          from="${DefaultVat.values()}"
                          value="${bankSetupData?.defaultVat}"
                          optionKey="value" optionValue="value"></g:select>

            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group ">
                <label for="incomeTaxReservation">
                    <g:message code="coreBanking.setting.bankSetup.taxReservation" default="Tax Reservation "/> *
                </label>

                <input type="text" required="" class="form-control" id="incomeTaxReservation"
                       value="${bankSetupData?.incomeTaxReservation}" name="incomeTaxReservation"
                       placeholder="Enter Tax Reservation">
            </div>

        </div>

        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="unforeseenExpenseReservation">
                    <g:message code="coreBanking.setting.bankSetup.unseenExpReserve" default="Unseen Exp. Reserve "/>
                </label>

                <input type="text" required="" class="form-control" id="unforeseenExpenseReservation"
                       name="unforeseenExpenseReservation"
                       value="${bankSetupData?.unforeseenExpenseReservation}" placeholder="Enter Unseen Exp. Reserve">
            </div>

        </div>

    </div>

    <div class="col-xs-12">
        <div class="col-md-4 col-sm-4">
            <div class="form-group">
                <label for="invoiceMoment">
                    <g:message code="coreBanking.setting.bankSetup.invoiceMoment" default="Invoice S. Moment "/> *
                </label>

                <select class="form-control" name="invoiceMoment" required="" id="invoiceMoment">
                    <option value="Invoice">Invoice S. Moment</option>
                </select>
            </div>
        </div>
    </div>

</div>