<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="DataObject.MemberDAO" %>
<%@ page import="DataObject.MemberDTO" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원 정보 수정</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    padding: 20px;
}

h1 {
    text-align: center;
}

form {
    width: 300px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

table {
    width: 100%;
}

table td {
    padding: 5px;
}

input[type="text"], input[type="password"] {
    width: 90%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="email"] {
    width: 90%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="radio"] {
    margin-right: 5px;
}

input[type="submit"] {
    width: 100%;
    padding: 8px;
    border: none;
    background-color: #4CAF50;
    color: #fff;
    cursor: pointer;
    border-radius: 4px;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

</style>
</head>
<body>
<h1>회원 정보 수정</h1>
<form action="editMember.jsp" method="post">
    <table>
        <tr>
            <td><b>이름:</b></td>
            <td><input type="text" name="name" value="" required></td>
        </tr>
        <tr>
            <td><b>이메일:</b></td>
            <td><input type="email" name="email" value="" required></td>
        </tr>
        <tr>
            <td><b>회원상태:</b></td>
            <td>
                <input type="radio" name="status" value="승인 전" required> 승인 전
                <input type="radio" name="status" value="정상" required> 정상
                <input type="radio" name="status" value="일시정지" required> 일시정지
            </td>
        </tr>
        <tr>
            <td><b>회원권한:</b></td>
            <td>
                <input type="radio" name="role" value="일반사용자" required> 일반사용자
                <input type="radio" name="role" value="관리자" required> 관리자
            </td>
        </tr>
    </table>
    <br>
    <input type="hidden" name="id" id="id" value="<%= request.getParameter("id") %>">
    <input type="submit" value="수정">
</form>
</body>
</html>
 --%>