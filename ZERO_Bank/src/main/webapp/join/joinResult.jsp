<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 결과</title>
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
	
    <div id ="main_wrap">
    <h1>회원가입 결과</h1>
    
    <%
        // Retrieve the form values
        String id = request.getParameter("id");
    	String bankCode = request.getParameter("bankCode");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String identityNum = request.getParameter("resident_number");
        String phoneNum = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String postalCode = request.getParameter("sample4_postcode");
        String address = request.getParameter("sample4_roadAddress");
        String jibunAddress = request.getParameter("sample4_jibunAddress");
        String detailAddress = request.getParameter("sample4_detailAddress");
        String extraAddress = request.getParameter("sample4_extraAddress");
    
        // Display the form values
        out.println("<p>아이디: " + id + "</p>");
        out.println("<p>비밀번호: " + password + "</p>");
        out.println("<p>이름: " + name + "</p>");
        out.println("<p>주민등록번호: " + identityNum + "</p>");
        out.println("<p>전화번호: " + phoneNum + "</p>");
        out.println("<p>이메일: " + email + "</p>");
        out.println("<p>우편번호: " + postalCode + "</p>");
        out.println("<p>도로명주소: " + address + "</p>");
        out.println("<p>지번주소: " + jibunAddress + "</p>");
        out.println("<p>상세주소: " + detailAddress + "</p>");
        out.println("<p>참고항목: " + extraAddress + "</p>");
    %>
    	<div>
	<jsp:include page="/include/mainFooter.jsp"></jsp:include>`
    </div>
</body>
</html>
