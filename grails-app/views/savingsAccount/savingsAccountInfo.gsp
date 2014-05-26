<%--
  Created by IntelliJ IDEA.
  User: Nusrat Jahan Bhuiyan
  Date: 5/20/14
  Time: 2:41 PM
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
        Savings Account
    </h1>
</div><!-- /.page-header -->

<div class="row">
    <div class="col-sm-12">
        <div class="widget-box">
            <div class="widget-header widget-header-flat widget-header-small">
                <h5 class="widget-title">
                    <i class="ace-icon fa fa-signal"></i>
                    Fees & Charges
                </h5>
            </div>
            <div class="widget-body">
                <div class="widget-main">
                    <table class="table-bordered">
                        <tbody>
                            <tr>
                                <th>Nature of Charges</th>
                                <th>Amount of Charges & Commission</th>
                            </tr>
                            <tr>
                                <td>Account Maintenance Fee(Service Charges)</td>
                                <td>
                                    <ul>
                                        <li>No A/C maintenance charge on Savings
                                    A/C having half-yearly average balance
                                    upto Tk. 5,000/- or less.</li>

                                        <li>Tk.100 on a half-yearly basis from Savings
                                A/C having half-yearly average balance of
                                more than Tk.5000 upto Tk. 25,000/-</li>

                                        <li>Tk.300 on a half-yearly basis from Savings
                                A/C having half-yearly average balance of
                                more than Tk. 25,000/-</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>Incidental charges</td>
                                <td>
                                    Nil
                                </td>
                            </tr>
                            <tr>
                                <td>Closing charges</td>
                                <td>
                                    Tk. 200/-
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="widget-box">
            <div class="widget-header widget-header-flat widget-header-small">
                <h5 class="widget-title">
                    <i class="ace-icon fa fa-signal"></i>
                    Terms & Conditions
                </h5>
            </div>
            <div class="widget-body">
                <div class="widget-main">
                    <ul>
                        <li>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                        </li>
                        <li>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                        </li>
                        <li>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <span class="input-group-btn align-right">
                <a href="${createLink(controller: 'savingsAccount', action: 'openingForm')}">
                    <button class="btn btn-sm btn-info no-radius" type="button">
                        <i class="glyphicon glyphicon-hand-right"></i>
                        Next
                    </button>
                </a>
            </span>
        </div>
    </div>
</div><!-- /.row -->
</body>
</html>