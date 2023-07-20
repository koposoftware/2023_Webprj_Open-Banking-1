package dataControl.account.dto;

//
// Source code recreated from a .class file by IntelliJ IDEA

import java.sql.Timestamp;
import java.util.Random;



 public class AccountDTO {
     private String accNum;              // 계좌번호
     private String bankCode;            // 은행코드 
     private String custId;              // 고객 아이디
     private String accPw;               // 계좌 비밀번호 - 
     private String accStatus;           // 계좌 상태
     private String accCode;             // 계좌 구분 코드 -
     private String accTypeName;         // 계좌 구분명 -
     private String accName;            // 계좌 상품명 -
     private String accNickName;         // 계좌 별칭
     private int accBalance;          // 계좌 잔액
     private Timestamp accOpening;       // 계좌 개설일 
     private Timestamp accClosure;      // 계좌 폐기일
      

     
      // 계좌 생성 DTO ()
      public AccountDTO(String custId, String accCode, String accTypeName, String accName, String accPw, String accNickName) {
        super();
        this.accNum = "001" + "-" + accCode + "-" + generateAccountNumber();    // 은행코드+계좌번호난수6자리
//        this.bankCode = "001"; // 개별은행 코드 (주연:001, 태현:002, 태환:003, 수영:004, 하영:005)
        this.bankCode = null;
        this.custId = custId;    // 로그인세션
        this.accPw = accPw;      
        this.accStatus = "정상";
        this.accCode = accCode;   
        this.accTypeName = accTypeName;
        this.accName = accName;
        this.accNickName = accNickName;
        this.accBalance = 0;
        this.accOpening = null;
        this.accClosure = null;
     }

     public AccountDTO() {

     }

     // 계좌번호 생성
      private String generateAccountNumber() {
         Random random = new Random();
         int accountNumber = random.nextInt(900000) + 100000;  // 6자리 계좌번호 생성 (100000 ~ 999999)

         return String.valueOf(accountNumber);
      }
      
      
      public AccountDTO(String accNum, String bankCode, String custId, String accPw, String accStatus, String accCode,
           String accTypeName, int accBalance, Timestamp accOpening, Timestamp accClosure, String accName) {
        super();
        this.accNum = accNum;
        this.bankCode = bankCode;
        this.custId = custId;
        this.accPw = accPw;
        this.accStatus = accStatus;
        this.accCode = accCode;
        this.accTypeName = accTypeName;
        this.accBalance = accBalance;
        this.accOpening = accOpening;
        this.accClosure = accClosure;
        this.accName = accName;
     }

     public AccountDTO(String accName) {
    	 this.accName = accName;
	}

	public String getAccNum() {
        return accNum;
     }

     public void setAccNum(String accNum) {
        this.accNum = accNum;
     }

     public String getBankCode() {
        return bankCode;
     }

     public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
     }

     public String getCustId() {
        return custId;
     }

     public void setCustId(String custId) {
        this.custId = custId;
     }

     public String getAccPw() {
        return accPw;
     }

     public void setAccPw(String accPw) {
        this.accPw = accPw;
     }

     public String getAccStatus() {
        return accStatus;
     }

     public void setAccStatus(String accStatus) {
        this.accStatus = accStatus;
     }

     public String getAccCode() {
        return accCode;
     }

     public void setAccCode(String accCode) {
        this.accCode = accCode;
     }

     public String getAccTypeName() {
        return accTypeName;
     }

     public void setAccTypeName(String accTypeName) {
        this.accTypeName = accTypeName;
     }

     public String getAccName() {
        return accName;
     }

     public void setAccName(String accName) {
        this.accName = accName;
     }

     public String getAccNickName() {
        return accNickName;
     }

     public void setAccNickName(String accNickName) {
        this.accNickName = accNickName;
     }

     public int getAccBalance() {
        return accBalance;
     }

     public void setAccBalance(int accBalance) {
        this.accBalance = accBalance;
     }

     public Timestamp getAccOpening() {
        return accOpening;
     }

     public void setAccOpening(Timestamp accOpening) {
        this.accOpening = accOpening;
     }

     public Timestamp getAccClosure() {
        return accClosure;
     }

     public void setAccClosure(Timestamp accClosure) {
        this.accClosure = accClosure;
     }
      
      
      
     
     
 }
 