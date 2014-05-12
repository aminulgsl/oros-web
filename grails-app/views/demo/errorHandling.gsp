<%--
  Created by IntelliJ IDEA.
  User: aminul haque
  Date: 3/25/14
  Time: 4:01 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
            <g:renderErrors bean="${user}" />

            %{--Manage How to render the error--}%
            <g:hasErrors bean="${user}">
                <ul>
                    <g:eachError var="err" bean="${user}">
                        <li>${err}</li>
                    </g:eachError>
                </ul>
            </g:hasErrors>

    <g:if test='${flash.message}'>
        <div class='login_message alert-danger '>
            <i class="icon-bell red"> <b> ${flash.message} </b> </i>
        </div>
    </g:if>
%{--Show error in UI with css for hilight--}%
<div class='value ${hasErrors(bean:user,field:'login','errors')}'>
    <input type="text" name="login" value="${fieldValue(bean:user,field:'login')}"/>
</div>
</body>
</html>