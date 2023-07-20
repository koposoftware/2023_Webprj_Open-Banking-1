<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.Connection,java.sql.ResultSet"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>거래 내역</title>
    <link rel="stylesheet" href="/static/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mr+Dafoe" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
        @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
        body{
            font-family: 'NanumSquareRound', sans-serif;
        }
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
    <jsp:include page="../include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>
<div id="menu_wrap2">
    <%
        String name = (String) session.getAttribute("name");
    %>

    <h1>거래 내역 페이지</h1>
    <%
        out.println(name + " 고객님의 거래 내역 페이지입니다.");
    %>
    <br><br><br>
    <table class="custom-table" style="margin:0 auto; width:70%; ">
        <tr>
            <th>거래내역</th>
            <th>거래일시</th>
            <th>거래금액</th>
            <th>잔액</th>
            <th>입금은행</th>
            <th>입금계좌번호</th>
            <th>출금은행</th>
            <th>출금계좌번호</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Context initContext = new InitialContext();
                DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/Oracle11g");
                conn = ds.getConnection();

                stmt = conn.createStatement();
                String sql = "SELECT * FROM trade ORDER BY tradeDate DESC";
                rs = stmt.executeQuery(sql);

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("tradeId") %></td>
            <td><%= rs.getDate("tradeDate") %></td>
            <td><%= rs.getDouble("tradeAcc") %></td>
            <td><%= rs.getDouble("balance") %></td>
            <td><%= rs.getString("depositCode") %></td>
            <td><%= rs.getString("depositNum") %></td>
            <td><%= rs.getString("withdrawalCode") %></td>
            <td><%= rs.getString("withdrawalNum") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch(Exception e) {}
                if (stmt != null) try { stmt.close(); } catch(Exception e) {}
                if (conn != null) try { conn.close(); } catch(Exception e) {}
            }
        %>
    </table>
</div>

<div>
    <jsp:include page="../include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>