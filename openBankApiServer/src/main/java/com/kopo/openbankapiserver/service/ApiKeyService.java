package com.kopo.openbankapiserver.service;

import com.kopo.openbankapiserver.dto.ApiKeyDto;

public interface ApiKeyService {

    /**
     * apiKey로 담긴 은행코드 별 회원ID 정보 조회
     * @param apiKey
     * @return
     */
    ApiKeyDto selectByKey(String apiKey);

    /**
     * apiKey 최초 생성
     * @param apiKeyDto
     */
    void insertApiKey(ApiKeyDto apiKeyDto);

    /**
     * apiKey 수정
     * - 오픈뱅킹 서비스 이용할때, 타 은행 오픈뱅킹 서비스를 추가신청할때
     * - 각 은행에서 회원 ID를 탈퇴할때, 은행코드 컬럼 NULL로
     * @param apiKeyDto
     */
    void updateApiKey(ApiKeyDto apiKeyDto);

    /**
     * apiKey 삭제
     * @param apiKey
     */
    void deleteApiKey(String apiKey);

}
