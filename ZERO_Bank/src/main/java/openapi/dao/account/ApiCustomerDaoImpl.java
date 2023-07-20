package openapi.dao.account;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ApiCustomerDaoImpl implements ApiCustomerDao {

    private DataSource dataSource;


    public ApiCustomerDaoImpl() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    public String selectCustIdByIdentityNum(String identityNum) {
        String custId = "";
        String query = "SELECT ID FROM CUSTOMERR WHERE IDENTITYNUM = ?";

        try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query);) {

            pstmt.setString(1, identityNum);
            System.out.println(identityNum);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    custId = rs.getString("id");
                    System.out.println("custId 조회 완료");
                }
            }

        } catch (Exception e) {
            System.out.println("SQL Statement or DB Connection Error Occur");
            e.printStackTrace();
        }

        return custId;
    }
}
