<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="static/css/styles.css">
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
         <img src="static/img/logo.png" width="50px">
          Bank
       </a>
       </div>
		<div class="menu">
          <a href="./accountSelect.bank" id="menu-button"> 조회 </a>
            <a href="./apiAccountListPage.bank" id="menu-button"> 오픈뱅킹 </a>
          <a href="./timeDepositSelect.bank" id="menu-button"> 금융상품 </a>
          <a href="./checkMemberById.bank" id="menu-button">개인정보</a>
          <a href="./logout.bank" id="menu-button2">로그아웃</a>
          
       </div>
	</div>
	<div id = first-header>
		<div class="first-header-container">
           <!-- <button class="header-button1" onclick="location.href='./checkMemberById.bank'">개인정보관리</button>
           <button class="header-button1" onclick="location.href='./timeDepositSelect.bank'">금융상품보기</button> 
           <button class="header-button1" onclick="location.href='./accountSelect.bank'">조회</button>
           <button class="header-button1" onclick="location.href='./transfer.bank'">이체</button>
           <button class="header-button2" onclick="location.href='./logout.bank'">로그아웃</button>-->
	</div>
</div>
</body>
</html>