<%@page import="dataControl.account.dao.*"%>
<%@page import="dataControl.account.dto.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="static/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
        @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
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

</head>
<body>
<header class="header-fixed">
    <jsp:include page="/include/mainHeader.jsp"></jsp:include>
</header>

<div class ="container">
    <br><br><br><br><br><br>
    <a href="./accountSelect.bank">
        <button class="menu-custom-button-1">HI BANK</button>
    </a>
    <a href="./checkMemberById.bank">
        <button class="menu-custom-button-2">내 정보</button>
    </a>
    <%
        String name = (String) session.getAttribute("name");
    %>

    <h1 class=search>조회</h1>
    <%
        //out.println(name + " 고객님");
    %>
    <br/>
    <%
        double totalBalance = 0.0;
        String custId = (String) session.getAttribute("loggedInId");
        TimeDepositDAO dao = TimeDepositDAO.getInstance();
        ArrayList<TimeDepositDTO> dtoList = dao.accountCheck(custId);
        int dtoListSize = dtoList.size(); // dtoList의 개수 저장

         // 총 잔액을 저장할 변수를 초기화합니다.
        for (TimeDepositDTO dto : dtoList) {
            totalBalance += dto.getAccBalance(); // 각 계좌의 잔액을 더하여 총 잔액을 계산합니다.
        }
        NumberFormat numberFormat = NumberFormat.getInstance();
        String formattedBalance = numberFormat.format(totalBalance);

    %>
    <div id ="search-container">
        <span id="customer-name"><%= name %> 고객님</span>
        <br/>
        <span id="account-info">총 1개 금융기관에 <%= dtoListSize %>개의 계좌가 등록되어 있습니다.</span>
        <p style="text-align: right; font-family: 'NanumSquareRound', sans-serif">총 잔액 <h2 style="text-align: right; font-size:35px; font-family: 'NanumSquareRound', sans-serif "><%= formattedBalance %>원</h2></p>

    </div>
    <br/><br/>

    <h3 style="text-align: left;">보유계좌목록</h3>
    <table class = "custom-table">
        <tr>
            <th>상품분류</th>
            <th>계좌명</th>
            <th>계좌번호</th>
            <th>잔액</th>
            <th>관리</th>
        </tr>

        <%
            for (TimeDepositDTO dto : dtoList) {
                String accTypeName = dto.getAccTypeName();
                String accName = dto.getAccName();
                String accNum = dto.getAccNum();
                String accBalance = String.valueOf(dto.getAccBalance());
                String accPw = dto.getAccPw();
        %>

        <tr>
            <td><p style="border:1px solid #3F2305;  text-align:center; border-radius:10px; width:30%; padding: 3px;"><%= accTypeName %></p></td>
            <td><%= accName %></td>
            <td><%= accNum %></td>
            <td><%= accBalance %></td>

            <td>
                <form action="accountManage.bank" method="post" style="border: none;">
                    <input type="hidden" name="accTypeName" value="<%= accTypeName %>">
                    <input type="hidden" name="accName" value="<%= accName %>">
                    <input type="hidden" name="accNum" value="<%= accNum %>">
                    <input type="hidden" name="accBalance" value="<%= accBalance %>">
                    <input type="hidden" name="accPw" id="accPw" value="<%= accPw %>">

                    <input type="submit" value="계좌관리" >
                </form>
            </td>
        </tr>

        <%
            }
        %>

    </table>
    <br/><br/>
    <button onclick="window.location.href='./Main.jsp'" class="custom-button">메인으로</button>
</div>
<div>
    <jsp:include page="/include/mainFooter.jsp"></jsp:include>
</div>

</body>
</html>
