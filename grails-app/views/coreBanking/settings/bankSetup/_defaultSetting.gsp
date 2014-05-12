<%@ page import="com.gsl.cbs.contraints.enums.ShowGlAndItemCode;  com.gsl.cbs.contraints.enums.ThousandSeparator; com.gsl.cbs.contraints.enums.TaxType; com.gsl.cbs.contraints.enums.ReportPageSize; com.gsl.cbs.contraints.enums.BookingPeriod; com.gsl.cbs.contraints.enums.Language; com.gsl.cbs.contraints.enums.DecimalSeparator; com.gsl.cbs.contraints.enums.DecimalRoundType; com.gsl.cbs.contraints.enums.DateSeparator; com.gsl.cbs.contraints.enums.DecimalPoint; com.gsl.cbs.contraints.enums.DateFormat; com.gsl.oros.core.banking.settings.Currencys" %>


<div class="row">
<div class="col-xs-12">

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="currencys">
                <g:message code="default.currency.label" default="Default Currency "/> *
            </label>

            <g:select id="currencys" name='currencys' class="form-control" required=""
                      noSelection="${['': 'Select Currency...']}"
                      from='${Currencys.list(sort: 'id')}'
                      value="${bankSetupData?.currencys?.id}"
                      optionKey="id" optionValue="name"></g:select>
        </div>

    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="bankDateFormat">
                <g:message code="coreBanking.setting.bankSetup.dateFormate" default="B.Date Format "/> *</label>

            <g:select name="bankDateFormat" id="bankDateFormat" class="form-control" required=""
                      noSelection="['': 'Choose Date Formate']"
                      from="${DateFormat.values()}"
                      value="${bankSetupData?.bankDateFormat}"
                      optionKey="value" optionValue="value"></g:select>
        </div>

    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="amntDeciPoint">
                <g:message code="coreBanking.setting.bankSetup.amntDeciPoint" default="Amnt.Deci.Point "/> *</label>

            <g:select name="amntDeciPoint" id="amntDeciPoint" class="form-control" required=""
                      noSelection="['': 'Choose Amnt Deci Point']"
                      from="${DecimalPoint.values()}"
                      value="${bankSetupData?.amntDeciPoint}"
                      optionKey="value" optionValue="value"></g:select>

        </div>

    </div>

</div>

<div class="col-xs-12">
    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="dateSeparator">
                <g:message code="coreBanking.setting.bankSetup.dateSeperator" default="Date Seperator "/>  *</label>

            <g:select name="dateSeparator" id="dateSeparator" class="form-control" required=""
                      noSelection="['': 'Choose Date Seperator']"
                      from="${DateSeparator.values()}"
                      value="${bankSetupData?.dateSeparator}"
                      optionKey="value" optionValue="value"></g:select>
        </div>

    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group ">
            <label for="deciRoundType">
                <g:message code="coreBanking.setting.bankSetup.deciRoundType" default="Deci Round Type "/>  *</label>

            <g:select name="deciRoundType" id="deciRoundType" class="form-control" required=""
                      noSelection="['': 'Chose A Round Type']"
                      from="${DecimalRoundType.values()}"
                      value="${bankSetupData?.deciRoundType}"
                      optionKey="value" optionValue="value"></g:select>
        </div>

    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="decimalSeparator">
                <g:message code="coreBanking.setting.bankSetup.decimalSeprator" default="Decimal Seprator "/>  *</label>

            <g:select name="decimalSeparator" id="decimalSeparator" class="form-control" required=""
                      noSelection="['': 'Chose A Decimal Separator']"
                      from="${DecimalSeparator.values()}"
                      value="${bankSetupData?.decimalSeparator}"
                      optionKey="value" optionValue="value"></g:select>
        </div>

    </div>

</div>

