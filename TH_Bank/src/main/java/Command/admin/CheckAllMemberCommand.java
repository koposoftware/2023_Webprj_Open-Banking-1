package Command.admin;

import java.io.IOException;
import java.util.List;
import Command.Command;
import dataControl.about.member.DAO;
import dataControl.about.member.DTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckAllMemberCommand implements Command {
    String viewPage = null;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        DTO dto = new DTO();
        DAO dao = DAO.getInstance();
        
        List<DTO> dtos = dao.getViewAll();

        if (!dtos.isEmpty()) {
            request.setAttribute("memberList", dtos); // dtos를 "memberList"라는 이름으로 저장
            viewPage = "./admin/checkAllmember.jsp"; // 이동할 JSP 페이지 지정
        } else {
            viewPage = "../error.bank"; // dtos가 비어있을 경우 이동할 JSP 페이지 지정
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
