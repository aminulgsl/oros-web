<!DOCTYPE html>
<html lang="en">
<head>
    <style>
    div.ui-ios-overlay {
        background: none repeat scroll 0 0 rgb(136, 136, 136);
    }
    </style>
    <meta charset="utf-8"/>
    <title>Dashboard - OrosCapital web</title>

    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- basic styles -->

    <link href="${resource(dir: 'css/uncompressed', file: 'bootstrap.css')}" rel="stylesheet"/>
    <link rel="stylesheet" href="${resource(dir: 'css/uncompressed', file: 'font-awesome.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/compressed', file: 'datepicker.css')}"/>

    <link rel="stylesheet" href="${resource(dir: 'css/uncompressed', file: 'chosen.css')}"/>

    <link rel="stylesheet" href="${resource(dir: 'css/uncompressed', file: 'ace-fonts.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/uncompressed', file: 'ace.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/uncompressed', file: 'ace-rtl.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/uncompressed', file: 'ace-skins.css')}"/>
    <script src="${resource(dir: 'js/uncompressed', file: 'ace-extra.js')}"></script>
    <g:layoutHead/>
    <r:layoutResources/>

</head>

<body>
<g:render template="/topHeadBar"/>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <g:render template="/leftNavBar"/>

        <div class="main-content">

            <g:render template="/breadcrumbs"/>

            <div class="page-content" id="page-content">

                <g:layoutBody/>

            </div><!-- /.page-content -->
        </div><!-- /.main-content -->

    </div><!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<script src="${resource(dir: 'js/compressed', file: 'jquery-1.10.2.min.js')}"></script>
%{--<script src="${resource(dir: 'js/datatable', file: 'jquery.dataTables.min.js')}"></script>--}%
<script src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
<script src="${resource(dir: 'js/datatable', file: 'jquery.dataTables.bootstrap.js')}"></script>

<script src="${resource(dir: 'js/date-time', file: 'bootstrap-datepicker.min.js')}"></script>


<script src="${resource(dir: 'js/uncompressed', file: 'bootstrap.js')}"></script>
%{--<script src="${resource(dir: 'js/compressed', file: 'typeahead-bs2.min.js')}"></script>--}%

<!-- page specific plugin scripts -->

<!-- inline scripts related to this page -->



%{--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed', file: 'jquery-ui-1.10.3.custom.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed', file: 'jquery.ui.touch-punch.js')}"></script>--}%

<script src="${resource(dir: 'js/uncompressed', file: 'chosen.jquery.js')}"></script>

%{--<script src="${resource(dir: 'js/uncompressed', file: 'jquery.slimscroll.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed', file: 'jquery.easy-pie-chart.js')}"></script>--}%

%{--<script src="${resource(dir: 'js/uncompressed', file: 'jquery.sparkline.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed/flot', file: 'jquery.flot.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed/flot', file: 'jquery.flot.pie.js')}"></script>--}%

%{--<script src="${resource(dir: 'js/uncompressed/flot', file: 'jquery.flot.resize.js')}"></script>--}%

<!-- ace scripts -->
<script src="${resource(dir: 'js/uncompressed', file: 'fuelux.wizard.min.js')}"></script>
<script src="${resource(dir: 'js/validate', file: 'jquery.validate.min.js')}"></script>
<script src="${resource(dir: 'js/uncompressed', file: 'additional-methods.min.js')}"></script>
%{--<script src="${resource(dir: 'js/uncompressed', file: 'bootbox.min.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed', file: 'select2.min.js')}"></script>--}%



%{--<script src="${resource(dir: 'js/uncompressed', file: 'jquery.multiselect.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed', file: 'jquery.multiselect.filter.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed', file: 'jquery.maskedinput.min.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed', file: 'jquery.inputmask.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/uncompressed', file: 'autoNumeric.js')}"></script>--}%
<script src="${resource(dir: 'js/uncompressed', file: 'ace-elements.min.js')}"></script>
%{--<script src="${resource(dir: 'js/uncompressed', file: 'iosOverlay.js')}"></script>--}%
<script src="${resource(dir: 'js/uncompressed', file: 'spin.min.js')}"></script>
<script src="${resource(dir: 'js/uncompressed', file: 'ace.js')}"></script>

<script src="${resource(dir: 'js/uncompressed', file: 'ace-elements.js')}"></script>
<script src="${resource(dir: 'js/uncompressed', file: 'ace.js')}"></script>

<!-- inline scripts related to this page -->


<r:layoutResources/>

<script type="text/javascript">
    $.ajaxSetup({
        timeout:50000,
        statusCode: {
            404: function() {
                bootstrap_alert.error("Ooops.. requested page is not available...");
            },
            401: function() {
                window.location = "${createLink(controller: 'logout')}";
//                bootstrap_alert.error("Ooops.. your session has timeout");
            },
            500: function() {
                bootstrap_alert.error("Ooops.. server has got some problems ...");
            },
            0: function() {
                bootstrap_alert.warning("Ooops.. this is taking much time.. retry"); //alert( "aborted" );
            }/*,
            200:function(){
                bootstrap_alert.success("Done"); //alert( "aborted" );
            }*/
        }
    });
    $(document)
            .ajaxStart(function () {
                showSpinner(true);
            })
            .ajaxStop(function () {
//                $loading.hide();
                showSpinner(false);
            });
    bootstrap_alert = function() {};
    bootstrap_alert.warning = function(message) {
        $('#notify').html('<div class="alert alert-warning"><a class="close" data-dismiss="alert">×</a><span>'+message+'</span></div>')
    };
    bootstrap_alert.error = function(message) {
        $('#notify').html('<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a><span>'+message+'</span></div>')
    };
    bootstrap_alert.success = function(message) {
        $('#notify').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>'+message+'</span></div>')
    };

    $(document).ready(function () {

    });


</script>
</body>
</html>