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
<jsp:include page="include/mainHeader.jsp"></jsp:include>
	<div class="container">
		<% session.invalidate(); %>
		<br><br><br><br>
		<h1>로그아웃되었습니다.</h1>

		<br><br><br>



		<iframe width="800" height="500" src="https://www.youtube.com/embed/o0FMA4xR9dg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		<br><br><br>

		<div style="width:100%;">
			<button onclick="location.href='Main.bank'" class="button1" style="text-align: center; margin: 0 auto;">메인 페이지</button></ul>
		</div>
		<br><br><br>
	</div>
	<div>
	<jsp:include page="include/mainFooter.jsp"></jsp:include>`
    </div>
</body>
</html>
