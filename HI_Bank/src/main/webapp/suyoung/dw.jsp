<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Account Transfer</title>
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

        body {
            margin: 0;
            background-color: #f0f0f0;
            font-family: 'Arial', sans-serif;
            display: flex;
            flex-direction: column;
        }

        #menu_wrap {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        table {
            border-collapse: collapse;
            margin: 0 auto;
            background-color: white;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.15);
            width: 60%; /* Optionally, adjust the width */
        }

        td {
            padding: 20px;
            text-align: left;
            border-bottom: 1px solid #ddd;
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


String wBankCode = request.getParameter("bankCode");
String wAccountNumber = request.getParameter("accNum");
String wPassword = request.getParameter("accPw");
String wBalance = request.getParameter("accBalance");
%>
<header class="header-fixed">
    <jsp:include page="../include/mainHeader.jsp"></jsp:include>
</header>
<div id="menu_wrap">
<h2>출금정보 확인</h2>
<table>
    <tr>
        <td>은행</td>
        <td><%= wBankCode %></td>
    </tr>
    <tr>
        <td>계좌번호</td>
        <td><%= wAccountNumber %></td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td>
            <input type="password" id="wPassword" />
            <button id="passwordCheck">확인</button>
        </td>
    </tr>
    <tr>
        <td>잔액</td>
        <td id="wBalance"><%= wBalance %></td>
    </tr>
</table>

<h2>입금정보 입력</h2>
    <table>
        <tr>
            <td>은행</td>
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
            <td>계좌번호</td>
            <td>
                <input type="text" id="dAccountNumber" />
            </td>
        </tr>
        <tr>
            <td>이체금액</td>
            <td>
                <input type="number" id="transferAmount" min="10" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button id="transferButton" disabled>이체하기</button>
            </td>
        </tr>
    </table>

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
</div>
<div>
    <jsp:include page="../include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>
