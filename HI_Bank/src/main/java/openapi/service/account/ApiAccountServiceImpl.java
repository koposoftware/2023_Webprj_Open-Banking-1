package openapi.service.account;

import dataControl.account.dto.AccountDTO;
import openapi.dao.account.ApiAccountDao;
import openapi.dao.account.ApiAccountDaoImpl;
import openapi.dao.account.ApiCustomerDao;
import openapi.dao.account.ApiCustomerDaoImpl;

import java.util.List;

public class ApiAccountServiceImpl implements ApiAccountService {

    private final ApiCustomerDao apiCustomerDao = new ApiCustomerDaoImpl();
    private final ApiAccountDao apiAccountDao = new ApiAccountDaoImpl();

    @Override
    public List<AccountDTO> listAccount() {
        return null;
    }

    @Override
    public List<AccountDTO> listAccount(String identityNum) {
        String custId = apiCustomerDao.selectCustIdByIdentityNum(identityNum);
        System.out.println("service > custId: " + custId);
        List<AccountDTO> accounts = apiAccountDao.selectAllByCustId(custId);
        System.out.println("service > accounts: " + accounts);

        return accounts;
    }
}
