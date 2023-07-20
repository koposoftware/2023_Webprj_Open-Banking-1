<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>
<!DOCTYPE html>
<html>
<head>
<title>제로뱅크</title>
<link rel="stylesheet" href="static/css/styles.css?a">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<style>
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
 @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');  

</style>
</head>
	<body>
		<div id="header">
        <div id="main-text">
       	<a href ="Main.jsp">
         <img src="static/img/img-hana-symbol.png" width="100px" height="100px">
          <span style="font-size: 60px; font-weight: bold;">Almond Bank</span>
       </a>
       </div>
		<%-- <%
		if (session.getAttribute("loggedIn") == null) { %>
			<a href="joinInput.bank">회원가입</a>
			<a href="loginInput.bank">로그인</a>
		  
		
		<% } --%>
		<%
		String id = (String) session.getAttribute("loggedInId");
		String name = (String) session.getAttribute("name");

		boolean loggedIn =
		        (session.getAttribute("loggedIn") != null && (boolean) session.getAttribute("loggedIn"));
		boolean isAdmin =
		        (session.getAttribute("isAdmin") != null && (boolean) session.getAttribute("isAdmin"));

		if (loggedIn) {
		    if (isAdmin) {
		out.println("TH은행 관리자 페이지");
		        %>
		<div class="menu">
			<a href="./manageAdmin.bankadmin" id="menu-button">회원관리</a>
			<a href="./logout.bank" id="menu-button2">로그아웃</a>
		</div>
		<%
		} else {
			String message = name + "(" + id + ")" + "님 환영합니다.";
		%>
		
		<p id="welcomeMessage"><br><%= message %></p>
		<div class="menu"> <!-- 버튼 컨테이너로 감싸줍니다. -->
          <a href="./accountSelect.bank" id="menu-button"> 조회 </a>
			<a href="./apiAccountListPage.bank" id="menu-button"> 오픈뱅킹 </a>
          <a href="./timeDepositSelect.bank" id="menu-button"> 금융상품 </a>
          <a href="./logout.bank" id="menu-button2">로그아웃</a>
        </div>
		<%
		}
		%>
		<%
		}
		 else { %>
			 <div class="menu">
                    <a href="joinInput.bank" id="menu-button"> 회원가입 </a>
                    <a href="loginInput.bank" id="menu-button2"> 로그인 </a>
              </div>
		<% } %>
	</div>
	</body>
	</html>