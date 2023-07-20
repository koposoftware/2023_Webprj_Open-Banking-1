<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="static/css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
 @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');  

</style>
</head>
<body>
<jsp:include page="include/mainHeader.jsp"></jsp:include>
	<div class="container">
		<% session.invalidate(); %>
		<br><br><br><br>
		<h1>로그아웃되었습니다.</h1>
		
		<img src="static/img/bye.jpg" width="500px" text-align="center">
		<ul>
		<button onclick="location.href='Main.bank'" class="button1">메인 페이지</button></ul>
		<br><br><br>
	</div>
	<div>
	<jsp:include page="include/mainFooter.jsp"></jsp:include>`
    </div>
</body>
</html>
