package openapi.dao.account;

public interface ApiCustomerDao {
    /**
     * 주민번호로 고객ID 구하는 쿼리
     */
    String selectCustIdByIdentityNum(String identityNum);
}
