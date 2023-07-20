package dataControl.about.member;

import java.util.Date;

public class DTO {

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
 
    

    public DTO() {
    }

    public String getJibunAddress() {
        return jibunAddress;
    }

    public void setJibunAddress(String jibunAddress) {
        this.jibunAddress = jibunAddress;
    }

    public String getExtraAddress() {
        return extraAddress;
    }

    public void setExtraAddress(String extraAddress) {
        this.extraAddress = extraAddress;
    }
    
    public DTO(String id, String name, String password, String email) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
    }
    
    public DTO(String id, String bankCode,String name, String password, String identityNum,
            String phoneNum, String email, String postalCode, String address, String detailAddress, 
            String jibunAddress, String extraAddress
            ) {

     this.id = id;
     this.bankCode = bankCode;
     this.name = name;
     this.password = password;
     this.identityNum = identityNum;
     this.phoneNum = phoneNum;
     this.email = email;
     this.address = address;
     this.detailAddress = detailAddress;
     this.postalCode = postalCode;
     this.grade = grade;
     this.status = status;
     this.jibunAddress = jibunAddress;
     this.extraAddress = extraAddress;
 }

    public DTO(String name2, String phoneNum2, String identityNum,String email2, String postalCode2, String address2,
            String jibunAddress, String detailAddress2, String extraAddress2, String grade2) {
        this.id = id;
        this.bankCode = bankCode;
        this.name = name2;
        this.password = password;
        this.identityNum = identityNum;
        this.phoneNum = phoneNum2;
        this.email = email2;
        this.address = address2;
        this.extraAddress = extraAddress2;
        this.detailAddress = detailAddress2;
        this.jibunAddress = jibunAddress;
        this.postalCode = postalCode2;
        this.grade = grade2;
        this.status = status;
    }

    public DTO(String id2, String bankCode2, String name2, String password2, String identityNum2,
            String phoneNum2, String email2, String postalCode2, String address2,
            String detailAddress2, String jibunAddress2, String extraAddress2, String grade2,
            String status2) {
        this.id = id2;
        this.bankCode = bankCode2;
        this.name = name2;
        this.password = password2;
        this.identityNum = identityNum2;
        this.phoneNum = phoneNum2;
        this.email = email2;
        this.address = address2;
        this.extraAddress = extraAddress2;
        this.detailAddress = detailAddress2;
        this.jibunAddress = jibunAddress2;
        this.postalCode = postalCode2;
        this.grade = grade2;
        this.status = status2;
        // TODO Auto-generated constructor stub
    }

    public String getBankCode() {
        return bankCode;
    }

    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdentityNum() {
        return identityNum;
    }

    public void setIdentityNum(String identityNum) {
        this.identityNum = identityNum;
    }


    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Getters and setters
    // ...
}

