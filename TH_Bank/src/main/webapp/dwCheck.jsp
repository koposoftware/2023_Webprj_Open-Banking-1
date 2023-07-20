<%@ page language="java" contentType="text/html; charset=EUC-KR"
		 pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>��ü Ȯ�� ������</title>
	<link rel="stylesheet" href="static/css/styles.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Mr+Dafoe" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
<%
	String name = (String) session.getAttribute("name");
%>
<header class="header-fixed">
	<jsp:include page="include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>
<div id="menu_wrap2">
<h1>��üȮ�� ������ </h1>
		<%
    out.println(name + " ������ ��ü Ȯ�� �������Դϴ�");
%>
	<br><br>
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
	String dName = "������"; //request.getParameter("dName"); ���߿� �Ķ���ͷ� �޾ƿð�� �ּ� ����
	//�Ա�(deposit)�޴� (������) ����� �̸�
%>
	<hr style="width:70%; margin:0 auto; text-align: center;">
	<br>
	<h2>����� ����</h2>
	<div style="border:1px solid #666; margin:0 auto; width:60%; padding:30px; background-color:#1e3c72; color:white; ">
	���� �ڵ� : <%= wBankCode %><br>
	���¹�ȣ : <%= wAccountNumber %><br>
		<hr style="width: 50%; color:white">
	�Աݾ�: <%= transferAmount %></p>
	</div>
<br><br><br>
	<h2>�Ա��� ����</h2>
	<div style="border:1px solid #666; margin:0 auto; width:60%; padding:30px; background-color:#1e3c72; color:white;">
	���� �ڵ� : <%= dBankCode %><br>
	���¹�ȣ : <%= dAccountNumber %><br>
	</div>
<br><br><br>
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
						// ��ü�� ���������� �̷�����ٸ� ���� �������� �̵��մϴ�.
						window.location.href = "apiAccountListPage.bank";
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