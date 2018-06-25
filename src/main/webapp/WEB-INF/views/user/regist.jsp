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
        <h3>회원가입</h3>
    </div>
    <div class="account-container">
        <form:form action="tryRegist" method="post" modelAttribute="accounts" commandName="accounts" role="valid">

            <div>
                <form:input cssClass="account-textinput" path="nick_name" placeholder="암기왕이되고싶은사람"/>
                <div class="dp-nickname"></div>
            </div>

            <div class="field">
                <form:input path="email" cssClass="account-textinput" type="email"
                            placeholder="user@learningmachine.ml"/>
                <div class="dp-email"></div>
            </div>

            <div class="field">
                <form:password cssClass="account-textinput" path="password" placeholder="비밀번호"/>
                <div class="valid_password"></div>
            </div>
            <div class="field">
                <button class="try-button" type="button" id="regist-submit">Sign Up</button>
            </div>
        </form:form>

    </div>
</div>

</div>

</div>


<script>

    var ready_nickName = false;
    var ready_email = false;
    var ready_password = false;


    $('#nick_name').on('change', function () {
        size_nickName = document.getElementById('nick_name').value.length;
        if (size_nickName >= 2 && size_nickName <= 12) {
            nick_name = document.getElementById('nick_name').value; // 닉네임
            $.ajax({
                type: "post",
                url: "dpNickName",
                data: {nick_name: nick_name},
                success: ajaxSuccessNickname,
                error: ajaxError,
            })
        } else {
            error('dp-nickname');
        }
    });

    $('#email').on('change', function () {
        email = document.getElementById('email').value; // 닉네임
        regExp_Email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        if (email.match(regExp_Email) != null) {
            $.ajax({
                type: "post",
                url: "dpEmail",
                data: {email: email},
                success: ajaxSuccessEmail,
                error: ajaxError,
            })
        } else {
            error('dp-email');
        }

    });

    $('#password').on('change', function () {
        size_password = document.getElementById('password').value.length;
        if (size_password >= 6 && size_password <= 20) {
            document.getElementsByClassName('valid_password')[0].innerHTML = '사용가능한 비밀번호입니다.';
            $('.valid_password').removeClass("error");
            $('.valid_password').addClass("success");
            ready_password = true;
            console.log("비번" + ready_password);

        } else {
            document.getElementsByClassName('valid_password')[0].innerHTML = '사용할 수 없는 비밀번호입니다.';
            $('.valid_password').removeClass("success");
            $('.valid_password').addClass("error");
            ready_password = false;
            console.log("비번" + ready_password);

        }
    })

    function error(valid) {
        document.getElementsByClassName(valid)[0].innerHTML = valid == 'dp-nickname' ? '유효하지 않은 닉네임입니다.' : '유효하지 않은 이메일입니다.';
        $('.' + valid + '').removeClass("success");
        $('.' + valid + '').addClass("error");
    }

    function ajaxSuccessNickname(data) {
        if (data == 'SUCCESS') {
            document.getElementsByClassName('dp-nickname')[0].innerHTML = '사용가능한 닉네임입니다.';
            $('.dp-nickname').removeClass("error");
            $('.dp-nickname').addClass("success");
            ready_nickName = true;
            console.log("닉넴" + ready_nickName);


        } else if (data == 'DUPLICATE_CHECK_ERROR') {
            document.getElementsByClassName('dp-nickname')[0].innerHTML = '중복된 닉네임입니다.';
            $('.dp-nickname').removeClass("success");
            $('.dp-nickname').addClass("error");
            ready_nickName = false;
            console.log("닉넴" + ready_nickName);


        }
    }

    function ajaxSuccessEmail(data) {
        if (data == 'SUCCESS') {
            document.getElementsByClassName('dp-email')[0].innerHTML = '사용가능한 이메일주소입니다.';
            $('.dp-email').removeClass("error");
            $('.dp-email').addClass("success");
            ready_email = true;
            console.log("이멜" + ready_email);

        } else if (data == 'DUPLICATE_CHECK_ERROR') {
            document.getElementsByClassName('dp-email')[0].innerHTML = '중복된 이메일주소입니다.';
            $('.dp-email').removeClass("success");
            $('.dp-email').addClass("error");
            ready_email = false;
            console.log("이멜" + ready_email);

        }
    }

    function ajaxError(request, status, error) {
        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    }

    document.getElementById('regist-submit').addEventListener('click', function () {
        console.log(ready_nickName + ready_email + ready_password);
        var formObj = $("form[role='valid']");
        if (ready_nickName + ready_email + ready_password == 3) {
            formObj.submit();
        } else {
            alert('내용을 다시한번 확인 해 주세요!');
        }
    })


</script>
</body>
</html>