<%@page import="dataControl.account.dao.*"%>
<%@page import="dataControl.account.dto.*"%>
<%@ page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
<jsp:include page="/include/mainHeader.jsp"></jsp:include>
<br><br><br><br>
	
	<div class ="container">
	<h1>상품 내역 확인</h1>
	<table class="custom-table">
		<tr>
			<th>상품코드</th>
			<th>상품분류</th>
			<th>상품이름</th>
			<th>가입</th>
		</tr>
		<%
		TimeDepositDAO dao = TimeDepositDAO.getInstance();
		ArrayList<TimeDepositDTO> dtoList = dao.timeDepositSelect();
/* 		String custId = (String) session.getAttribute("loggedInId"); */

		for (TimeDepositDTO dto : dtoList) {
			String timeDepositCode = dto.getAccCode();
			String timeDepositType = dto.getAccTypeName();
			String timeDepositName = dto.getAccName();
		%>
		<tr>
			<td><%=timeDepositCode%></td>
			<td><p style="border:1px solid #3F2305;  text-align:center; border-radius:10px; width:30%; padding: 3px;"><%=timeDepositType%></p></td>
			<td><%=timeDepositName%></td>
			<td>
				<form id="joinForm" action="accJoinCheck.jsp" method="post" style="border: none;">
				  <!-- 폼 내용 -->
				  <input type="hidden" name="timeDepositCode" value="<%=timeDepositCode%>">
				  <input type="hidden" name="timeDepositType" value="<%=timeDepositType%>">
				  <input type="hidden" name="timeDepositName" value="<%=timeDepositName%>">
				  <input type="submit" value="가입하기">
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<br />
	<br />
	<button onclick="window.location.href='./Main.jsp'" class="custom-button">메인으로</button>
</div>
<div>
<jsp:include page="/include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>
