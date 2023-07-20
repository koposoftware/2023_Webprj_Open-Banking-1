<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>이체전 마지막으로 체크하는 페이지</title>
</head>
<body>
	<h1>이체확인 페이지 dwCheck.jsp</h1>
	<h2>테스트 페이지</h2>
	<h2>dw.jps에서 모든 조회 과정을 거쳐서, 파라미터로 받아왔다고 가정하고 시작</h2>
<% 
	String wBankCode = request.getParameter("wBankCode"); 
	//출금(withd)되는 (돈뺄) 사람의 은행 코드
    String wAccountNumber = request.getParameter("wAccountNumber");  
  	//출금(withd)되는 (돈뺄) 사람의 계좌번호
    String wName = "정수영"; //request.getParameter("wName"); 나중에 파라미터로 받아올경우 주석 해제
  	//출금(withd)되는 (돈뺄) 사람의 이름
    String transferAmount = request.getParameter("transferAmount");
  	//출금(withd)되는 계좌에서 빼낼 돈 (입금할 돈)
  
  	String dBankCode = request.getParameter("dBankCode");
	//입금(deposit)받는 (돈받을) 사람의 은행 코드
    String dAccountNumber = request.getParameter("dAccountNumber");
  	//입금(deposit)받는 (돈받을) 사람의 계좌번호
    String dName = "강태근"; //request.getParameter("dName"); 나중에 파라미터로 받아올경우 주석 해제
  	//입금(deposit)받는 (돈받을) 사람의 이름
%>
	출금(withd)되는 (돈뺄) 사람의 은행 코드 : <%= wBankCode %><br>
	출금(withd)되는 (돈뺄) 사람의 계좌번호 : <%= wAccountNumber %><br>
	<%= wName %>
	<br>
	출금(withd)하는 계좌에서 빼낼 돈 (입금할 돈): <%= transferAmount %><br>
	<br>
	입금(deposit)받는 (돈받을) 사람의 은행 코드 : <%= dBankCode %><br>
	입금(deposit)받는 (돈받을) 사람의 계좌번호 : <%= dAccountNumber %><br>
	<%= dName %>
	<br>
	<button id="transferBtn">이체하기</button>
	
<script>
document.getElementById("transferBtn").addEventListener("click", function() {
    console.log("요청합니다") //요청확인용 코드
     
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
            console.log("응답받음02") //응답 확인용 코드
            alert('이체가 성공적으로 이루어졌습니다.');
        } else {
            console.log("응답받음03") //응답 확인용 코드
            alert('이체에 실패하였습니다.');
        }
    })
    .catch(error => console.error('Error:', error));
});
</script>

</body>
</html>