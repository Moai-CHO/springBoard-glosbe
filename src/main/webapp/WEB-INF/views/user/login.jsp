<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jo
  Date: 2018-05-15
  Time: 오전 2:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/side.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/regist_valid.css">

    <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.js"></script>
</head>
<body>
<div>
    <%@include file="../include/side.jsp" %>
</div>
<div class="content">
    <div class="account-head">
        <h3>로그인</h3>
    </div>
    <div class="account-container">
        <form:form action="tryLogin" method="post" modelAttribute="accounts" commandName="accounts" role="valid">

            <div class="field">
                <form:input path="email" cssClass="account-textinput" type="email"
                            placeholder="user@learningmachine.ml"/>
                <div class="valid_password error">
                    <form:errors path="email"/>
                </div>
            </div>

            <div class="field">
                <form:password cssClass="account-textinput" path="password" placeholder="비밀번호"/>
                <div class="valid_password error">
                    <form:errors path="password"/>
                </div>
            </div>
            <div class="field">
                <button class="try-button" type="submit" id="regist-submit">Sign In</button>
            </div>
            <div class="valid_password error">
                    ${errormsg}
            </div>
        </form:form>

    </div>
</div>
</body>
</html>