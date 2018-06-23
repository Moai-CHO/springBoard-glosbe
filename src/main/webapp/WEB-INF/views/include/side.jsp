<%--
  Created by IntelliJ IDEA.
  User: Jo
  Date: 2018-06-13
  Time: 오후 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="login_session" value="${sessionScope.login}"/>
<div class="menu-bar asdasd">


    <div class="menu-head">
        <h1 class="menu-head-inner">

            <div class="menu-button-wrapper">
                <input type="checkbox" id="menu-toggle">
                <label for="menu-toggle"><i class="bars icon"></i></label>
            </div>

            <div>뤄닝머신</div>

            <div class="menu-button-wrapper">
                <c:choose>
                    <c:when test="${empty login_session}">
                        <a href="/user/login"><i class="sign in alternate icon"></i></a>
                    </c:when>

                    <c:when test="${!empty login_session}">
                        <a href="/user/logout"><i class="sign in alternate icon"></i></a>
                    </c:when>
                </c:choose>
            </div>
        </h1>

        <div>
            <div class="search-container">
                <input type="text" placeholder="검색">
                <button><i class="search icon"></i></button>
            </div>
        </div>
    </div>

    <c:choose>
        <%--로그인 세션 無--%>
        <c:when test="${empty login_session}">

            <div class="user-container">

                <a href="/user/login">
                    <div>
                        <div><i class="sign in alternate icon"></i></div>
                        <span>로그인</span>
                    </div>
                </a>
                <a href="/user/regist">
                    <div>
                        <div><i class="user icon"></i></div>
                        <span>회원가입</span>
                    </div>
                </a>
            </div>
        </c:when>

        <%--로그인 세션 有--%>
        <c:when test="${!empty login_session}">
            <div class="user-container">
                    ${login_session.id}
                    ${login_session.nick_name}님 환영합니다
                <div>로그아웃</div>
            </div>

        </c:when>
    </c:choose>
    <div class="category-list">
        <a href="/article/write">
            <div>
                <div><i class="edit icon"></i>만들기</div>
            </div>
        </a>
        <a href="/article/myBook">
            <div>
                <div><i class="folder outline icon"></i>나의 단어장</div>
            </div>
        </a>
        <a href="/article/list">
            <div>
                <div><i class="list icon"></i>모든 단어장</div>
            </div>
        </a>
    </div>
</div>
<script>
    $('.search-container > input').on('keydown', function (event) {
        if (event.keyCode == 13) {
            keyword = $('.search-container > input').val(); // 키워드
            location.href = '/article/list?page=1&keyword=' + keyword;
        }
    })
    $('#menu-toggle').on('change', function () {
        if ($('#menu-toggle').is(':checked')) {
            $('.menu-bar').addClass('open');
        } else {
            $('.menu-bar').removeClass('open');
        }
    })
</script>
</div>