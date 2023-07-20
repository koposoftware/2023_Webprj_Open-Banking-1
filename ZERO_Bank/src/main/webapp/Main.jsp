<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>
<!DOCTYPE html>
<html>
<head>
<title>제로뱅크</title>
    <link rel="stylesheet" href="static/css/main.css">
<link rel="stylesheet" href="static/css/styles.css?a">
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

html, body {
    display: block;
    width: 100%;
    height: 100%;
    margin: 0;
    
}
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
	
    <div id ="main_wrap">
        <div class ="section" id="section1">
            <div id="main_color">
                <div id="main_body2">
                    <div id=hi-container>
                        ZERO BANK
                        <div id=flip>
                            <div><div>ZERO INTEREST</div></div>
                            <div><div>ZERO CHARGE</div></div>
                            <div><div>ZERO ATM</div></div>
                        </div>
                        ZERO BANK
                    </div>

                </div>
            </div>
        </div>
    <div class="section" id="section2">
    <br><br><br><br><br><br><br><br><br>
    <h1>놀라운 혜택이 팡팡!</h1>
    <h3>하루하루 돈이 들어오는 이벤트</h3>
    <br>
    <img src="https://cdn.dribbble.com/users/2287419/screenshots/15663694/media/74936224354b5bace24995f237dd5d06.gif" width="500px" style="margin: 0 auto; text-align: center;">
    <br><br><br><br><br><br><br><br><br>
    	<h1>제로결제</h1>
    <h3>수수료 없는 제로 결제,</h3>
    <h3>소비의 새로운 경험을 시작해보세요</h3>
    
    
    <img src="https://payco-cdn.cdn.toastoven.net/PAYCO_CONTENTS/payco/www/img/main_gif/img_service_01.gif?1689057071830"><br><br>
    <div id="menu-button2" style="margin: 0 auto; text-align: center;">시작하기</div><br><br>
	</div
	><div class="section" id="section3">
	<br><br><br><br><br><br><br><br><br><br>
	<h1>지갑은 가볍게 ! 즐거움은 더 많게!</h1>
	<h3>여러분들을 위해 준비된 ZERO 수수료</h3>
	<img src="static/img/section3.jpg" width="500px">
	<br><br><br>
	</div
	><div class="section" id="section4">
	<br><br><br><br><br><br><br><br><br><br>
	<h1>날마다 터지는 제로데이!</h1>
	<h3>마음껏 행복한 나날을 보내세요</h3>
	<img src="static/img/gift.jpg" width="400px">
	<br><br><br><br><br><br>
	</div>
	</div>
	</div>
	<div>
	<jsp:include page="include/mainFooter.jsp"></jsp:include>`
    </div>
</body>
</html>