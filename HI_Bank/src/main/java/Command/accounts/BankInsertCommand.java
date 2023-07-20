package Command.accounts;

import java.io.IOException;
import Command.Command;
import dataControl.account.dao.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BankInsertCommand implements Command {
    
    String viewPage = null;
    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        AccountDAO dao = AccountDAO.getInstance();
        
        HttpSession session = request.getSession();
        String custId = (String) session.getAttribute("loggedInId");
        
        String accCode = request.getParameter("accCode");
        String accTypeName = request.getParameter("accTypeName");
        String accPw = request.getParameter("password");
        String accName = request.getParameter("accName");
        String accNickName = request.getParameter("accNickName");
        System.out.println(accCode);
        boolean result = dao.accountInsert(custId, accCode, accTypeName,  accPw, accName, accNickName);
        
        System.out.println("두번찍히는거 확인용 " + result);
        if (result == true) {
            viewPage = "/account/accountInsertOk.jsp";
        } else {
            viewPage = "../error.jsp";
        }
    }
    @Override
    public String getViewPage() {
        if (viewPage == null) {
            viewPage = "../error.jsp";
        }
        return viewPage;
    }


}
