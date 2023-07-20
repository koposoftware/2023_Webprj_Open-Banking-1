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
    // ��ȭ��ȣ �Է� �ʵ忡�� �Է� ������ ����� ������ �ڵ����� �������� �߰��ϴ� �Լ�
    function formatPhoneNumber() {
        var phoneNumberInput = document.querySelector('input[name="phone_number"]');
        var phoneNumber = phoneNumberInput.value.replace(/[^0-9]/g, ''); // ���� �̿��� ���ڴ� ����
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

    // ��ȭ��ȣ �Է� �ʵ忡�� Ű �Է� �̺�Ʈ�� �����Ͽ� �ڵ����� �������� �߰�
    var phoneNumberInput = document.querySelector('input[name="phone_number"]');
    phoneNumberInput.addEventListener('keyup', formatPhoneNumber);

    document.querySelector('form').addEventListener('submit', function(event) {
        var passwordInput = document.querySelector('input[name="password"]');
        var password = passwordInput.value;

        if (!isPasswordValid(password)) {
            event.preventDefault(); // �� ���� ����
            document.getElementById('passwordError').style.display = 'block';
            passwordInput.focus();
        }
    });

    function isPasswordValid(password) {
        // ������ ������ �������� 4�ڸ� �̻����� �˻�
        var pattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
        return pattern.test(password);
    }

    function isEmailValid(email) {
        // �̸��� �������� �˻�
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
<h1>�� ���� ���� - <%=memberId%></h1>
<form action="manageMember.bank" method="post">
    <table>
        <tr>
            <td><b>��й�ȣ:</b></td>
            <td>
                <input type="password" name="password" placeholder="����+���� 4�ڸ� �̻�" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$" required>
                <div id="passwordError" class="error-message">��й�ȣ�� ������ ������ �������� 4�ڸ� �̻��̾�� �մϴ�.</div>
            </td>
        </tr>
        <tr>
            <td><b>�̸�:</b></td>
            <td><input type="text" name="name" placeholder="�̸�" required></td>
        </tr>
        <tr>
            <td><b>��ȭ��ȣ:</b></td>
            <td>
                <input type="text" name="phone_number" pattern="\d{3}-\d{4}-\d{4}" placeholder="��ȭ��ȣ (��: 010-1234-5678)" required>
                <div class="error-message">��ȭ��ȣ�� �������� �����Ͽ� �Է����ּ���.</div>
            </td>
        </tr>
        <tr>
            <td><b>�̸���:</b></td>
            <td><input type="email" name="email" placeholder="�̸��� (��: example@example.com)" required></td>
        </tr>
    </table>
    <input type="hidden" name="id" id="id" value="<%= request.getParameter("id") %>">
    <input type="submit" value="����">
</form>
</div>
	<div>
	<jsp:include page="/include/mainFooter.jsp"></jsp:include>`
    </div>
</body>
</html>
