 <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Error Page</title>
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
	<jsp:include page="include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>
	<h3>에러 페이지입니다</h3>
	<a href="Main.bank">메인으로 돌아가기</a>
<div>
<jsp:include page="include/mainFooter.jsp"></jsp:include>`
</div>
</body>
</html>