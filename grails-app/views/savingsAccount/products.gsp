<%--
  Created by IntelliJ IDEA.
  User: Nusrat Jahan Bhuiyan
  Date: 5/27/14
  Time: 11:45 AM
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
        Savings Products
    </h1>
</div><!-- /.page-header -->

<div class="row">
    <div class="col-sm-5">
        <div class="widget-box">
            <div class="widget-header widget-header-flat widget-header-small">
                <h5 class="widget-title">
                    <i class="ace-icon fa fa-signal"></i>
                    Choose your product
                </h5>
            </div>
            <div class="widget-body">
                <div class="widget-main">
                    <ul>
                        <g:each in="${savingsProductList}" var='savingsProducts'>
                        <li><a href="${createLink(controller: 'savingsAccount', action: 'product', params: [productId:savingsProducts.id])}">${savingsProducts.productName}</a></li>
                    </g:each>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.row -->
</body>
</html>