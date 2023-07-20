package Command.accounts.pw;

import java.io.IOException;
import Command.Command;
import dataControl.account.dao.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PwCheckOkCommand implements Command {

    String viewPage = "/account/pwCheckOk.jsp";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO dao = AccountDAO.getInstance();

        HttpSession session = request.getSession();
        String storedPassword = (String) session.getAttribute("accPw");
        String enteredPassword = request.getParameter("password");
        String accNum = (String) session.getAttribute("accNum");

        if (storedPassword != null && storedPassword.equals(enteredPassword)) {
            dao.pwDelete(accNum);
        } else {
            // Passwords don't match, handle the error or display a message to the user
            // 예를 들어, 비밀번호 불일치 에러 메시지를 설정하고 사용자에게 알릴 수 있습니다.
            request.setAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
            viewPage = "/error.jsp"; // 에러 발생 시 보여줄 페이지 설정
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
