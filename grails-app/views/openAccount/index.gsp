<%--
  Created by IntelliJ IDEA.
  User: Nusrat Jahan Bhuiyan
  Date: 5/20/14
  Time: 12:11 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="oros"/>
    <title>Welcome to OrosCapital</title>

</head>

<body>

    <div class="page-header">
        <h1>
            Open Account
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-sm-5">
            <div class="widget-box">
                <div class="widget-header widget-header-flat widget-header-small">
                    <h5 class="widget-title">
                        <i class="ace-icon fa fa-signal"></i>
                        Choose your account
                    </h5>
                </div>
                <div class="widget-body">
                    <div class="widget-main">
                        <ul>
                            <li><a href="${createLink(controller: 'savingsAccount', action: 'index')}">Savings Account</a></li>
                            <li><a href="${createLink(controller: 'currentAccount', action: 'index')}">Current Account</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.row -->
</body>
</html>