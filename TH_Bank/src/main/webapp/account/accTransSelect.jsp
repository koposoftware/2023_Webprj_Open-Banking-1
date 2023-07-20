<%@page import="dataControl.account.dao.*"%>
<%@page import="dataControl.account.dto.*"%>
<%@ page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
<header class="header-fixed">
	<jsp:include page="/include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br><br><br>
<div id="menu_wrap">
    <h1>상품 선택</h1>
    <h2>변경하실 예금 상품을 선택해주세요.</h2>
    <br />
    <br />

    <form action="accTransOk.bank" method="post">
        <table >
            <thead>
                <tr>
                    <th class="name-cell" style="text-align: center; font-size:20px;">계좌 상품명</th>
                    <th class="checkbox-cell" style="text-align: center; font-size:20px;">선택</th>
                </tr>
            </thead>
            <tbody>
                <%
                String accName = (String) session.getAttribute("accName"); 
                AccountDAO dao = new AccountDAO(); 
                ArrayList<AccountDTO> dtoList = dao.accTransSelect(accName);

                for (AccountDTO dto : dtoList) {
                    String accName1 = dto.getAccName(); 
                %>
                
                <tr>
                
                    <td class="name-cell" style="text-align: center; font-size:20px;"><%=accName1%></td>
                    <td class="checkbox-cell">
                        <input type="radio" name="selectedAccName" value="<%=accName1%>"> 
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <br>
        <input type="submit" value="변경">
    </form>
    </div>
    <div>
	<jsp:include page="/include/mainFooter.jsp"></jsp:include>`
    </div>
</body>
</html>
