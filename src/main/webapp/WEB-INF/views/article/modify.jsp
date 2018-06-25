<%--
  Created by IntelliJ IDEA.
  User: Jo
  Date: 2018-06-23
  Time: 오전 4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <link rel="stylesheet" type="text/css" href="/resources/css/side.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/view.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/write.css">

</head>
<body>

<div>
    <%@include file="../include/side.jsp" %>
</div>


<div class="content">
    <%--<div class="contents-info">
        <span>#${view_wordBook.board_number}</span>
        <span>조회 : ${view_wordBook.view_count}</span>
    </div>--%>
    <div class="wordset-info-container">

        <input placeholder="제목" type="text" id="subject" class="wordset-option-input" value="${modify.wordset_subject}">

        <div>
            <select id="destLang" class="wordset-option-input">
                <option selected value="none">검색할 단어의 언어 선택</option>
                <option value="eng">영어</option>
                <option value="ja">일본어</option>
                <option value="de">독일어</option>
                <option value="ru">러시아어</option>
                <option value="it">이탈리아어</option>
                <option value="zh">중국어</option>
                <option value="fr">프랑스어</option>
                <option value="fr">프랑스어</option>
            </select>
        </div>
        <textarea name="" id="comment" rows="5" class="wordset-option-input">${modify.wordset_comment}</textarea>
    </div>

    <div class="wordset-container">
        <!--단어세트-->
        <div class="wordset-header"></div>
        <div class="wd-set">
            <%--wordset 추가되는 곳--%>
        </div>
        <div id="add-wordset">
            <i class="add icon"></i> 추가
        </div>
    </div>

    <div style="text-align: right; margin-top: 2rem">
        <button id="contents-create">
            수정
        </button>
    </div>
</div>


<script> // 줄바꿈 자동 높이 조절
$(document).on('change keydown keyup', 'textarea', function () {
    $(this).css('height', 'auto');
    if (this.scrollHeight != 34) {
        // $(this).css('height', 'auto');
        $(this).height(this.scrollHeight - 18);
    }
})

</script>
<script>
    /*자동 단어 검색 */
    $(document).on('blur', '.input-word', function () {
        if ($('#destLang').val() != 'none') {
            thisWordKeyword = $(this).val(); // 검색 할 단어값

            console.log("thisWordKeyword :: " + thisWordKeyword);

            thisWordTerm = $(this).parents('.wordbook-wrapper').attr('data-word-term'); // 현재노드 data-set 구하기

            console.log("thisWordTerm-data :: " + thisWordTerm);

            console.log(document.querySelectorAll('[data-word-term]')[thisWordTerm - 1])

            getGlosbeDic(thisWordKeyword, thisWordTerm);
        }

    });


    function getGlosbeDic(fromword, wordSetNum) {
        var destLang = document.getElementById('destLang').value;
        console.log(destLang);
        $.ajax({
            url: 'https://glosbe.com/gapi/translate?from=kor&dest=' + destLang + '&format=json&pretty=true&phrase=' + fromword,
            dataType: 'jsonp',
            type: 'GET',
            success: function (data) {
                console.log(data);
                var parseDIC = data.tuc;
                document.querySelector('[data-word-term="' + wordSetNum + '"]').getElementsByClassName('search-result-container')[0].innerHTML =
                    '                        <div class="search-result-wrapper">\n' +
                    '                            <div class="search-result-header"><i class="close icon" id="gg"></i></div>\n' +
                    '                        </div>';

                if (parseDIC[0] !== undefined) {
                    for (var i = 0; data.tuc.length > i; i++) {
                        if (parseDIC[i].phrase === undefined) {
                            console.log('찾을 수 없어 반복 끝냄');
                            break;
                        } else {
                            console.log(parseDIC[i].phrase.text); // 검색한 단어
                            /*검색결과 반영 엘리먼트 생성*/
                            searchSuccessElement = document.createElement('div');
                            searchSuccessElement.className = 'search-result-body';
                            searchSuccessElement.innerHTML = '<a href="#" class="search-meaning-text">' + parseDIC[i].phrase.text + '</a>'
                            document.querySelector('[data-word-term="' + wordSetNum + '"]').getElementsByClassName('search-result-wrapper')[0].appendChild(searchSuccessElement);

                        }
                    }
                } else if (parseDIC[0] === undefined) {
                    /*검색결과 없음 엘리먼트 생성*/
                    searchFailElement = document.createElement('div');
                    searchFailElement.className = 'search-result-body';
                    searchFailElement.innerHTML = '검색 결과가 없습니다.'
                    document.querySelector('[data-word-term="' + wordSetNum + '"]').getElementsByClassName('search-result-wrapper')[0].appendChild(searchFailElement);
                }


            }
        });
    }

    $(document).on('click', '.search-meaning-text', function () {
        selected_searchResult = $(this).text(); // 단어 검색 결과 선택값

        data_set = $(this).parents('.wordbook-wrapper').attr('data-word-term'); // 현재노드 data-set 구하기

        // aa = document.querySelector('[data-word-term="' + data_set + '"]').children('.result-meaning');
        aa = $(this).parents('.wordbook-wrapper').find('.result-meaning');
        console.log('시발')
        console.log(aa)
        $(this).parents('.wordbook-wrapper').find('.result-meaning')[0].value += selected_searchResult;


        console.log('zz');
        console.log(this.scrollHeight);
        $(this).css('height', 'auto');
        console.log(this.scrollHeight);


    })

    $(document).on('click', '.close', function () {
        alert('gd');
        $(this)
            .closest('.search-result-wrapper')
            .transition('fade')
        ;
    })