<div class="col-xs-12">
    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="percentageDeciPoint">
                <g:message code="coreBanking.setting.bankSetup.decimalPoint" default="(%)Decimal Point "/></label>

            <g:select name="percentageDeciPoint" id="percentageDeciPoint" class="form-control" required=""
                      noSelection="['': 'Chose Decimal Point']"
                      from="${DecimalPoint.values()}"
                      value="${bankSetupData?.percentageDeciPoint}"
                      optionKey="value" optionValue="value"></g:select>
        </div>

    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="language">
                <g:message code="coreBanking.setting.bankSetup.language" default="Language "/> Language *</label>

            <g:select name="language" id="language" class="form-control" required=""
                      noSelection="['': 'Chose A Language']"
                      from="${Language.values()}"
                      value="${bankSetupData?.language}"
                      optionKey="value" optionValue="value"></g:select>
        </div>
    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="numOfBookingPeriod">
                <g:message code="coreBanking.setting.bankSetup.bookingPeriod" default="Booking Period"/>  *</label>

            <g:select name="numOfBookingPeriod" id="numOfBookingPeriod" class="form-control" required=""
                      noSelection="['': 'Chose Booking Period']"
                      from="${BookingPeriod.values()}"
                      value="${bankSetupData?.numOfBookingPeriod}"
                      optionKey="value" optionValue="value"></g:select>
        </div>
    </div>
</div>

<div class="col-xs-12">
    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="qtyDeciPoint">
                <g:message code="coreBanking.setting.bankSetup.qtyDecimalPoint" default="Qty.Decimal Point "/></label>

            <g:select name="qtyDeciPoint" id="qtyDeciPoint" class="form-control" required=""
                      noSelection="['': 'Chose Quantity Decimal Point']"
                      from="${DecimalPoint.values()}"
                      value="${bankSetupData?.qtyDeciPoint}"
                      optionKey="value" optionValue="value"></g:select>
        </div>
    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="reportPageSize">
                <g:message code="coreBanking.setting.bankSetup.reportPageSize" default=" Report Page Size "/></label>

            <g:select name="reportPageSize" id="reportPageSize" class="form-control" required=""
                      noSelection="['': 'Chose A Page Size']"
                      from="${ReportPageSize.values()}"
                      value="${bankSetupData?.reportPageSize}"
                      optionKey="value" optionValue="value"></g:select>
        </div>
    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="showGlCodeInReport">
                <g:message code="coreBanking.setting.bankSetup.glCodeInReport" default="Gl code In Report"/>  *</label>

            <g:select name="showGlCodeInReport" id="showGlCodeInReport" class="form-control" required=""
                      noSelection="['': 'Chose Gl code In Report']"
                      from="${ShowGlAndItemCode.values()}"
                      value="${bankSetupData?.showGlCodeInReport}"
                      optionKey="value" optionValue="key"></g:select>
        </div>
    </div>
</div>

<div class="col-xs-12">
    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="showItemCodeInReport">
                <g:message code="coreBanking.setting.bankSetup.itemOnReport" default="Item # On Report"/>  *</label>

            <g:select name="showItemCodeInReport" id="showItemCodeInReport" class="form-control" required=""
                      noSelection="['': 'Chose Item On Report']"
                      from="${ShowGlAndItemCode.values()}"
                      value="${bankSetupData?.showItemCodeInReport}"
                      optionKey="value" optionValue="key"></g:select>
        </div>
    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="taxType">
                <g:message code="coreBanking.setting.bankSetup.taxType" default="Tax Type "/></label>

            <g:select name="taxType" id="taxType" class="form-control" required=""
                      noSelection="['': 'Chose Tax Type']"
                      from="${TaxType.values()}"
                      value="${bankSetupData?.taxType}"
                      optionKey="value" optionValue="value"></g:select>
        </div>
    </div>

    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="thousandSeparator">
                <g:message code="coreBanking.setting.bankSetup.thousandSeparator"
                           default="Thousand Separator "/>  *</label>

            <g:select name="thousandSeparator" id="thousandSeparator" class="form-control" required=""
                      noSelection="['': 'Chose Thousand Separator']"
                      from="${ThousandSeparator.values()}"
                      value="${bankSetupData?.thousandSeparator}"
                      optionKey="value" optionValue="value"></g:select>
        </div>
    </div>

</div>

<div class="col-xs-12">
    <div class="col-md-4 col-sm-4">
        <div class="form-group">
            <label for="reportDateFormat">
                <g:message code="coreBanking.setting.bankSetup.reportDateFormat"
                           default="Report Date Format "/>  *</label>

            <g:select name="reportDateFormat" id="reportDateFormat" class="form-control" required=""
                      noSelection="['': 'Choose Date Formate']"
                      from="${DateFormat.values()}"
                      value="${bankSetupData?.reportDateFormat}"
                      optionKey="value" optionValue="value"></g:select>
        </div>
    </div>
</div>

</div>

