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
    <title>회원가입</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/sign-upForm.css">

    <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.js"></script>
    <style>
        .dp-nickname {
            text-align: right;
            font-size: 0.85rem;
            font-weight: 600;
            transition: 0.2s;
        }

        .dp-email {
            text-align: right;
            font-size: 0.85rem;
            font-weight: 600;
            transition: 0.2s;
        }

        .success {
            color: #3F51B5;
        }

        .error {
            color: #F44336;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="../header/header.jsp" flush="true"></jsp:include>
</header>

<div class="register-container">
    <div class="register-wrapper">
        <h1 class="ui blue header center">SUPER LEARN</h1>
        <div class="register-step-wrapper">
            <i class="dot">1단계</i>
            <i class="dot">2단계</i>
            <i class="dot">3단계</i>
            <i class="dot this-step">4단계</i>
        </div>

        <div class="content-wrapper">

            <%--@elvariable id="accounts" type="ml.learningmachine.model.domain.AccountsVO"--%>
            <form:form action="tryRegist" method="post" modelAttribute="accounts" commandName="accounts">
                <div class="ui large form">
                    <div class="field">
                        <div class="ui left icon input">
                            <form:input cssClass="form-control" path="nick_name" placeholder="똥싸는제이지"/>
                            <i class="users icon"></i>
                        </div>
                        <div class="dp-nickname"></div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <form:input path="email" cssClass="form-control" type="email"
                                        placeholder="user@superlearn.com"/>
                            <i class="user icon"></i>
                        </div>
                        <div class="dp-email"></div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <form:password cssClass="form-control" path="password"/>
                            <i class="lock icon"></i>
                        </div>
                    </div>
                        <%--
                        <div class="field">

                            <div class="ui left icon input">
                                <input type="text" placeholder="패스워드2">
                                <i class="lock icon"></i>
                            </div>
                        </div>
                        --%>
                        <%--<div class="ui fluid massive blue submit button">Sign Up</div>--%>
                    <button class="ui fluid massive blue submit button">Sign Up</button>
                </div>
            </form:form>
        </div>
    </div>

</div>
<script>
    $('#nick_name').on('change', function () {
        nick_name = document.getElementById('nick_name').value; // 닉네임
        $.ajax({
            type: "post",
            url: "dpNickName",
            data: {nick_name: nick_name},
            success: ajaxSuccessNickname,
            error: ajaxError,
        })
    });

    $('#email').on('change', function () {
        email = document.getElementById('email').value; // 닉네임
        $.ajax({
            type: "post",
            url: "dpEmail",
            data: {email: email},
            success: ajaxSuccessEmail,
            error: ajaxError,
        })
    });

    function ajaxSuccessNickname(data) {
        if (data == 'SUCCESS') {
            document.getElementsByClassName('dp-nickname')[0].innerHTML = '사용가능한 닉네임 입니다.';
            $('.dp-nickname').removeClass("error");
            $('.dp-nickname').addClass("success");
        } else if (data == 'DUPLICATE_CHECK_ERROR') {
            document.getElementsByClassName('dp-nickname')[0].innerHTML = '중복된 닉네임입니다.';
            $('.dp-nickname').removeClass("success");
            $('.dp-nickname').addClass("error");
        }
    }

    function ajaxSuccessEmail(data) {
        if (data == 'SUCCESS') {
            document.getElementsByClassName('dp-email')[0].innerHTML = '사용가능한 이메일주소입니다.';
            $('.dp-email').removeClass("error");
            $('.dp-email').addClass("success");
        } else if (data == 'DUPLICATE_CHECK_ERROR') {
            document.getElementsByClassName('dp-email')[0].innerHTML = '중복된 이메일주소입니다.';
            $('.dp-email').removeClass("success");
            $('.dp-email').addClass("error");
        }
    }

    function ajaxError(request, status, error) {
        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    }

</script>
</body>
</html>