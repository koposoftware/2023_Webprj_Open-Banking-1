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
</head>
<body>
<table border="1">
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
</body>
</html>