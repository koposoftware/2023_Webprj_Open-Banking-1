//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package dataControl.account.dto;

import java.sql.Timestamp;

public class TradeDTO {
    private String tradeId;
    private String custId;
    private String tradeType;
    private String tradeStatus;
    private Timestamp tradeDate;
    private int tradeAcc;
    private int balance;
    private String depositCode;
    private String depositNum;
    private String withdrawalCode;
    private String withdrawalNum;
    private String tradeMemo;

    public TradeDTO(Timestamp tradeDate, String tradeType, String withdrawalNum, String depositNum, int tradeAcc, int balance, String tradeMemo) {
        this.tradeDate = tradeDate;
        this.tradeType = tradeType;
        this.withdrawalNum = withdrawalNum;
        this.depositNum = depositNum;
        this.tradeAcc = tradeAcc;
        this.balance = balance;
        this.tradeMemo = tradeMemo;
    }

    public String getTradeId() {
        return this.tradeId;
    }

    public void setTradeId(String tradeId) {
        this.tradeId = tradeId;
    }

    public String getCustId() {
        return this.custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getTradeType() {
        return this.tradeType;
    }

    public void setTradeType(String tradeType) {
        this.tradeType = tradeType;
    }

    public String getTradeStatus() {
        return this.tradeStatus;
    }

    public void setTradeStatus(String tradeStatus) {
        this.tradeStatus = tradeStatus;
    }

    public Timestamp getTradeDate() {
        return this.tradeDate;
    }

    public void setTradeDate(Timestamp tradeDate) {
        this.tradeDate = tradeDate;
    }

    public int getTradeAcc() {
        return this.tradeAcc;
    }

    public void setTradeAcc(int tradeAcc) {
        this.tradeAcc = tradeAcc;
    }

    public int getBalance() {
        return this.balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public String getDepositCode() {
        return this.depositCode;
    }

    public void setDepositCode(String depositCode) {
        this.depositCode = depositCode;
    }

    public String getDepositNum() {
        return this.depositNum;
    }

    public void setDepositNum(String depositNum) {
        this.depositNum = depositNum;
    }

    public String getWithdrawalCode() {
        return this.withdrawalCode;
    }

    public void setWithdrawalCode(String withdrawalCode) {
        this.withdrawalCode = withdrawalCode;
    }

    public String getWithdrawalNum() {
        return this.withdrawalNum;
    }

    public void setWithdrawalNum(String withdrawalNum) {
        this.withdrawalNum = withdrawalNum;
    }

    public String getTradeMemo() {
        return this.tradeMemo;
    }

    public void setTradeMemo(String tradeMemo) {
        this.tradeMemo = tradeMemo;
    }
}
