package Command.accounts;

import java.io.IOException;
import Command.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AccountManageCommand implements Command {
	
	String viewPage = "/account/accountManage.jsp";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String accPw = (String) request.getAttribute("accPw");
		session.setAttribute("accPw", accPw);

		System.out.println(accPw);
		
		
	}

	@Override
	public String getViewPage() {
        if (viewPage == null) {
            viewPage = "../error.bank";
        }
        return viewPage;
    }

}
