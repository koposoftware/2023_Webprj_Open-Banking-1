package Command.accounts;

import java.io.IOException;
import java.util.ArrayList;
import Command.Command;
import dataControl.account.dao.AccountDAO;
import dataControl.account.dao.TimeDepositDAO;
import dataControl.account.dto.AccountDTO;
import dataControl.account.dto.TimeDepositDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BankTimeDepositCommand implements Command {
    String viewPage = null;
    ArrayList<TimeDepositDTO> dtos = new ArrayList<TimeDepositDTO>();
    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        viewPage = "/account/timeDepositSelect.jsp";
        
    
    }
    

    @Override
    public String getViewPage() {
        if (viewPage == null) {
            viewPage = "../error.jsp";
        }
        return viewPage;
    }
}
