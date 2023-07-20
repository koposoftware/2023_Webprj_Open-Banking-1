package com.kopo.openbankapiserver.dto;

import lombok.Data;

@Data
public class    MemberDto {
    private String id;
    private String name;
    private String password;
    private String identityNum;
    private String phoneNum;
    private String email;
    private String address;
    private String detailAddress;
    private String postalCode;
    private String grade;
    private String status;
    private String bankCode;
    private String jibunAddress;
    private String extraAddress;

    public MemberDto(String identityNum) {
        this.identityNum = identityNum;
    }
}
