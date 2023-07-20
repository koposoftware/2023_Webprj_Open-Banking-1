package Command.manage.users;

import java.io.IOException;
import Command.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class checkMemberByIdCommand implements Command {
    String viewPage = null;
    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        viewPage = "/user/showMyInfo.jsp";
    }

    @Override
    public String getViewPage() {
        if (viewPage == null) {
            viewPage = "./error.bank";
        }
        return viewPage;
    }

}
