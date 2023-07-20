<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglibprefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@pagecontentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %> 
<link rel="stylesheet" href="/static/css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<title>Login</title>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
 @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
 
</style>

</head>
<body>
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
<jsp:include page="/include/mainHeader.jsp"></jsp:include>
<br><br><br><br><br><br>
	<form action="login.bank" method="post">
		<h1>로그인</h1>
		<table>
			<tr>
				<td><b>아이디 </b></td><br>
			</tr>
			<tr>
				<td><input type="text" name="id" placeholder="아이디" required></td>
			</tr>
			<tr>
				<td><b>비밀번호 </b></td>
			</tr>
			<tr>
				<td><input type="password" name="password" placeholder="비밀번호" required></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="로그인"> <br><br><hr><br>
		  	<%
    			String clientId = "FbjOQbM89RJgdVK0TC0h";//애플리케이션 클라이언트 아이디값";
    			String redirectURI = URLEncoder.encode("http://144.24.75.25:8082/naverLoginCallback.jsp", "UTF-8");
    			SecureRandom random = new SecureRandom();
    			String state = new BigInteger(130, random).toString();
    			String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    			apiURL += "&client_id=" + clientId;
    			apiURL += "&redirect_uri=" + redirectURI;
    			apiURL += "&state=" + state;
    			session.setAttribute("state", state);
 		  	%>
 		  	<div>
 		  	<a href="<%=apiURL%>"><img height="40px" src="static/img/naver.png" style="border-radius: 50%;"></a>
            <a href="javascript:kakaoLogin()">
            <img src="<c:url value='/static/img/kakao.png'/>" style="width: 40px; border-radius: 50%;"></a>
        	</div>
    </form>
        <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script type="text/javascript">
		    Kakao.init('229db5dc03f8bfd9e48ca85e6ecf82de');
		    function kakaoLogin() {
		        Kakao.Auth.login({
		            success: function (response) {
		                Kakao.API.request({
		                    url: '/v2/user/me',
		                    success: function (response) {
		                        // 서버로 정보를 전송하기 위한 AJAX 요청
		                        var xhr = new XMLHttpRequest();
		                        xhr.open("POST", "kakaoLogin.bank", true);
		                        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		                        xhr.onload = function () {
		                        	if (xhr.status === 200) {
		                        	    var result = JSON.parse(xhr.responseText);
		                        	    if (result.redirect) {
		                        	    	var redirectUrl = result.redirect;
		                        	        redirectUrl += "?refinedEmail=" + encodeURIComponent(result.refinedEmail);
		                        	        console.log(redirectUrl);
		                        	        window.location.href = redirectUrl;
		                        	    }else {
											var email = result.email;
											document.getElementById('emailInput').value = email;
										}
		                        	    console.log(result);
		                        	} else {
		                                alert("요청 실패");
		                                
		                            }
		                        };

		                        // JSON 데이터 생성 및 전송
		                        var jsonData = {
		                            properties: response.properties,
		                            kakao_account: response.kakao_account
		                        };
		                        xhr.send(JSON.stringify(jsonData));
		                    },
		                    fail: function (error) {
		                        alert(JSON.stringify(error));
		                    }
		                })
		            },
		            fail: function (error) {
		                alert(JSON.stringify(error));
		            },
		        })
		    }

		</script>
		
	</form>
	<br><br>
	<jsp:include page="/include/mainFooter.jsp"></jsp:include>
	
</body>
</html>