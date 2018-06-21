<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Jo
  Date: 2018-06-09
  Time: 오후 7:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.css">
    <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.js"></script>

    <link rel="stylesheet" type="text/css" href="/resources/css/side.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main_page.css">
    <style>
    </style>
</head>
<body>
<div>
    <%@include file="../include/side.jsp" %>
</div>
<div class="content">
    <div class="wordset-header"><h4>${pagination.totalCount}개의 단어장</h4></div>


    <%--${fn:length(boardList)}--%>

    <c:forEach items="${listContents}" var="list">
        <div class="wordset-list-wrapper">
            <div class="content-info">
                <div class="header">
                    <a href="view?no=${list.board_number}">${list.wordset_subject}</a>
                    <div class="info">
                        <span>조회 : ${list.view_count} / </span>
                        <span>#${list.board_number}</span>
                    </div>
                </div>
                <div class="footer">${list.wordset_comment}</div>
            </div>
            <div class="list-aside">
                <div class="writer">${list.nick_name}
                </div>
                <div class="date"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm"/></div>
            </div>
        </div>
    </c:forEach>

    <div class="paging">
        <div class="ui pagination menu">
            <c:if test="${pagination.startPage > 1}">
                <a class="icon item" href="list?page=1<c:if test="${pagination.keyword != null}">&keyword=${pagination.keyword}</c:if>"> <i class="angle double left icon"></i> </a>
            </c:if>

            <%--이전--%>
            <c:if test="${pagination.page > 1}">
                <a class="icon item" href="list?page=${pagination.page-1}<c:if test="${pagination.keyword != null}">&keyword=${pagination.keyword}</c:if>"> <i class="angle left icon"></i> </a>
            </c:if>

            <%--반복--%>
            <c:forEach var="idx" begin="${pagination.startPage}" end="${pagination.endPage}">
                <%--현재 페이지--%>
                <c:if test="${pagination.page == idx}">
                    <a class="active item" href="list?page=${idx}<c:if test="${pagination.keyword != null}">&keyword=${pagination.keyword}</c:if>">${idx}</a>
                </c:if>
                <c:if test="${pagination.page != idx}">
                    <a class="item" href="list?page=${idx}<c:if test="${pagination.keyword != null}">&keyword=${pagination.keyword}</c:if>">${idx}</a>
                </c:if>
            </c:forEach>

            <c:if test="${pagination.page < pagination.totalPage}">
                <a class="icon item" href="list?page=${pagination.page+1}<c:if test="${pagination.keyword != null}">&keyword=${pagination.keyword}</c:if>"><i class="angle right icon"></i></a>
            </c:if>

            <c:if test="${pagination.endPage < pagination.totalPage}">
                <a class="icon red item" href="list?page=${pagination.totalPage}<c:if test="${pagination.keyword != null}">&keyword=${pagination.keyword}</c:if>"
                   data-tooltip="${pagination.totalPage}" data-inverted="">
                    <i class="angle double right icon"></i>
                </a>
            </c:if>


        </div>
    </div>

</div>
</div>
</body>
</html>
