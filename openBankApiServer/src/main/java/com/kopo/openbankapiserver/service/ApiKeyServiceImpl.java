package com.kopo.openbankapiserver.service;

import com.kopo.openbankapiserver.dao.ApiKeyDao;
import com.kopo.openbankapiserver.dto.ApiKeyDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class ApiKeyServiceImpl implements ApiKeyService {

    @Autowired // DAO에 @Repository 해주면 안해도됨??
    ApiKeyDao apiKeyDao;

    @Override
    public ApiKeyDto selectByKey(String apiKey) {
        return apiKeyDao.selectByKey(apiKey);
    }

    @Override
    public void insertApiKey(ApiKeyDto apiKeyDto) {
        String uuidApiKey = UUID.randomUUID().toString();
        apiKeyDto.setApikey(uuidApiKey);

        apiKeyDao.insert(apiKeyDto);
    }

    @Override
    public void updateApiKey(ApiKeyDto apiKeyDto) {
        apiKeyDao.update(apiKeyDto);
    }

    @Override
    public void deleteApiKey(String apiKey) {
        apiKeyDao.delete(apiKey);
    }
}
