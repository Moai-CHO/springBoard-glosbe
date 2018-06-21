<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="ui fixed menu">
    <div class="ui container">
        <a href="#" class="header item">
            SuperLearn
        </a>
        <a href="#" class="item">Home</a>
        <a href="#" class="item">Home</a>
        <div class="ui simple dropdown item">
            Dropdown <i class="dropdown icon"></i>
            <div class="menu">
                <a class="item" href="#">Link Item</a>
                <a class="item" href="#">Link Item</a>
                <div class="divider"></div>
                <div class="header">Header Item</div>
                <div class="item">
                    <i class="dropdown icon"></i>
                    Sub Menu
                    <div class="menu">
                        <a class="item" href="#">Link Item</a>
                        <a class="item" href="#">Link Item</a>
                    </div>
                </div>
                <a class="item" href="#">Link Item</a>
            </div>
        </div>

        <div class="right menu">
            <c:set var="login_session" value="${sessionScope.login}"/>
            <c:choose>

                <%--로그인 세션 有--%>
                <c:when test="${!empty login_session}">

                    <div>
                        <a href="#" class="item">Log out</a>
                        <span>${login_session}</span>
                    </div>

                </c:when>

                <%--세션 없음--%>
                <c:when test="${empty login_session}">
                    <div class="item">
                        <a class="ui button" href="../../../asd">Log in</a>
                    </div>
                    <div class="item">
                        <a class="ui primary button" href="../../registForm">Sign Up</a>
                    </div>
                </c:when>

            </c:choose>


        </div>
    </div>
</div>