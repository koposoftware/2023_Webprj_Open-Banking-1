<%@ page language="java" contentType="text/html; charset=EUC-KR"
		 pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>이체 확인 페이지</title>
	<link rel="stylesheet" href="static/css/styles.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Mr+Dafoe" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
<%
	String name = (String) session.getAttribute("name");
%>
<header class="header-fixed">
	<jsp:include page="include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>
<div id="menu_wrap2">
<h1>이체확인 페이지 </h1>
		<%
    out.println(name + " 고객님의 이체 확인 페이지입니다");
%>
	<br><br>
<%
	String wBankCode = request.getParameter("wBankCode");
	//출금(withd)되는 (돈뺄) 사람의 은행 코드
	String wAccountNumber = request.getParameter("wAccountNumber");
	//출금(withd)되는 (돈뺄) 사람의 계좌번호
	String wName = "정수영"; //request.getParameter("wName"); 나중에 파라미터로 받아올경우 주석 해제
	//출금(withd)되는 (돈뺄) 사람의 이름
	String transferAmount = request.getParameter("transferAmount");
	//출금(withd)되는 계좌에서 빼낼 돈 (입금할 돈)

	String dBankCode = request.getParameter("dBankCode");
	//입금(deposit)받는 (돈받을) 사람의 은행 코드
	String dAccountNumber = request.getParameter("dAccountNumber");
	//입금(deposit)받는 (돈받을) 사람의 계좌번호
	String dName = "정수영"; //request.getParameter("dName"); 나중에 파라미터로 받아올경우 주석 해제
	//입금(deposit)받는 (돈받을) 사람의 이름
%>
	<hr style="width:70%; margin:0 auto; text-align: center;">
	<br>
	<h2>출금자 정보</h2>
	<div style="border:1px solid #666; margin:0 auto; width:60%; padding:30px; background-color:#1e3c72; color:white; ">
	은행 코드 : <%= wBankCode %><br>
	계좌번호 : <%= wAccountNumber %><br>
		<hr style="width: 50%; color:white">
	입금액: <%= transferAmount %></p>
	</div>
<br><br><br>
	<h2>입금자 정보</h2>
	<div style="border:1px solid #666; margin:0 auto; width:60%; padding:30px; background-color:#1e3c72; color:white;">
	은행 코드 : <%= dBankCode %><br>
	계좌번호 : <%= dAccountNumber %><br>
	</div>
<br><br><br>
<button id="transferBtn">이체하기</button>

<script>
	document.getElementById("transferBtn").addEventListener("click", function() {
		console.log("요청합니다") //요청확인용 코드

		const params = new URLSearchParams();
		params.append('wBankCode', "<%= wBankCode %>");
		params.append('wAccountNumber', "<%= wAccountNumber %>");
		params.append('wName', "<%= wName %>");
		params.append('transferAmount', "<%= transferAmount %>");
		params.append('dBankCode', "<%= dBankCode %>");
		params.append('dName', "<%= dName %>");


		fetch('http://144.24.91.101:8080/OpenBankingAPI', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				'wBankCode': "<%= wBankCode %>",
				'wAccountNumber': "<%= wAccountNumber %>",
				'wName': "<%= wName %>",
				'transferAmount': "<%= transferAmount %>",
				'dBankCode': "<%= dBankCode %>",
				'dAccountNumber': "<%= dAccountNumber %>",
				'dName': "<%= dName %>"

			})
		})
				.then(response => response.json())
				.then(data => {
					if (data.result === "success") {
						console.log("응답받음02") //응답 확인용 코드
						alert('이체가 성공적으로 이루어졌습니다.');
						// 이체가 성공적으로 이루어졌다면 다음 페이지로 이동합니다.
						window.location.href = "apiAccountListPage.bank";
					} else {
						console.log("응답받음03") //응답 확인용 코드
						alert('이체에 실패하였습니다.');
					}
				})
				.catch(error => console.error('Error:', error));
	});
</script>
</div>
<div>
	<jsp:include page="include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>