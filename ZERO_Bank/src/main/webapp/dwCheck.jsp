<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>��ü Ȯ�� ������</title>
	<style>
		/* Your existing styles... */
		#transferBtn{
			padding: 10px 20px;
			background-color: #666;
			color: #fff;
			border: none;
			border-radius: 20px;
			cursor: pointer;
			font-size: large;
			font-family: 'NanumSquareRound', sans-serif;
			text-align: center;
		}
		#transferBtn:active{
			transform: scale(0.95);
		}
		form input[type="text"],
		form input[type="password"],
		form input[type="email"],
		form input[type="tel"] {
			padding: 10px;
			border: 1px solid #ccc;
			height: 20px;
			width: 100%;
			border-radius: 20px;
			font-family: 'Nanum Gothic', sans-serif;
		}
	</style>
	<!-- Rest of your head content -->
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
	<div style="border-radius:30px; border:1px solid #666; margin:0 auto; width:60%; padding:30px; color:#333; ">
		<p>���� �ڵ� : <%= wBankCode %></p><br>
		<p>���¹�ȣ : <%= wAccountNumber %></p><br>
		<hr style="width: 50%; color:white">
		<p>�Աݾ�: <%= transferAmount %></p>
	</div>
	<br><br><br>
	<h2>�Ա��� ����</h2>
	<div style="border-radius:30px; border:1px solid #666; margin:0 auto; width:60%; padding:30px; color:#333;">
		<p>���� �ڵ� : <%= dBankCode %></p><br>
		<p>���¹�ȣ : <%= dAccountNumber %></p><br>
	</div>
	<br><br><br>
	<div style="width:100%; text-align: center; margin:0 auto;">
			<button id="transferBtn" type="submit">��ü�ϱ�</button>
	</div>
</div>
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
