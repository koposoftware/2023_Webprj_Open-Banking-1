package Command.accounts.pw;

import java.io.IOException;
import Command.Command;
import dataControl.about.member.*;
import dataControl.account.dao.*;
import dataControl.account.dto.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PwUpdateInputCommand implements Command {
	
	String viewPage = "/account/pwUpdateInput.jsp";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		AccountDAO dao = AccountDAO.getInstance();
//		
//		HttpSession session = request.getSession();
//        String custId = (String) session.getAttribute("loggedInId");
//		System.out.println(custId);
//		
//        
//        
//		String accPw = request.getParameter("password");
//		System.out.println(accPw);
//		
//		boolean result = dao.pwUpdate(accPw, custId);
//		
//		 System.out.println("두번찍히는거 확인용 " + result);
//	        if (result == true) {
//	            viewPage = "/Main.bank";
//	        } else {
//	            viewPage = "../error.jsp";
//	        }
	}

	@Override
	public String getViewPage() {
        if (viewPage == null) {
            viewPage = "../error.bank";
        }
        return viewPage;
    }
}
