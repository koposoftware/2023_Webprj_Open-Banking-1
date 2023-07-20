package suyoung.dwCommand;

import suyoung.dwDAODTO.dwDAO;

public class WTAccountCommand {
    public boolean execute(String wAccountNumber, String transferAmount, String dBankCode, String dAccountNumber) {
        dwDAO dao = new dwDAO();
        boolean result = dao.updateWithdrawBalance(wAccountNumber, transferAmount, dBankCode, dAccountNumber);
        return result;
    }
}
