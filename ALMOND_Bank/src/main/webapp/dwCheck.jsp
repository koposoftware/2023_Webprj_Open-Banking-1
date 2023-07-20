<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü�� ���������� üũ�ϴ� ������</title>
</head>
<body>
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
	���(withd)�Ǵ� (����) ����� ���� �ڵ� : <%= wBankCode %><br>
	���(withd)�Ǵ� (����) ����� ���¹�ȣ : <%= wAccountNumber %><br>
	<%= wName %>
	<br>
	���(withd)�ϴ� ���¿��� ���� �� (�Ա��� ��): <%= transferAmount %><br>
	<br>
	�Ա�(deposit)�޴� (������) ����� ���� �ڵ� : <%= dBankCode %><br>
	�Ա�(deposit)�޴� (������) ����� ���¹�ȣ : <%= dAccountNumber %><br>
	<%= dName %>
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

</body>
</html>