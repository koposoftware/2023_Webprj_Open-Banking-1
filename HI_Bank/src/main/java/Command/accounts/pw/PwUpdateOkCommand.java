package Command.accounts.pw;

import java.io.IOException;
import Command.Command;
import dataControl.account.dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PwUpdateOkCommand implements Command {

	String viewPage = "/account/pwUpdateOk.jsp";
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AccountDAO dao = AccountDAO.getInstance();
		
		HttpSession session = request.getSession();
        String accNum = (String) session.getAttribute("accNum");
		
		


		String accPw = (String) request.getParameter("password");
		System.out.println(accPw);

		boolean result = dao.pwUpdate(accPw, accNum);
		
		 System.out.println("두번찍히는거 확인용 " + result);
	        if (result == true) {
	            viewPage = "/account/pwUpdateOk.jsp";
	        } else {
	            viewPage = "../error.jsp";
	        }
	}

	@Override
	public String getViewPage() {
        if (viewPage == null) {
            viewPage = "../error.bank";
        }
        return viewPage;
    }
}
