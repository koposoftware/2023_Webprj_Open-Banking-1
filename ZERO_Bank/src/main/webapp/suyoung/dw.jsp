<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bank Account Transfer</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/static/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mr+Dafoe" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
        @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
        body{
            font-family: 'NanumSquareRound', sans-serif;

        }
        .check
        {
            border:none;
            font-family: 'NanumSquareRound', sans-serif;
            padding: 10px 20px;
            background-color: #666; /* 버튼 배경색 지정 */
            color: #fff; /* 버튼 텍스트 색상 지정 */
            cursor: pointer; /* 커서를 손가락 모양으로 변경 */
            border-radius: 30px;
        }
        .check:active{
            transform: scale(0.95);
        }
        #dBankCode {
            padding: 10px;
            border: 1px solid #ccc;
            height: 40px; /* 높이 값을 원하는 크기로 설정해주세요 */
            width: 50%;
            border-radius: 20px;
            font-family: 'Nanum Gothic', sans-serif;
        }
        td {
            padding: 10px; /* td 요소의 높이를 조절하기 위해 padding 추가 */
        }
        #wPassword,
        #dAccountNumber,
        #transferAmount{
            padding: 10px;
            border: 1px solid #ccc;
            height:20px;
            width:50%;
            border-radius: 20px;
            font-family: 'Nanum Gothic', sans-serif;
        }
        .custom-button[disabled] {
            opacity: 0.5;
            cursor: not-allowed;
        }
    </style>

    <script>
        window.addEventListener("wheel", function(e){
            e.preventDefault();
        },{passive : false});

        var mHtml = $("html");
        var page = 1;

        mHtml.animate({scrollTop : 0}, 10);

        $(window).on("wheel", function(e) {
            if (mHtml.is(":animated")) return;
            if (e.originalEvent.deltaY > 0) {
                if (page == 7) return;
                page++;
            } else if (e.originalEvent.deltaY < 0) {
                if (page == 1) return;
                page--;
            }
            var posTop = (page - 1) * $(window).height();
            mHtml.animate({ scrollTop: posTop });
        });

    </script>
</head>
<body>

<%
    //    bankCode = request.getParameter("bankCode");
//    accTypeName = request.getParameter("accTypeName");
//    accName = request.getParameter("accName");
//    accNum = request.getParameter("accNum");
//    accPw = request.getParameter("accPw");
//    accBalance = Integer.parseInt(request.getParameter("accBalance"));


    String wBankCode = request.getParameter("bankCode");
    String wAccountNumber = request.getParameter("accNum");
    String wPassword = request.getParameter("accPw");
    String wBalance = request.getParameter("accBalance");
%>
<header class="header-fixed">
    <jsp:include page="../include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br><br><br><br><br>
<div id="menu_wrap2">
    <%
        String name = (String) session.getAttribute("name");
    %>

    <h1>출금정보 확인 페이지</h1>
    <%
        out.println(name + " 고객님의 출금정보 확인 페이지");
    %>

    <br><br><br>
    <h2>출금정보 입력</h2>
    <hr style="width:30%; text-align: center; margin:0 auto;">
    <table class="custom-table" style="width:40%; text-align: center; margin: 0 auto;">
        <tr>
            <td style="text-align: right;">은행</td>
            <td><%= wBankCode %></td>
        </tr>
        <tr>
            <td style="text-align: right;">계좌번호</td>
            <td><%= wAccountNumber %></td>
        </tr>
        <tr>
            <td style="text-align: right;">비밀번호</td>
            <td>
                <input type="password" id="wPassword" />
                <button id="passwordCheck" class="check">확인</button>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">잔액</td>
            <td id="wBalance"><%= wBalance %> 원</td>
        </tr>
    </table>
    <br><br><br>
    <br><br><br>
    <h2>입금정보 입력</h2>
    <hr style="width:30%; text-align: center; margin:0 auto;">
    <table class="custom-table" style="width:40%; text-align: center; margin: 0 auto;">
        <tr>
            <td style="text-align: right;">은행</td>
            <td>
                <select id="dBankCode">
                    <option value="">은행을 선택하세요</option>
                    <option value="TH">TH은행</option>
                    <option value="ZERO">ZERO은행</option>
                    <option value="HI">HI은행</option>
                    <option value="ALMOND">ALMOND은행</option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">계좌번호</td>
            <td>
                <input type="text" id="dAccountNumber" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">이체금액</td>
            <td>
                <input type="number" id="transferAmount" min="10" />
            </td>
        </tr>
    </table>

</div>
<br><br>
<div style="text-align: center; width: 100%; margin:0 auto;">
    <button id="transferButton" class="custom-button" style="text-align: center; margin:0 auto;"disabled>이체하기</button>
</div>
<script>
    $(document).ready(function() {
        // 세션에서 잔액을 가져옵니다.
        var wBalance = Number($('#wBalance').text().replace(/[^0-9.-]+/g,""));
        var wPassword = '<%= wPassword %>';
        var wBankCode = '<%= wBankCode %>';
        var wAccountNumber = '<%= wAccountNumber %>';

        $('#transferButton').click(function() {
            if (wBalance < Number($('#transferAmount').val())) {
                alert("잔액이 부족합니다.");
                return false;
            } else {
                var dBankCode = $('#dBankCode').val();
                var dAccountNumber = $('#dAccountNumber').val();
                var transferAmount = $('#transferAmount').val();

                location.href = 'dwCheck.jsp?wBankCode=' + wBankCode + '&wAccountNumber=' + wAccountNumber + '&dBankCode=' + dBankCode + '&dAccountNumber=' + dAccountNumber + '&transferAmount=' + transferAmount;
            }
        });

        // 비밀번호 확인 버튼 클릭 이벤트
        $('#passwordCheck').click(function() {
            var enteredPassword = $('#wPassword').val();
            if (enteredPassword === wPassword) {
                $('#transferButton').prop('disabled', false);
            } else {
                alert("비밀번호가 틀립니다.");
            }
        });
    });

</script>

</script>
</div>
<div>
    <jsp:include page="../include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>
