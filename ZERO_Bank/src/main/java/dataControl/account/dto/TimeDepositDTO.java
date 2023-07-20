package dataControl.account.dto;

import java.sql.Timestamp;

//
//Source code recreated from a .class file by IntelliJ IDEA
//(powered by FernFlower decompiler)
//


public class TimeDepositDTO {
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
    
    public TimeDepositDTO() {
        
    }
    
    public TimeDepositDTO(String accCode, String accTypeName, String accName) {
       super();
       this.accCode = accCode;
       this.accTypeName = accTypeName;
       this.accName = accName;
    }

    // 전체 계좌 조회시 사용 생성자
    public TimeDepositDTO(String accTypeName, String accName, String accNum, int accBalance) {
        super();
        this.accTypeName = accTypeName;
        this.accName = accName;
        this.accNum = accNum;
        this.accBalance = accBalance;
    }

    public TimeDepositDTO(String accTypeName, String accName, String accNum, int accBalance, String accPw) {
        this.accTypeName = accTypeName;
        this.accName = accName;
        this.accNum = accNum;
        this.accBalance = accBalance;
        this.accPw = accPw;
        // TODO Auto-generated constructor stub
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