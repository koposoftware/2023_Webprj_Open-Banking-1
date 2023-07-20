package Command;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ErrorCommnad implements Command {
    String viewPage = "./error.jsp";
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

    }

    @Override
    public String getViewPage() {
        // TODO Auto-generated method stub
        return null;
    }

}
