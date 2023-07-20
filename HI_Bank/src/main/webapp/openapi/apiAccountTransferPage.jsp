<%--
  Created by IntelliJ IDEA.
  User: kantae
  Date: 2023/07/13
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>계좌이체 페이지</title>
    <link rel="stylesheet" href="/static/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mr+Dafoe" rel="stylesheet">
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
<div id="menu_wrap">
<h1>계좌 이체 페이지</h1>
<header class="header-fixed">
    <jsp:include page="../include/mainHeader.jsp"></jsp:include>
</header>
    <%
        String bankCode, accTypeName, accName, accNum, accPw;
        int accBalance = 0;

        bankCode = request.getParameter("bankCode");
        accTypeName = request.getParameter("accTypeName");
        accName = request.getParameter("accName");
        accNum = request.getParameter("accNum");
        accPw = request.getParameter("accPw");
        accBalance = Integer.parseInt(request.getParameter("accBalance"));
    %>

    <%=bankCode%>
    <%=accTypeName%>
    <%=accName%>
    <%=accNum%>
    <%=accPw%>
    <%=accBalance%>

</div>
<div>
    <jsp:include page="../include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>
