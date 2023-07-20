package Command.accounts.change;

import java.io.IOException;
import Command.Command;
import dataControl.account.dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AccTransOkCommand implements Command {
	
	String viewPage = "/account/accTransOk.jsp";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO dao = AccountDAO.getInstance();
		
		HttpSession session = request.getSession();
		String accNum = (String) session.getAttribute("accNum");
		String selectedAccName = request.getParameter("selectedAccName"); // 이전 페이지에서 선택된 계좌명(accName) 값 가져오기
		
		// 계좌 업데이트 처리
		if (selectedAccName != null) {
			dao.accTransUpdate(selectedAccName, accNum);
		} else {
			// 선택된 계좌가 없는 경우, 에러 처리 또는 사용자에게 메시지 표시
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
