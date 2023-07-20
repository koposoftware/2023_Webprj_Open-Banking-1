//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

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
import dataControl.account.dto.*;

public class AccountDAO {
    private static AccountDAO instance;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public AccountDAO() {
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

    public static AccountDAO getInstance() {
        if (instance == null) {
            instance = new AccountDAO();
        }
        return instance;
    }

    public boolean accountInsert(String custId, String accCode, String accTypeName, String accPw, String accName,
            String accNickName) {
        System.out.println("계좌생성시작");

        AccountDTO dto = new AccountDTO(custId, accCode, accTypeName, accName, accPw, accNickName);

        // db에 디폴트인 sysdate부분만 빼고 다 ? 표시
//        String query = "INSERT INTO account (accNum, bankCode, custId, accPw, accStatus, accCode, accTypeName, accName, accNickName, accBalance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String query = "INSERT INTO account (accNum, custId, accPw, accStatus, accCode, accTypeName, accName, accNickName, accBalance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);

//            pstmt.setString(1, dto.getAccNum());
//            pstmt.setString(2, dto.getBankCode());
//            pstmt.setString(3, dto.getCustId());
//            pstmt.setString(4, dto.getAccPw());
//            pstmt.setString(5, dto.getAccStatus());
//            pstmt.setString(6, dto.getAccCode());
//            pstmt.setString(7, dto.getAccTypeName());
//            pstmt.setString(8, dto.getAccName());
//            pstmt.setString(9, dto.getAccNickName());
//            pstmt.setInt(10, dto.getAccBalance());
            pstmt.setString(1, dto.getAccNum());
            pstmt.setString(2, dto.getCustId());
            pstmt.setString(3, dto.getAccPw());
            pstmt.setString(4, dto.getAccStatus());
            pstmt.setString(5, dto.getAccCode());
            pstmt.setString(6, dto.getAccTypeName());
            pstmt.setString(7, dto.getAccName());
            pstmt.setString(8, dto.getAccNickName());
            pstmt.setInt(9, dto.getAccBalance());

            int iResult = pstmt.executeUpdate();
            if (iResult >= 1) {
                System.out.println("insert success");
                return true;
            } else {
                System.out.println("insert fail");
            }
        } catch (Exception e) {

            e.printStackTrace();

        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public ArrayList<TimeDepositDTO> accountCheck(String custId) {
        ArrayList<TimeDepositDTO> tDtos = new ArrayList();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            String query = "select * from account where custId = ? order by accName";
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            pstmt.setString(1, custId);

            while (rs.next()) {
                String accTypeName = rs.getString("accTypeName"); // 계좌구분명
                String accName = rs.getString("accName"); // 계좌상품명
                String accNum = rs.getString("accNum"); // 계좌번호
                int accBalance = rs.getInt("accBalance");
                String accPw = rs.getString("accPw");// 잔약
                TimeDepositDTO tDto = new TimeDepositDTO(accTypeName, accName, accNum, accBalance, accPw);
                System.out.println("-------------" + accPw);

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

    // 다른 상품 조회
    public ArrayList<AccountDTO> accTransSelect(String accName) {
        ArrayList<AccountDTO> dtos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT DISTINCT accName FROM account WHERE accName != ? AND accCode = '01'";
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, accName);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String accName1 = rs.getString("accName"); // 계좌상품명
                AccountDTO dto = new AccountDTO(accName1); // 수정: accName1로 변경
                dtos.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally { // 데이터베이스 관련 자원인 ResultSet, PreparedStatement, Connection을 해제하는 역할
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dtos;
    }

    
    // 계좌 비밀번호 수정 (update)
    public boolean pwUpdate(String accPw, String accNum) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "update account set accPw = ? where accNum = ?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, accPw);
            pstmt.setString(2, accNum);

            int iResult = pstmt.executeUpdate();

            if (iResult >= 1) {
                System.out.println("update success");
                return true;
            } else {
                System.out.println("update fail");
                return false;
            }
        } catch (Exception e) {
            return false;
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // 상품 변경 (update)
    public void accTransUpdate(String accName, String accNum) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "update account set accName = ? where accNum = ?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, accName);
            pstmt.setString(2, accNum);

            int iResult = pstmt.executeUpdate();

            if (iResult >= 1) {
                System.out.println("update success");
            } else {
                System.out.println("update fail");
            }
        } catch (Exception e) {
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // 계좌 해지 (delete)
    public boolean pwDelete(String accNum) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "delete from account where accNum = ?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, accNum);

            int iResult = pstmt.executeUpdate();

            if (iResult >= 1) {
                System.out.println("delete success");
                return true;
            } else {
                System.out.println("delete fail");
                return false;
            }
        } catch (Exception e) {
            return false;
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
