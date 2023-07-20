package openapi.service.account;

import dataControl.account.dto.AccountDTO;

import java.util.List;

public interface ApiAccountService {

    /**
     * 타 은행 모든 내 계좌 정보 조회
     */
    List<AccountDTO> listAccount(String custId);

    /**
     * 고객ID로 타 은행 모든 내 계좌 정보 조회
     */
    List<AccountDTO> listAccount();
}
