<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Account Transfer</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</table>

<button id="transferButton" disabled>이체하기</button>

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


<%--<button id="transferButton" disabled>이체하기</button>--%>

<%--<script>--%>
<%--$(document).ready(function() {--%>
<%--    // 세션에서 잔액을 가져옵니다.--%>
<%--    var wBalance = Number($('#wBalance').text().replace(/[^0-9.-]+/g,""));--%>
<%--    var wPassword = '<%= wPassword %>';--%>
<%--    var wBankCode = '<%= wBankCode %>';--%>
<%--    var wAccountNumber = '<%= wAccountNumber %>';--%>

<%--    $('#transferButton').click(function() {--%>
<%--        if (balance < Number($('#transferAmount').val())) {--%>
<%--            alert("잔액이 부족합니다.");--%>
<%--            return false;--%>
<%--        } else {--%>
<%--            var dBankCode = $('#dBankCode').val();--%>
<%--            var dAccountNumber = $('#dAccountNumber').val();--%>
<%--            var transferAmount = $('#transferAmount').val();--%>

<%--            location.href = 'dwCheck.jsp?wBankCode=' + wBankCode + '&wAccountNumber=' + wAccountNumber + '&dBankCode=' + dBankCode + '&dAccountNumber=' + dAccountNumber + '&transferAmount=' + transferAmount;--%>
<%--        }--%>
<%--    });--%>

<%--    // 비밀번호 확인 버튼 클릭 이벤트--%>
<%--    $('#passwordCheck').click(function() {--%>
<%--        var enteredPassword = $('#wPassword').val();--%>
<%--        if (enteredPassword === wPassword) {--%>
<%--            $('#transferButton').prop('disabled', false);--%>
<%--        } else {--%>
<%--            alert("비밀번호가 틀립니다.");--%>
<%--        }--%>
<%--    });--%>
<%--});--%>

</script>

</body>
</html>
