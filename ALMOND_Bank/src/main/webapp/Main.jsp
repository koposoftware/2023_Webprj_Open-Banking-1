<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>
<!DOCTYPE html>
<html>
<head>
<title>Almond Bank</title>
<link rel="stylesheet" href="static/css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Mr+Dafoe" rel="stylesheet">
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
	  if (mHtml.is(":animated")) return;
	  if (e.originalEvent.deltaY > 0) {
	    if (page == 7) return;
	    page++;
	  } else if (e.originalEvent.deltaY < 0) {
	    if (page == 1) return;
	    page--;
	  }
	  var posTop = (page - 1) * $(window).height();
	  mHtml.animate({ scrollTop: posTop });
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
  <div id="main_content">
  <div id="wrap_textimg">
    <h3>Almond Bank 적금통장 첫 번째 서비스</h3>
	<h1>평생 </h1>
	<h1>당신의 편이</h1>
	<h1>되어줄</h1>
    <h1>단 하나의 은행</h1>
    <p>지금 Almond 은행의 적금통장을 개설하고</p>
    <p>무료 수수료 혜택을 누리세요.</p>

    <div id="button-container">
      <a href="#" class="button">고객센터</a>
      <a href="#" class="button">이벤트</a>
      </div>
  </div>
      <img src="static/img/mainlogojy.gif">
    </div>
</div>
    <div class="section" id="section2">
    <br><br><br><br><br><br><br><br><br>
    <hr>
    <br><br><br><br><br>
    
    
    
    <iframe width="800" height="500" src="https://www.youtube.com/embed/lcmoyD3m89c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    <br><br><br><br><br><br><br><br><br>
    <br><br>
    <h1>놀라운 혜택이 팡팡!</h1><br>
    <h3>하루하루 돈이 들어오는 이벤트</h3>
    <br>
    <img src="static/img/successMassage.gif" >
    <br><br><div id="menu-button2" style="margin: 0 auto; text-align: center;">더보기</div><br><br>
    
    <br><br><br><br><br><br><br><br><br><br><br><br>
    	<h1>Almond PAY</h1><br>
    <h3>수수료 없는 Almond PAY,</h3>
    <h3>소비의 새로운 경험을 시작해보세요</h3>
    
    
    <img src="https://payco-cdn.cdn.toastoven.net/PAYCO_CONTENTS/payco/www/img/main_gif/img_service_01.gif?1689057071830"><br><br>
    <br><br><br><br><br><br><br><br><br>
    	<h1>Almond Card</h1><br>
    <h3>Almond Bank와 함께하는,</h3>
    <h3>소비의 새로운 경험을 시작해보세요</h3>
    
    
    <img src="https://cdn.dribbble.com/users/43762/screenshots/1398115/ccu-superbowl---charge.gif" width="500px" style="margin: 0 auto; text-align: center;">
    <div id="menu-button2" style="margin: 0 auto; text-align: center;">시작하기</div><br><br>
	</div
	><div class="section" id="section3">
	<br><br><br><br><br><br><br><br><br><br>
	<h1>언제 어디서든 여러분과 함께</h1><br>
	<h3>고객과 함께하는 Almond Bank</h3>
	<img src="https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/10/Stop-Animation-Blog-Post-Wave.gif" style="margin: 0 auto; text-align: center;">
	<br><br><br>
	</div
	><div class="section" id="section4">
	<br><br><br><br><br><br>
	</div>
	</div>
	</div>
<div>
<jsp:include page="include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>