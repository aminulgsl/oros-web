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

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'datepicker.css')}"/>
%{----}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'chosen.css')}"/>
%{----}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'ace-fonts.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'ace.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'ace-rtl.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'ace-skins.css')}"/>
    <script src="${resource(dir: 'js', file: 'ace-extra.js')}"></script>
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

<script src="${resource(dir: 'js', file: 'jquery-1.10.2.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.validate.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.dataTables.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.dataTables.bootstrap.js')}"></script>

<script src="${resource(dir: 'js', file: 'bootstrap-datepicker.min.js')}"></script>


<script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
<script src="${resource(dir: 'js', file: 'chosen.jquery.js')}"></script>
%{--<script src="${resource(dir: 'js', file: 'fuelux.wizard.min.js')}"></script>--}%
<script src="${resource(dir: 'js', file: 'jquery.validate.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'additional-methods.min.js')}"></script>

<script src="${resource(dir: 'js', file: 'ace-elements.min.js')}"></script>
%{--<script src="${resource(dir: 'js', file: 'iosOverlay.js')}"></script>--}%
<script src="${resource(dir: 'js', file: 'spin.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'ace.js')}"></script>

<script src="${resource(dir: 'js', file: 'ace-elements.js')}"></script>

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
//                showSpinner(true);
            })
            .ajaxStop(function () {
//                $loading.hide();
//                showSpinner(false);
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
        menuActive();
    });
    function menuActive() {
        var topMenu = $("#sidebar ul.nav");
        var singleMenuItems = ["home", "openaccount"]; // need to provided by programmer manually

        topMenu.find("li").removeClass("open").removeClass("active"); // remove previous active link

        var loc = document.URL;
        loc = loc.replace(/.*?:\/\//g, "");  // remove "htpp://"
        loc = loc.replace("localhost/", ""); // remove "localhost/"
        loc = loc.replace("oros-web/", ""); // remove
        loc = loc.split('/');     // split by "/"
        var controllerName = loc[1];
        //var actionName = loc[2];
        if (controllerName) {
            topMenu.find("li a").each(function () {

                var menuLinkName = $(this).attr('data-linkTo');
                if(menuLinkName==controllerName) {
                    $(this).parent("li").addClass("active");
                    $(this).closest('ul').parent("li").addClass("open").addClass("active");
                }
            });
        }else{
            $('#sidebar ul.nav li').first().addClass('active');
        }

    }

</script>
</body>
</html>