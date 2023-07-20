package Command.manage.users;

import java.io.IOException;
import Command.Command;
import dataControl.about.member.DAO;
import dataControl.about.member.DTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class deleteMember implements Command {
    String viewPage = null;
    String id;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
    
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        HttpSession session = request.getSession();
        boolean isAdmin = (boolean) session.getAttribute("isAdmin");
        if (isAdmin) {
            
            id = (String) session.getAttribute("userId");
        } else {
            id = (String) session.getAttribute("loggedInId");
        }
        System.out.println(id);
        DTO dto = new DTO();
        DAO dao = DAO.getInstance();



        boolean result = dao.deleteMember(id);
        if (!isAdmin) {
            if (result == true) {
                session.setAttribute("loggedIn", false);
                session.setAttribute("isAdmin", false);

            viewPage = "Main.bank";
        }
        } else {
            if (result == true) {
                System.out.println("ㅇ여까지 오는지");
                viewPage="manageAdmin.bankadmin";
            } else { 
            viewPage = null;
            }
        }
    }



    @Override
    public String getViewPage() {
        if (viewPage == null) {
            viewPage = "../error.jsp";
        }
        return viewPage;
    }


}
