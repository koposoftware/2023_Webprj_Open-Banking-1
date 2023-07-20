package Command.join;

import java.io.IOException;
import Command.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class joinInputCommand implements Command {
    String viewPage = "/join/joinInput.jsp";
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

    }

    @Override
    public String getViewPage() {
        if (viewPage == null) {
            viewPage = "./error.bank";
        }
        return viewPage;
    }

}
