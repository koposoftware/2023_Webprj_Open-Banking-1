package dataControl.account.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dataControl.about.member.DAO;
import dataControl.account.dto.TradeDTO;

public class TradeDAO {
    private static TradeDAO instance;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    public TradeDAO() {
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
    
    public static TradeDAO getInstance() {
        if (instance == null) {
            instance = new TradeDAO();
        }
        return instance;
    }
    
    public ArrayList<TradeDTO> selectAllTrade() {
        ArrayList<TradeDTO> tdtos = new ArrayList();
        
        String query = "SELECT * FROM trade WHERE tradeDate = ? AND tradeType = ? AND withdrawalNum = ? AND depositCode = ? AND tradeAcc = ? AND balance = ? AND tradeMemo = ?";
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                Timestamp tradeDate = rs.getTimestamp("tradeDate");
                String tradeType = rs.getString("tradeType");
                String withdrawalNum = rs.getString("withdrawalNum");
                String depositNum = rs.getString("depositNum");
                int tradeAcc = rs.getInt("tradeAcc");
                int balance = rs.getInt("balance");
                String tradeMemo = rs.getString("tradeMemo");
                TradeDTO tDto = new TradeDTO(tradeDate, tradeType, withdrawalNum, depositNum, tradeAcc, balance, tradeMemo);
                tdtos.add(tDto);
            }
        } catch (Exception var22) {
            var22.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }

                if (pstmt != null) {
                    pstmt.close();
                }

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception var21) {
                var21.printStackTrace();
            }

        }

        return tdtos;
    }
}
