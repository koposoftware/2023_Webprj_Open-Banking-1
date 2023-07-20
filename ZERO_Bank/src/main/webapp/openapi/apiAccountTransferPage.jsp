<%--
  Created by IntelliJ IDEA.
  User: kantae
  Date: 2023/07/13
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header class="header-fixed">
    <jsp:include page="/include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br><br><br><br><br><br>
<div id ="menu_wrap2">
    <h1>오픈뱅킹 계좌이체 페이지</h1>

    <%
        String bankCode, accTypeName, accName, accNum, accPw;
        int accBalance = 0;

        bankCode = request.getParameter("bankCode");
        accTypeName = request.getParameter("accTypeName");
        accName = request.getParameter("accName");
        accNum = request.getParameter("accNum");
        accPw = request.getParameter("accPw");
        accBalance = Integer.parseInt(request.getParameter("accBalance"));
    %>

    <table id="TH-table">
        <tr>
            <td>은행 코드:</td>
            <td><%= bankCode %></td>
        </tr>
        <tr>
            <td>계좌 유형:</td>
            <td><%= accTypeName %></td>
        </tr>
        <tr>
            <td>예금주 이름:</td>
            <td><%= accName %></td>
        </tr>
        <tr>
            <td>계좌 번호:</td>
            <td><%= accNum %></td>
        </tr>
        <tr>
            <td>계좌 비밀번호:</td>
            <td><%= accPw %></td>
        </tr>
        <tr>
            <td>계좌 잔액:</td>
            <td><%= accBalance %></td>
        </tr>
    </table>
</div>
<div>
    <jsp:include page="../include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>
