<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Manage My Info</title>
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
<script>
    // 전화번호 입력 필드에서 입력 내용이 변경될 때마다 자동으로 하이픈을 추가하는 함수
    function formatPhoneNumber() {
        var phoneNumberInput = document.querySelector('input[name="phone_number"]');
        var phoneNumber = phoneNumberInput.value.replace(/[^0-9]/g, ''); // 숫자 이외의 문자는 제거
        var formattedPhoneNumber = '';

        if (phoneNumber.length > 3) {
            formattedPhoneNumber += phoneNumber.substr(0, 3) + '-';
            if (phoneNumber.length > 7) {
                formattedPhoneNumber += phoneNumber.substr(3, 4) + '-' + phoneNumber.substr(7);
            } else {
                formattedPhoneNumber += phoneNumber.substr(3);
            }
        } else {
            formattedPhoneNumber = phoneNumber;
        }

        phoneNumberInput.value = formattedPhoneNumber;
    }

    // 전화번호 입력 필드에서 키 입력 이벤트를 감지하여 자동으로 하이픈을 추가
    var phoneNumberInput = document.querySelector('input[name="phone_number"]');
    phoneNumberInput.addEventListener('keyup', formatPhoneNumber);

    document.querySelector('form').addEventListener('submit', function(event) {
        var passwordInput = document.querySelector('input[name="password"]');
        var password = passwordInput.value;

        if (!isPasswordValid(password)) {
            event.preventDefault(); // 폼 제출 방지
            document.getElementById('passwordError').style.display = 'block';
            passwordInput.focus();
        }
    });

    function isPasswordValid(password) {
        // 영문과 숫자의 조합으로 4자리 이상인지 검사
        var pattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
        return pattern.test(password);
    }

    function isEmailValid(email) {
        // 이메일 형식인지 검사
        var pattern = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
        return pattern.test(email);
    }
</script>

<% String memberId = (String) session.getAttribute("loggedInId"); %>
<header class="header-fixed">
	<jsp:include page="/include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>
<div id="menu_wrap">
<h1>내 정보 수정 - <%=memberId%></h1>
<form action="manageMember.bank" method="post">
    <table>
        <tr>
            <td><b>비밀번호:</b></td>
            <td>
                <input type="password" name="password" placeholder="영문+숫자 4자리 이상" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$" required>
                <div id="passwordError" class="error-message">비밀번호는 영문과 숫자의 조합으로 4자리 이상이어야 합니다.</div>
            </td>
        </tr>
        <tr>
            <td><b>이름:</b></td>
            <td><input type="text" name="name" placeholder="이름" required></td>
        </tr>
        <tr>
            <td><b>전화번호:</b></td>
            <td>
                <input type="text" name="phone_number" pattern="\d{3}-\d{4}-\d{4}" placeholder="전화번호 (예: 010-1234-5678)" required>
                <div class="error-message">전화번호는 하이픈을 포함하여 입력해주세요.</div>
            </td>
        </tr>
        <tr>
            <td><b>이메일:</b></td>
            <td><input type="email" name="email" placeholder="이메일 (예: example@example.com)" required></td>
        </tr>
    </table>
    <input type="hidden" name="id" id="id" value="<%= request.getParameter("id") %>">
    <input type="submit" value="수정">
</form>
</div>
	<div>
	<jsp:include page="/include/mainFooter.jsp"></jsp:include>`
    </div>
</body>
</html>
