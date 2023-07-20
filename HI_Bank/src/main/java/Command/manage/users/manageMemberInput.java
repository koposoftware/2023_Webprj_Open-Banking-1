package Command.manage.users;

import java.io.IOException;
import Command.Command;
import dataControl.about.member.DAO;
import dataControl.about.member.DTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class manageMemberInput implements Command {
    String viewPage = null;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        

        HttpSession session = request.getSession();
        boolean isAdmin = (boolean) session.getAttribute("isAdmin");
         

        
        
        
        DAO dao = DAO.getInstance();
        if (!isAdmin) {

            
        String id = (String) session.getAttribute("loggedInId");
        DTO dto = dao.checkMemberById(id);        
        session.setAttribute("name", dto.getName());
        session.setAttribute("phoneNum", dto.getPhoneNum());
        session.setAttribute("email", dto.getEmail());
        session.setAttribute("postalCode", dto.getPostalCode());
        session.setAttribute("password", dto.getPassword());
        
        session.setAttribute("address", dto.getAddress());
        session.setAttribute("jibunAddress", dto.getJibunAddress());
        session.setAttribute("detailAddress", dto.getDetailAddress());
        session.setAttribute("grade", dto.getGrade());
        session.setAttribute("identityNum", dto.getIdentityNum());
        session.setAttribute("extraAddress", dto.getExtraAddress());
        session.setAttribute("status", dto.getStatus());
        session.setAttribute("grade", dto.getGrade());
        
        viewPage = "/user/manageMember.jsp";
        }
        else {
            
            String id = (String) request.getParameter("loggedInId");
            session.setAttribute("userId", id);
            System.out.println("Input에서 ID" + id);
            DTO dto = dao.checkMemberById(id);        
            session.setAttribute("name", dto.getName());
            session.setAttribute("phoneNum", dto.getPhoneNum());
            session.setAttribute("email", dto.getEmail());
            session.setAttribute("postalCode", dto.getPostalCode());
            session.setAttribute("password", dto.getPassword());
            
            session.setAttribute("address", dto.getAddress());
            session.setAttribute("jibunAddress", dto.getJibunAddress());
            session.setAttribute("detailAddress", dto.getDetailAddress());
            session.setAttribute("grade", dto.getGrade());
            session.setAttribute("identityNum", dto.getIdentityNum());
            session.setAttribute("extraAddress", dto.getExtraAddress());
            session.setAttribute("status", dto.getStatus());
            session.setAttribute("grade", dto.getGrade());
                        
            viewPage = "/user/manageMember.jsp";
        }
        }

    @Override
    public String getViewPage() {
        if (viewPage == null) {
            viewPage = "/error.bank";
        }
        return viewPage;
    }

}
