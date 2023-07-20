<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	
<div id ="menu_wrap">
<h2>���� ����</h2>
���� Ȯ���� ���� ���� ��й�ȣ�� �Է����ּ���. <br/><br/>

<form action="pwCheckOk.bank" method="post">
<%
    String accPw = (String) session.getAttribute("accPw");
%>

��й�ȣ: <input type="password" id="accPw" name="enteredPassword" required maxlength="4" pattern="[0-9]{4}"> 
<input type="hidden" name="password" value="<%= accPw %>">
<input type="submit" value="����" onclick="return checkPassword();">
</form>

<script>
    function checkPassword() {
        var enteredPassword = document.getElementById("accPw").value;
        var password = "<%= accPw %>";
        
        if (!/^[0-9]{4}$/.test(enteredPassword)) {
            alert("���� ��й�ȣ�� 4�ڸ� �����Դϴ�.");
            return false;
        }
        
        if (enteredPassword === password) {
            return true;
        } else {
            alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է����ּ���.");
            return false;
        }
    }
</script>
</div>
	<div>
	<jsp:include page="/include/mainFooter.jsp"></jsp:include>`
    </div>
</body>
</html>
