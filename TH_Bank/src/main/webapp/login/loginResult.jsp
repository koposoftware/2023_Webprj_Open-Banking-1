<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.tlf.ex.dao.MBDao"%>
<%@ page import="kr.co.tlf.ex.dto.MBDto"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        button {
            display: block;
            width: 200px;
            padding: 8px;
            border: none;
            background-color: #555;
            color: #fff;
            cursor: pointer;
            border-radius: 4px;
            margin: 0 auto;
            margin-top: 20px;
        }

        button:hover {
            background-color: #333;
        }

        .message {
            text-align: center;
            font-size: 18px;
            margin-top: 20px;
        }

        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
    </style>

</head>
<body>
<div class="container">
    <h1>로그인 결과</h1>

    <%
    request.setCharacterEncoding("EUC-KR");
        response.setCharacterEncoding("EUC-KR");
        String loggedInId = request.getParameter("id");
        String password = request.getParameter("password");
        session.setAttribute("loggedInId", loggedInId);
        MBDao memberDAO = new MBDao();
        ArrayList<MBDto> rs = memberDAO.getLoggedInMember(loggedInId);

        if (!rs.isEmpty()) {

            MBDto member = rs.get(0);

            String storedPassword = member.getPassword();
            if (password.equals(storedPassword)) {
        // 로그인 성공
        if (member.getStatus().equals("정상")) {
            session.setAttribute("loggedInId", loggedInId);
            if (member.getRole().equals("관리자")) {
        // 관리자로 로그인된 경우
        session.setAttribute("isAdmin", true);
        session.setAttribute("loggedIn", true);
        response.sendRedirect("../Main.jsp");
            } else {
        // 일반 사용자로 로그인된 경우
        session.setAttribute("isAdmin", false);
        session.setAttribute("loggedIn", true);
        response.sendRedirect("../Main.jsp");
            }
        } else if ( member.getStatus().equals("일시정지") ){
            // 일시 정지된 계정 메시지 출력
    %>
                <p class="message">일시 정지된 계정입니다.</p>
                <button onclick="location.href='../login/login.html'">로그인 페이지로 이동</button>
                <%
            } else {
                // 승인 대기 중 메시지 출력
                %>
                <p class="message">승인 대기 중입니다.</p>
                <button onclick="location.href='../login/login.html'">로그인 페이지로 이동</button>
                <%
            }
        } else { %>                
        		<p class="message">비밀번호가 일치하지 않습니다.</p>
                <button onclick="location.href='../login/login.html'">로그인 페이지로 이동</button>
 
<!--             // 비밀번호 불일치
            String errorMessage = "비밀번호가 일치하지 않습니다.";
            response.sendRedirect("login.html?errorMessage=" + URLEncoder.encode(errorMessage, "UTF-8")); -->
        <%}
    } else { %>
		<p class="message">해당 아이디가 존재하지 않습니다.</p>
        <button onclick="location.href='../login/login.html'">로그인 페이지로 이동</button>
		
<!--          // 아이디가 존재하지 않음
        String errorMessage = "해당 아이디가 존재하지 않습니다.";
        response.sendRedirect("login.html?errorMessage=" + URLEncoder.encode(errorMessage, "UTF-8"));
 --> 
 	<%   }
    %>
</div>
</body>
</html>
 --%>