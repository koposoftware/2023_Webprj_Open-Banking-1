<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="kr.co.tlf.ex.dao.MBDao"%>
<%@ page import="kr.co.tlf.ex.dto.MBDto"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Withdrawn Members</title>
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
	margin-top: 20px; /* Added margin-top for spacing */
}

table th, table td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

button {
	padding: 8px 12px; /* Adjusted padding for button size */
	border: none;
	background-color: pink;
	color: #fff;
	cursor: pointer;
	border-radius: 4px;
	font-family: 'Hana', Arial, sans-serif;
	/* Applied font to the button */
}

button:hover {
	background-color: #ff6b9b;
}

a {
	display: inline-block;
	margin-top: 10px;
	margin-right: 10px;
	color: #fff;
	text-decoration: none;
	background-color: pink;
	padding: 6px;
	border-radius: 4px;
	font-family: 'Hana', Arial, sans-serif;
}

a:hover {
	background-color: #ff6b9b;
}

.button-container {
	display: flex;
	justify-content: center; /* Added for center alignment */
	margin-bottom: 20px; /* Added margin-bottom for spacing */
	margin-top: 20px; /* Added margin-top for spacing */
}

.button-container button {
	padding: 8px 12px; /* Adjusted padding for button size */
	border: none;
	background-color: pink;
	color: #fff;
	cursor: pointer;
	border-radius: 4px;
	text-align: center;
	font-size: 16px;
}

.button-container a {
	display: inline-block;
	margin-right: 10px;
	color: #fff;
	text-decoration: none;
	background-color: pink;
	padding: 6px;
	border-radius: 4px;
	font-family: 'Hana', Arial, sans-serif;
}

.button-container button:hover {
	background-color: #ff6b9b !important;
}

.button-container a:hover {
	background-color: #ff6b9b !important;
}
</style>
</head>
<body>
	<h1>ȸ�� ���� ������</h1>
	<h2>���� ���� ���� - Ż�� ��û�� �����</h2>
	<table>
		<tr>
			<th>�̸�</th>
			<th>ID</th>
			<th>��й�ȣ</th>
			<th>��ȭ��ȣ</th>
			<th>�̸���</th>
			<th>ȸ������</th>
			<th>ȸ������</th>
			<th>Ż�𿩺�</th>
			<th>ȸ������</th>
		</tr>
		<%
		MBDao memberDAO = new MBDao();
						    ArrayList<MBDto> withdrawnMembers = memberDAO.getWithdrawnMembers();

						    for (MBDto member : withdrawnMembers) {
		%>
		<tr>
			<td><%= member.getName() %></td>
			<td><%= member.getId() %></td>
			<td>******</td>
			<td><%= maskPhoneNumber(member.getPhoneNumber()) %></td>
			<td><%= member.getEmail() %></td>
			<td><%= member.getStatus() %></td>
			<td><%= member.getRole() %></td>
			<td><%= member.getWithdraw() %></td>
			<td>
				<form method="post" action="">
					<input type="hidden" name="id" value="<%= member.getId() %>">
					<button type="submit">ȸ������</button>
				</form>
			</td>

		</tr>
		<% 
            }
        %>
	</table>
	<div class="button-container">
		<button onclick="location.href='manageUser.jsp'">ȸ�������� �̵�</button>
	</div>
	<%!// ��ȭ��ȣ ����ŷ ó�� �Լ�
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
    }%>
	<%
        // Check if the delete member button is clicked
        String memberIdToDelete = request.getParameter("id");
        if (memberIdToDelete != null) {
            memberDAO.delete(memberIdToDelete);
            response.sendRedirect(request.getRequestURI());
        }
    %>
</body>
</html>
 --%>