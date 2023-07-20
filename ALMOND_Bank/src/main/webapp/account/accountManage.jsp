<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 관리</title>
<link rel="stylesheet" href="/static/css/styles.css">
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
<script>
window.addEventListener("wheel", function(e){
    e.preventDefault();
},{passive : false});

var mHtml = $("html");
var page = 1;

mHtml.animate({scrollTop : 0}, 10);

$(window).on("wheel", function(e) {
    if(mHtml.is(":animated")) return;
    if(e.originalEvent.deltaY > 0) {
        if(page == 5) return;
        page++;
    } else if(e.originalEvent.deltaY < 0) {
        if(page == 1) return;
        page--;
    }
    var posTop = (page-1) * $(window).height();
    mHtml.animate({scrollTop : posTop});
});
</script>
</head>
<body>
<header class="header-fixed">
	<jsp:include page="/include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>
<div id="menu_wrap">
<h1>계좌관리</h1>
<br><br>
<!-- 거래내역 조회 select (구현 예정)-->
<a id ="a_link" href="tradeSelect.bank">거래내역 조회</a><br><br>

<!-- 변경할 비밀번호 입력 받아서 그 값을 update 처리 -->
<br>
<a id ="a_link" href="pwUpdateInput.bank">계좌 비밀번호 변경</a><br><br>     
<br>
<%
    String accPw = (String) request.getParameter("accPw");
    session.setAttribute("accPw", accPw);
    String accNum = (String) request.getParameter("accNum");
    session.setAttribute("accNum", accNum);
    String accName = (String) request.getParameter("accName");
    session.setAttribute("accName", accName);
    
    String accTypeName = (String) request.getParameter("accTypeName");
    session.setAttribute("accTypeName", accTypeName);
%>

<%
    if (accTypeName.equals("적금")) {
%>
<!--         <script>
            alert("상품 전환은 예금 상품만 가능합니다.");
        </script>
 -->
        
<%
    }
    else {
%>
        <!-- 상품 분류명, 계좌명 update -->
        <a id ="a_link" href="accTransSelect.bank">다른 예금 상품으로 전환</a><br><br><br>
<%
    }
%>

<!-- 계좌 삭제 delete -->
<a id ="a_link" href="accDeleteCheck.jsp">계좌 해지</a>
</div>
<div>
<jsp:include page="/include/mainFooter.jsp"></jsp:include>`
</div>
</body>
</html>
