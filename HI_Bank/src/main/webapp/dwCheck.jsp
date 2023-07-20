<%@ page language="java" contentType="text/html; charset=EUC-KR"
		 pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>��ü�� ���������� üũ�ϴ� ������</title>
	<link rel="stylesheet" href="static/css/main.css">
	<link rel="stylesheet" href="static/css/styles.css?2">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Mr+Dafoe" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&family=Vollkorn&display=swap" rel="stylesheet">
	<style>
		@import 'https://fonts.googleapis.com/css?family=Baloo+Paaji';
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
<header class="header-fixed">
	<jsp:include page="include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>
<div id="menu_wrap">
	<h1>��üȮ�� ������ dwCheck.jsp</h1>
	<h2>�׽�Ʈ ������</h2>
	<h2>dw.jps���� ��� ��ȸ ������ ���ļ�, �Ķ���ͷ� �޾ƿԴٰ� �����ϰ� ����</h2>

	<%
		String wBankCode = request.getParameter("wBankCode");
		//���(withd)�Ǵ� (����) ����� ���� �ڵ�
		String wAccountNumber = request.getParameter("wAccountNumber");
		//���(withd)�Ǵ� (����) ����� ���¹�ȣ
		String wName = "������"; //request.getParameter("wName"); ���߿� �Ķ���ͷ� �޾ƿð�� �ּ� ����
		//���(withd)�Ǵ� (����) ����� �̸�
		String transferAmount = request.getParameter("transferAmount");
		//���(withd)�Ǵ� ���¿��� ���� �� (�Ա��� ��)

		String dBankCode = request.getParameter("dBankCode");
		//�Ա�(deposit)�޴� (������) ����� ���� �ڵ�
		String dAccountNumber = request.getParameter("dAccountNumber");
		//�Ա�(deposit)�޴� (������) ����� ���¹�ȣ
		String dName = "���±�"; //request.getParameter("dName"); ���߿� �Ķ���ͷ� �޾ƿð�� �ּ� ����
		//�Ա�(deposit)�޴� (������) ����� �̸�
	%>
	<h1><%= wName %>���� ��� Ȯ�� ������</h1>
	���(withd)�Ǵ� (����) ����� ���� �ڵ� : <%= wBankCode %><br>
	���(withd)�Ǵ� (����) ����� ���¹�ȣ : <%= wAccountNumber %><br>
	����� ��: <%= wName %>
	<br>
	���(withd)�ϴ� ���¿��� ���� �� (�Ա��� ��): <%= transferAmount %><br>
	<h1>�޴� ��</h1>
	<br>
	�Ա�(deposit)�޴� (������) ����� ���� �ڵ� : <%= dBankCode %><br>
	�Ա�(deposit)�޴� (������) ����� ���¹�ȣ : <%= dAccountNumber %><br>
	�Ա��� ��: <%= dName %>
	<br>
	<button id="transferBtn">��ü�ϱ�</button>

	<script>
		document.getElementById("transferBtn").addEventListener("click", function() {
			console.log("��û�մϴ�") //��ûȮ�ο� �ڵ�

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
							console.log("�������02") //���� Ȯ�ο� �ڵ�
							alert('��ü�� ���������� �̷�������ϴ�.');
						} else {
							console.log("�������03") //���� Ȯ�ο� �ڵ�
							alert('��ü�� �����Ͽ����ϴ�.');
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