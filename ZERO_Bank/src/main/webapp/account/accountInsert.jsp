<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/css/styles.css?a">
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
<header class="header-fixed">
	<jsp:include page="/include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>
	
<div id="menu_wrap">
<%
	String timeDepositCode = request.getParameter("timeDepositCode");
	String timeDepositType = request.getParameter("timeDepositType");
	String timeDepositName = request.getParameter("timeDepositName");
%>

<h1>상품 가입</h1>
아래 항목을 기입해주세요 <br/><br/>
<form action="insertAccount.bank" method="post">

	상품코드: <input type="text" name="accCode" id="accCode" value="<%= timeDepositCode %>"> <br/>
	상품분류: <input type="text" name="accTypeName" id="accTypeName" value="<%= timeDepositType %>"><br/>
	상품이름: <input type="text" name="accName" id="accName" value="<%= timeDepositName %>"><br/>
	계좌비밀번호: <input type="password" name="password" id="password" maxlength="4" required>
	<span id="passwordError" style="color: red;"></span>
	<br/>
	계좌별칭: <input type="text" name="accNickName" id="accNickName"> <br/><br/>
	<input type="submit" value="계좌생성">
</form>

<script>
document.getElementById("password").addEventListener("input", validatePassword);

function validatePassword() {
  var passwordInput = document.getElementById("password");
  var passwordError = document.getElementById("passwordError");
  var password = passwordInput.value;

  if (!/^\d{4}$/.test(password)) {
    passwordError.textContent = "4자리 숫자를 입력하세요.";
    passwordInput.setCustomValidity("4자리 숫자를 입력하세요.");
    document.getElementById("accNickName").setAttribute("disabled", true);
    document.querySelector('input[type="submit"]').setAttribute("disabled", true);
  } else {
    passwordError.textContent = "";
    passwordInput.setCustomValidity("");
    document.getElementById("accNickName").removeAttribute("disabled");
    document.querySelector('input[type="submit"]').removeAttribute("disabled");
  }
}
</script>
</div>
<div>
<jsp:include page="/include/mainFooter.jsp"></jsp:include>`
   </div>
</body>
</html>
