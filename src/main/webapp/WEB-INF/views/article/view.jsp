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
    <link rel="stylesheet" type="text/css" href="/resources/css/view.css">
</head>
<body>
<div>
    <%@include file="../include/side.jsp" %>
</div>


<div class="content">
    <div class="contents-info">
        <span>#${view_wordBook.board_number}</span>
        <span>조회 : ${view_wordBook.view_count}</span>
    </div>
    <div class="wordset-info-container">

        <!--제목-->
        <h1>${view_wordBook.wordset_subject}</h1>

        <!--작성자, 단어 수, 글쓴 일-->
        <div class="wordset-contentsInfo-wrapper">
            <!--<div></div>-->
            <div class="wordset-contentsInfo-contents">

                <!--작성자 + 단어 수-->
                <div>
                    <a class="writer" href="#">${view_wordBook.nick_name}</a>
                </div>

                <!--작성일-->
                <div class="regdate">
                        <span class="date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                           value="${view_wordBook.regdate}"/></span>
                </div>
            </div>
        </div>

        <!--내용-->
        <div class="wordset-comment">${view_wordBook.wordset_comment}</div>
    </div>

    <form method="post" role="form">
        <input type="hidden" name="no" value="${view_wordBook.board_number}">
    </form>

    <c:set var="login_id" value="${login_session.id}"/>
    <c:set var="writer_id" value="${view_wordBook.writer_id}"/>
    <c:if test="${login_id eq writer_id}">
        <div style="margin-top: 1rem;text-align: right;">
            <button class="ui red button">삭제</button>
            <button type="submit" class="ui violet button" id="modify">수정</button>
        </div>
    </c:if>

    <div class="wordset-container">
        <!--단어세트-->
        <div>
            <!---->
            <div class="wordset-header"></div>
            <div class="wordbook-set">
            </div>

        </div>
    </div>
</div>
</div>
</body>


<script>
    wordset = ${view_wordBook.wordset};
    set_length = wordset.wordset.length;

    function line_break() {
        word = wordset.wordset[i].word;
        meaning = wordset.wordset[i].meaning;


        if (word.indexOf('\n') || meaning.indexOf('\n')) {
            word = word.replace(new RegExp('\r?\n', 'g'), '<br />');
            meaning = meaning.replace(new RegExp('\r?\n', 'g'), '<br />');
        }
    }

    for (var i = 0; i < wordset.wordset.length; i++) {
        line_break();
        nodes = '<div class="wordbook-wrapper">\n' +
            '                        <!--word-->\n' +
            '                        <div class="wordset-wrapper">\n' +
            '                            <div class="word-area">\n' +
            '                                <span class="wordbook-text">' + word + '</span>\n' +
            '                            </div>\n' +
            '                            <div class="wordset-line"></div>\n' +
            '                            <!--meaning-->\n' +
            '                            <div class="meaning-area">\n' +
            '                                <span class="wordbook-text">' + meaning + '</span>\n' +
            '                            </div>\n' +
            '                        </div>\n' +
            '                    </div>';

        $(nodes).appendTo('.wordbook-set');
    }

    count = '<h4>' + set_length + '개의 단어 세트</h4>';
    $(count).appendTo('.wordset-header');

</script>
<script>
    $(document).ready(function () {

        var formObj = $("form[role='form']");

        $("#modify").on("click", function () {
            alert('슈ㅋㅋ발')
            formObj.attr("action", "/article/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });
    });

</script>
</html>
