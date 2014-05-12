

<g:render template='/coreBanking/settings/product/savings/chequeFeesTable'/>

<script type="text/javascript">
    $(document).ready(function(){
        var chqFeeShow = 0;
        validateChqFeesTable();

        $("#chequeAdd").click(function(){

            var chequeStartAm = $( "#chequeStartAmount" ).val();
            var chequeEndAm = $( "#chequeEndAmount" ).val();
            var chequeRate = $( "#chequeRate" ).val();
            var chequeRateType = $( "#chequeRateType" ).val();
            var chequeRateName = $( "#chequeRateType option:selected" ).html();
            var checkChqFee = 0;
            var checkChqFeeInt = 0;

            if($('#chequeTableData').find('#chequeStartAmount').val()==''){
                checkChqFee++;
//                $("#chequeStartAmountMsg").show();
                $('#chequeStartAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#chequeTableData').find('#chequeStartAmount').val())){
                checkChqFeeInt++;
            }
            if($('#chequeTableData').find('#chequeEndAmount').val()==''){
                checkChqFee++;
//                $("#chequeEndAmountMsg").show();
                $('#chequeEndAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#chequeTableData').find('#chequeEndAmount').val())){
                checkChqFeeInt++;
            }
            if($('#chequeTableData').find('#chequeRateType').val()==''){
                checkChqFee++;
//                $("#chequeRateTypeMsg").show();
                $('#chequeRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if($('#chequeTableData').find('#chequeRate').val()==''){
                checkChqFee++;
//                $("#chequeRateMsg").show();
                $('#chequeRate').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#chequeTableData').find('#chequeRate').val())){
                checkChqFeeInt++;
            }

            if((checkChqFee==0)&&(checkChqFeeInt==0)) {
                $("#chequeTableData tbody").append(
                        "<tr>"+
                                "<td><div id='cheque_start'>"+chequeStartAm+"<input type='hidden' name='chequeStart' value='"+chequeStartAm+"' /></div></td>"+
                                "<td><div id='cheque_end'>"+chequeEndAm+"<input type='hidden' name='chequeEnd' value='"+chequeEndAm+"' /></div></td>"+
                                "<td><div id='cheque_rate_type'>"+chequeRateName+"<input type='hidden' name='chequeRateType' value='"+chequeRateType+"' /></div></td>"+
                                "<td><div id='cheque_rate'>"+chequeRate+"<input type='hidden' name='chequeRate' value='"+chequeRate+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+
                        "</tr>");
                $('#chequeTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#chequeTableData').find('select').each(function() {
                    $(this).val('');
                });
            }
        });
        function validateChqFeesTable(){

//            $("#chequeStartAmountMsg").hide();
//            $("#chequeEndAmountMsg").hide();
//            $("#chequeRateTypeMsg").hide();
//            $("#chequeRateMsg").hide();

            $("#chequeStartAmount").keyup(function(){
                if(is_int($('#chequeStartAmount').val())){
//                    $("#cashStartAmountMsg").hide();
                    $("#chequeStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#chequeStartAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#chequeStartAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });

            $("#chequeEndAmount").keyup(function(){
                if(is_int($('#chequeEndAmount').val())){
//                    $("#cashStartAmountMsg").hide();
                    $("#chequeEndAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#chequeEndAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#chequeEndAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#chequeRate").keyup(function(){
                if(is_int($('#chequeRate').val())){
//                    $("#cashStartAmountMsg").hide();
                    $("#chequeRate").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#chequeRate').val())){
//                alert("Enter Number in Start Amount!");
                    $("#chequeRate").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#chequeRateType").mousedown(function(){
//                $("#chequeRateTypeMsg").hide();
                $("#chequeRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });


        }
        $('#chequeTableData').on('click', '.icon-pencil', function () {
            //     alert('Detected a click!');
            chqFeeShow++;
            $("#chequeFeesTr").hide();
            var par = $(this).closest('tr'); //tr
            var chequeStartAm = par.children("td:nth-child(1)");
            var chequeEndAm = par.children("td:nth-child(2)");
            var chequeRateType = par.children("td:nth-child(3)");
            var chequeRate = par.children("td:nth-child(4)");

            var chequeEdit  = par.children("td:nth-child(5)");

            var drop = "<div id='cheque_rate_type'><select name='chequeRateType' style='min-width:120px'>" +
                    "<option value=''>- Select -</option>"+
                    "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>" +
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var temp_chequeStartAm = "<input type='text' size='9' placeholder='Start Amount' value='"+chequeStartAm.children("div").children("input[type=hidden]").val()+"'/>";
            chequeStartAm.children("div").html(temp_chequeStartAm);

            var temp_chequeEndAm = "<input type='text' size='9' placeholder='End Amount' value='"+chequeEndAm.children("div").children("input[type=hidden]").val()+"'/>";
            chequeEndAm.children("div").html(temp_chequeEndAm);

            var temp_chequeRate = "<input type='text' size='9' placeholder='0.00'  value='"+chequeRate.children("div").children("input[type=hidden]").val()+"'/>";
            chequeRate.children("div").html(temp_chequeRate);

            var selVal = chequeRateType.children("div").children("input[type=hidden]").val();
            chequeRateType.html(drop);
            chequeRateType.find("select[name='chequeRateType'] option[value='"+selVal+"']").attr("selected","selected");

            chequeEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            chequeStartAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(chequeStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeStartAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(chequeStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeStartAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            chequeEndAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(chequeEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeEndAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(chequeEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeEndAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            chequeRate.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(chequeRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeRate.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(chequeRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeRate.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });


        });
        $('#chequeTableData').on('click', '.glyphicon-floppy-saved', function () {

            var par = $(this).closest('tr'); //tr
            var chequeStartAm = par.children("td:nth-child(1)");
            var chequeEndAm = par.children("td:nth-child(2)");
            var chequeRateType = par.children("td:nth-child(3)");
            var chequeRate = par.children("td:nth-child(4)");
            var chequeEdit  = par.children("td:nth-child(5)");
            var checkChqSave = 0;
            var checkChqSaveInt = 0;
            if(chequeStartAm.children("div").children("input[type=text]").val()==''){

                checkChqSave++;
                var temp_chequeStartAm =  "<input type='text' size='9' id='temp_chequeStartAm' placeholder='Start Amount' class='hasError'/>";
//                        "<div id='chequeStartAmMsgSave' class='errorMsg'><span>Please Enter Start Amount</span></div>";
                chequeStartAm.children("div").html(temp_chequeStartAm);
            }
            else if(!is_int(chequeStartAm.children("div").children("input[type=text]").val())){
                checkChqSaveInt++;
//                alert("enter num");
            }

            if(chequeEndAm.children("div").children("input[type=text]").val()==''){
                checkChqSave++;
                var temp_chequeEndAm =  "<input type='text' size='9' id='temp_chequeEndAm' placeholder='End Amount' class='hasError'/>";
//                        "<div id='chequeEndAmMsgSave' class='errorMsg'><span>Please Enter End Amount</span></div>";
                chequeEndAm.children("div").html(temp_chequeEndAm);

            }
            else if(!is_int(chequeEndAm.children("div").children("input[type=text]").val())){
                checkChqSaveInt++;
//                alert("enter num");
            }

            if(chequeRateType.children("div").children("select").val()==''){
                checkChqSave++;//
                var temp_chequeRateType =  "<select id='temp_chequeRateType' class='form-control hasError' name='chequeRateType' style='min-width:70px'>"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>" +
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='chequeRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                chequeRateType.children("div").html(temp_chequeRateType);


            }

            if(chequeRate.children("div").children("input[type=text]").val()==''){
                checkChqSave++;

                var temp_chequeRate =  "<input type='text' size='9' id='temp_chequeRate' placeholder='0.00' class='hasError'/>";
//                        "<div id='chequeRateMsgSave' class='errorMsg'><span>Please Enter Rate</span></div>";
                chequeRate.children("div").html(temp_chequeRate);
            }
            else if(!is_int(chequeRate.children("div").children("input[type=text]").val())){
                checkChqSaveInt++;
//                alert("enter num");
            }


            validateChqFeesSave(par);
            if((checkChqSave==0)&&(checkChqSaveInt==0)){
                chqFeeShow--;
                if(chqFeeShow==0) $("#chequeFeesTr").show();


                var temp_chequeStartAm = chequeStartAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+chequeStartAm.children("div").children("input[type=text]").val()+"' name='chequeStart' />";
                chequeStartAm.children("div").html(temp_chequeStartAm);

                var temp_chequeEndAm = chequeEndAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+chequeEndAm.children("div").children("input[type=text]").val()+"' name='chequeEnd' />";
                chequeEndAm.children("div").html(temp_chequeEndAm);

                var temp_chequeRateType = chequeRateType.children("div").find("select[name=chequeRateType] option:selected").html() + "<input type='hidden' value='"+chequeRateType.children("div").children("select").val()+"' name='chequeRateType' />";
                chequeRateType.children("div").html(temp_chequeRateType);

                var temp_chequeRate = chequeRate.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+chequeRate.children("div").children("input[type=text]").val()+"' name='chequeRate' />";
                chequeRate.children("div").html(temp_chequeRate);



                chequeEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");

            }

        });
        function validateChqFeesSave(par){
            var chequeStartAm = par.children("td:nth-child(1)");
            var chequeEndAm = par.children("td:nth-child(2)");
            var chequeRateType = par.children("td:nth-child(3)");
            var chequeRate = par.children("td:nth-child(4)");
            chequeStartAm.find("#temp_chequeStartAm").keyup(function(){
                if(!is_int((chequeStartAm.find("#temp_chequeStartAm").val()))){
//                    alert("enter Num");
                    chequeStartAm.find("#temp_chequeStartAm").addClass('hasError');
                }
                if(is_int((chequeStartAm.find("#temp_chequeStartAm").val()))){
//                    alert("enter Num");
                    chequeStartAm.find("#temp_chequeStartAm").removeClass('hasError');
                }
            });

            chequeEndAm.find("#temp_chequeEndAm").keyup(function(){
                if(!is_int((chequeEndAm.find("#temp_chequeEndAm").val()))){
//                    alert("enter Num");
                    chequeEndAm.find("#temp_chequeEndAm").addClass('hasError');
                }
                if(is_int((chequeEndAm.find("#temp_chequeEndAm").val()))){
//                    alert("enter Num");
                    chequeEndAm.find("#temp_chequeEndAm").removeClass('hasError');
                }
            });
            chequeRate.find("#temp_chequeRate").keyup(function(){
                if(!is_int((chequeRate.find("#temp_chequeRate").val()))){
//                    alert("enter Num");
                    chequeRate.find("#temp_chequeRate").addClass('hasError');
                }
                if(is_int((chequeRate.find("#temp_chequeRate").val()))){
//                    alert("enter Num");
                    chequeRate.find("#temp_chequeRate").removeClass('hasError');
                }
            });
            chequeRateType.find("#temp_chequeRateType").mousedown(function(){
//                $("#chequeRateTypeMsgSave").hide();
                chequeRateType.find("#temp_chequeRateType").removeClass('hasError');
            });

        }
        $('#chequeTableData').on('click', '.icon-trash-add', function(){

            if(chqFeeShow==0)  $("#chequeFeesTr").show();
            $(this).closest ('tr').remove ();
        });

        $('#chequeTableData').on('click', '.icon-trash-edit', function(){
            chqFeeShow--;
            if(chqFeeShow==0)  $("#chequeFeesTr").show();
            $(this).closest ('tr').remove ();
        });
        var chqWithdrwShow = 0;
        validateChqWithdrwlFeesTable();

        $("#chequeWithdrawlAdd").click(function(){

            var chequeWithdrwlStartAm = $( "#chequeWithdrwlStartAmount" ).val();
            var chequeWithdrwlEndAm = $( "#chequeWithdrwlEndAmount" ).val();
            var chequeWithdrwlRate = $( "#chequeWithdrwlRate" ).val();
            var chequeWithdrwlRateType = $( "#chequeWithdrwlRateType" ).val();
            var chequeWithdrwlRateName = $( "#chequeWithdrwlRateType option:selected" ).html();
            var checkchqWithdrwl = 0;
            var checkchqWithdrwlInt = 0;


            if($('#chequeWithdrawalTableData').find('#chequeWithdrwlStartAmount').val()==''){
                checkchqWithdrwl++;
//                $("#chequeWithdrwlStartAmountMsg").show();
                $('#chequeWithdrwlStartAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#chequeWithdrawalTableData').find('#chequeWithdrwlStartAmount').val())){
                checkchqWithdrwlInt++;
            }

            if($('#chequeWithdrawalTableData').find('#chequeWithdrwlEndAmount').val()==''){
                checkchqWithdrwl++;
//                $("#chequeWithdrwlEndAmountMsg").show();
                $('#chequeWithdrwlEndAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#chequeWithdrawalTableData').find('#chequeWithdrwlEndAmount').val())){
                checkchqWithdrwlInt++;
            }
            if($('#chequeWithdrawalTableData').find('#chequeWithdrwlRateType').val()==''){
                checkchqWithdrwl++;
//                $("#chequeWithdrwlRateTypeMsg").show();
                $('#chequeWithdrwlRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if($('#chequeWithdrawalTableData').find('#chequeWithdrwlRate').val()==''){
                checkchqWithdrwl++;
//                $("#chequeWithdrwlRateMsg").show();
                $('#chequeWithdrwlRate').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#chequeWithdrawalTableData').find('#chequeWithdrwlRate').val())){
                checkchqWithdrwlInt++;
            }

            if((checkchqWithdrwl==0)&&(checkchqWithdrwlInt==0)) {
                $("#chequeWithdrawalTableData tbody").append(
                        "<tr>"+
                                "<td><div id='cheque_withdrwl_start'>"+chequeWithdrwlStartAm+"<input type='hidden' name='chequeWithdrwlStartAm' value='"+chequeWithdrwlStartAm+"' /></div></td>"+
                                "<td><div id='cheque_withdrwl_end'>"+chequeWithdrwlEndAm+"<input type='hidden' name='chequeWithdrwlEndAm' value='"+chequeWithdrwlEndAm+"' /></div></td>"+
                                "<td><div id='cheque_withdrwl_rate_type'>"+chequeWithdrwlRateName+"<input type='hidden' name='chequeWithdrwlRateType' value='"+chequeWithdrwlRateType+"' /></div></td>"+
                                "<td><div id='cheque_withdrwl_rate'>"+chequeWithdrwlRate+"<input type='hidden' name='chequeWithdrwlRate' value='"+chequeWithdrwlRate+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+
                                "</tr>");
                $('#chequeWithdrawalTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#chequeWithdrawalTableData').find('select').each(function() {
                    $(this).val('');
                });

            }

        });
        function validateChqWithdrwlFeesTable(){

//            $("#chequeWithdrwlStartAmountMsg").hide();
//            $("#chequeWithdrwlEndAmountMsg").hide();
//            $("#chequeWithdrwlRateTypeMsg").hide();
//            $("#chequeWithdrwlRateMsg").hide();

            $("#chequeWithdrwlStartAmount").keyup(function(){
                if(is_int($('#chequeWithdrwlStartAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#chequeWithdrwlStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#chequeWithdrwlStartAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#chequeWithdrwlStartAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });

            $("#chequeWithdrwlEndAmount").keyup(function(){
                if(is_int($('#chequeWithdrwlEndAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#chequeWithdrwlEndAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#chequeWithdrwlEndAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#chequeWithdrwlEndAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#chequeWithdrwlRate").keyup(function(){
                if(is_int($('#chequeWithdrwlRate').val())){
//                    $("#fixedMinMsg").hide();
                    $("#chequeWithdrwlRate").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#chequeWithdrwlRate').val())){
//                alert("Enter Number in Start Amount!");
                    $("#chequeWithdrwlRate").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#chequeWithdrwlRateType").mousedown(function(){
//                $("#chequeWithdrwlRateTypeMsg").hide();
                $("#chequeWithdrwlRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });



        }
        $('#chequeWithdrawalTableData').on('click', '.icon-pencil', function () {
            //     alert('Detected a click!');
            chqWithdrwShow++;
            $("#chequeWithdrwlFeesTr").hide();
            var par = $(this).closest('tr'); //tr
            var chequeWithdrwlStartAm = par.children("td:nth-child(1)");
            var chequeWithdrwlEndAm = par.children("td:nth-child(2)");
            var chequeWithdrwlRateType = par.children("td:nth-child(3)");
            var chequeWithdrwlRate = par.children("td:nth-child(4)");

            var chequewithdrwlEdit  = par.children("td:nth-child(5)");

            var drop = "<div id='cheque_withdrwl_rate_type'><select name='chequeWithdrwlRateType' style='min-width:120px'>" +
                    "<option value=''>- Select -</option>"+
                    "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var temp_chequeWithdrwlStartAm = "<input type='text' size='9' placeholder='Start Amount' value='"+chequeWithdrwlStartAm.children("div").children("input[type=hidden]").val()+"'/>";
            chequeWithdrwlStartAm.children("div").html(temp_chequeWithdrwlStartAm);

            var temp_chequeWithdrwlEndAm = "<input type='text' size='9' placeholder='End Amount'  value='"+chequeWithdrwlEndAm.children("div").children("input[type=hidden]").val()+"'/>";
            chequeWithdrwlEndAm.children("div").html(temp_chequeWithdrwlEndAm);

            var temp_chequeWithdrwlRate = "<input type='text' size='9' placeholder='0.00' value='"+chequeWithdrwlRate.children("div").children("input[type=hidden]").val()+"'/>";
            chequeWithdrwlRate.children("div").html(temp_chequeWithdrwlRate);

            var selVal = chequeWithdrwlRateType.children("div").children("input[type=hidden]").val();
            chequeWithdrwlRateType.html(drop);
            chequeWithdrwlRateType.find("select[name='chequeWithdrwlRateType'] option[value='"+selVal+"']").attr("selected","selected");

            chequewithdrwlEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            chequeWithdrwlStartAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(chequeWithdrwlStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeWithdrwlStartAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(chequeWithdrwlStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeWithdrwlStartAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            chequeWithdrwlEndAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(chequeWithdrwlEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeWithdrwlEndAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(chequeWithdrwlEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeWithdrwlEndAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            chequeWithdrwlRate.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(chequeWithdrwlRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeWithdrwlRate.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(chequeWithdrwlRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeWithdrwlRate.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });

        });
        $('#chequeWithdrawalTableData').on('click', '.glyphicon-floppy-saved', function () {

            var par = $(this).closest('tr'); //tr
            var chequeWithdrwlStartAm = par.children("td:nth-child(1)");
            var chequeWithdrwlEndAm = par.children("td:nth-child(2)");
            var chequeWithdrwlRateType = par.children("td:nth-child(3)");
            var chequeWithdrwlRate = par.children("td:nth-child(4)");

            var chequewithdrwlEdit  = par.children("td:nth-child(5)");
            var checkchqWithdrwlSave = 0;
            var checkchqWithdrwlSaveInt = 0;
            if(chequeWithdrwlStartAm.children("div").children("input[type=text]").val()==''){

                checkchqWithdrwlSave++;
                var temp_chequeWithdrwlStartAm =  "<input type='text' size='9' id='temp_chequeWithdrwlStartAm' placeholder='Start Amount' class='hasError'/>";
//                        "<div id='chequeWithdrwlStartAmMsgSave' class='errorMsg'><span>Please Enter Start Amount</span></div>";
                chequeWithdrwlStartAm.children("div").html(temp_chequeWithdrwlStartAm);
            }
            else if(!is_int(chequeWithdrwlStartAm.children("div").children("input[type=text]").val())){
                chequeWithdrwlStartAm++;
//                alert("enter num");
            }

            if(chequeWithdrwlEndAm.children("div").children("input[type=text]").val()==''){
                checkchqWithdrwlSave++;
                var temp_chequeWithdrwlEndAm =  "<input type='text' size='9' id='temp_chequeWithdrwlEndAm' placeholder='End Amount' class='hasError'/>";
//                        "<div id='chequeWithdrwlEndAmMsgSave' class='errorMsg'><span>Please Enter End Amount</span></div>";
                chequeWithdrwlEndAm.children("div").html(temp_chequeWithdrwlEndAm);

            }
            else if(!is_int(chequeWithdrwlEndAm.children("div").children("input[type=text]").val())){
                chequeWithdrwlStartAm++;
//                alert("enter num");
            }

            if(chequeWithdrwlRateType.children("div").children("select").val()==''){
                checkchqWithdrwlSave++;//
                var temp_chequeWithdrwlRateType =  "<select id='temp_chequeWithdrwlRateType' class='form-control hasError' name='chequeWithdrwlRateType' style='min-width:70px'>"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='chequeWithdrwlRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                chequeWithdrwlRateType.children("div").html(temp_chequeWithdrwlRateType);


            }

            if(chequeWithdrwlRate.children("div").children("input[type=text]").val()==''){
                checkchqWithdrwlSave++;

                var temp_chequeWithdrwlRate =  "<input type='text' size='9' id='temp_chequeWithdrwlRate' placeholder='0.00' class='hasError'/>";
//                        "<div id='chequeWithdrwlRateMsgSave' class='errorMsg'><span>Please Enter Rate</span></div>";
                chequeWithdrwlRate.children("div").html(temp_chequeWithdrwlRate);
            }
            else if(!is_int(chequeWithdrwlRate.children("div").children("input[type=text]").val())){
                chequeWithdrwlStartAm++;
//                alert("enter num");
            }


            validateChqWithdrwlFeesSave(par);
            if((checkchqWithdrwlSave==0)&&(checkchqWithdrwlSaveInt==0)){
                chqWithdrwShow--;
                if(chqWithdrwShow==0) $("#chequeWithdrwlFeesTr").show();

                var temp_chequeWithdrwlStartAm = chequeWithdrwlStartAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+chequeWithdrwlStartAm.children("div").children("input[type=text]").val()+"' name='chequeWithdrwlStartAm' />";
                chequeWithdrwlStartAm.children("div").html(temp_chequeWithdrwlStartAm);

                var temp_chequeWithdrwlEndAm = chequeWithdrwlEndAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+chequeWithdrwlEndAm.children("div").children("input[type=text]").val()+"' name='chequeWithdrwlEndAm' />";
                chequeWithdrwlEndAm.children("div").html(temp_chequeWithdrwlEndAm);

                var temp_chequeWithdrwlRate = chequeWithdrwlRate.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+chequeWithdrwlRate.children("div").children("input[type=text]").val()+"' name='chequeWithdrwlRate' />";
                chequeWithdrwlRate.children("div").html(temp_chequeWithdrwlRate);

                var temp_chequeWithdrwlRateType = chequeWithdrwlRateType.children("div").find("select[name=chequeWithdrwlRateType] option:selected").html() + "<input type='hidden' value='"+chequeWithdrwlRateType.children("div").children("select").val()+"' name='chequeWithdrwlRateType' />";
                chequeWithdrwlRateType.children("div").html(temp_chequeWithdrwlRateType);

                chequewithdrwlEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");


            }

        });
        function validateChqWithdrwlFeesSave(par){
            var chequeWithdrwlStartAm = par.children("td:nth-child(1)");
            var chequeWithdrwlEndAm = par.children("td:nth-child(2)");
            var chequeWithdrwlRateType = par.children("td:nth-child(3)");
            var chequeWithdrwlRate = par.children("td:nth-child(4)");
            chequeWithdrwlStartAm.find("#temp_chequeWithdrwlStartAm").keyup(function(){
                if(!is_int((chequeWithdrwlStartAm.find("#temp_chequeWithdrwlStartAm").val()))){
//                    alert("enter Num");
                    chequeWithdrwlStartAm.find("#temp_chequeWithdrwlStartAm").addClass('hasError');
                }
                if(is_int((chequeWithdrwlStartAm.find("#temp_chequeWithdrwlStartAm").val()))){
//                    alert("enter Num");
                    chequeWithdrwlStartAm.find("#temp_chequeWithdrwlStartAm").removeClass('hasError');
                }
            });

            chequeWithdrwlEndAm.find("#temp_chequeWithdrwlEndAm").keyup(function(){
                if(!is_int((chequeWithdrwlEndAm.find("#temp_chequeWithdrwlEndAm").val()))){
//                    alert("enter Num");
                    chequeWithdrwlEndAm.find("#temp_chequeWithdrwlEndAm").addClass('hasError');
                }
                if(is_int((chequeWithdrwlEndAm.find("#temp_chequeWithdrwlEndAm").val()))){
//                    alert("enter Num");
                    chequeWithdrwlEndAm.find("#temp_chequeWithdrwlEndAm").removeClass('hasError');
                }
            });
            chequeWithdrwlRate.find("#temp_chequeWithdrwlRate").keyup(function(){
                if(!is_int((chequeWithdrwlRate.find("#temp_chequeWithdrwlRate").val()))){
//                    alert("enter Num");
                    chequeWithdrwlRate.find("#temp_chequeWithdrwlRate").addClass('hasError');
                }
                if(is_int((chequeWithdrwlRate.find("#temp_chequeWithdrwlRate").val()))){
//                    alert("enter Num");
                    chequeWithdrwlRate.find("#temp_chequeWithdrwlRate").removeClass('hasError');
                }
            });
            chequeWithdrwlRateType.find("#temp_chequeWithdrwlRateType").mousedown(function(){
//                $("#chequeWithdrwlRateTypeMsgSave").hide();
                chequeWithdrwlRateType.find("#temp_chequeWithdrwlRateType").removeClass('hasError');
            });

        }
        $('#chequeWithdrawalTableData').on('click', '.icon-trash-add', function(){

            if(chqWithdrwShow==0)
                $("#chequeWithdrwlFeesTr").show();
            $(this).closest ('tr').remove ();
        });

        $('#chequeWithdrawalTableData').on('click', '.icon-trash-edit', function(){
            chqWithdrwShow--;
            if(chqWithdrwShow==0)
                $("#chequeWithdrwlFeesTr").show();
            $(this).closest ('tr').remove ();
        });
        var chqTransferShow = 0;
        validateChqTransferFeesTable();
        $("#chequeTransferAdd").click(function(){
            var chequeTransferStartAm = $( "#chequeTransferStartAmount" ).val();
            var chequeTransferEndAm = $( "#chequeTransferEndAmount" ).val();
            var chequeTransferRate = $( "#chequeTransferRate" ).val();
            var chequeTransferRateType = $( "#chequeTransferRateType" ).val();
            var chequeTransferRateName = $( "#chequeTransferRateType option:selected" ).html();
            var checkChqtrn = 0;
            var checkChqtrnInt = 0;

            if($('#chequeTransferTableData').find('#chequeTransferStartAmount').val()==''){
                checkChqtrn++;
//                $("#chequeTransferStartAmountMsg").show();
                $('#chequeTransferStartAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#chequeTransferTableData').find('#chequeTransferStartAmount').val())){
                checkChqtrnInt++;
            }
            if($('#chequeTransferTableData').find('#chequeTransferEndAmount').val()==''){
                checkChqtrn++;
//                $("#chequeTransferEndAmountMsg").show();
                $('#chequeTransferEndAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#chequeTransferTableData').find('#chequeTransferEndAmount').val())){
                checkChqtrnInt++;
            }
            if($('#chequeTransferTableData').find('#chequeTransferRate').val()==''){
                checkChqtrn++;
//                $("#chequeTransferRateMsg").show();
                $('#chequeTransferRate').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#chequeTransferTableData').find('#chequeTransferRate').val())){
                checkChqtrnInt++;
            }
            if($('#chequeTransferTableData').find('#chequeTransferRateType').val()==''){
                checkChqtrn++;
//                $("#chequeTransferRateTypeMsg").show();
                $('#chequeTransferRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }

            if((checkChqtrn==0)&&(checkChqtrnInt==0)) {
                $("#chequeTransferTableData tbody").append(
                        "<tr>"+
                                "<td><div id='cheque_transfer_start'>"+chequeTransferStartAm+"<input type='hidden' name='chequeTransferStartAm' value='"+chequeTransferStartAm+"' /></div></td>"+
                                "<td><div id='cheque_transfer_end'>"+chequeTransferEndAm+"<input type='hidden' name='chequeTransferEndAm' value='"+chequeTransferEndAm+"' /></div></td>"+
                                "<td><div id='cheque_transfer_rate_type'>"+chequeTransferRateName+"<input type='hidden' name='chequeTransferRateType' value='"+chequeTransferRateType+"' /></div></td>"+
                                "<td><div id='cheque_transfer_rate'>"+chequeTransferRate+"<input type='hidden' name='chequeTransferRate' value='"+chequeTransferRate+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+
                                "</tr>");
                $('#chequeTransferTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#chequeTransferTableData').find('select').each(function() {
                    $(this).val('');
                });

            }

        });
        function validateChqTransferFeesTable(){

//            $("#chequeTransferStartAmountMsg").hide();
//            $("#chequeTransferEndAmountMsg").hide();
//            $("#chequeTransferRateTypeMsg").hide();
//            $("#chequeTransferRateMsg").hide();

            $("#chequeTransferStartAmount").keyup(function(){
                if(is_int($('#chequeTransferStartAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#chequeTransferStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#chequeTransferStartAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#chequeTransferStartAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });

            $("#chequeTransferEndAmount").keyup(function(){
                if(is_int($('#chequeTransferEndAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#chequeTransferEndAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#chequeTransferEndAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#chequeTransferEndAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#chequeTransferRate").keyup(function(){
                if(is_int($('#chequeTransferRate').val())){
//                    $("#fixedMinMsg").hide();
                    $("#chequeTransferRate").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#chequeTransferRate').val())){
//                alert("Enter Number in Start Amount!");
                    $("#chequeTransferRate").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#chequeTransferRateType").mousedown(function(){
//                $("#chequeTransferRateTypeMsg").hide();
                $("#chequeTransferRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });


        }
        $('#chequeTransferTableData ').on('click', '.icon-pencil', function () {
            //     alert('Detected a click!');
            chqTransferShow++;
            $("#chequeTransferTr").hide();
            var par = $(this).closest('tr'); //tr
            var chequeTransferStartAm = par.children("td:nth-child(1)");
            var chequeTransferEndAm = par.children("td:nth-child(2)");
            var chequeTransferRateType = par.children("td:nth-child(3)");
            var chequeTransferRate = par.children("td:nth-child(4)");

            var chequeTransferEdit  = par.children("td:nth-child(5)");

            var drop = "<div id='cheque_transfer_rate_type'><select name='chequeTransferRateType' style='min-width:120px'>" +
                    "<option value=''>- Select -</option>"+
                    "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var temp_chequeTransferStartAm = "<input type='text' size='9' placeholder='Start Amount'  value='"+chequeTransferStartAm.children("div").children("input[type=hidden]").val()+"'/>";
            chequeTransferStartAm.children("div").html(temp_chequeTransferStartAm);

            var temp_chequeTransferEndAm = "<input type='text' size='9' placeholder='End Amount'  value='"+chequeTransferEndAm.children("div").children("input[type=hidden]").val()+"'/>";
            chequeTransferEndAm.children("div").html(temp_chequeTransferEndAm);

            var temp_chequeTransferRate = "<input type='text' size='9' placeholder='0.00' value='"+chequeTransferRate.children("div").children("input[type=hidden]").val()+"'/>";
            chequeTransferRate.children("div").html(temp_chequeTransferRate);

            var selVal = chequeTransferRateType.children("div").children("input[type=hidden]").val();
            chequeTransferRateType.html(drop);
            chequeTransferRateType.find("select[name='chequeTransferRateType'] option[value='"+selVal+"']").attr("selected","selected");

            chequeTransferEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            chequeTransferStartAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(chequeTransferStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeTransferStartAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(chequeTransferStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeTransferStartAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            chequeTransferEndAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(chequeTransferEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeTransferEndAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(chequeTransferEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeTransferEndAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            chequeTransferRate.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(chequeTransferRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeTransferRate.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(chequeTransferRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    chequeTransferRate.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });

        });
        $('#chequeTransferTableData ').on('click', '.glyphicon-floppy-saved', function () {

            var par = $(this).closest('tr'); //tr
            var chequeTransferStartAm = par.children("td:nth-child(1)");
            var chequeTransferEndAm = par.children("td:nth-child(2)");
            var chequeTransferRateType = par.children("td:nth-child(3)");
            var chequeTransferRate = par.children("td:nth-child(4)");

            var chequeTransferEdit  = par.children("td:nth-child(5)");
            var checkChqtrnSave = 0;
            var checkChqtrnSaveInt = 0;
            if(chequeTransferStartAm.children("div").children("input[type=text]").val()==''){

                checkChqtrnSave++;
                var temp_chequeTransferStartAm =  "<input type='text' size='9' id='temp_chequeTransferStartAm' placeholder='Start Amount' class='hasError'/>";
//                        "<div id='chequeTransferStartAmMsgSave' class='errorMsg'><span>Please Enter Start Amount</span></div>";
                chequeTransferStartAm.children("div").html(temp_chequeTransferStartAm);
            }
            else if(!is_int(chequeTransferStartAm.children("div").children("input[type=text]").val())){
                checkChqtrnSaveInt++;
//                alert("enter num");
            }

            if(chequeTransferEndAm.children("div").children("input[type=text]").val()==''){
                checkChqtrnSave++;
                var temp_chequeTransferEndAm =  "<input type='text' size='9' id='temp_chequeTransferEndAm' placeholder='End Amount' class='hasError'/>";
//                        "<div id='chequeTransferEndAmMsgSave' class='errorMsg'><span>Please Enter End Amount</span></div>";
                chequeTransferEndAm.children("div").html(temp_chequeTransferEndAm);

            }
            else if(!is_int(chequeTransferEndAm.children("div").children("input[type=text]").val())){
                checkChqtrnSaveInt++;
//                alert("enter num");
            }

            if(chequeTransferRateType.children("div").children("select").val()==''){
                checkChqtrnSave++;//
                var temp_chequeTransferRateType =  "<select id='temp_chequeTransferRateType' class='form-control hasError' name='chequeTransferRateType' style='min-width:70px'>"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>"+
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='chequeTransferRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                chequeTransferRateType.children("div").html(temp_chequeTransferRateType);


            }

            if(chequeTransferRate.children("div").children("input[type=text]").val()==''){
                checkChqtrnSave++;

                var temp_chequeTransferRate =  "<input type='text' size='9' id='temp_chequeTransferRate' placeholder='0.00' class='hasError'/>";
//                        "<div id='chequeTransferRateMsgSave' class='errorMsg'><span>Please Enter Rate</span></div>";
                chequeTransferRate.children("div").html(temp_chequeTransferRate);
            }
            else if(!is_int(chequeTransferRate.children("div").children("input[type=text]").val())){
                checkChqtrnSaveInt++;
//                alert("enter num");
            }


            validateChqTransferFeesSave(par);
            if((checkChqtrnSave==0)&&(checkChqtrnSaveInt==0)){
                chqTransferShow--;
                if(chqTransferShow==0) $("#chequeTransferTr").show();

                var temp_chequeTransferStartAm = chequeTransferStartAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+chequeTransferStartAm.children("div").children("input[type=text]").val()+"' name='chequeTransferStartAm' />";
                chequeTransferStartAm.children("div").html(temp_chequeTransferStartAm);

                var temp_chequeTransferEndAm = chequeTransferEndAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+chequeTransferEndAm.children("div").children("input[type=text]").val()+"' name='chequeTransferEndAm' />";
                chequeTransferEndAm.children("div").html(temp_chequeTransferEndAm);

                var temp_chequeTransferRate = chequeTransferRate.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+chequeTransferRate.children("div").children("input[type=text]").val()+"' name='chequeTransferRate' />";
                chequeTransferRate.children("div").html(temp_chequeTransferRate);

                var temp_chequeTransferRateType = chequeTransferRateType.children("div").find("select[name=chequeTransferRateType] option:selected").html() + "<input type='hidden' value='"+chequeTransferRateType.children("div").children("select").val()+"' name='chequeTransferRateType' />";
                chequeTransferRateType.children("div").html(temp_chequeTransferRateType);

                chequeTransferEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");

            }

        });
        function validateChqTransferFeesSave(par){
            var chequeTransferStartAm = par.children("td:nth-child(1)");
            var chequeTransferEndAm = par.children("td:nth-child(2)");
            var chequeTransferRateType = par.children("td:nth-child(3)");
            var chequeTransferRate = par.children("td:nth-child(4)");
            chequeTransferStartAm.find("#temp_chequeTransferStartAm").keyup(function(){
                if(!is_int((chequeTransferStartAm.find("#temp_chequeTransferStartAm").val()))){
//                    alert("enter Num");
                    chequeTransferStartAm.find("#temp_chequeTransferStartAm").addClass('hasError');
                }
                if(is_int((chequeTransferStartAm.find("#temp_chequeTransferStartAm").val()))){
//                    alert("enter Num");
                    chequeTransferStartAm.find("#temp_chequeTransferStartAm").removeClass('hasError');
                }
            });

            chequeTransferEndAm.find("#temp_chequeTransferEndAm").keyup(function(){
                if(!is_int((chequeTransferEndAm.find("#temp_chequeTransferEndAm").val()))){
//                    alert("enter Num");
                    chequeTransferEndAm.find("#temp_chequeTransferEndAm").addClass('hasError');
                }
                if(is_int((chequeTransferEndAm.find("#temp_chequeTransferEndAm").val()))){
//                    alert("enter Num");
                    chequeTransferEndAm.find("#temp_chequeTransferEndAm").removeClass('hasError');
                }
            });
            chequeTransferRate.find("#temp_chequeTransferRate").keyup(function(){
                if(!is_int((chequeTransferRate.find("#temp_chequeTransferRate").val()))){
//                    alert("enter Num");
                    chequeTransferRate.find("#temp_chequeTransferRate").addClass('hasError');
                }
                if(is_int((chequeTransferRate.find("#temp_chequeTransferRate").val()))){
//                    alert("enter Num");
                    chequeTransferRate.find("#temp_chequeTransferRate").removeClass('hasError');
                }
            });
            chequeTransferRateType.find("#temp_chequeTransferRateType").mousedown(function(){
//                $("#chequeTransferRateTypeMsgSave").hide();
                chequeTransferRateType.find("#temp_chequeTransferRateType").removeClass('hasError');
            });

        }
        $('#chequechequeTransferTableData').on('click', '.icon-trash-add', function(){

            if(chqTransferShow==0)
                $("#chequechequeTransferTr").show();
            $(this).closest ('tr').remove ();
        });
        $('#chequechequeTransferTableData').on('click', '.icon-trash-edit', function(){
            chqTransferShow--;
            if(chqTransferShow==0)
                $("#chequechequeTransferTr").show();
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
