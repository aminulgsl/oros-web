%{--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">--}%
%{--</script>--}%


<g:render template='/coreBanking/settings/product/savings/cashFeesTable'/>

<script type="text/javascript">
    $(document).ready(function(){

        validateCashFeesTable();

        var cashShow = 0;


        $("#cashAdd").click(function(){

            var cashStartAm = $( "#cashStartAmount" ).val();
            var cashEndAm = $( "#cashEndAmount" ).val();
            var cashRate = $( "#cashRate" ).val();
            var cashRateType = $( "#cashRateType" ).val();
            var cashRateTypeName = $( "#cashRateType option:selected" ).html();
            var checkCash = 0;
            var checkCashInt = 0;

            if($('#cashTableData').find('#cashStartAmount').val()==''){
                checkCash++;
//                $("#cashStartAmountMsg").show();
                $('#cashStartAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#cashTableData').find('#cashStartAmount').val())){
                checkCashInt++;
            }
            if($('#cashTableData').find('#cashEndAmount').val()==''){
                checkCash++;
//                $("#cashEndAmountMsg").show();
                $('#cashEndAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#cashTableData').find('#cashEndAmount').val())){
                checkCashInt++;
            }
            if($('#cashTableData').find('#cashRateType').val()==''){
                checkCash++;
//                $("#cashRateTypeMsg").show();
                $('#cashRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if($('#cashTableData').find('#cashRate').val()==''){
                checkCash++;
//                $("#cashRateMsg").show();
                $('#cashRate').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#cashTableData').find('#cashRate').val())){
                checkCashInt++;
            }

            if((checkCash==0)&&(checkCashInt==0)) {

                $("#cashTableData tbody").append(
                        "<tr>"+
                                "<td><div id='cash_start'>"+cashStartAm+"<input type='hidden' name='cashStart' value='"+cashStartAm+"' /></div></td>"+
                                "<td><div id='cash_end'>"+cashEndAm+"<input type='hidden' name='cashEnd' value='"+cashEndAm+"' /></div></td>"+
                                "<td><div id='cash_rate_type'>"+cashRateTypeName+"<input type='hidden' name='cashRateType' value='"+cashRateType+"' /></div></td>"+
                                "<td><div id='cash_rate'>"+cashRate+"<input type='hidden' name='cashRate' value='"+cashRate+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+

                                "</tr>");
                $('#cashTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#cashTableData').find('select').each(function() {
                    $(this).val('');
                });
            }
        });
        function validateCashFeesTable(){

//            $("#cashStartAmountMsg").hide();
//            $("#cashEndAmountMsg").hide();
//            $("#cashRateTypeMsg").hide();
//            $("#cashRateMsg").hide();

            $("#cashStartAmount").keyup(function(){
//                $("#cashStartAmountMsg").hide();
//                $("#cashStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                if(is_int($('#cashStartAmount').val())){
//                    $("#cashStartAmountMsg").hide();
                    $("#cashStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cashStartAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cashStartAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });

            $("#cashEndAmount").keyup(function(){
                if(is_int($('#cashEndAmount').val())){
//                    $("#cashStartAmountMsg").hide();
                    $("#cashEndAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cashEndAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cashEndAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#cashRate").keyup(function(){
                if(is_int($('#cashRate').val())){
//                    $("#cashStartAmountMsg").hide();
                    $("#cashRate").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cashRate').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cashRate").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#cashRateType").mousedown(function(){
//                $("#cashRateTypeMsg").hide();
                $("#cashRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });


        }
        $('#cashTableData').on('click', '.icon-pencil', function () {
            //     alert('Detected a click!');
            cashShow++;
            $("#cashFeesTr").hide();
            var par = $(this).closest('tr'); //tr
            var cashStartAm = par.children("td:nth-child(1)");
            var cashEndAm = par.children("td:nth-child(2)");
            var cashRateType = par.children("td:nth-child(3)");
            var cashRate = par.children("td:nth-child(4)");
            var cashEdit  = par.children("td:nth-child(5)");

            var drop = "<div id='cash_rate_type'><select name='cashRateTypeI' style='min-width:120px'>" +
                    "<option value=''>- Select -</option> " +
                    "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var temp_cashStartAm = "<input type='text' size='9' placeholder='Start Amount' value='"+cashStartAm.children("div").children("input[type=hidden]").val()+"'/>";
            cashStartAm.children("div").html(temp_cashStartAm);

            var temp_cashEndAm = "<input type='text' size='9' placeholder='End Amount' value='"+cashEndAm.children("div").children("input[type=hidden]").val()+"'/>";
            cashEndAm.children("div").html(temp_cashEndAm);

            var temp_cashRate = "<input type='text' size='9' placeholder='0.00'  value='"+cashRate.children("div").children("input[type=hidden]").val()+"'/>";
            cashRate.children("div").html(temp_cashRate);

            var selVal = cashRateType.children("div").children("input[type=hidden]").val();
            cashRateType.html(drop);
            cashRateType.find("select[name='cashRateTypeI'] option[value='"+selVal+"']").attr("selected","selected");

            cashEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            cashStartAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cashStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cashStartAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cashStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cashStartAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            cashEndAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cashEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cashEndAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cashEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cashEndAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            cashRate.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cashRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cashRate.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cashRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cashRate.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });

        });

        $('#cashTableData').on('click', '.glyphicon-floppy-saved', function () {

            var par = $(this).closest('tr'); //tr
            var cashStartAm = par.children("td:nth-child(1)");
            var cashEndAm = par.children("td:nth-child(2)");
            var cashRateType = par.children("td:nth-child(3)");
            var cashRate = par.children("td:nth-child(4)");
            var cashEdit  = par.children("td:nth-child(5)");
            var checkCashSave = 0;
            var checkCashSaveInt = 0;
            if(cashStartAm.children("div").children("input[type=text]").val()==''){

                checkCashSave++;
                var temp_cashStartAm =  "<input type='text' size='9' id='temp_cashStartAm' placeholder='Start Amount' class='hasError'/>";
//                        "<div id='cashStartAmMsgSave' class='errorMsg'><span>Please Enter Start Amount</span></div>";
                cashStartAm.children("div").html(temp_cashStartAm);
            }
            else if(!is_int(cashStartAm.children("div").children("input[type=text]").val())){
                checkCashSaveInt++;
//                alert("enter num");
            }

            if(cashEndAm.children("div").children("input[type=text]").val()==''){
                checkCashSave++;
                var temp_cashEndAm =  "<input type='text' size='9' id='temp_cashEndAm' class='hasError' placeholder='End Amount'/>";
//                        "<div id='cashEndAmMsgSave' class='errorMsg'><span>Please Enter End Amount</span></div>";
                cashEndAm.children("div").html(temp_cashEndAm);
            }
            else if(!is_int(cashEndAm.children("div").children("input[type=text]").val())){
                checkCashSaveInt++;
//                alert("enter num");
            }

            if(cashRateType.children("div").children("select").val()==''){
                checkCashSave++;
                var temp_cashRateType =  "<select id='temp_cashRateType' class='form-control hasError' name='cashRateTypeI'  style='min-width:70px' >"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='cashRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                cashRateType.children("div").html(temp_cashRateType);


            }

            if(cashRate.children("div").children("input[type=text]").val()==''){
                checkCashSave++;

                var temp_cashRate =  "<input type='text' size='9' id='temp_cashRate' class='hasError'  placeholder='0.00'/>";
//                        "<div id='cashRateMsgSave' class='errorMsg'><span>Please Enter Rate</span></div>";
                cashRate.children("div").html(temp_cashRate);
            }
            else if(!is_int(cashRate.children("div").children("input[type=text]").val())){
                checkCashSaveInt++;
//                alert("enter num");
            }


            validateCashFeesSave(par);
            if((checkCashSave==0)&&(checkCashSaveInt==0)){
                cashShow--;
                if(cashShow==0) $("#cashFeesTr").show();
                var temp_cashStartAm = cashStartAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cashStartAm.children("div").children("input[type=text]").val()+"' name='cashStart' />";
                cashStartAm.children("div").html(temp_cashStartAm);

                var temp_cashEndAm = cashEndAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cashEndAm.children("div").children("input[type=text]").val()+"' name='cashEnd' />";
                cashEndAm.children("div").html(temp_cashEndAm);

                var temp_cashRate = cashRate.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cashRate.children("div").children("input[type=text]").val()+"' name='cashRate' />";
                cashRate.children("div").html(temp_cashRate);

                var temp_cashRateType = cashRateType.children("div").find("select[name=cashRateTypeI] option:selected").html() + "<input type='hidden' value='"+cashRateType.children("div").children("select").val()+"' name='cashRateType' />";
                cashRateType.children("div").html(temp_cashRateType);

                cashEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");

            }

        });

        function validateCashFeesSave(par){
            var cashStartAm = par.children("td:nth-child(1)");
            var cashEndAm = par.children("td:nth-child(2)");
            var cashRateType = par.children("td:nth-child(3)");
            var cashRate = par.children("td:nth-child(4)");
//            alert("c");
            cashStartAm.find("#temp_cashStartAm").keyup(function(){

//                $("#cashStartAmMsgSave").hide();
//                $("#temp_cashStartAm").removeClass('hasError');
                if(!is_int((cashStartAm.find("#temp_cashStartAm").val()))){
//                    alert("enter Num");
                    cashStartAm.find("#temp_cashStartAm").addClass('hasError');
                }
                if(is_int((cashStartAm.find("#temp_cashStartAm").val()))){
//                    alert("enter Num");
                    cashStartAm.find("#temp_cashStartAm").removeClass('hasError');
                }
            });

            cashEndAm.find("#temp_cashEndAm").keyup(function(){

                if(!is_int((cashEndAm.find("#temp_cashEndAm").val()))){
//                    alert("enter Num");
                    cashEndAm.find("#temp_cashEndAm").addClass('hasError');
                }
                if(is_int((cashEndAm.find("#temp_cashEndAm").val()))){
//                    alert("enter Num");
                    cashEndAm.find("#temp_cashEndAm").removeClass('hasError');
                }
            });
            cashRate.find("#temp_cashRate").keyup(function(){

                if(!is_int((cashRate.find("#temp_cashRate").val()))){
//                    alert("enter Num");
                    cashRate.find("#temp_cashRate").addClass('hasError');
                }
                if(is_int((cashRate.find("#temp_cashRate").val()))){
//                    alert("enter Num");
                    cashRate.find("#temp_cashRate").removeClass('hasError');
                }
            });
            cashRateType.find("#temp_cashRateType").mousedown(function(){
//                $("#cashRateTypeMsgSave").hide();
                cashRateType.find("#temp_cashRateType").removeClass('hasError');
            });

        }
        $('#cashTableData').on('click', '.icon-trash-add', function(){
            if(cashShow==0) $("#cashFeesTr").show();
            $(this).closest ('tr').remove ();
        });


        $('#cashTableData').on('click', '.icon-trash-edit', function(){
            cashShow--;
            if(cashShow==0) $("#cashFeesTr").show();
            $(this).closest ('tr').remove ();
        });
        var cashWithdrwShow = 0;
        validateCashWithdrwlFeesTable();
        $("#withdrawlAdd").click(function(){
            var withdrwlStartAm = $( "#withdrwlStartAmount" ).val();
            var withdrwlEndAm = $( "#withdrwlEndAmount" ).val();
            var withdrwlRate = $( "#withdrwlRate" ).val();
            var withdrwlRateType = $( "#withdrwlRateType" ).val();
            var withdrwlRateName = $( "#withdrwlRateType option:selected" ).html();
            var checkWithdrwl = 0;
            var checkWithdrwlInt = 0;

            if($('#withdrawalTableData').find('#withdrwlStartAmount').val()==''){
                checkWithdrwl++;
//                $("#withdrwlStartAmountMsg").show();
                $('#withdrwlStartAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#withdrawalTableData').find('#withdrwlStartAmount').val())){
                checkWithdrwlInt++;
            }
            if($('#withdrawalTableData').find('#withdrwlEndAmount').val()==''){
                checkWithdrwl++;
//                $("#withdrwlEndAmountMsg").show();
                $('#withdrwlEndAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#withdrawalTableData').find('#withdrwlEndAmount').val())){
                checkWithdrwlInt++;
            }
            if($('#withdrawalTableData').find('#withdrwlRateType').val()==''){
                checkWithdrwl++;
//                $("#withdrwlRateTypeMsg").show();
                $('#withdrwlRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if($('#withdrawalTableData').find('#withdrwlRate').val()==''){
                checkWithdrwl++;
//                $("#withdrwlRateMsg").show();
                $('#withdrwlRate').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#withdrawalTableData').find('#withdrwlRate').val())){
                checkWithdrwlInt++;
            }

            if((checkWithdrwl==0)&&(checkWithdrwlInt==0)) {

                $("#withdrawalTableData tbody").append(
                        "<tr>"+
                                "<td><div id='withdrwl_start'>"+withdrwlStartAm+"<input type='hidden' name='withdrwlStartAm' value='"+withdrwlStartAm+"' /></div></td>"+
                                "<td><div id='withdrwl_end'>"+withdrwlEndAm+"<input type='hidden' name='withdrwlEndAm' value='"+withdrwlEndAm+"' /></div></td>"+
                                "<td><div id='withdrwl_rate_type'>"+withdrwlRateName+"<input type='hidden' name='withdrwlRateType' value='"+withdrwlRateType+"' /></div></td>"+
                                "<td><div id='withdrwl_rate'>"+withdrwlRate+"<input type='hidden' name='withdrwlRate' value='"+withdrwlRate+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+
                                "</tr>");
                $('#withdrawalTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#withdrawalTableData').find('select').each(function() {
                    $(this).val('');
                });
            }
        });
        function validateCashWithdrwlFeesTable(){

//            $("#withdrwlStartAmountMsg").hide();
//            $("#withdrwlEndAmountMsg").hide();
//            $("#withdrwlRateTypeMsg").hide();
//            $("#withdrwlRateMsg").hide();

            $("#withdrwlStartAmount").keyup(function(){
//                $("#withdrwlStartAmountMsg").hide();
//                $("#withdrwlStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                if(is_int($('#withdrwlStartAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#withdrwlStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#withdrwlStartAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#withdrwlStartAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });

            $("#withdrwlEndAmount").keyup(function(){
                if(is_int($('#withdrwlEndAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#withdrwlEndAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#withdrwlEndAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#withdrwlEndAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#withdrwlRate").keyup(function(){
                if(is_int($('#withdrwlRate').val())){
//                    $("#fixedMinMsg").hide();
                    $("#withdrwlRate").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#withdrwlRate').val())){
//                alert("Enter Number in Start Amount!");
                    $("#withdrwlRate").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#withdrwlRateType").mousedown(function(){
//                $("#withdrwlRateTypeMsg").hide();
                $("#withdrwlRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });


        }


        $('#withdrawalTableData').on('click', '.icon-pencil', function () {
            cashWithdrwShow++;

            $("#withdrwlFeesTr").hide();
            var par = $(this).closest('tr'); //tr
            var withdrwlStartAm = par.children("td:nth-child(1)");
            var withdrwlEndAm = par.children("td:nth-child(2)");
            var withdrwlRateType = par.children("td:nth-child(3)");
            var withdrwlRate = par.children("td:nth-child(4)");
            var withdrwlEdit  = par.children("td:nth-child(5)");

            var drop = "<div id='withdrwl_rate_type'><select name='withdrwlRateTypeI' style='min-width:120px'>" +
                    "<option value=''>- Select -</option> " +
                    "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var temp_withdrwlStartAm = "<input type='text' size='9' placeholder='Start Amount' value='"+withdrwlStartAm.children("div").children("input[type=hidden]").val()+"'/>";
            withdrwlStartAm.children("div").html(temp_withdrwlStartAm);

            var temp_withdrwlEndAm = "<input type='text' size='9' placeholder='End Amount' value='"+withdrwlEndAm.children("div").children("input[type=hidden]").val()+"'/>";
            withdrwlEndAm.children("div").html(temp_withdrwlEndAm);

            var temp_withdrwlRate = "<input type='text' size='9' placeholder='0.00' value='"+withdrwlRate.children("div").children("input[type=hidden]").val()+"'/>";
            withdrwlRate.children("div").html(temp_withdrwlRate);

            var selVal = withdrwlRateType.children("div").children("input[type=hidden]").val();
            withdrwlRateType.html(drop);
            withdrwlRateType.find("select[name='withdrwlRateTypeI'] option[value='"+selVal+"']").attr("selected","selected");

            withdrwlEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            withdrwlStartAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(withdrwlStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    withdrwlStartAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(withdrwlStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    withdrwlStartAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            withdrwlEndAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(withdrwlEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    withdrwlEndAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(withdrwlEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    withdrwlEndAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            withdrwlRate.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(withdrwlRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    withdrwlRate.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(withdrwlRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    withdrwlRate.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });


        });
        $('#withdrawalTableData').on('click', '.glyphicon-floppy-saved', function () {

            var par = $(this).closest('tr'); //tr
            var withdrwlStartAm = par.children("td:nth-child(1)");
            var withdrwlEndAm = par.children("td:nth-child(2)");
            var withdrwlRateType = par.children("td:nth-child(3)");
            var withdrwlRate = par.children("td:nth-child(4)");

            var withdrwlEdit  = par.children("td:nth-child(5)");
            var checkWithdrwlSave = 0;
            var checkWithdrwlSaveInt = 0;
            if(withdrwlStartAm.children("div").children("input[type=text]").val()==''){

                checkWithdrwlSave++;
                var temp_withdrwlStartAm =  "<input type='text' size='9' id='temp_withdrwlStartAm' placeholder='Start Amount' class='hasError'/>";
//                        "<div id='withdrwlStartAmMsgSave' class='errorMsg'><span>Please Enter Start Amount</span></div>";
                withdrwlStartAm.children("div").html(temp_withdrwlStartAm);
            }
            else if(!is_int(withdrwlStartAm.children("div").children("input[type=text]").val())){
                checkWithdrwlSaveInt++;
//                alert("enter num");
            }

            if(withdrwlEndAm.children("div").children("input[type=text]").val()==''){
                checkWithdrwlSave++;
                var temp_withdrwlEndAm =  "<input type='text' size='9' id='temp_withdrwlEndAm' placeholder='End Amount' class='hasError'/>";
//                        "<div id='withdrwlEndAmMsgSave' class='errorMsg'><span>Please Enter End Amount</span></div>";
                withdrwlEndAm.children("div").html(temp_withdrwlEndAm);

            }
            else if(!is_int(withdrwlEndAm.children("div").children("input[type=text]").val())){
                checkWithdrwlSaveInt++;
//                alert("enter num");
            }


            if(withdrwlRateType.children("div").children("select").val()==''){
                checkWithdrwlSave++;//
                var temp_withdrwlRateType =  "<select id='temp_withdrwlRateType' class='form-control hasError' name='withdrwlRateTypeI' style='min-width:70px'>"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='withdrwlRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                withdrwlRateType.children("div").html(temp_withdrwlRateType);


            }

            if(withdrwlRate.children("div").children("input[type=text]").val()==''){
                checkWithdrwlSave++;

                var temp_withdrwlRate =  "<input type='text' size='9' id='temp_withdrwlRate' placeholder='0.00' class='hasError'/>";
//                        "<div id='withdrwlRateMsgSave' class='errorMsg'><span>Please Enter Rate</span></div>";
                withdrwlRate.children("div").html(temp_withdrwlRate);
            }
            else if(!is_int(withdrwlRate.children("div").children("input[type=text]").val())){
                checkWithdrwlSaveInt++;
//                alert("enter num");
            }


            validateCashWithdrwlFeesSave(par);
            if((checkWithdrwlSave==0)&&(checkWithdrwlSaveInt==0)){
                cashWithdrwShow--;
                if(cashWithdrwShow==0) $("#withdrwlFeesTr").show();
                var temp_withdrwlStartAm = withdrwlStartAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+withdrwlStartAm.children("div").children("input[type=text]").val()+"' name='withdrwlStartAm' />";
                withdrwlStartAm.children("div").html(temp_withdrwlStartAm);

                var temp_withdrwlEndAm = withdrwlEndAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+withdrwlEndAm.children("div").children("input[type=text]").val()+"' name='withdrwlEndAm' />";
                withdrwlEndAm.children("div").html(temp_withdrwlEndAm);

                var temp_withdrwlRate = withdrwlRate.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+withdrwlRate.children("div").children("input[type=text]").val()+"' name='withdrwlRate' />";
                withdrwlRate.children("div").html(temp_withdrwlRate);

                var temp_withdrwlRateType = withdrwlRateType.children("div").find("select[name=withdrwlRateTypeI] option:selected").html() + "<input type='hidden' value='"+withdrwlRateType.children("div").children("select").val()+"' name='withdrwlRateType' />";
                withdrwlRateType.children("div").html(temp_withdrwlRateType);

                withdrwlEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");

            }

        });
        function validateCashWithdrwlFeesSave(par){
            var withdrwlStartAm = par.children("td:nth-child(1)");
            var withdrwlEndAm = par.children("td:nth-child(2)");
            var withdrwlRateType = par.children("td:nth-child(3)");
            var withdrwlRate = par.children("td:nth-child(4)");
            withdrwlStartAm.find("#temp_withdrwlStartAm").keyup(function(){
                if(!is_int((withdrwlStartAm.find("#temp_withdrwlStartAm").val()))){
//                    alert("enter Num");
                    withdrwlStartAm.find("#temp_withdrwlStartAm").addClass('hasError');
                }
                if(is_int((withdrwlStartAm.find("#temp_withdrwlStartAm").val()))){
//                    alert("enter Num");
                    withdrwlStartAm.find("#temp_withdrwlStartAm").removeClass('hasError');
                }
            });

            withdrwlEndAm.find("#temp_withdrwlEndAm").keyup(function(){
                if(!is_int((withdrwlEndAm.find("#temp_withdrwlEndAm").val()))){
//                    alert("enter Num");
                    withdrwlEndAm.find("#temp_withdrwlEndAm").addClass('hasError');
                }
                if(is_int((withdrwlEndAm.find("#temp_withdrwlEndAm").val()))){
//                    alert("enter Num");
                    withdrwlEndAm.find("#temp_withdrwlEndAm").removeClass('hasError');
                }
            });
            withdrwlRate.find("#temp_withdrwlRate").keyup(function(){
                if(!is_int((withdrwlRate.find("#temp_withdrwlRate").val()))){
//                    alert("enter Num");
                    withdrwlRate.find("#temp_withdrwlRate").addClass('hasError');
                }
                if(is_int((withdrwlRate.find("#temp_withdrwlRate").val()))){
//                    alert("enter Num");
                    withdrwlRate.find("#temp_withdrwlRate").removeClass('hasError');
                }
            });
            withdrwlRateType.find("#temp_withdrwlRateType").mousedown(function(){
//                $("#withdrwlRateTypeMsgSave").hide();
                withdrwlRateType.find("#temp_withdrwlRateType").removeClass('hasError');
            });

        }
        $('#withdrawalTableData').on('click', '.icon-trash-add', function(){

            if(cashWithdrwShow==0) $("#withdrwlFeesTr").show();
            $(this).closest ('tr').remove ();
        });

        $('#withdrawalTableData').on('click', '.icon-trash-edit', function(){
            cashWithdrwShow--;
            if(cashWithdrwShow==0) $("#withdrwlFeesTr").show();
            $(this).closest ('tr').remove ();
        });
        validateCashTransferFeesTable();

        var cashTransferShow = 0;

        $("#transferAdd").click(function(){

            var transferStartAm = $( "#transferStartAmount" ).val();
            var transferEndAm = $( "#transferEndAmount" ).val();
            var transferRate = $( "#transferRate" ).val();
            var transferRateType = $( "#transferRateType" ).val();
            var transferRateName = $( "#transferRateType option:selected" ).html();
            var checktrn = 0;
            var checktrnInt = 0;

            if($('#transferTableData').find('#transferStartAmount').val()==''){
                checktrn++;
//                $("#transferStartAmountMsg").show();
                $('#transferStartAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#transferTableData').find('#transferStartAmount').val())){
                checktrnInt++;
            }
            if($('#transferTableData').find('#transferEndAmount').val()==''){
                checktrn++;
//                $("#transferEndAmountMsg").show();
                $('#transferEndAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#transferTableData').find('#transferEndAmount').val())){
                checktrnInt++;
            }
            if($('#transferTableData').find('#transferRateType').val()==''){
                checktrn++;
//                $("#transferRateTypeMsg").show();
                $('#transferRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if($('#transferTableData').find('#transferRate').val()==''){
                checktrn++;
//                $("#transferRateMsg").show();
                $('#transferRate').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#transferTableData').find('#transferRate').val())){
                checktrnInt++;
            }

            if((checktrn==0)&&(checktrnInt==0)) {

                $("#transferTableData tbody").append(
                        "<tr>"+
                                "<td><div id='transfer_start'>"+transferStartAm+"<input type='hidden' name='transferStartAmount' value='"+transferStartAm+"' /></div></td>"+
                                "<td><div id='transfer_end'>"+transferEndAm+"<input type='hidden' name='transferEndAmount' value='"+transferEndAm+"' /></div></td>"+
                                "<td><div id='transfer_rate_type'>"+transferRateName+"<input type='hidden' name='transferRateType' value='"+transferRateType+"' /></div></td>"+
                                "<td><div id='transfer_rate'>"+transferRate+"<input type='hidden' name='transferRate' value='"+transferRate+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+
                                "</tr>");
                $('#transferTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#transferTableData').find('select').each(function() {
                    $(this).val('');
                });
            }
        });
        function validateCashTransferFeesTable(){

//            $("#transferStartAmountMsg").hide();
//            $("#transferEndAmountMsg").hide();
//            $("#transferRateTypeMsg").hide();
//            $("#transferRateMsg").hide();

            $("#transferStartAmount").keyup(function(){
                if(is_int($('#transferStartAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#transferStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#transferStartAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#transferStartAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });

            $("#transferEndAmount").keyup(function(){
                if(is_int($('#transferEndAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#transferEndAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#transferEndAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#transferEndAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#transferRate").keyup(function(){
                if(is_int($('#transferRate').val())){
//                    $("#fixedMinMsg").hide();
                    $("#transferRate").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#transferRate').val())){
//                alert("Enter Number in Start Amount!");
                    $("#transferRate").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#transferRateType").mousedown(function(){
//                $("#transferRateTypeMsg").hide();
                $("#transferRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });


        }

        $('#transferTableData').on('click', '.icon-pencil', function () {
            //     alert('Detected a click!');
            cashTransferShow++;
            $("#transferTr").hide();
            var par = $(this).closest('tr'); //tr
            var transferStartAm = par.children("td:nth-child(1)");
            var transferEndAm = par.children("td:nth-child(2)");
            var transferRate = par.children("td:nth-child(4)");
            var transferRateType = par.children("td:nth-child(3)");
            var transferEdit  = par.children("td:nth-child(5)");

            var drop = "<div id='transfer_rate_type'><select name='transferRateType' style='min-width:120px'>" +
                    "<option value=''>- Select -</option> " +
                    "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var temp_transferStartAm = "<input type='text' size='9' placeholder='Start Amount'  value='"+transferStartAm.children("div").children("input[type=hidden]").val()+"'/>";
            transferStartAm.children("div").html(temp_transferStartAm);

            var temp_transferEndAm = "<input type='text' size='9' placeholder='End Amount'  value='"+transferEndAm.children("div").children("input[type=hidden]").val()+"'/>";
            transferEndAm.children("div").html(temp_transferEndAm);

            var temp_transferRate = "<input type='text' size='9' placeholder='0.00'  value='"+transferRate.children("div").children("input[type=hidden]").val()+"'/>";
            transferRate.children("div").html(temp_transferRate);

            var selVal = transferRateType.children("div").children("input[type=hidden]").val();
            transferRateType.html(drop);
            transferRateType.find("select[name='transferRateType'] option[value='"+selVal+"']").attr("selected","selected");

            transferEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            transferStartAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(transferStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    transferStartAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(transferStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    transferStartAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            transferEndAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(transferEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    transferEndAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(transferEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    transferEndAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            transferRate.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(transferRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    transferRate.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(transferRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    transferRate.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });

        });
        $('#transferTableData').on('click', '.glyphicon-floppy-saved', function () {


            var par = $(this).closest('tr'); //tr
            var transferStartAm = par.children("td:nth-child(1)");
            var transferEndAm = par.children("td:nth-child(2)");
            var transferRate = par.children("td:nth-child(4)");
            var transferRateType = par.children("td:nth-child(3)");
            var transferEdit  = par.children("td:nth-child(5)");
            var checktrnSave = 0;
            var checktrnSaveInt = 0;
            if(transferStartAm.children("div").children("input[type=text]").val()==''){

                checktrnSave++;
                var temp_transferStartAm =  "<input type='text' size='9' id='temp_transferStartAm' placeholder='Start Amount' class='hasError'/>";
//                        "<div id='transferStartAmMsgSave' class='errorMsg'><span>Please Enter Start Amount</span></div>";
                transferStartAm.children("div").html(temp_transferStartAm);
            }
            else if(!is_int(transferStartAm.children("div").children("input[type=text]").val())){
                checktrnSaveInt++;
//                alert("enter num");
            }

            if(transferEndAm.children("div").children("input[type=text]").val()==''){
                checktrnSave++;
                var temp_transferEndAm =  "<input type='text' size='9' id='temp_transferEndAm' placeholder='End Amount' class='hasError'/>";
//                        "<div id='transferEndAmMsgSave' class='errorMsg'><span>Please Enter End Amount</span></div>";
                transferEndAm.children("div").html(temp_transferEndAm);

            }
            else if(!is_int(transferEndAm.children("div").children("input[type=text]").val())){
                checktrnSaveInt++;
//                alert("enter num");
            }

            if(transferRateType.children("div").children("select").val()==''){
                checktrnSave++;//
                var temp_transferRateType =  "<select id='temp_transferRateType' class='form-control hasError' name='transferRateType' style='min-width:70px'>"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='transferRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                transferRateType.children("div").html(temp_transferRateType);


            }

            if(transferRate.children("div").children("input[type=text]").val()==''){
                checktrnSave++;

                var temp_transferRate =  "<input type='text' size='9' id='temp_transferRate' class='hasError'/>";
//                        "<div id='transferRateMsgSave' class='errorMsg'><span>Please Enter Rate</span></div>";
                transferRate.children("div").html(temp_transferRate);
            }
            else if(!is_int(transferRate.children("div").children("input[type=text]").val())){
                checktrnSaveInt++;
//                alert("enter num");
            }


            validateTransferFeesSave(par);
            if((checktrnSave==0)&&(checktrnSaveInt==0)){
                cashTransferShow--;
                if(cashTransferShow==0) $("#transferTr").show();

                var temp_transferStartAm = transferStartAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+transferStartAm.children("div").children("input[type=text]").val()+"' name='transferStartAmount' />";
                transferStartAm.children("div").html(temp_transferStartAm);

                var temp_transferEndAm = transferEndAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+transferEndAm.children("div").children("input[type=text]").val()+"' name='transferEndAmount' />";
                transferEndAm.children("div").html(temp_transferEndAm);

                var temp_transferRate = transferRate.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+transferRate.children("div").children("input[type=text]").val()+"' name='transferRate' />";
                transferRate.children("div").html(temp_transferRate);

                var temp_transferRateType = transferRateType.children("div").find("select[name=transferRateType] option:selected").html() + "<input type='hidden' value='"+transferRateType.children("div").children("select").val()+"' name='transferRateType' />";
                transferRateType.children("div").html(temp_transferRateType);

                transferEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");

            }

        });
        function validateTransferFeesSave(par){
            var transferStartAm = par.children("td:nth-child(1)");
            var transferEndAm = par.children("td:nth-child(2)");
            var transferRate = par.children("td:nth-child(4)");
            var transferRateType = par.children("td:nth-child(3)");
            transferStartAm.find("#temp_transferStartAm").keyup(function(){
                if(!is_int((transferStartAm.find("#temp_transferStartAm").val()))){
//                    alert("enter Num");
                    transferStartAm.find("#temp_transferStartAm").addClass('hasError');
                }
                if(is_int((transferStartAm.find("#temp_transferStartAm").val()))){
//                    alert("enter Num");
                    transferStartAm.find("#temp_transferStartAm").removeClass('hasError');
                }
            });

            transferEndAm.find("#temp_transferEndAm").keyup(function(){
                if(!is_int((transferEndAm.find("#temp_transferEndAm").val()))){
//                    alert("enter Num");
                    transferEndAm.find("#temp_transferEndAm").addClass('hasError');
                }
                if(is_int((transferEndAm.find("#temp_transferEndAm").val()))){
//                    alert("enter Num");
                    transferEndAm.find("#temp_transferEndAm").removeClass('hasError');
                }
            });
            transferRate.find("#temp_transferRate").keyup(function(){
                if(!is_int((transferRate.find("#temp_transferRate").val()))){
//                    alert("enter Num");
                    transferRate.find("#temp_transferRate").addClass('hasError');
                }
                if(is_int((transferRate.find("#temp_transferRate").val()))){
//                    alert("enter Num");
                    transferRate.find("#temp_transferRate").removeClass('hasError');
                }
            });
            transferRateType.find("#temp_transferRateType").mousedown(function(){
//                $("#transferRateTypeMsgSave").hide();
                transferRateType.find("#temp_transferRateType").removeClass('hasError');
            });

        }
        $('#transferTableData').on('click', '.icon-trash-add', function(){

            if(cashTransferShow==0) $("#transferTr").show();
            $(this).closest ('tr').remove ();
        });

        $('#transferTableData').on('click', '.icon-trash-edit', function(){
            cashTransferShow--;
            if(cashTransferShow==0) $("#transferTr").show();
            $(this).closest ('tr').remove ();
        });
        function is_int(value){
            if( (value>=0) && !isNaN(value)){
                return true;
            } else {
                return false;
            }
        }

    });
</script>
