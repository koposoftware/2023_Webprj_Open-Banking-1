package com.kopo.openbankapiserver.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class AccountDto {
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
    private Timestamp accClosure;
}
