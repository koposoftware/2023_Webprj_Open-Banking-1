<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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

.error-message {
	color: red;
	display: none;
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
	<jsp:include page="/include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br><br><br><br>
<div id="menu_wrap>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var roadAddr = data.roadAddress;
							var extraRoadAddr = '';

							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}

							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById('sample4_roadAddress').value = roadAddr;
							document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

							if (roadAddr !== '') {
								document.getElementById('sample4_extraAddress').value = extraRoadAddr;
							} else {
								document.getElementById('sample4_extraAddress').value = '';
							}

							var guideTextBox = document.getElementById('guide');
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소: '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소: '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}

							// 주소 필드를 채운 후 loginResult 페이지로 값을 넘기는 부분

						}
					}).open();
		}
		
	</script>
	<!-- <script>
		function formatPhoneNumber() {
			var phoneNumberInput = document
					.querySelector('input[name="phone_number"]');
			var phoneNumber = phoneNumberInput.value.replace(/[^0-9]/g, '');
			var formattedPhoneNumber = '';

			if (phoneNumber.length > 3) {
				formattedPhoneNumber += phoneNumber.substr(0, 3) + '-';
				if (phoneNumber.length > 7) {
					formattedPhoneNumber += phoneNumber.substr(3, 4) + '-'
							+ phoneNumber.substr(7);
				} else {
					formattedPhoneNumber += phoneNumber.substr(3);
				}
			} else {
				formattedPhoneNumber = phoneNumber;
			}

			phoneNumberInput.value = formattedPhoneNumber;
		}

		var phoneNumberInput = document
				.querySelector('input[name="phone_number"]');
		phoneNumberInput.addEventListener('keyup', formatPhoneNumber);

		document
				.querySelector('form')
				.addEventListener(
						'submit',
						function(event) {
							var passwordInput = document
									.querySelector('input[name="password"]');
							var password = passwordInput.value;

							if (!isPasswordValid(password)) {
								event.preventDefault();
								document.getElementById('passwordError').style.display = 'block';
								passwordInput.focus();
							}
						});

		function isPasswordValid(password) {
			var pattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
			return pattern.test(password);
		}

		function isEmailValid(email) {
			var pattern = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
			return pattern.test(email);
		}
	</script> -->
	<%
	boolean isAdmin = (boolean) session.getAttribute("isAdmin");
		String id = (String) session.getAttribute("loggedInId"); 
		String userId = (String) session.getAttribute("userId");
		String name = (String) session.getAttribute("name");
	String phoneNum = (String) session.getAttribute("phoneNum");
	String email = (String) session.getAttribute("email");
	String postalCode = (String) session.getAttribute("postalCode");
	String address = (String) session.getAttribute("address");
	String jibunAddress = (String) session.getAttribute("jibunAddress");
	String detailAddress = (String) session.getAttribute("detailAddress");
	String grade = (String) session.getAttribute("grade");
	String identityNum = (String) session.getAttribute("identityNum");
	String extraAddress = (String) session.getAttribute("extraAddress");
	String password = (String) session.getAttribute("password");
	String status = (String) session.getAttribute("status");
  	%>
	<% 
	if (!isAdmin) { %>
<form action="manageMember.bank" method="post">
	<h1>회원 정보 수정 <%=id %></h1>
	<hr>
	<table>
		<tr>
			<td><b>아이디:</b></td>

			<td><input type="text" name="id" placeholder="<%=id %>" required disabled></td>
		</tr>
		<tr>
			<td><b>비밀번호:</b></td>
			<td><input type="password" name="password"
				placeholder="*************"
				pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$" required disabled></td>
		</tr>
		<tr>
		  <td><b>현재 비밀번호:</b></td>
		  <td><input type="password" name="current_password" required></td>
		</tr>
		<tr>
		  <td><b>새로운 비밀번호:</b></td>
		  <td><input type="password" name="new_password" required></td>
		</tr>
		<tr>
		  <td><b>비밀번호 확인:</b></td>
		  <td><input type="password" name="confirm_password" required></td>
		</tr>
		<tr>
			<td colspan="2" id="passwordError" class="error-message">영문과
				숫자의 조합으로 4자리 이상 입력해주세요.</td>
		</tr>
		<tr>
			<td><b>이름:</b></td>
			<td><input type="text" name="name" placeholder="<%=name %>"></td>
		</tr>
		<tr>
			<td><b>주민등록번호:</b></td>
			<td><input type="text" name="resident_number"
				pattern="\d{6}-\d{7}" placeholder="<%=identityNum %>"
				required disabled></td>
		</tr>
		<tr>
			<td><b>전화번호:</b></td>
			<td><input type="tel" name="phone_number"
				pattern="\d{3}-\d{4}-\d{4}" placeholder="<%=phoneNum %>"></td>
		</tr>
		<tr>
			<td><b>이메일:</b></td>
			<td><input type="email" name="email"
				placeholder="<%=email %>"></td>
		</tr>
		<tr>
			<td><b>주소:</b></td>
			
			<td><input type="text" id="sample4_postcode"
				name="sample4_postcode" placeholder="<%=postalCode %>"> <input
				type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				<br> <input type="text" id="sample4_roadAddress"
				name="sample4_roadAddress" placeholder="<%=address %>"> <input
				type="text" id="sample4_jibunAddress" name="sample4_jibunAddress"
				placeholder="<%=jibunAddress %>"> <span id="guide"
				style="color: #999; display: none"></span> <br> <input
				type="text" id="sample4_detailAddress" name="sample4_detailAddress"
				placeholder="<%=detailAddress %>"> <br> <input type="text"
				id="sample4_extraAddress" name="sample4_extraAddress"
				placeholder="<%=extraAddress %>"></td>
		</tr>	
		<br>
		<tr>
			<td></td>
			<td style="text-align:center;">
				<input id="joinButton" type="submit" value="회원 정보 수정">
				<button id="loginButton" onclick="location.href='./Main.bank'">메인페이지로 이동</button>
		
			</td>
	</table>
			</form>
		<tr>

		</tr>
		<% } else { %>
<!-- 			String password = (String) session.getAttribute("password"); -->
		    <form action="manageMember.bank" method="post">
			<h1>회원 정보 수정 - 관리자모드</h1>
			<hr>
			<table>
				<tr>
					<td><b>아이디:</b></td>
					<td><input type="text" name="id" placeholder="<%=userId %>" required disabled></td>
				</tr>
				<tr>
					<td><b>비밀번호:</b></td>
					<td><input type="password" name="password"
						placeholder="*************"
						pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$" required disabled></td>
				</tr>
				<tr>
					<td colspan="2" id="passwordError" class="error-message">영문과
						숫자의 조합으로 4자리 이상 입력해주세요.</td>
				</tr>
				<tr>
					<td><b>이름:</b></td>
					<td><input type="text" name="name" placeholder="<%=name %>"></td>
				</tr>
				<tr>
					<td><b>주민등록번호:</b></td>
					<td><input type="text" name="resident_number"
						pattern="\d{6}-\d{7}" placeholder="<%=identityNum %>"
						required disabled></td>
				</tr>
				<tr>
					<td><b>전화번호:</b></td>
					<td><input type="tel" name="phone_number"
						pattern="\d{3}-\d{4}-\d{4}" placeholder="<%=phoneNum %>"></td>
				</tr>
				<tr>
					<td><b>이메일:</b></td>
					<td><input type="email" name="email"
						placeholder="<%=email %>"></td>
				</tr>
				<tr>
					<td><b>주소:</b></td>
					
					<td><input type="text" id="sample4_postcode"
						name="sample4_postcode" placeholder="<%=postalCode %>"> <input
						type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						<br> <input type="text" id="sample4_roadAddress"
						name="sample4_roadAddress" placeholder="<%=address %>"> <input
						type="text" id="sample4_jibunAddress" name="sample4_jibunAddress"
						placeholder="<%=jibunAddress %>"> <span id="guide"
						style="color: #999; display: none"></span> <br> <input
						type="text" id="sample4_detailAddress" name="sample4_detailAddress"
						placeholder="<%=detailAddress %>"> <br> <input type="text"
						id="sample4_extraAddress" name="sample4_extraAddress"
						placeholder="<%=extraAddress %>"></td>
				</tr>	
				<br>
				<tr>
				<tr>
                <td><b>등급:</b></td>
                <td>
                    <select name="grade">
                        <option value="일반회원">BASIC</option>
                        <option value="우수회원">MIDDLE </option>
                        <option value="VIP회원">VIP</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><b>상태:</b></td>
                <td>
                    <select name="status">
                        <option value="활성">활성</option>
                        <option value="비활성">비활성</option>
                    </select>
                </td>
            </tr>
            <tr>
					<td></td>
					</tr>

			
					
				<tr>
				
					<td>
						<input id="joinButton" type="submit" value="회원 정보 수정">
					</td>
					<td>	
						<button id="loginButton" onclick="location.href='./Main.bank'">메인</button>
					</td>
					<td>
						<button id="loginButton" onclick="location.href='./deleteMember.bank'">회원 삭제</button>
					</td>				
				
					
				</tr>
		

<%} %>
<br></table></form>
	</div>
	<div>
	<jsp:include page="/include/mainFooter.jsp"></jsp:include>`
    </div>

</body>
</html>
