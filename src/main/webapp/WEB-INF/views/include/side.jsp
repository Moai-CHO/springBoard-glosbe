<%--
  Created by IntelliJ IDEA.
  User: Jo
  Date: 2018-06-13
  Time: 오후 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="menu-bar">
    <div style="padding: 0 20px;">
        <h2 style="margin: 1.25rem 0">ULTRA LEARN</h2>


        <div>
            <div class="search-container" style="height: 44px;">
                <input type="text" placeholder="검색섹터" style="border: none; height: 100%; width: 100%;">
                <button style="border: transparent; background: transparent;"><i class="search icon"></i></button>
            </div>
        </div>
    </div>

    <c:set var="login_session" value="${sessionScope.login}"/>
    <c:choose>
        <%--로그인 세션 無--%>
        <c:when test="${empty login_session}">

            <div class="user-container">

                <a href="/user/login">
                    <div style="display: flex; font-size: 12px; color: white; font-family: '돋움', Dotum;">
                        <div style="margin-right: .35rem"><i class="sign in alternate icon"></i></div>
                        <span>로그인</span>
                    </div>
                </a>

                <a href="/user/regist">
                    <div style="display: flex; font-size: 12px; color: white; font-family: '돋움', Dotum;">
                        <div style="margin-right: .35rem"><i class="user icon"></i></div>
                        <span>회원가입</span>
                    </div>
                </a>
            </div>


        </c:when>

        <%--로그인 세션 有--%>
        <c:when test="${!empty login_session}">
            로그인 O
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
</div>