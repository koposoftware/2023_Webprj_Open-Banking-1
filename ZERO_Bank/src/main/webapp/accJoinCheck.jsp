<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/css/styles.css?a">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">

<style>
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
 @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');  

.scrollable {
	max-height: 200px;
	overflow-y: scroll;
	border: 1px solid #ccc;
	padding: 10px;
}

.radio-label {
	display: inline-block;
	margin-right: 10px;
}

.radio-label input[type="checkbox"] {
	vertical-align: middle;
	margin-right: 5px;
}
</style>
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
<script>
function toggleCheckbox(checkbox) {
  var checkbox1 = document.getElementById("checkbox1");
  var checkbox2 = document.getElementById("checkbox2");
  var submitButton = document.querySelector('input[type="submit"]');

  if (checkbox1.checked && checkbox2.checked) {
    submitButton.disabled = false; // submit 버튼 활성화
  } else {
    submitButton.disabled = true; // submit 버튼 비활성화
  }
}

function validateForm() {
  var checkbox1 = document.getElementById("checkbox1");
  var checkbox2 = document.getElementById("checkbox2");

  if (!checkbox1.checked || !checkbox2.checked) {
    alert("모두 체크해 주세요");
    return false; // 양식 제출 방지
  }

  return true; // 양식 제출 허용
}
</script>
</head>
<body>
<header class="header-fixed">
	<jsp:include page="include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br><br>
	<form action="accountInput.bank" method="post" onsubmit="return validateForm();">
		<h1>비대면 계좌개설 약관 동의</h1>
		<h2>약관 동의</h2>
		원활한 비대면 계좌 개설을 위해 약관을 확인해 주세요.

		<h3>개인정보 동의 확인</h3>
		<div class="scrollable">
			<p>
				귀 행이 상품서비스 안내 등을 위하여 본인의 개인(신용)정보를 수집·이용하는 경우에는 「신용정보의 이용 및 보호에 관한
				법률」 제15조 제2항, 제32조 제1항, 제33조 및 제34조, 「개인정보 보호법」 제15조 제1항 제1호, 제22조
				제3항에 따라 본인의 동의가 필요합니다. <br> 아래에서 (금융)거래라 함은 은행업무(여신, 수신, 외국환),
				겸영업무(신탁, 펀드, 방카슈랑스, 신용카드 등), 부수업무(보증, 팩토링, 대여금고, 보호예수 등)와 관련된 거래를
				의미합니다. <br> 1. 수집 이용 목적 <br> 타행 (금융)거래정보를 활용한 상품, 서비스 홍보 및
				판매 권유<br> 2. 수집‧이용할 항목<br> ￭ 개인정보<br> ‣ 성명, 생년월일, 주소,
				연락처(전자우편주소, 집/직장/휴대폰 전화번호 등), 국적, 연소독, 직업, 직장정보, 결혼여부, 주거 및 가족사항,
				거주기간, 관심 금융/서비 스 정보, 금융/비금융 자산현황<br> ￭ 오픈뱅킹 및 통합조회 서비스 이용을 위하여
				등록한 타행 (금융)거래정보<br> ‣ 상품종류, 거래조건(이자율, 만기 등), 거래일시, 금액 등 거래
				설정·내역정보 및 오픈 뱅킹 서비스의 설정·유지·이행·관리를 위한 상담 등을 통해 생성되는 정보 ※ 본 동의 이전에 발생한
				개인(신용)정보도 포함됩니다.<br> 3. 보유 이용 기간<br> 위 개인(신용)정보는
				(금융)거래종료일* 또는 동의 철회 시까지 보유· 이용할 수 있습니다. 이후에는 관련된 사고조사, 분쟁해결, 민원처리,
				법령상 의 무이행을 위하여 필요한 범위 내에서만 보유․이용됩니다. * (금융)거래 종료일이란 당행과 거래중인 모든
				계약(여·수신, 내·외국환, 카드 및 제3자 담보 제공 등)해지 및 서비스(대여금고, 보호예수, 외국환거래지정, 인터넷뱅킹
				포함 전자금융 거래 등)가 종료된 날을 의미합니다.
			</p>
		</div>
		<div>
			<span class="radio-label"><input type="checkbox" name="autoTransferAgreement1" id="checkbox1" onclick="toggleCheckbox(this);" value="Agree">동의</span>
		</div>

		<br />
		<br />

		<h3>계좌 간 자동이체 약관</h3>
		<div class="scrollable">
			<p>
				귀 행은 계좌 간 자동이체 서비스 제공을 위하여 본인의 동의를 필요로 합니다. 아래의 내용을 확인하고 동의해 주세요.

				1. 서비스 내용<br> 
				계좌 간 자동이체 서비스는 본인이 지정한 계좌 간에 자동으로 이체되는 서비스입니다.<br>
				￭ 이체는 본인이 설정한 이체일에 자동으로 처리됩니다. <br>
				
				2. 수집‧이용할 항목<br> 이체에 필요한 계좌 정보 (이체출금계좌 및 입금계좌 등)<br> 
				￭ 이체 금액 및 이체 주기 등 이체설정 정보 이용 목적<br> 
본 서비스는 편의성과 효율성을 제공하기 위해 개발되었습니다.<br> 
이체 서비스를 통해 자동으로 금액을 이체함으로써 시간과 노력을 절약할 수 있습니다. <br> 
3. 보유 이용 기간<br> 수집된 정보는 서비스 이용 동안에 한하여 보유 및
이용됩니다.<br> 서비스 종료 시에는 관련 법령에 따라 즉시 파기됩니다. 
4. 동의 철회<br> 
동의한 내용에 대해 언제든지 동의를 철회할 수 있습니다.<br> 
￭ 동의 철회 시, 서비스 이용이 제한될 수 있습니다. 위
내용을 확인하였으며, 계좌 간 자동이체 서비스에 동의합니다.
			</p>
			
		</div>
		<div>
			<span class="radio-label"><input type="checkbox" name="autoTransferAgreement2" id="checkbox2" onclick="toggleCheckbox(this);" value="Agree">동의</span>
		</div>
		<br/><br/>
		
		<%
            String timeDepositCode = request.getParameter("timeDepositCode");
            String timeDepositType = request.getParameter("timeDepositType");
            String timeDepositName = request.getParameter("timeDepositName");
        %>
		
		<input type="hidden" name="timeDepositCode" value="<%=timeDepositCode%>"> 
		<input type="hidden" name="timeDepositType" value="<%=timeDepositType%>"> 
		<input type="hidden" name="timeDepositName" value="<%=timeDepositName%>"> 
		<input type="submit" value="확인">
	</form>
	<br><br><br><br>

<footer>
<div>
<jsp:include page="include/mainFooter.jsp"></jsp:include>`
</div>
</footer>
</body>
</html>
