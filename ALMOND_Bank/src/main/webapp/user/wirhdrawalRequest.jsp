<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="kr.co.tlf.ex.dao.MBDao"%>
<%@ page import="kr.co.tlf.ex.dto.MBDto"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    body {
        font-family: 'Hana', Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 20px;
    }

    .container {
        max-width: 600px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
        color: #333;
        margin-top: 0;
    }

    .message {
        margin-bottom: 20px;
        color: #555;
    }

    form {
        margin-top: 20px;
    }

    button {
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background-color: #555;
    }
</style>
</head>
<body>
<div class="container">
    <h1>회원 탈퇴 요청</h1>
    <%
    String loggedInId = (String) session.getAttribute("loggedInId");
             
             MBDao memberDAO = new MBDao();
             memberDAO.updateWithdraw(loggedInId, "T");
             memberDAO.updateWithdrawStatus(loggedInId);
    %>
    <p class="message"><%= loggedInId %>님 탈퇴요청이 완료되었습니다.</p>
    Perform withdrawal operations
    <% memberDAO.updateWithdraw(loggedInId, "T");
    memberDAO.updateWithdrawStatus(loggedInId);


    // Check if the cancel withdrawal button is clicked
    String cancelWithdrawal = request.getParameter("cancelWithdrawal");
    if (cancelWithdrawal != null && cancelWithdrawal.equals("true")) {
        boolean success = memberDAO.updateWithdraw(loggedInId, "F");

        if (success) {
            out.println("<p class='message'>회원 탈퇴 요청이 취소되었습니다.</p>");
        } else {
            out.println("<p class='message'>회원 탈퇴 요청을 취소하는 중에 오류가 발생했습니다.</p>");
        }
    }
    %>

    <form method="post" action="">
        <input type="hidden" name="loggedInId" value="<%= loggedInId %>">
        <input type="hidden" name="cancelWithdrawal" value="true">
        <button type="submit">탈퇴 취소</button>
    </form>
    <br>
    <a href="../Main.jsp">메인페이지로 이동하기</a>
</div>
</body>
</html>
 --%>