package Command.accounts.pw;

import java.io.IOException;
import Command.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PwCheckInputCommand implements Command {

	String viewPage = "/account/pwCheckInput.jsp";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	@Override
	public String getViewPage() {
		if (viewPage == null) {
			viewPage = "../error.bank";
		}
		return viewPage;
	}
}
