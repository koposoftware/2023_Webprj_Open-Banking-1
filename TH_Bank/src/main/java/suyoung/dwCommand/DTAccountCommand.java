package suyoung.dwCommand;

import suyoung.dwDAODTO.dwDAO;

public class DTAccountCommand {
    public boolean execute(String dAccountNumber, String transferAmount, String wBankCode, String wAccountNumber) {
        dwDAO dao = new dwDAO();
        boolean result = dao.updateDepositBalance(dAccountNumber, transferAmount, wBankCode, wAccountNumber);
        return result;
    }
}
