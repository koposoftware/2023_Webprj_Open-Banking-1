package suyoung.dwDAODTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dwDAO {

	DataSource dataSource;

	public dwDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//입금처리를 하는 메소드
	//입금처리를 하는 메소드
	public boolean updateDepositBalance(String dAccountNumber, String transferAmount, String wBankCode, String wAccountNumber) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		ResultSet resultSet = null;

		try {
			connection = dataSource.getConnection();

			// account02 테이블 업데이트 쿼리
			String query1 = "UPDATE account SET accBalance = accBalance + ? WHERE accNum = ?";
			preparedStatement = connection.prepareStatement(query1);
			preparedStatement.setInt(1, Integer.parseInt(transferAmount)); // String을 int로 변환
			preparedStatement.setString(2, dAccountNumber);
			int affectedRows1 = preparedStatement.executeUpdate();

			// trade 테이블에 행 추가하는 쿼리
			String query2 = "INSERT INTO trade (tradeId, tradeDate, tradeAcc, balance, depositCode, depositNum, withdrawalCode, withdrawalNum) " +
					"VALUES (trade_seq.NEXTVAL, CURRENT_TIMESTAMP, ?, (SELECT accBalance FROM account WHERE accNum = ?), 'TH', ?, ?, ?)";
			preparedStatement2 = connection.prepareStatement(query2);
			preparedStatement2.setInt(1, Integer.parseInt(transferAmount));
			preparedStatement2.setString(2, dAccountNumber);
			preparedStatement2.setString(3, dAccountNumber);
			preparedStatement2.setString(4, wBankCode);
			preparedStatement2.setString(5, wAccountNumber);
			int affectedRows2 = preparedStatement2.executeUpdate();

			// 두 쿼리 모두 성공했는지 확인
			return affectedRows1 > 0 && affectedRows2 > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(preparedStatement2 != null) preparedStatement2.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}


	//출금 처리를 하는 메소드
	public boolean updateWithdrawBalance(String wAccountNumber, String transferAmount, String dBankCode, String dAccountNumber) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		ResultSet resultSet = null;

		try {
			connection = dataSource.getConnection();
			String query1 = "UPDATE account SET accBalance = accBalance - ? WHERE accNum = ?";
			preparedStatement = connection.prepareStatement(query1);
			preparedStatement.setInt(1, Integer.parseInt(transferAmount)); // String을 int로 변환
			preparedStatement.setString(2, wAccountNumber);
			int affectedRows1 = preparedStatement.executeUpdate();

			// trade 테이블에 행 추가하는 쿼리
			String query2 = "INSERT INTO trade (tradeId, tradeDate, tradeAcc, balance, depositCode, depositNum, withdrawalCode, withdrawalNum) " +
					"VALUES (trade_seq.NEXTVAL, CURRENT_TIMESTAMP, ?, (SELECT accBalance FROM account WHERE accNum = ?), ?, ?, 'TH', ?)";
			preparedStatement2 = connection.prepareStatement(query2);
			preparedStatement2.setInt(1, Integer.parseInt(transferAmount));
			preparedStatement2.setString(2, wAccountNumber);
			preparedStatement2.setString(3, dAccountNumber);
			preparedStatement2.setString(4, dAccountNumber);
			preparedStatement2.setString(5, wAccountNumber);
			int affectedRows2 = preparedStatement2.executeUpdate();

			// 두 쿼리 모두 성공했는지 확인
			return affectedRows1 > 0 && affectedRows2 > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(preparedStatement2 != null) preparedStatement2.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}

