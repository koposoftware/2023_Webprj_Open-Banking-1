package openapi.dao.account;

import dataControl.account.dto.AccountDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ApiAccountDaoImpl implements ApiAccountDao {

    private DataSource dataSource;

    public ApiAccountDaoImpl() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<AccountDTO> selectAllByCustId(String custId) {
        ArrayList<AccountDTO> accountDtos = new ArrayList<>();
        String query = "select * from account where custId = ? order by accName";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, custId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String bankCode = rs.getString("bankCode"); // 계좌구분명
                    String accTypeName = rs.getString("accTypeName"); // 계좌구분명
                    String accName = rs.getString("accName"); // 계좌상품명
                    String accNum = rs.getString("accNum"); // 계좌번호
                    int accBalance = rs.getInt("accBalance");
                    String accPw = rs.getString("accPw"); // 잔약

                    AccountDTO tDto = new AccountDTO();
                    tDto.setBankCode(bankCode);
                    tDto.setAccTypeName(accTypeName);
                    tDto.setAccName(accName);
                    tDto.setAccNum(accNum);
                    tDto.setAccBalance(accBalance);
                    tDto.setAccPw(accPw);

                    accountDtos.add(tDto);

                    System.out.println("타 은행 내 계좌 정보 조회");
                }
            }
        } catch (Exception e) {
            System.out.println("SQL Statement or DB Connection Error Occurred");
            e.printStackTrace();
        }

        return accountDtos;
    }


//    @Override
//    public List<AccountDTO> selectAllByCustId2(String originCustId) {
//        List<AccountDTO> accountDtos = new ArrayList();
//        String query = "select * from account where custId = ? order by accName";
//
//        try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query); ) {
//            pstmt.setString(1, originCustId);
//            ResultSet rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                String accNum = rs.getString("accNum");
//                String bankCode = rs.getString("bankCode");
//                String custId = rs.getString("custId");
//                String accPw = rs.getString("accPw");
//                String accStatus = rs.getString("accStatus");
//                String accCode = rs.getString("accCode");
//                String accTypeName = rs.getString("accTypeName");
//                String accName = rs.getString("accName");
//                String accNickName = rs.getString("accNickName");
//                int accBalance = rs.getInt("accBalance");
//                Timestamp accOpening = rs.getTimestamp("accOpening");
//                Timestamp accClosure = rs.getTimestamp("accClosure");
//
//
//                AccountDTO tDto = new AccountDTO();
//                tDto.setAccTypeName(accTypeName);
//                tDto.setAccName(accName);
//                tDto.setAccNum(accNum);
//                tDto.setAccBalance(accBalance);
//                tDto.setAccPw(accPw);
//
//                System.out.println("-------------" + accPw);
//
//                accountDtos.add(tDto);
//            }
//
//        } catch (Exception e) {
//            System.out.println("SQL Statement or DB Connection Error Occur");
//            e.printStackTrace();
//        }
//
//        return accountDtos;
//    }
}
