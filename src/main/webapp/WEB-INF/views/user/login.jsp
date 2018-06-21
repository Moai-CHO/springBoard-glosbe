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
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/loginForm.css">


    <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.js"></script>
    <script>
        $(document)
            .ready(function () {
                $('.ui.form')
                    .form({
                        fields: {
                            email: {
                                identifier: 'email',
                                rules: [
                                    {
                                        type: 'empty',
                                        prompt: '이메일을 입력해 주세요'
                                    },
                                    {
                                        type: 'email',
                                        prompt: '이메일 형식에 맞지 않습니다'
                                    }
                                ]
                            },
                            password: {
                                identifier: 'password',
                                rules: [
                                    {
                                        type: 'empty',
                                        prompt: '비밀번호를 입력해 주세요'
                                    },
                                    {
                                        type: 'length[6]',
                                        prompt: '비밀번호는 6글자 이상 20글자 이하 이어야 합니다'
                                    },
                                    {
                                        type: 'maxLength[20]',
                                        prompt: '비밀번호는 6글자 이상 20글자 이하 이어야 합니다'
                                    }
                                ]
                            }
                        }
                    })
                ;
            })
        ;
    </script>
</head>
<body>
<header>
    <jsp:include page="../header/header.jsp" flush="true"></jsp:include>
</header>

<div class="login-container-wrapper">
    <div class="ui four column centered grid">
        <div class="column form">
            <!--<h2 class="ui teal image header"> <div class="content">SuperLearn</div> </h2>-->
            <h1 class="ui blue header center">Super Learn</h1>
            <%--<form class="ui large form" action="test" method="post">--%>
            <%--@elvariable id="accounts" type="ml.learningmachine.model.domain.AccountsVO"--%>

            <form:form action="tryLogin" method="post" modelAttribute="accounts" commandName="accounts"
                       cssClass="ui large form">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <form:input path="email" cssClass="form-control" type="email"
                                    placeholder="user@superlearn.com"/>
                    </div>
                    <form:errors path="email"/>
                </div>

                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <form:password path="password"/>
                    </div>
                    <form:errors path="password"/>
                </div>

                <div class="ui error message"></div>

                <button class="ui fluid large blue submit button">Log in</button>
            </form:form>


        </div>
    </div>
</div>

</body>
</html>