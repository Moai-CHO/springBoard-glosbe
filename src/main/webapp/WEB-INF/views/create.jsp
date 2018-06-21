<%--
  Created by IntelliJ IDEA.
  User: Jo
  Date: 2018-05-25
  Time: 오후 6:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/loginForm.css">


    <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.js"></script>
    <style>
        .creater {
            display: inline-flex;
        }

        .comment-option {
            width: 65%;
        }

        .word-content-wrapper {
            display: flex;
            background-color: white;
        }

        .buttonArea {
            /*margin-top: auto;
            margin-bottom: auto;*/

            margin: auto 0;
            display: flex;
            width: 12.5%;
        }

        .buttonArea > div {
            margin: 0 auto;
        }

        /*.word-content-wrapper:after {
            content: "dd";
        }*/

        textarea {
            width: 100%;
            border: transparent;
            resize: none;
            font-size: 1.4rem;
        }

        textarea:focus {
            outline: none;
        }

        hr {
            border: 1px solid #1ea1f7;
            margin-top: -1px;
            position: relative;
        }

        .subject {
            width: 100%;
            height: 44px;

            padding: 0 8px;
            font-size: 18px;

            border: none;
            outline: none;
        }

        .subject:focus {
            border: 1px solid #1ea1f7;
        }

        .search-meaning-result-container {
            padding: 1.25rem 1.5rem;
            border-top: 0.125rem solid #f0f0f0;

            background-color: white;

        }

        .search-meaning-result-container > * {

        }

        .search-meaning-result-wrapper {
            /*padding: 1rem 1rem;*/
            /*margin: 1rem 1rem 1rem 1rem;*/
            margin-top: 0.625rem;
            background-color: rgba(30, 166, 255, 0.76);

        }

        .search-meaning-result-wrapper > a {
            font-size: 20px;

            background-color: #f0f0f0;
            color: #455358;
            cursor: pointer;
            display: block;
            outline: none;
            padding: 0.625rem;
            position: relative;
            transition: all 120ms cubic-bezier(0.47, 0, 0.745, 0.715);
            width: 100%;
        }

        .btnClose {
            background-color: transparent;
            border: transparent;
            outline: none;

        }

        .btnClose:hover {
            color: #1ea1f7;
        }

        .testclass {
            width: 43.75%;
            padding: 1.25rem 1.5rem;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="header/header.jsp" flush="true"></jsp:include>
</header>

<div style="background-color: white; margin-bottom: 1.15rem;">
    <div class="ui container" style="display: flex; justify-content: space-between; padding: 35px 0;">
        <div class="comment-option">
            <div id="dd">
                <input type="text" placeholder="제목" id="subject" class="subject">
                <hr>
            </div>
            <div>
                <textarea id="comment" cols="30" rows="10" style="width: 100%;"></textarea>
                <hr>
            </div>
        </div>

        <div>
            <div class="creater">

                <div>
                    <img src="https://semantic-ui.com/images/avatar/small/joe.jpg">
                </div>
                <div>
                    <div>작성자</div>
                    <div>만수르_조</div>
                </div>
            </div>
            <div class="country">
                <select id="destLang">
                    <option value="eng">영어</option>
                    <option value="ja">일본어</option>
                    <option value="de">독일어</option>
                    <option value="ru">러시아어</option>
                    <option value="it">이탈리아어</option>
                    <option value="zh">중국어</option>
                    <option value="fr">프랑스어</option>
                </select>
            </div>
        </div>
    </div>
</div>

<div class="ui container">
    <div id="set1">
        <div class="ddd1">
            <div class="word-content-wrapper">

                <div class="testclass">
                    <div><textarea class="word-textarea" data-word-info="set-1" id="word" out></textarea></div>
                    <hr>
                    <div><label for="word">단어</label></div>
                </div>
                <div class="testclass">
                    <div><textarea data-mean-info="set-1" name="mean" id="mean"></textarea></div>
                    <hr>
                    <div><label for="mean">뜻</label></div>
                </div>
                <div class="buttonArea">
                    <div>
                        <div class="ui icon button autoSearch" data-tooltip="단어 검색" data-inverted="">
                            <i class="search icon"></i>
                        </div>
                        <div class="ui icon button" data-tooltip="삭제" data-inverted="">
                            <i class="trash icon"></i>
                        </div>
                    </div>

                </div>
            </div>
            <div class="search-meaning-result-container" data-search-result="set-1"></div>
        </div>
    </div>
    <div>
        <button id="addbtn">추가</button>
    </div>
    <div>
        <button id="getSet">
            가져오기
        </button>
    </div>
</div>
<div>
    <div class="ui modal">
        <div class="header">Header</div>
    </div>
</div>
<script> // todo : 워드셋 추가 버튼 .... 보기좋게 수정 필요
document.getElementById('addbtn').addEventListener('click', function () {
    var set_number = document.getElementById('set1').children.length + 1; // wordSet Length
    var set1 = '<div class="ddd1">\n' +
        '            <div class="word-content-wrapper">\n' +
        '                <div class="testclass">\n' +
        '                    <div><textarea class="word-textarea" data-word-info="set-' + set_number + '" id="word"></textarea></div>\n' +
        '                    <hr>\n' +
        '                    <div><label for="word">단어</label></div>\n' +
        '                </div>\n' +
        '                <div class="testclass">\n' +
        '                    <div><textarea data-mean-info="set-' + set_number + '" name="mean" id="mean"></textarea></div>\n' +
        '                    <hr>\n' +
        '                    <div><label for="mean">뜻</label></div>\n' +
        '                </div>\n' +
        '                <div class="buttonArea">\n' +
        '                    <div>\n' +
        '                        <div class="ui icon button autoSearch" data-tooltip="단어 검색" data-inverted="">\n' +
        '                            <i class="search icon"></i>\n' +
        '                        </div>\n' +
        '                        <div class="ui icon button" data-tooltip="삭제" data-inverted="">\n' +
        '                            <i class="trash icon"></i>\n' +
        '                        </div>\n' +
        '                    </div>\n' +
        '                </div>\n' +
        '            </div>\n' +
        '            <div class="search-meaning-result-container" data-search-result="set-' + set_number + '"></div>\n' +
        '        </div>';
    $(set1).appendTo('#set1');
})
</script>

<script> // jqueryUI 드래그 기능..
$(function () {
    $("#set1").sortable();
    $("#set1").disableSelection();
});
</script>
<%--<script>
    /*
    * word 와 mean 값 받아오는 반복문*/
    document.getElementById("getSet").addEventListener('click', function (event) {
        var length = document.querySelectorAll('[data-word-info]').length;

        for (var i = 0; i < length; i++) {
            console.log(i + '::' + document.querySelectorAll('[data-word-info]')[i].value);
        }
    })
</script>--%>
<div>
    <%--asdasd--%>
    <%--<%=session.getAttribute("login")%>--%>
    ${sessionScope.login.getId()}
    <%--${login_session}--%>
</div>
<script>
    document.getElementById('getSet').addEventListener('click', function () {
        var writer_id = ${sessionScope.login.getId()}; // 로그인 계정 id값
        var subject = document.getElementById('subject').value; // 타이틀
        var comment = document.getElementById('comment').value; // 내용
        $.ajax({
            type: "POST",
            url: "write",
            data: {
                writer_id: writer_id,
                wordset_subject: subject,
                wordset_comment: comment,
                wordset: wordsetConvert()
            },
            // contentType : 'application/json; charset=UTF-8',
            success: ajaxSuccess,
            error: ajaxError
        });
    });

    function ajaxSuccess(data) {
        if (data == 'WRITE_SUCCESS') {
            location.href = 'loginMain';
        }
    }

    function ajaxError(request, status, error) {
        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    }

    // wordset 변환
    function wordsetConvert() {

        var set_length = document.getElementById('set1').children.length; // wordSet Length

        var JSONdata = // JSON 틀 생성
            {
                "wordset": []
            }

        for (var i = 0; i < set_length; i++) {
            console.log(i + '::' + document.querySelectorAll('[data-word-info]')[i].value);

            var word = document.querySelectorAll('[data-word-info]')[i].value; // 단어
            var mean = document.querySelectorAll('[data-mean-info]')[i].value; // 의미

            var wordSet = {'word': word, 'meaning': mean};
            JSONdata.wordset.push(wordSet);
        }
        var json_data = JSON.stringify(JSONdata);
        return json_data;
    }


</script>

<script>
    $(document).on('click', 'a', function () {
        var selectMean = $(this).text();
        var selectSetNum = $(this).parent('div').parent('div').attr('data-search-result');

        var innerSetTextArea = document.querySelector('[data-mean-info=' + selectSetNum + ']');


        console.log('선택한 의미값 :: ' + selectMean);
        console.log('선택된 세트값 :: ' + selectSetNum); // 속성값 (순서값)

        var blankCheck = document.querySelector('[data-mean-info=set-1]').value === "";

        blankCheck ? innerSetTextArea.value += selectMean : innerSetTextArea.value += '\r' + selectMean;


    })
</script>

<script> // 검색결과 닫기버튼

$(document).on('click', '.btnClose', function () {

    var searchResultWindow = $(this).parent('div').parent('div').attr('data-search-result') // 클릭한 닫기버튼의 Search Result Window의 값

    document.querySelector('[data-search-result=' + searchResultWindow + ']').innerHTML = '';

})
</script>
<script>
    // .autoSearch
    /*$(document).on('click','.autoSearch', function () {
        alert('dd');
    })*/
</script>
<script> // 사전데이터 구해오기
$(document).on('click', '.autoSearch', function () {

    var dataArrayNum = $(this).parents('.word-content-wrapper').find('.word-textarea').data('word-info');
    console.log('array :: ' + dataArrayNum);
    var wordData = document.querySelector('[data-word-info=' + dataArrayNum + ']').value;
    getGlosbeDic(wordData, dataArrayNum);

});

// 사전 검색 함수
function getGlosbeDic(fromword, wordSetNum) {
    var destLang = document.getElementById('destLang').value;
    console.log('set :: ' + wordSetNum)
    $.ajax({
        url: 'https://glosbe.com/gapi/translate?from=kor&dest=' + destLang + '&format=json&pretty=true&phrase=' + fromword,
        dataType: 'jsonp',
        type: 'GET',
        success: function (data) {

            // document.querySelector('[data-search-result=set-1]').

            if (document.querySelector('[data-search-result=' + wordSetNum + ']').childNodes[0] != undefined) { // 이미 검색 결과가 존재 한다면
                document.querySelector('[data-search-result=' + wordSetNum + ']').innerHTML = ''; // 검색결과 초기화
            }
            document.querySelector('[data-search-result=' + wordSetNum + ']').innerHTML = '<div style="float:  right;    margin-top: -0.9em;"><button class="btnClose"><i class="window close icon"></i></button></div>';

            var parseDIC = data.tuc;
            if (parseDIC[0] !== undefined) {
                for (var i = 0; data.tuc.length > i; i++) {
                    if (parseDIC[i].phrase === undefined) {
                        console.log('찾을 수 없어 반복 끝냄');
                        break;
                    } else {
                        console.log(parseDIC[i].phrase.text); // 검색한 단어
                        // 노드 생성, 추가
                        var newNode = document.createElement('div');
                        newNode.className = 'search-meaning-result-wrapper';
                        newNode.innerHTML = '<a href="#">' + parseDIC[i].phrase.text + '</a>'
                        document.querySelector('[data-search-result=' + wordSetNum + ']').appendChild(newNode);
                    }
                }
            } else if (parseDIC[0] === undefined) {
                console.log('검색결과를 찾을 수 없습니다');
                var newNode = document.createElement('div');
                newNode.className = 'search-meaning-result-wrapper';
                newNode.innerHTML = '검색 결과가 없습니다.';
                document.querySelector('[data-search-result=' + wordSetNum + ']').appendChild(newNode);
            }


        }
    });
};
</script>
</body>
</html>
