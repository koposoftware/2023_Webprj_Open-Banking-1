<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/static/css/styles.css?a">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function checkDuplicateId() {
    var id = document.getElementById("id").value; // 입력된 아이디 가져오기

    // AJAX 요청 수행
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "./checkDuplicateId.bank", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    console.log("readyState:", xhr.readyState, "status:", xhr.status);
    xhr.onreadystatechange = function() {
      console.log("readyState:", xhr.readyState, "status:", xhr.status);
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          var response = xhr.responseText; // AJAX 응답 받기

          var ckResult = response === "true"; // 중복 결과에 따라 ckResult 설정

          // ckResult 값에 따른 로직 처리
          if (!ckResult) {
            idCk = true;
            alert("아이디 사용이 가능합니다.");
          } else {
            alert("중복된 아이디입니다. 다른 아이디를 입력해주세요.");
          }
        } else {
          console.log("Error:", xhr.status, xhr.statusText); // 추가된 에러 메시지
        }
      }
    }
    xhr.send("id=" + encodeURIComponent(id)); // 요청 전달 데이터 설정
    return false; // submit 이벤트를 방지하기 위해 false를 반환
}
;

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

							// 주소 필드를 채운 후 loginResult 페이지로 값을 넘기는

						}
					}).open();
		}
		function validateResidentNumber(input) {
			  var residentNumber = input.value;

			  // "-" 제거
			  residentNumber = residentNumber.replace(/-/g, "");

			  // 주민등록번호 유효성 검사 함수
			  function checkResidentNumberValidity(residentNumber) {
			    // 주민등록번호는 13자리여야 함
			    if (residentNumber.length !== 13) {
			      return false;
			    }

			    // 생년월일 체크 (YYMMDD)
			    var year = parseInt(residentNumber.substr(0, 2), 10);
			    var month = parseInt(residentNumber.substr(2, 2), 10);
			    var day = parseInt(residentNumber.substr(4, 2), 10);

			    // 생년월일 유효성 검사
			    if (month < 1 || month > 12 || day < 1 || day > 31) {
			      return false;
			    }

			    // 성별 체크 (7번째 숫자)
			    var gender = parseInt(residentNumber.charAt(6), 10);
			    if (gender !== 1 && gender !== 2 && gender !== 3 && gender !== 4) {
			      return false;
			    }

			    // Checksum 검사
			    var checkSum = parseInt(residentNumber.charAt(12), 10);
			    var weight = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
			    var sum = 0;

			    for (var i = 0; i < 12; i++) {
			      sum += parseInt(residentNumber.charAt(i), 10) * weight[i];
			    }

			    var result = (11 - (sum % 11)) % 10;
			    if (result !== checkSum) {
			      return false;
			    }

			    // 모든 유효성 검사 통과
			    return true;
			  }

			  // 유효성 검사 수행
			  var isValid = checkResidentNumberValidity(residentNumber);
			  
			  // 오류 메시지 표시 여부 설정
			  var errorElement = document.getElementById('residentNumberError');
			  if (isValid) {
			    errorElement.style.display = 'none';
			  } else {
			    errorElement.style.display = 'block';
			  }
			  var validationResult = document.getElementById('validationResult');
			  if (isValid) {
			    validationResult.style.display = 'block';
			    validationResult.style.color = 'green';
			  } else {
			    validationResult.style.display = 'none';
			  }
			}
			

	</script>
<script>
var verifyCode = "";

function sendMail() {
	var email = document.querySelector("input[name='email']").value;
	if (email === "") {
		alert("이메일을 입력해주세요.");
		return;
	}
	alert("인증번호가 발송되었습니다.");
	console.log(email);
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "mail.bank", true);
	xhr.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			verifyCode = xhr.responseText;
			console.log(xhr.responseText);
		}
	};
	xhr.send("email=" + encodeURIComponent(email));
}

var codeCk = false;

function checkCode() {
	var inputCode = document.querySelector('input[name="verifyCode"]').value;
	if (verifyCode === inputCode && !(inputCode === "")) {
		alert("인증 성공");
		codeCk = true;
	} else {
		alert("인증번호가 일치하지 않습니다.");
		codeCk = false;
	}
	return codeCk;
}

function validateEmail() {
	if (codeCk) {
		return true;
	} else {
		alert("메일 인증이 필요합니다.");
		return false;
	}
}
</script>
<script>
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

		function limitPhoneNumber() {
			var phoneNumberInput = document.getElementById('phone');
			var phoneNumber = phoneNumberInput.value;
			if (!phoneNumber.startsWith('010')) {
				phoneNumberInput.value = '010-' + phoneNumber;
			}

			if (phoneNumber.length === 8) {
				phoneNumberInput.value = phoneNumber + '-';
			}

			if (phoneNumber.length === 9 && phoneNumber.endsWith('-')) {
				phoneNumberInput.value = phoneNumber.slice(0, 8);
			}

			if (phoneNumber.length > 13) {
				phoneNumberInput.value = phoneNumber.slice(0, 13);
			}
		}

		function limitSimplePw(input) {
			var digits = input.value.replace(/\D/g, '');
			digits = digits.substr(0, 6);
			input.value = digits;
			
		}
		function performRealNameVerification() {
		      var residentNumberInput = document.querySelector('input[name="resident_number"]');
		      var residentNumber = residentNumberInput.value;

		      // 주민등록번호 유효성 검사 수행
		      var isValid = validateResidentNumber(residentNumber);

		      // 실명인증 검사 결과 처리
		      if (isValid) {
		        alert("실명인증 검사가 완료되었습니다. 유효한 주민등록번호입니다.");
		      } else {
		        alert("주민등록번호가 유효하지 않습니다. 다시 확인해주세요.");
		      }
		    }

		function validatePasswordMatch() {
			  var password = document.getElementById('password').value;
			  var confirmPassword = document.getElementById('confirmPassword').value;
			  var errorElement = document.getElementById('passwordError');
			  var matchMessageElement = document.getElementById('passwordMatchMessage');

			  if (password !== confirmPassword) {
			    errorElement.style.display = 'block';
			  } else {
				    errorElement.style.display = 'none';
				    matchMessageElement.style.display = 'block';
				  }
				}