</script>
<script> // wordset 가져오기
wordset = ${modify.wordset};
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
    wordset_inner = document.createElement('div');
    wordset_inner.className = 'wordbook-set';
    wordset_inner.innerHTML = '<div class="wordbook-wrapper" data-word-term="' + (i + 1) + '">\n' +
        '                    <div class="wordset-wrapper">\n' +
        '                        <div class="word-area">\n' +
        '                            <span class="wordbook-text">\n' +
        '                                <textarea class="wordset-option-input input-word" name="" rows="1">' + word + '</textarea>\n' +
        '                                <div class="sub-title">단어</div>\n' +
        '                            </span>\n' +
        '                        </div>\n' +
        '                        <div class="meaning-area">\n' +
        '                            <span class="wordbook-text">\n' +
        '                                <textarea class="wordset-option-input result-meaning" name="" rows="1">' + meaning + '</textarea>\n' +
        '                                <div class="sub-title">뜻</div>\n' +
        '                            </span>\n' +
        '                        </div>\n' +
        '                    </div>\n' +
        '                    <div class="search-result-container">\n' +
        '                    </div>\n' +
        '                </div>\n';

    $('.wd-set')[0].appendChild(wordset_inner);

}

</script>
<script>
    /* 단어세트 추가버튼*/
    $('#add-wordset').on('click', function () {
        termNumber = document.getElementsByClassName('wd-set')[0].children.length + 1;
        alert('gd');


        wordset_inner = document.createElement('div');
        wordset_inner.className = 'wordbook-set';
        wordset_inner.innerHTML = '<div class="wordbook-wrapper" data-word-term="' + termNumber + '">\n' +
            '                    <div class="wordset-wrapper">\n' +
            '                        <div class="word-area">\n' +
            '                            <span class="wordbook-text">\n' +
            '                                <textarea class="wordset-option-input input-word" name="" rows="1"></textarea>\n' +
            '                                <div class="sub-title">단어</div>\n' +
            '                            </span>\n' +
            '                        </div>\n' +
            '                        <div class="meaning-area">\n' +
            '                            <span class="wordbook-text">\n' +
            '                                <textarea class="wordset-option-input result-meaning" name="" rows="1"></textarea>\n' +
            '                                <div class="sub-title">뜻</div>\n' +
            '                            </span>\n' +
            '                        </div>\n' +
            '                    </div>\n' +
            '                    <div class="search-result-container">\n' +
            '                    </div>\n' +
            '                </div>\n';


        $('.wd-set')[0].appendChild(wordset_inner);
    })
</script>
<script>
    /*글 쓰기*/
    document.getElementById('contents-create').addEventListener('click', function () {
        writer_id = ${sessionScope.login.getId()}; // 로그인 계정 id값
        subject = document.getElementById('subject').value; // 타이틀
        comment = document.getElementById('comment').value; // 내용
        if ((subject && comment) != "") {
            $.ajax({
                type: "POST",
                url: "content_modify",
                data: {
                    board_number: ${modify.board_number},
                    writer_id: writer_id,
                    wordset_subject: subject,
                    wordset_comment: comment,
                    wordset: wordsetConvert()
                },
                success: ajaxSuccess,
                error: ajaxError
            });
        } else {
            alert('빈칸채워라');
        }
    });

    function ajaxSuccess(data) {
        if (data == 'WRITE_SUCCESS') {
            alert('수정 완료');
            location.href = 'view?no=${modify.board_number}';
        }
    }

    function ajaxError(request, status, error) {
        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    }

    function wordsetConvert() {

        var set_length = document.getElementsByClassName('wd-set')[0].children.length; // wordSet Length

        var JSONdata = // DATA 틀
            {
                "wordset": []
            }

        for (var i = 0; i < set_length; i++) {

            var word = $(document).find('.input-word')[i].value; // 단어
            var mean = $(document).find('.result-meaning')[i].value; // 의미
            if ((word && mean) === "") {
                alert('단어장 빈칸 채우셈');
                throw 'WORDSET_BLANK_STOP'; // 빈칸 함수 중지
            }
            var wordSet = {'word': word, 'meaning': mean};
            JSONdata.wordset.push(wordSet);
        }
        var json_data = JSON.stringify(JSONdata);
        return json_data;
    }

</script>


<script> // jqueryUI 드래그 기능.
$(function () {
    $(".wd-set").sortable({
        placeholder: "state-highlight"
    });
    $(".wd-set").disableSelection();
});
</script>
</body>
</html>
