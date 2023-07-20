package dataControl.account.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oracle.wls.shaded.org.apache.regexp.recompile;

import dataControl.account.dto.*;

public class TimeDepositDAO {
    private static TimeDepositDAO instance;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public TimeDepositDAO() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception var2) {
            var2.printStackTrace();
        }

    }


    private Connection getConnection() throws Exception {
        Context context = new InitialContext();
        DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
        return dataSource.getConnection();

    }

    private void closeResources(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static TimeDepositDAO getInstance() {
        if (instance == null) {
            instance = new TimeDepositDAO();
        }
        return instance;
    }

    public ArrayList<TimeDepositDTO> timeDepositSelect() {
        ArrayList<TimeDepositDTO> tDtos = new ArrayList();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from timedeposit order by timedepositcode");
//                    + "distinct accCode, accTypeName, accName from account order by accCode");

            while (rs.next()) {
                String accCode = rs.getString("TimeDepositcode"); // 계좌구분코드
                String accTypeName = rs.getString("TimeDeposittype"); // 계좌상품명
                String accName = rs.getString("TimeDepositname"); // 계좌상품명

                TimeDepositDTO tDto = new TimeDepositDTO(accCode, accTypeName, accName);
                tDtos.add(tDto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally { // 데이터베이스 관련 자원인 ResultSet, Statement, Connection을 해제하는 역할
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return tDtos;
    }
    
    
    public ArrayList<TimeDepositDTO> accountCheck(String custId) {
        ArrayList<TimeDepositDTO> tDtos = new ArrayList();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        System.out.println();
        
        try {
        	String query = "select * from account where custId = ? order by accTypeName, accName, accBalance";
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, custId);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                String accTypeName = rs.getString("accTypeName"); 	// 	계좌구분명
                String accName = rs.getString("accName"); 			// 	계좌상품명
                String accNum = rs.getString("accNum");				//	계좌번호
                int accBalance=  rs.getInt("accBalance"); 
                String accPw =  rs.getString("accPw");// 	잔약
                TimeDepositDTO tDto = new TimeDepositDTO(accTypeName, accName, accNum, accBalance, accPw);
                tDtos.add(tDto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally { // 데이터베이스 관련 자원인 ResultSet, Statement, Connection을 해제하는 역할
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return tDtos;
    }
}

