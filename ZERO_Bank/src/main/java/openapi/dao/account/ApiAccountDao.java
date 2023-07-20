package openapi.dao.account;

import dataControl.account.dto.AccountDTO;

import java.util.List;

public interface ApiAccountDao {
    /**
     * 고객ID로 타 은행 모든 내 계좌 정보 조회
     */
    List<AccountDTO> selectAllByCustId(String custId);
//    List<AccountDTO> selectAllByCustId2(String custId);



}
