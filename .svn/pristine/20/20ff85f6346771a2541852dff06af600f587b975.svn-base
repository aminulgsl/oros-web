%{--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">--}%
%{--</script>--}%
<g:render template='/coreBanking/settings/product/savings/cardFeesTable'/>
<script type="text/javascript">
    $(document).ready(function(){
        var cardShow = 0;
        validateCardFeesTable();
        $("#cardAdd").click(function(){
            var cardStartAm = $( "#cardStartAmount" ).val();
            var cardEndAm = $( "#cardEndAmount" ).val();
            var cardRate = $( "#cardRate" ).val();
            var cardRateType = $( "#cardRateType" ).val();
            var cardRateTypeName = $( "#cardRateType option:selected" ).html();
            var checkCardFee = 0;
            var checkCardFeeInt = 0;

            if($('#cardTableData').find('#cardStartAmount').val()==''){
                checkCardFee++;
//                $("#cardStartAmountMsg").show();
                $('#cardStartAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#cardTableData').find('#cardStartAmount').val())){
                checkCardFeeInt++;
            }
            if($('#cardTableData').find('#cardEndAmount').val()==''){
                checkCardFee++;
//                $("#cardEndAmountMsg").show();
                $('#cardEndAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#cardTableData').find('#cardEndAmount').val())){
                checkCardFeeInt++;
            }
            if($('#cardTableData').find('#cardRateType').val()==''){
                checkCardFee++;
//                $("#cardRateTypeMsg").show();
                $('#cardRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if($('#cardTableData').find('#cardRate').val()==''){
                checkCardFee++;
//                $("#cardRateMsg").show();
                $('#cardRate').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#cardTableData').find('#cardRate').val())){
                checkCardFeeInt++;
            }

            if((checkCardFee==0)&&(checkCardFeeInt==0)) {
                $("#cardTableData tbody").append(
                        "<tr>"+
                                "<td><div id='card_start'>"+cardStartAm+"<input type='hidden' name='cardStart' value='"+cardStartAm+"' /></div></td>"+
                                "<td><div id='card_end'>"+cardEndAm+"<input type='hidden' name='cardEnd' value='"+cardEndAm+"' /></div></td>"+
                                "<td><div id='card_rate_type'>"+cardRateTypeName+"<input type='hidden' name='cardRateType' value='"+cardRateType+"' /></div></td>"+
                                "<td><div id='card_rate'>"+cardRate+"<input type='hidden' name='cardRate' value='"+cardRate+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+

                                "</tr>");
                $('#cardTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#cardTableData').find('select').each(function() {
                    $(this).val('');
                });
            }


        });
        function validateCardFeesTable(){

//            $("#cardStartAmountMsg").hide();
//            $("#cardEndAmountMsg").hide();
//            $("#cardRateTypeMsg").hide();
//            $("#cardRateMsg").hide();

            $("#cardStartAmount").keyup(function(){
                if(is_int($('#cardStartAmount').val())){
//                    $("#cashStartAmountMsg").hide();
                    $("#cardStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cardStartAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cardStartAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });

            $("#cardEndAmount").keyup(function(){
                if(is_int($('#cardEndAmount').val())){
//                    $("#cashStartAmountMsg").hide();
                    $("#cardEndAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cardEndAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cardEndAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#cardRate").keyup(function(){
                if(is_int($('#cardRate').val())){
//                    $("#cashStartAmountMsg").hide();
                    $("#cardRate").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cardRate').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cardRate").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#cardRateType").mousedown(function(){
//                $("#cardRateTypeMsg").hide();
                $("#cardRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });


        }
        $('#cardTableData').on('click', '.icon-pencil', function () {
            //     alert('Detected a click!');
            cardShow++;
            $("#cardFeesTr").hide();
            var par = $(this).closest('tr'); //tr
            var cardStartAm = par.children("td:nth-child(1)");
            var cardEndAm = par.children("td:nth-child(2)");
            var cardRateType = par.children("td:nth-child(3)");
            var cardRate = par.children("td:nth-child(4)");
            var cardEdit  = par.children("td:nth-child(5)");

            var drop = "<div id='card_rate_type'><select name='cardRateType' style='min-width:120px'>" +
                    "<option value=''>- Select -</option>"+
                    "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>" +
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var temp_cardStartAm = "<input type='text' size='9' placeholder='Start Amount' value='"+cardStartAm.children("div").children("input[type=hidden]").val()+"'/>";
            cardStartAm.children("div").html(temp_cardStartAm);

            var temp_cardEndAm = "<input type='text' size='9' placeholder='End Amount' value='"+cardEndAm.children("div").children("input[type=hidden]").val()+"'/>";
            cardEndAm.children("div").html(temp_cardEndAm);

            var temp_cardRate = "<input type='text' size='9' placeholder='0.00' value='"+cardRate.children("div").children("input[type=hidden]").val()+"'/>";
            cardRate.children("div").html(temp_cardRate);

            var selVal = cardRateType.children("div").children("input[type=hidden]").val();
            cardRateType.html(drop);
            cardRateType.find("select[name='cardRateType'] option[value='"+selVal+"']").attr("selected","selected");

            cardEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            cardStartAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cardStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardStartAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cardStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardStartAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            cardEndAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cardEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardEndAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cardEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardEndAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            cardRate.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cardRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardRate.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cardRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardRate.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });

        });
        $('#cardTableData').on('click', '.glyphicon-floppy-saved', function () {

            var par = $(this).closest('tr'); //tr
            var cardStartAm = par.children("td:nth-child(1)");
            var cardEndAm = par.children("td:nth-child(2)");
            var cardRateType = par.children("td:nth-child(3)");
            var cardRate = par.children("td:nth-child(4)");

            var cardEdit  = par.children("td:nth-child(5)");
            var checkCardSave = 0;
            var checkCardSaveInt = 0;
            if(cardStartAm.children("div").children("input[type=text]").val()==''){

                checkCardSave++;
                var temp_cardStartAm =  "<input type='text' size='9' id='temp_cardStartAm' placeholder='Start Amount' class='hasError'/>";
//                        "<div id='cardStartAmMsgSave' class='errorMsg'><span>Please Enter Start Amount</span></div>";
                cardStartAm.children("div").html(temp_cardStartAm);
            }
            else if(!is_int(cardStartAm.children("div").children("input[type=text]").val())){
                checkCardSaveInt++;
//                alert("enter num");
            }

            if(cardEndAm.children("div").children("input[type=text]").val()==''){
                checkCardSave++;
                var temp_cardEndAm =  "<input type='text' size='9' id='temp_cardEndAm' placeholder='End Amount' class='hasError'/>";
//                        "<div id='cardEndAmMsgSave' class='errorMsg'><span>Please Enter End Amount</span></div>";
                cardEndAm.children("div").html(temp_cardEndAm);

            }
            else if(!is_int(cardEndAm.children("div").children("input[type=text]").val())){
                checkCardSaveInt++;
//                alert("enter num");
            }

            if(cardRateType.children("div").children("select").val()==''){
                checkCardSave++;//
                var temp_cardRateType =  "<select id='temp_cardRateType' class='form-control hasError' name='cardRateType' style='min-width:70px'>"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>" +
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='cardRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                cardRateType.children("div").html(temp_cardRateType);


            }

            if(cardRate.children("div").children("input[type=text]").val()==''){
                checkCardSave++;

                var temp_cardRate =  "<input type='text' size='9' id='temp_cardRate' placeholder='0.00' class='hasError'/>";
//                        "<div id='cardRateMsgSave' class='errorMsg'><span>Please Enter Rate</span></div>";
                cardRate.children("div").html(temp_cardRate);
            }
            else if(!is_int(cardRate.children("div").children("input[type=text]").val())){
                checkCardSaveInt++;
//                alert("enter num");
            }


            validateCardFeesSave(par);
            if((checkCardSave==0)&&(checkCardSaveInt==0)){
                cardShow--;

                if(cardShow==0) $("#cardFeesTr").show();
                var temp_cardStartAm = cardStartAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cardStartAm.children("div").children("input[type=text]").val()+"' name='cardStart' />";
                cardStartAm.children("div").html(temp_cardStartAm);

                var temp_cardEndAm = cardEndAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cardEndAm.children("div").children("input[type=text]").val()+"' name='cardEnd' />";
                cardEndAm.children("div").html(temp_cardEndAm);

                var temp_cardRate = cardRate.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cardRate.children("div").children("input[type=text]").val()+"' name='cardRate' />";
                cardRate.children("div").html(temp_cardRate);

                var temp_cardRateType = cardRateType.children("div").find("select[name=cardRateType] option:selected").html() + "<input type='hidden' value='"+cardRateType.children("div").children("select").val()+"' name='cardRateType' />";
                cardRateType.children("div").html(temp_cardRateType);

                cardEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");


            }
        });
        function validateCardFeesSave(par){
            var cardStartAm = par.children("td:nth-child(1)");
            var cardEndAm = par.children("td:nth-child(2)");
            var cardRateType = par.children("td:nth-child(3)");
            var cardRate = par.children("td:nth-child(4)");

            cardStartAm.find("#temp_cardStartAm").keyup(function(){
                if(!is_int((cardStartAm.find("#temp_cardStartAm").val()))){
//                    alert("enter Num");
                    cardStartAm.find("#temp_cardStartAm").addClass('hasError');
                }
                if(is_int((cardStartAm.find("#temp_cardStartAm").val()))){
//                    alert("enter Num");
                    cardStartAm.find("#temp_cardStartAm").removeClass('hasError');
                }
            });

            cardEndAm.find("#temp_cardEndAm").keyup(function(){
                if(!is_int((cardEndAm.find("#temp_cardEndAm").val()))){
//                    alert("enter Num");
                    cardEndAm.find("#temp_cardEndAm").addClass('hasError');
                }
                if(is_int((cardEndAm.find("#temp_cardEndAm").val()))){
//                    alert("enter Num");
                    cardEndAm.find("#temp_cardEndAm").removeClass('hasError');
                }
            });
            cardRate.find("#temp_cardRate").keyup(function(){
                if(!is_int((cardRate.find("#temp_cardRate").val()))){
//                    alert("enter Num");
                    cardRate.find("#temp_cardRate").addClass('hasError');
                }
                if(is_int((cardRate.find("#temp_cardRate").val()))){
//                    alert("enter Num");
                    cardRate.find("#temp_cardRate").removeClass('hasError');
                }
            });
            cardRateType.find("#temp_cardRateType").mousedown(function(){
//                $("#cardRateTypeMsgSave").hide();
                cardRateType.find("#temp_cardRateType").removeClass('hasError');
            });

        }
        $('#cardTableData').on('click', '.icon-trash-add', function(){


            if(cardShow==0)
                $("#cardFeesTr").show();
            $(this).closest ('tr').remove ();

        });
        $('#cardTableData').on('click', '.icon-trash-edit', function(){
            cardShow--;

            if(cardShow==0)
                $("#cardFeesTr").show();
            $(this).closest ('tr').remove ();

        });
        var cardWithdrwShow = 0;
        validateCardWithdrwlFeesTable();

        $("#cardWithdrawlAdd").click(function(){
            var cardWithdrwlStartAm = $( "#cardWithdrwlStartAmount" ).val();
            var cardWithdrwlEndAm = $( "#cardWithdrwlEndAmount" ).val();
            var cardWithdrwlRate = $( "#cardWithdrwlRate" ).val();
            var cardWithdrwlRateType = $( "#cardWithdrwlRateType" ).val();
            var cardWithdrwlRateName = $( "#cardWithdrwlRateType option:selected" ).html();
            var checkcardWithdrwl = 0;
            var checkcardWithdrwlInt = 0;


            if($('#cardWithdrawalTableData').find('#cardWithdrwlStartAmount').val()==''){
                checkcardWithdrwl++;
//                $("#cardWithdrwlStartAmountMsg").show();
                $('#cardWithdrwlStartAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#cardWithdrawalTableData').find('#cardWithdrwlStartAmount').val())){
                checkcardWithdrwlInt++;
            }

            if($('#cardWithdrawalTableData').find('#cardWithdrwlEndAmount').val()==''){
                checkcardWithdrwl++;
//                $("#cardWithdrwlEndAmountMsg").show();
                $('#cardWithdrwlEndAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#cardWithdrawalTableData').find('#cardWithdrwlEndAmount').val())){
                checkcardWithdrwlInt++;
            }
            if($('#cardWithdrawalTableData').find('#cardWithdrwlRateType').val()==''){
                checkcardWithdrwl++;
//                $("#cardWithdrwlRateTypeMsg").show();
                $('#cardWithdrwlRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if($('#cardWithdrawalTableData').find('#cardWithdrwlRate').val()==''){
                checkcardWithdrwl++;
//                $("#cardWithdrwlRateMsg").show();
                $('#cardWithdrwlRate').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#cardWithdrawalTableData').find('#cardWithdrwlRate').val())){
                checkcardWithdrwlInt++;
            }

            if((checkcardWithdrwl==0)&&(checkcardWithdrwlInt==0)) {
                $("#cardWithdrawalTableData tbody").append(
                        "<tr>"+
                                "<td><div id='card_withdrwl_start'>"+cardWithdrwlStartAm+"<input type='hidden' name='cardWithdrwlStartAm' value='"+cardWithdrwlStartAm+"' /></div></td>"+
                                "<td><div id='card_withdrwl_end'>"+cardWithdrwlEndAm+"<input type='hidden' name='cardWithdrwlEndAm' value='"+cardWithdrwlEndAm+"' /></div></td>"+
                                "<td><div id='card_withdrwl_rate_type'>"+cardWithdrwlRateName+"<input type='hidden' name='cardWithdrwlRateType' value='"+cardWithdrwlRateType+"' /></div></td>"+
                                "<td><div id='card_withdrwl_rate'>"+cardWithdrwlRate+"<input type='hidden' name='cardWithdrwlRate' value='"+cardWithdrwlRate+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+
                                "</tr>");
                $('#cardWithdrawalTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#cardWithdrawalTableData').find('select').each(function() {
                    $(this).val('');
                });
            }
        });
        function validateCardWithdrwlFeesTable(){

//            $("#cardWithdrwlStartAmountMsg").hide();
//            $("#cardWithdrwlEndAmountMsg").hide();
//            $("#cardWithdrwlRateTypeMsg").hide();
//            $("#cardWithdrwlRateMsg").hide();

            $("#cardWithdrwlStartAmount").keyup(function(){
                if(is_int($('#cardWithdrwlStartAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#cardWithdrwlStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cardWithdrwlStartAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cardWithdrwlStartAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });

            $("#cardWithdrwlEndAmount").keyup(function(){
                if(is_int($('#cardWithdrwlEndAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#cardWithdrwlEndAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cardWithdrwlEndAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cardWithdrwlEndAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#cardWithdrwlRate").keyup(function(){
                if(is_int($('#cardWithdrwlRate').val())){
//                    $("#fixedMinMsg").hide();
                    $("#cardWithdrwlRate").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cardWithdrwlRate').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cardWithdrwlRate").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#cardWithdrwlRateType").mousedown(function(){
//                $("#cardWithdrwlRateTypeMsg").hide();
                $("#cardWithdrwlRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });



        }
        $('#cardWithdrawalTableData').on('click', '.icon-pencil', function () {
            //     alert('Detected a click!');
            cardWithdrwShow++;
            $("#cardWithdrwlFeesTr").hide();
            var par = $(this).closest('tr'); //tr
            var cardWithdrwlStartAm = par.children("td:nth-child(1)");
            var cardWithdrwlEndAm = par.children("td:nth-child(2)");
            var cardWithdrwlRateType = par.children("td:nth-child(3)");
            var cardWithdrwlRate = par.children("td:nth-child(4)");

            var cardWithdrwlEdit  = par.children("td:nth-child(5)");

            var drop = "<div id='card_withdrwl_rate_type'><select name='cardWithdrwlRateType' style='min-width:120px'>" +
                    "<option value=''>- Select -</option>"+
                    "<option value='${rateType.FLAT}''>${rateType.FLAT}</option>" +
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var temp_cardWithdrwlStartAm = "<input type='text' size='9' placeholder='Start Amount'  value='"+cardWithdrwlStartAm.children("div").children("input[type=hidden]").val()+"'/>";
            cardWithdrwlStartAm.children("div").html(temp_cardWithdrwlStartAm);

            var temp_cardWithdrwlEndAm = "<input type='text' size='9' placeholder='End Amount' value='"+cardWithdrwlEndAm.children("div").children("input[type=hidden]").val()+"'/>";
            cardWithdrwlEndAm.children("div").html(temp_cardWithdrwlEndAm);

            var temp_cardWithdrwlRate = "<input type='text' size='9' placeholder='0.00' value='"+cardWithdrwlRate.children("div").children("input[type=hidden]").val()+"'/>";
            cardWithdrwlRate.children("div").html(temp_cardWithdrwlRate);

            var selVal = cardWithdrwlRateType.children("div").children("input[type=hidden]").val();
            cardWithdrwlRateType.html(drop);
            cardWithdrwlRateType.find("select[name='cardWithdrwlRateType'] option[value='"+selVal+"']").attr("selected","selected");

            cardWithdrwlEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            cardWithdrwlStartAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cardWithdrwlStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardWithdrwlStartAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cardWithdrwlStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("123");
                    cardWithdrwlStartAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            cardWithdrwlEndAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cardWithdrwlEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardWithdrwlEndAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cardWithdrwlEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardWithdrwlEndAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            cardWithdrwlRate.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cardWithdrwlRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardWithdrwlRate.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cardWithdrwlRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardWithdrwlRate.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });

        });
        $('#cardWithdrawalTableData').on('click', '.glyphicon-floppy-saved', function () {

            var par = $(this).closest('tr'); //tr
            var cardWithdrwlStartAm = par.children("td:nth-child(1)");
            var cardWithdrwlEndAm = par.children("td:nth-child(2)");
            var cardWithdrwlRateType = par.children("td:nth-child(3)");
            var cardWithdrwlRate = par.children("td:nth-child(4)");

            var cardWithdrwlEdit  = par.children("td:nth-child(5)");
            var checkCardWithdrwlSave = 0;
            var checkCardWithdrwlSaveInt = 0;
            if(cardWithdrwlStartAm.children("div").children("input[type=text]").val()==''){

                checkCardWithdrwlSave++;
                var temp_cardWithdrwlStartAm =  "<input type='text' size='9' id='temp_cardWithdrwlStartAm' placeholder='Start Amount' class='hasError'/>";
//                        "<div id='cardWithdrwlStartAmMsgSave' class='errorMsg'><span>Please Enter Start Amount</span></div>";
                cardWithdrwlStartAm.children("div").html(temp_cardWithdrwlStartAm);
            }
            else if(!is_int(cardWithdrwlStartAm.children("div").children("input[type=text]").val())){
                checkCardWithdrwlSaveInt++;
//                alert("enter num");
            }

            if(cardWithdrwlEndAm.children("div").children("input[type=text]").val()==''){
                checkCardWithdrwlSave++;
                var temp_cardWithdrwlEndAm =  "<input type='text' size='9' id='temp_cardWithdrwlEndAm' placeholder='End Amount' class='hasError'/>";
//                        "<div id='cardWithdrwlEndAmMsgSave' class='errorMsg'><span>Please Enter End Amount</span></div>";
                cardWithdrwlEndAm.children("div").html(temp_cardWithdrwlEndAm);

            }
            else if(!is_int(cardWithdrwlEndAm.children("div").children("input[type=text]").val())){
                checkCardWithdrwlSaveInt++;
//                alert("enter num");
            }

            if(cardWithdrwlRateType.children("div").children("select").val()==''){
                checkCardWithdrwlSave++;//
                var temp_cardWithdrwlRateType =  "<select id='temp_cardWithdrwlRateType' class='form-control hasError' name='cardWithdrwlRateType' style='min-width:70px'>"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>" +
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='cardWithdrwlRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                cardWithdrwlRateType.children("div").html(temp_cardWithdrwlRateType);


            }

            if(cardWithdrwlRate.children("div").children("input[type=text]").val()==''){
                checkCardWithdrwlSave++;

                var temp_cardWithdrwlRate =  "<input type='text' size='9' id='temp_cardWithdrwlRate' placeholder='0.00' class='hasError'/>";
//                        "<div id='cardWithdrwlRateMsgSave' class='errorMsg'><span>Please Enter Rate</span></div>";
                cardWithdrwlRate.children("div").html(temp_cardWithdrwlRate);
            }
            else if(!is_int(cardWithdrwlRate.children("div").children("input[type=text]").val())){
                checkCardWithdrwlSaveInt++;
//                alert("enter num");
            }


            validateCardWithdrwlFeesSave(par);
            if((checkCardWithdrwlSave==0)&&(checkCardWithdrwlSaveInt==0)){
                cardWithdrwShow--;
                if(cardWithdrwShow==0) $("#cardWithdrwlFeesTr").show();

                var temp_cardWithdrwlStartAm = cardWithdrwlStartAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cardWithdrwlStartAm.children("div").children("input[type=text]").val()+"' name='cardWithdrwlStartAm' />";
                cardWithdrwlStartAm.children("div").html(temp_cardWithdrwlStartAm);

                var temp_cardWithdrwlEndAm = cardWithdrwlEndAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cardWithdrwlEndAm.children("div").children("input[type=text]").val()+"' name='cardWithdrwlEndAm' />";
                cardWithdrwlEndAm.children("div").html(temp_cardWithdrwlEndAm);

                var temp_cardWithdrwlRate = cardWithdrwlRate.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cardWithdrwlRate.children("div").children("input[type=text]").val()+"' name='cardWithdrwlRate' />";
                cardWithdrwlRate.children("div").html(temp_cardWithdrwlRate);

                var temp_cardWithdrwlRateType = cardWithdrwlRateType.children("div").find("select[name=cardWithdrwlRateType] option:selected").html() + "<input type='hidden' value='"+cardWithdrwlRateType.children("div").children("select").val()+"' name='cardWithdrwlRateType' />";
                cardWithdrwlRateType.children("div").html(temp_cardWithdrwlRateType);

                cardWithdrwlEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");

            }

        });
        function validateCardWithdrwlFeesSave(par){
            var cardWithdrwlStartAm = par.children("td:nth-child(1)");
            var cardWithdrwlEndAm = par.children("td:nth-child(2)");
            var cardWithdrwlRateType = par.children("td:nth-child(3)");
            var cardWithdrwlRate = par.children("td:nth-child(4)");
            cardWithdrwlStartAm.find("#temp_cardWithdrwlStartAm").keyup(function(){
                if(!is_int((cardWithdrwlStartAm.find("#temp_cardWithdrwlStartAm").val()))){
//                    alert("enter Num");
                    cardWithdrwlStartAm.find("#temp_cardWithdrwlStartAm").addClass('hasError');
                }
                if(is_int((cardWithdrwlStartAm.find("#temp_cardWithdrwlStartAm").val()))){
//                    alert("enter Num");
                    cardWithdrwlStartAm.find("#temp_cardWithdrwlStartAm").removeClass('hasError');
                }
            });

            cardWithdrwlEndAm.find("#temp_cardWithdrwlEndAm").keyup(function(){
                if(!is_int((cardWithdrwlEndAm.find("#temp_cardWithdrwlEndAm").val()))){
//                    alert("enter Num");
                    cardWithdrwlEndAm.find("#temp_cardWithdrwlEndAm").addClass('hasError');
                }
                if(is_int((cardWithdrwlEndAm.find("#temp_cardWithdrwlEndAm").val()))){
//                    alert("enter Num");
                    cardWithdrwlEndAm.find("#temp_cardWithdrwlEndAm").removeClass('hasError');
                }
            });
            cardWithdrwlRate.find("#temp_cardWithdrwlRate").keyup(function(){
                if(!is_int((cardWithdrwlRate.find("#temp_cardWithdrwlRate").val()))){
//                    alert("enter Num");
                    cardWithdrwlRate.find("#temp_cardWithdrwlRate").addClass('hasError');
                }
                if(is_int((cardWithdrwlRate.find("#temp_cardWithdrwlRate").val()))){
//                    alert("enter Num");
                    cardWithdrwlRate.find("#temp_cardWithdrwlRate").removeClass('hasError');
                }
            });
            cardWithdrwlRateType.find("#temp_cardWithdrwlRateType").mousedown(function(){
//                $("#cardWithdrwlRateTypeMsgSave").hide();
                cardWithdrwlRateType.find("#temp_cardWithdrwlRateType").removeClass('hasError');
            });

        }
        $('#cardWithdrawalTableData').on('click', '.icon-trash-add', function(){

            if(cardWithdrwShow==0)
                $("#cardWithdrwlFeesTr").show();
            $(this).closest ('tr').remove ();
        });
        $('#cardWithdrawalTableData').on('click', '.icon-trash-edit', function(){
            cardWithdrwShow--;
            if(cardWithdrwShow==0)
                $("#cardWithdrwlFeesTr").show();
            $(this).closest ('tr').remove ();
        });
        var cardTransferShow = 0;
        validateCardTransferFeesTable();
        $("#cardTransferAdd").click(function(){
            var cardTransferStartAm = $( "#cardTransferStartAmount" ).val();
            var cardTransferEndAm = $( "#cardTransferEndAmount" ).val();
            var cardTransferRate = $( "#cardTransferRate" ).val();
            var cardTransferRateType = $( "#cardTransferRateType" ).val();
            var cardTransferRateName = $( "#cardTransferRateType option:selected" ).html();
            var checkCardTrn = 0;
            var checkCardTrnInt = 0;

            if($('#cardTransferTableData').find('#cardTransferStartAmount').val()==''){
                checkCardTrn++;
//                $("#cardTransferStartAmountMsg").show();
                $('#cardTransferStartAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#cardTransferTableData').find('#cardTransferStartAmount').val())){
                checkCardTrnInt++;
            }
            if($('#cardTransferTableData').find('#cardTransferEndAmount').val()==''){
                checkCardTrn++;
//                $("#cardTransferEndAmountMsg").show();
                $('#cardTransferEndAmount').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#cardTransferTableData').find('#cardTransferEndAmount').val())){
                checkCardTrnInt++;
            }
            if($('#cardTransferTableData').find('#cardTransferRate').val()==''){
                checkCardTrn++;
//                $("#cardTransferRateMsg").show();
                $('#cardTransferRate').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#cardTransferTableData').find('#cardTransferRate').val())){
                checkCardTrnInt++;
            }
            if($('#cardTransferTableData').find('#cardTransferRateType').val()==''){
                checkCardTrn++;
//                $("#cardTransferRateTypeMsg").show();
                $('#cardTransferRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }

            if((checkCardTrn==0)&&(checkCardTrnInt==0)) {
                $("#cardTransferTableData tbody").append(
                        "<tr>"+
                                "<td><div id='card_transfer_start'>"+cardTransferStartAm+"<input type='hidden' name='cardTransferStartAm' value='"+cardTransferStartAm+"' /></div></td>"+
                                "<td><div id='card_transfer_end'>"+cardTransferEndAm+"<input type='hidden' name='cardTransferEndAmount' value='"+cardTransferEndAm+"' /></div></td>"+
                                "<td><div id='card_transfer_rate_type'>"+cardTransferRateName+"<input type='hidden' name='cardTransferRateType' value='"+cardTransferRateType+"' /></div></td>"+
                                "<td><div id='card_transfer_rate'>"+cardTransferRate+"<input type='hidden' name='cardTransferRate' value='"+cardTransferRate+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add  bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+
                                "</tr>");
                $('#cardTransferTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#cardTransferTableData').find('select').each(function() {
                    $(this).val('');
                });
            }

        });
        function validateCardTransferFeesTable(){

//            $("#cardTransferStartAmountMsg").hide();
//            $("#cardTransferEndAmountMsg").hide();
//            $("#cardTransferRateTypeMsg").hide();
//            $("#cardTransferRateMsg").hide();

            $("#cardTransferStartAmount").keyup(function(){
                if(is_int($('#cardTransferStartAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#cardTransferStartAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cardTransferStartAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cardTransferStartAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });

            $("#cardTransferEndAmount").keyup(function(){
                if(is_int($('#cardTransferEndAmount').val())){
//                    $("#fixedMinMsg").hide();
                    $("#cardTransferEndAmount").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cardTransferEndAmount').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cardTransferEndAmount").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#cardTransferRate").keyup(function(){
                if(is_int($('#cardTransferRate').val())){
//                    $("#fixedMinMsg").hide();
                    $("#cardTransferRate").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
                else if(!is_int($('#cardTransferRate').val())){
//                alert("Enter Number in Start Amount!");
                    $("#cardTransferRate").closest('.form-group').removeClass('has-info').addClass('has-error');
                }
            });
            $("#cardTransferRateType").mousedown(function(){
//                $("#cardTransferRateTypeMsg").hide();
                $("#cardTransferRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });


        }
        $('#cardTransferTableData').on('click', '.icon-pencil', function () {
            //     alert('Detected a click!');
            cardTransferShow++;
            $("#cardTransferTr").hide();
            var par = $(this).closest('tr'); //tr
            var cardTransferStartAm = par.children("td:nth-child(1)");
            var cardTransferEndAm = par.children("td:nth-child(2)");
            var cardTransferRateType = par.children("td:nth-child(3)");
            var cardTransferRate = par.children("td:nth-child(4)");
            var cardTransferEdit  = par.children("td:nth-child(5)");

            var drop = "<div id='card_transfer_rate_type'><select name='cardTransferRateType' style='min-width:120px'>" +
                    "<option value=''>- Select -</option>"+
                    "<option value='${rateType.FLAT}''>${rateType.FLAT}</option>" +
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var temp_cardTransferStartAm = "<input type='text' size='9' placeholder='Start Amount' value='"+cardTransferStartAm.children("div").children("input[type=hidden]").val()+"'/>";
            cardTransferStartAm.children("div").html(temp_cardTransferStartAm);

            var temp_cardTransferEndAm = "<input type='text' size='9' placeholder='End Amount'  value='"+cardTransferEndAm.children("div").children("input[type=hidden]").val()+"'/>";
            cardTransferEndAm.children("div").html(temp_cardTransferEndAm);

            var temp_cardTransferRate = "<input type='text' size='9' placeholder='0.00'  value='"+cardTransferRate.children("div").children("input[type=hidden]").val()+"'/>";
            cardTransferRate.children("div").html(temp_cardTransferRate);

            var selVal = cardTransferRateType.children("div").children("input[type=hidden]").val();
            cardTransferRateType.html(drop);
            cardTransferRateType.find("select[name='cardTransferRateType'] option[value='"+selVal+"']").attr("selected","selected");

            cardTransferEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            cardTransferStartAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cardTransferStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardTransferStartAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cardTransferStartAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardTransferStartAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            cardTransferEndAm.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cardTransferEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardTransferEndAm.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cardTransferEndAm.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardTransferEndAm.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            cardTransferRate.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(cardTransferRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardTransferRate.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(cardTransferRate.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    cardTransferRate.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });


        });
        $('#cardTransferTableData').on('click', '.glyphicon-floppy-saved', function () {

            var par = $(this).closest('tr'); //tr
            var cardTransferStartAm = par.children("td:nth-child(1)");
            var cardTransferEndAm = par.children("td:nth-child(2)");
            var cardTransferRateType = par.children("td:nth-child(3)");
            var cardTransferRate = par.children("td:nth-child(4)");
            var cardTransferEdit  = par.children("td:nth-child(5)");
            var checkCardTrnSave = 0;
            var checkCardTrnSaveInt = 0;
            if(cardTransferStartAm.children("div").children("input[type=text]").val()==''){

                checkCardTrnSave++;
                var temp_cardTransferStartAm =  "<input type='text' size='9' id='temp_cardTransferStartAm' placeholder='Start Amount' class='hasError'/>";
//                        "<div id='cardTransferStartAmMsgSave' class='errorMsg'><span>Please Enter Start Amount</span></div>";
                cardTransferStartAm.children("div").html(temp_cardTransferStartAm);
            }
            else if(!is_int(cardTransferStartAm.children("div").children("input[type=text]").val())){
                checkCardTrnSaveInt++;
//                alert("enter num");
            }

            if(cardTransferEndAm.children("div").children("input[type=text]").val()==''){
                checkCardTrnSave++;
                var temp_cardTransferEndAm =  "<input type='text' size='9' id='temp_cardTransferEndAm' placeholder='End Amount' class='hasError'/>";
//                        "<div id='cardTransferEndAmMsgSave' class='errorMsg'><span>Please Enter End Amount</span></div>";
                cardTransferEndAm.children("div").html(temp_cardTransferEndAm);
            }
            else if(!is_int(cardTransferEndAm.children("div").children("input[type=text]").val())){
                checkCardTrnSaveInt++;
//                alert("enter num");
            }


            if(cardTransferRateType.children("div").children("select").val()==''){
                checkCardTrnSave++;//
                var temp_cardTransferRateType =  "<select id='temp_cardTransferRateType' class='form-control hasError' name='cardTransferRateType' style='min-width:70px'>"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>" +
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='cardTransferRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                cardTransferRateType.children("div").html(temp_cardTransferRateType);


            }

            if(cardTransferRate.children("div").children("input[type=text]").val()==''){
                checkCardTrnSave++;

                var temp_cardTransferRate =  "<input type='text' size='9' id='temp_cardTransferRate' placeholder='0.00' class='hasError'/>";
//                        "<div id='cardTransferRateMsgSave' class='errorMsg'><span>Please Enter Rate</span></div>";
                cardTransferRate.children("div").html(temp_cardTransferRate);
            }
            else if(!is_int(cardTransferRate.children("div").children("input[type=text]").val())){
                checkCardTrnSaveInt++;
//                alert("enter num");
            }


            validateCardTransferFeesSave(par);
            if((checkCardTrnSave==0)&&(checkCardTrnSaveInt==0)){
                cardTransferShow--;
                if(cardTransferShow==0) $("#cardTransferTr").show();

                var temp_cardTransferStartAm = cardTransferStartAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cardTransferStartAm.children("div").children("input[type=text]").val()+"' name='cardTransferStartAm' />";
                cardTransferStartAm.children("div").html(temp_cardTransferStartAm);

                var temp_cardTransferEndAm = cardTransferEndAm.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cardTransferEndAm.children("div").children("input[type=text]").val()+"' name='cardTransferEndAm' />";
                cardTransferEndAm.children("div").html(temp_cardTransferEndAm);

                var temp_cardTransferRate = cardTransferRate.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+cardTransferRate.children("div").children("input[type=text]").val()+"' name='cardTransferRate' />";
                cardTransferRate.children("div").html(temp_cardTransferRate);

                var temp_cardTransferRateType = cardTransferRateType.children("div").find("select[name=cardTransferRateType] option:selected").html() + "<input type='hidden' value='"+cardTransferRateType.children("div").children("select").val()+"' name='cardTransferRateType' />";
                cardTransferRateType.children("div").html(temp_cardTransferRateType);

                cardTransferEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");

            }
        });
        function validateCardTransferFeesSave(par){
            var cardTransferStartAm = par.children("td:nth-child(1)");
            var cardTransferEndAm = par.children("td:nth-child(2)");
            var cardTransferRateType = par.children("td:nth-child(3)");
            var cardTransferRate = par.children("td:nth-child(4)");
            var cardTransferEdit  = par.children("td:nth-child(5)");
            cardTransferStartAm.find("#temp_cardTransferStartAm").keyup(function(){
                if(!is_int((cardTransferStartAm.find("#temp_cardTransferStartAm").val()))){
//                    alert("enter Num");
                    cardTransferStartAm.find("#temp_cardTransferStartAm").addClass('hasError');
                }
                if(is_int((cardTransferStartAm.find("#temp_cardTransferStartAm").val()))){
//                    alert("enter Num");
                    cardTransferStartAm.find("#temp_cardTransferStartAm").removeClass('hasError');
                }
            });

            cardTransferEndAm.find("#temp_cardTransferEndAm").keyup(function(){
                if(!is_int((cardTransferEndAm.find("#temp_cardTransferEndAm").val()))){
//                    alert("enter Num");
                    cardTransferEndAm.find("#temp_cardTransferEndAm").addClass('hasError');
                }
                if(is_int((cardTransferEndAm.find("#temp_cardTransferEndAm").val()))){
//                    alert("enter Num");
                    cardTransferEndAm.find("#temp_cardTransferEndAm").removeClass('hasError');
                }
            });
            cardTransferRate.find("#temp_cardTransferRate").keyup(function(){
                if(!is_int((cardTransferRate.find("#temp_cardTransferRate").val()))){
//                    alert("enter Num");
                    cardTransferRate.find("#temp_cardTransferRate").addClass('hasError');
                }
                if(is_int((cardTransferRate.find("#temp_cardTransferRate").val()))){
//                    alert("enter Num");
                    cardTransferRate.find("#temp_cardTransferRate").removeClass('hasError');
                }
            });
            cardTransferRateType.find("#temp_cardTransferRateType").mousedown(function(){
//                $("#cardTransferRateTypeMsgSave").hide();
                cardTransferRateType.find("#temp_cardTransferRateType").removeClass('hasError');
            });

        }
        $('#cardTransferTableData').on('click', '.icon-trash-add', function(){

            if(cardTransferShow==0)
                $("#cardTransferTr").show();
            $(this).closest ('tr').remove ();
        });
        $('#cardTransferTableData').on('click', '.icon-trash-edit', function(){
            cardTransferShow--;
            if(cardTransferShow==0)
                $("#cardTransferTr").show();
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
