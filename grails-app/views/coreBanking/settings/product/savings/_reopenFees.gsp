%{--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">--}%
%{--</script>--}%
<html>
<head></head>
<body>


<g:render template='/coreBanking/settings/product/savings/reopenFeesTable'/>
<script type="text/javascript">
    $(document).ready(function(){
        validateReopenFeesTable();
        var reopenShow = 0;
        $("#reopenAdd").click(function(){

            var reopenMin = $( "#reopenMin" ).val();
            var reopenMax = $( "#reopenMax" ).val();
            var reopenValue = $( "#reopenValue" ).val();
            var reopenRateTypeValue = $( "#reopenRateType" ).val();
            var reopenRateTypeName = $( "#reopenRateType option:selected" ).html();
            var checkReopen = 0;
            var checkReopenInt = 0;


            if($('#reopenTableData').find('#reopenMin').val()==''){
                checkReopen++;
//                $("#reopenMinMsg").show();
                $('#reopenMin').closest('.form-group').removeClass('has-info').addClass('has-error');
            }
            if(!is_int($('#reopenTableData').find('#reopenMin').val())){
                checkReopenInt++;
            }
            if($('#reopenTableData').find('#reopenMax').val()==''){
                checkReopen++;
//                $("#reopenMaxMsg").show();
                $('#reopenMax').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#reopenTableData').find('#reopenMax').val())){
                checkReopenInt++;
            }
            if($('#reopenTableData').find('#reopenRateType').val()==''){
                checkReopen++;
//                $("#reopenRateTypeMsg").show();
                $('#reopenRateType').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if($('#reopenTableData').find('#reopenValue').val()==''){
                checkReopen++;
//                $("#reopenValMsg").show();
                $('#reopenValue').closest('.form-group').removeClass('has-info').addClass('has-error');

            }
            if(!is_int($('#reopenTableData').find('#reopenValue').val())){
                checkReopenInt++;
            }


            if((checkReopen==0)&&(checkReopenInt==0)) {
                $("#reopenTableData tbody").append(
                        "<tr>"+
                                "<td><div id='reopen_min'>"+reopenMin+"<input type='hidden' name='reopenMin' value='"+reopenMin+"' /></div></td>"+
                                "<td><div id='reopen_max'>"+reopenMax+"<input type='hidden' name='reopenMax' value='"+reopenMax+"' /></div></td>"+
                                "<td><div id='reopen_rate_type'>"+reopenRateTypeName+"<input type='hidden' name='reopenRateType' value='"+reopenRateTypeValue+"' /></div></td>"+
                                "<td><div id='reopen_value'>"+reopenValue+"<input type='hidden' name='reopenValue' value='"+reopenValue+"' /></div></td>"+
                                "<td>" +
                                "<div class='visible-md visible-lg visible-sm visible-xs action-buttons' id='btnEdit'>"+
                                "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                                "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>"+
                                "</div>"+
                                "</td>"+
                                "</tr>");
                $('#reopenTableData').find('input[type=text]').each(function() {
                    $(this).val('');
                });

                $('#reopenTableData').find('select').each(function() {
                    $(this).val('');
                });
            }



        });
        function validateReopenFeesTable(){

//            $("#reopenMinMsg").hide();
//            $("#reopenMaxMsg").hide();
//            $("#reopenRateTypeMsg").hide();
//            $("#reopenValMsg").hide();

            $("#reopenMin").keyup(function(){
//                $("#reopenMinMsg").hide();
//                $("#reopenMin").closest('.form-group').removeClass('has-error').addClass('has-info');
                if(!is_int($('#reopenMin').val())){
//                $("#entryMinMsg").hide();

                    $('#reopenMin').closest('.form-group').removeClass('has-info').addClass('has-error');

                }
                else if(is_int($('#reopenMin').val())){
//                alert("Enter Number in Start Amount!");
                    $("#reopenMin").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
            });

            $("#reopenMax").keyup(function(){
//                $("#reopenMaxMsg").hide();
//                $("#reopenMax").closest('.form-group').removeClass('has-error').addClass('has-info');
                if(!is_int($('#reopenMax').val())){
//                $("#entryMinMsg").hide();

                    $('#reopenMax').closest('.form-group').removeClass('has-info').addClass('has-error');

                }
                else if(is_int($('#reopenMax').val())){
//                alert("Enter Number in Start Amount!");
                    $("#reopenMax").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
            });
            $("#reopenValue").keyup(function(){
                if(!is_int($('#reopenValue').val())){
//                $("#entryMinMsg").hide();

                    $('#reopenValue').closest('.form-group').removeClass('has-info').addClass('has-error');

                }
                else if(is_int($('#reopenValue').val())){
//                alert("Enter Number in Start Amount!");
                    $("#reopenValue").closest('.form-group').removeClass('has-error').addClass('has-info');
                }
            });
            $("#reopenRateType").mousedown(function(){
//                $("#reopenRateTypeMsg").hide();
                $("#reopenRateType").closest('.form-group').removeClass('has-error').addClass('has-info');
            });


        }

        $('#reopenTableData').on('click','.icon-pencil', function () {
            reopenShow++;
            $("#reopenTr").hide();
            var par = $(this).closest('tr'); //tr
            var reopenMin = par.children("td:nth-child(1)");
            var reopenMax = par.children("td:nth-child(2)");
            var reopenRateType = par.children("td:nth-child(3)");
            var reopenValue = par.children("td:nth-child(4)");

            var drop = "<div id='reopen_rate_type'><select name='reopenRateType' style='min-width:90px'>" +
                    "<option value=''>- Select -</option>"+
                    "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>" +
                    "<option value='${rateType.RATE}'>${rateType.RATE}</option></select></div> ";

            var reopenEdit  = par.children("td:nth-child(5)");
            var temp_reopenMin = "<input type='text' size='9' placeholder='0.00' value='"+reopenMin.children("div").children("input[type=hidden]").val()+"'/>";
            reopenMin.children("div").html(temp_reopenMin);

            var temp_reopenMax = "<input type='text' size='9' placeholder='0.00' value='"+reopenMax.children("div").children("input[type=hidden]").val()+"'/>";
            reopenMax.children("div").html(temp_reopenMax);

            var selVal = reopenRateType.children("div").children("input[type=hidden]").val();
            reopenRateType.html(drop);
            reopenRateType.find("select[name='reopenRateType'] option[value='"+selVal+"']").attr("selected","selected");

            var temp_reopenValue = "<input type='text' size='9' placeholder='0.00' value='"+reopenValue.children("div").children("input[type=hidden]").val()+"'/>";
            reopenValue.children("div").html(temp_reopenValue);

            reopenEdit .html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                    "<a  href='javascript:void(0);'><i class='glyphicon glyphicon-floppy-saved bigger-130 green'></i></a>"+
                    "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-edit bigger-130'></i></a>");
            reopenMin.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(reopenMin.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    reopenMin.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(reopenMin.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    reopenMin.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            reopenMax.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(reopenMax.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    reopenMax.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(reopenMax.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    reopenMax.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });
            reopenValue.children("div").children("input[type=text]").keyup(function(){
                if(!is_int(reopenValue.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    reopenValue.children("div").children("input[type=text]").addClass('hasError');
                }
                if(is_int(reopenValue.children("div").children("input[type=text]").val()))
                {
//                    alert("Enter Number");
                    reopenValue.children("div").children("input[type=text]").removeClass('hasError');
                }
//
            });



        });
        $('#reopenTableData').on('click', '.glyphicon-floppy-saved', function () {

            var par = $(this).closest('tr'); //tr
            var reopenMin = par.children("td:nth-child(1)");
            var reopenMax = par.children("td:nth-child(2)");
            var reopenRateType = par.children("td:nth-child(3)");
            var reopenValue = par.children("td:nth-child(4)");

            var reopenEdit  = par.children("td:nth-child(5)");
            var checkReopenSave = 0;
            var checkReopenSaveInt =0;
            if(reopenMin.children("div").children("input[type=text]").val()==''){

                checkReopenSave++;
                var temp_reopenMin =  "<input type='text' size='9' id='temp_reopenMin' class='hasError' placeholder='0.00'/>";
//                        "<div id='reopenMinMsgSave' class='errorMsg'><span>Please Enter Min</span></div>";
                reopenMin.children("div").html(temp_reopenMin);
            }
            else if(!is_int(reopenMin.children("div").children("input[type=text]").val())){
                checkReopenSaveInt++;
//                alert("enter num");
            }

            if(reopenMax.children("div").children("input[type=text]").val()==''){
                checkReopenSave++;
                var temp_reopenMax =  "<input type='text' size='9' id='temp_reopenMax' class='hasError'  placeholder='0.00'/>";
//                        "<div id='reopenMaxMsgSave' class='errorMsg'><span>Please Enter Max</span></div>";
                reopenMax.children("div").html(temp_reopenMax);
            }
            else if(!is_int(reopenMax.children("div").children("input[type=text]").val())){
                checkReopenSaveInt++;
//                alert("enter num");
            }

            if(reopenRateType.children("div").children("select").val()==''){
                checkReopenSave++;//
                var temp_reopenRateType =  "<select id='temp_reopenRateType' class='form-control hasError' name='reopenRateType' style='min-width:70px'>"+
                        "<option value=''>- Select -</option>"+
                        "<option value='${rateType.FLAT}'>${rateType.FLAT}</option>" +
                        "<option value='${rateType.RATE}'>${rateType.RATE}</option>"+
                        "</select>";
//                        "<div id='reopenRateTypeMsgSave' class='errorMsg'><span>Please Enter Rate Type</span></div>";
                reopenRateType.children("div").html(temp_reopenRateType);
            }

            if(reopenValue.children("div").children("input[type=text]").val()==''){
                checkReopenSave++;

                var temp_reopenValue =  "<input type='text' size='9' id='temp_reopenValue' class='hasError' placeholder='0.00'/>";
//                        "<div id='reopenValueMsgSave' class='errorMsg'><span>Please Enter Value</span></div>";
                reopenValue.children("div").html(temp_reopenValue);
            }
            else if(!is_int(reopenValue.children("div").children("input[type=text]").val())){
                checkReopenSaveInt++;
//                alert("enter num");
            }


            validateReopenFeesSave(par);

            if((checkReopenSave==0)&&(checkReopenSaveInt==0)){
                reopenShow--;
                if(reopenShow==0)
                    $("#reopenTr").show();

                var temp_reopenMin = reopenMin.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+reopenMin.children("div").children("input[type=text]").val()+"' name='reopenMin' />";
                reopenMin.children("div").html(temp_reopenMin);

                var temp_reopenMax = reopenMax.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+reopenMax.children("div").children("input[type=text]").val()+"' name='reopenMax' />";
                reopenMax.children("div").html(temp_reopenMax);

                var temp_reopenRateType = reopenRateType.children("div").find("select[name=reopenRateType] option:selected").html() + "<input type='hidden' value='"+reopenRateType.children("div").children("select").val()+"' name='reopenRateType' />";
                reopenRateType.children("div").html(temp_reopenRateType);

                var temp_reopenValue = reopenValue.children("div").children("input[type=text]").val() + "<input type='hidden' value='"+reopenValue.children("div").children("input[type=text]").val()+"' name='reopenValue' />";
                reopenValue.children("div").html(temp_reopenValue);

                reopenEdit.html("<div class='visible-md visible-lg visible-sm visible-xs action-buttons'>"+
                        "<a  href='javascript:void(0);'><i class='icon-pencil bigger-130 green'></i></a>"+
                        "<a class='red' href='javascript:void(0);'><i class='icon-trash icon-trash-add bigger-130'></i></a>");

            }

        });
        function validateReopenFeesSave(par){
            var reopenMin = par.children("td:nth-child(1)");
            var reopenMax = par.children("td:nth-child(2)");
            var reopenRateType = par.children("td:nth-child(3)");
            var reopenValue = par.children("td:nth-child(4)");
            reopenMin.find("#temp_reopenMin").keyup(function(){
//                $("#reopenMinMsgSave").hide();
//                $("#temp_reopenMin").removeClass('hasError');
                if(!is_int((reopenMin.find("#temp_reopenMin").val()))){
//                    alert("enter Num");
                    reopenMin.find("#temp_reopenMin").addClass('hasError');
                }
                if(is_int((reopenMin.find("#temp_reopenMin").val()))){
//                    alert("enter Num");
                    reopenMin.find("#temp_reopenMin").removeClass('hasError');
                }
            });

            reopenMax.find("#temp_reopenMax").keyup(function(){
                if(!is_int((reopenMax.find("#temp_reopenMax").val()))){
//                    alert("enter Num");
                    reopenMax.find("#temp_reopenMax").addClass('hasError');
                }
                if(is_int((reopenMax.find("#temp_reopenMax").val()))){
//                    alert("enter Num");
                    reopenMax.find("#temp_reopenMax").removeClass('hasError');
                }
            });
            reopenValue.find("#temp_reopenValue").keyup(function(){
                if(!is_int((reopenValue.find("#temp_reopenValue").val()))){
//                    alert("enter Num");
                    reopenValue.find("#temp_reopenValue").addClass('hasError');
                }
                if(is_int((reopenValue.find("#temp_reopenValue").val()))){
//                    alert("enter Num");
                    reopenValue.find("#temp_reopenValue").removeClass('hasError');
                }
            });
            reopenRateType.find("#temp_reopenRateType").mousedown(function(){
//                $("#reopenRateTypeMsgSave").hide();
                reopenRateType.find("#temp_reopenRateType").removeClass('hasError');
            });

        }
        $('#reopenTableData').on('click', '.icon-trash-add', function(){
            if(reopenShow==0) $("#reopenTr").show();
            $(this).closest ('tr').remove ();
        })

        $('#reopenTableData').on('click', '.icon-trash-edit', function(){
            reopenShow--;
            if(reopenShow==0) $("#reopenTr").show();
            $(this).closest ('tr').remove ();
        })
        function is_int(value){
            if( (value>=0) && !isNaN(value)){
                return true;
            } else {
                return false;
            }
        }


    });
</script>
</body></html>
