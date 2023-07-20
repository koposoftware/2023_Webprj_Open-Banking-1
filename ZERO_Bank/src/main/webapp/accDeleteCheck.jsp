<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<div id = "menu_wrap">
<h1>계좌해지</h1>
<form action="pwCheckInput.bank" method="post">
  <p>다음의 경우 해지가 불가능 합니다.</p>
  <ul >
    <li style="text-align: left;">한도대출, 체크카드, 자동납부 연결계좌</li>
    <li style="text-align: left;">대출원리금 출금 계좌</li>
    <li style="text-align: left;">입출금 정지상태의 계좌</li>
    <li style="text-align: left;">모임통장 서비스 이용중인 계좌</li>
    <li style="text-align: left;">증권 계좌 개설 혹은 신분증 확인이 진행중인 계좌</li>
    <li style="text-align: left;">잔액이 남아있는 계좌</li>
  </ul>
  <br>
  <input type="submit" value="확인">
</form>
</div>
<div>
<jsp:include page="include/mainFooter.jsp"></jsp:include>`
</div>
</body>
</html>
