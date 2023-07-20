package Command.accounts;

import java.io.IOException;
import Command.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class accountSelectCommand implements Command{
    
    String viewPage = "/account/accountSelect.jsp";
    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("name");
    }

    @Override
    public String getViewPage() {
        if (viewPage == null) {
            viewPage = "../error.bank";
        }
        return viewPage;
    }

}