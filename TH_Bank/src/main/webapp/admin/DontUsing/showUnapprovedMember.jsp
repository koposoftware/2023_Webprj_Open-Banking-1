<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="DataObject.MemberDAO"%>
<%@ page import="DataObject.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 관리 페이지</title>
  <style>
    body {
      font-family: 'Hana', Arial, sans-serif;
      background-color: #ffffff;
      padding: 20px;
      text-align: center;
    }

    h1 {
      text-align: center;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #f9f9f9;
    }

    table th, table td {
      padding: 10px;
      border: 1px solid #ccc;
      text-align: center;
    }

    button {
      width: 80px; /* Updated button width to 80px */
      padding: 6px;
      border: none;
      background-color: pink;
      color: #fff;
      cursor: pointer;
      border-radius: 4px;
      font-family: 'Hana', Arial, sans-serif; /* Applied font to the button */
    }

    button:hover {
      background-color: #ff6b9b;
    }

    a {
      display: inline-block; /* Changed display to inline-block */
      margin-top: 10px;
      margin-right: 10px; /* Added margin-right for spacing between buttons */
      color: #fff;
      text-decoration: none;
      background-color: pink;
      padding: 6px;
      border-radius: 4px;
      font-family: 'Hana', Arial, sans-serif; /* Applied font to the buttons */
    }

    a:hover {
      background-color: #ff6b9b;
    }
  </style>
</head>
<body>
  <h1>회원 관리 페이지</h1>

  유저 정보 조회
  <h2>유저 정보 조회 - 미승인 사용자</h2>
  <table>
    <tr>
      <th>ID</th>
      <th>Password</th>
      <th>Name</th>
      <th>Contact</th>
      <th>Email</th>
      <th>Status</th>
      <th>Role</th>
      <th>Edit</th>
    </tr>
    <% 
    MemberDAO memberDAO = new MemberDAO();
    ArrayList<MemberDTO> members = memberDAO.memberSelect();
    for (MemberDTO member : members) {
      if (!member.getRole().equals("관리자") && member.getStatus().equals("승인 전")) { // role이 "관리자"가 아닌 경우에만 출력
    %>
      <tr>
        <td><%= member.getId() %></td>
        <td><%= member.getPassword() %></td>
        <td><%= member.getName() %></td>
        <td><%= maskPhoneNumber(member.getPhoneNumber()) %></td>
        <td><%= member.getEmail() %></td>
        <td><%= member.getStatus() %></td>
        <td><%= member.getRole() %></td>
        <td><button onclick="editMember('<%= member.getId() %>')">수정</button></td>
      </tr>
    <% 
      }
    } 
    %>
    <%!
    // 전화번호 마스킹 처리 함수
    public String maskPhoneNumber(String phoneNumber) {
        if (phoneNumber == null || phoneNumber.isEmpty()) {
            return phoneNumber;
        }
        if (phoneNumber.startsWith("010") && phoneNumber.length() >= 10) {
            String front = phoneNumber.substring(0, 4);
            String masked = phoneNumber.substring(4).replaceAll("\\d", "*");
            return front + masked;
        } else {
            return phoneNumber;
        }
    }
%>
  </table>
  <div>
    <a href="manageUser.jsp">회원 관리로 돌아가기</a>
    <a href="../Main.jsp">메인페이지로 돌아가기</a>
  </div>
  <script>
    function editMember(id) {
      window.location.href = "editMemberInput.jsp?id=" + id;
    }
  </script>
</body>
</html>
 --%>