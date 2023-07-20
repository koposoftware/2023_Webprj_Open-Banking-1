<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DataObject.MemberDAO" %>
<%@ page import="DataObject.MemberDTO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 업데이트</title>
    <style>
        body {
            font-family: 'Hana', Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-top: 30px;
        }

        table {
            margin: 30px auto;
            border-collapse: collapse;
            width: 80%;
            max-width: 600px;
            background-color: #fff;
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f5f5f5;
        }

        a {
            display: block;
            margin-top: 20px;
            color: #888;
            text-decoration: none;
        }

        a:hover {
            color: #ff6b9b;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("EUC-KR");
    response.setCharacterEncoding("EUC-KR");

    String memberId = (String) session.getAttribute("loggedInId");
    System.out.println(memberId);
    MemberDAO memberDAO = new MemberDAO();
    ArrayList<MemberDTO> members = memberDAO.getLoggedInMember(memberId);

    if (members.size() > 0) {
        MemberDTO member = members.get(0);
        // 회원 정보 업데이트 처리
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");
        String password = request.getParameter("password");

        boolean success = memberDAO.update(memberId, password, name, phone_number, email);

        if (success) {
            // 업데이트 성공 시 메시지 출력
%>
            <h2>회원 정보가 업데이트되었습니다.</h2>
            <table>
                <tr>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                </tr>
                <tr>
                    <td><%= memberId %></td>
                    <td><%= password.replaceAll(".", "*") %></td> <!-- 비밀번호 마스킹 처리 -->
                    <td><%= name %></td>
                    <td><%= phone_number %></td>
                    <td><%= email %></td>
                </tr>
            </table>
            <a href="../Main.jsp">메인페이지로 돌아가기</a><!-- manageUser.jsp로 이동하는 버튼 -->
<%
        } else {
            // 업데이트 실패 시 메시지 출력
%>
            <h2>회원 정보 업데이트에 실패했습니다. - 중복된 전화번호 혹은 이메일</h2>
            <a href="manageMyInfoInput.jsp">다시 수정하기</a><!-- manageMyInfoInput.jsp로 이동하는 버튼 -->
<%
        }
    } else {
%>
        <h2>회원 정보를 가져오지 못했습니다.</h2>
        <a href="../Main.jsp">메인페이지으로 가기</a>
<%
    }
%>
</body>
</html>
 --%>