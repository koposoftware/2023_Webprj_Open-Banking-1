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
    <title>Title</title>
</head>
<body>
계좌 이체 하는 페이지~

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


</body>
</html>