</script>

</head>
<body>
	<header class="header-fixed">
		<jsp:include page="/include/mainHeader.jsp"></jsp:include>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id=menu_wrap>
		<form id="joinForm" action="join.bank" method="post"
			onsubmit="return validateEmail()">
			<h1>회원가입</h1>
			<hr>
			<table>
				<tr>
					<td><b>아이디:</b></td>
					<td><input type="text" name="id" id="id" required></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><button class="valiButton" type="button"
							onclick="checkDuplicateId()">중복 확인</button></td>
				</tr>
				<tr>
					<td><b>비밀번호:</b>
					<td><input type="password" name="password" id="password"
						placeholder="영문+숫자 4자리 이상"
						pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$" required></td>
					<br>
				</tr>
				<tr>
					<td>비밀번호 확인:</td>

					<td><input type="password" name="confirmPassword"
						id="confirmPassword" placeholder="비밀번호 확인" required
						oninput="validatePasswordMatch()"> <span colspan="2"
						id="passwordError" class="error-message"
						style="display: none; color: red;">비밀번호가 일치하지 않습니다.</span> <span
						colspan="2" id="passwordMatchMessage" class="match-message"
						style="display: none; color: green;">비밀번호가 일치합니다.</span>
				</tr>
				</tr>


				<tr>
					<td><b>이름:</b></td>
					<td><input type="text" name="name" placeholder="이름" required></td>
				</tr>
				<tr>
					<td><b>주민등록번호:</b></td>
					<td><input type="text" name="resident_number"
						pattern="\d{6}-\d{7}" placeholder="주민등록번호 (예: 123456-1234567)"
						required onfocusout="validateResidentNumber(this)"> <span
						id="residentNumberError" class="error-message"
						style="display: none;">유효하지 않은 주민등록번호입니다.</span> <span
						id="validationResult" style="display: none; color: green;">
							실명인증이 완료되었습니다. </span>
						<button class="valiButton" type="button"
							onclick="validateResidentNumber()">실명인증</button></td>




					<!-- <tr>
			<td><b>주민등록번호:</b></td>
			<td><input type="text" name="resident_number" pattern="\d{6}-\d{7}" placeholder="주민등록번호 (예: 123456-1234567)" required></td>
		</tr> -->
				<tr>
					<td><b>전화번호:</b></td>
					<td><input type="text" id="phone" name="phone"
						pattern="\d{3}-\d{4}-\d{4}" oninput="limitPhoneNumber()"
						placeholder="전화번호 (예: 010-1234-5678)" required
						value="${param.phone}"></td>
				</tr>
				<tr>
					<td><b>이메일:</b></td>
					<td><input type="email" name="email"
						placeholder="이메일을 입력해주세요." required value="${param.email}">
						<br>
						<button style="text-align: center;" class="valiButton"
							type="button" onclick="sendMail()">인증 메일 발송</button></td>
				</tr>
				<tr>
					<td>인증번호:</td>
					<td><input type="text" name="verifyCode">
						<button class="valiButton" type="button" onclick="checkCode()">코드
							확인</button></td>
				</tr>
				<tr>
					<td><b>주소:</b></td>
					<td><input type="text" id="sample4_postcode"
						name="sample4_postcode" placeholder="우편번호"><br> <input
						type="button" class="valiButton" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
						class="findPostal"> <br> <br> <input type="text"
						id="sample4_roadAddress" name="sample4_roadAddress"
						placeholder="도로명주소"> <input type="text"
						id="sample4_jibunAddress" name="sample4_jibunAddress"
						placeholder="지번주소"><br> <input type="text"
						id="sample4_detailAddress" name="sample4_detailAddress"
						placeholder="상세주소"><br> <input type="text"
						id="sample4_extraAddress" name="sample4_extraAddress"
						placeholder="참고항목"></td>

				</tr>
				<tr>
					<td></td>
					<td><input id="joinButton" type="submit" value="회원가입"
						style="font-family: 'Tenada', Arial, sans-serif;">
						<button id="loginButton"
							onclick="location.href='./loginInput.bank'">로그인 페이지로 이동</button></td>
				</tr>
			</table>
		</form>

		<br> <br> <br> <br>

		<jsp:include page="/include/mainFooter.jsp"></jsp:include>
	</div>
</body>
</html>
