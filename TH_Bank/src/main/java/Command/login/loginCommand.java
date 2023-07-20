package Command.login;


import java.net.URLEncoder;
import java.util.ArrayList;
import Command.Command;
import dataControl.about.member.DAO;
import dataControl.about.member.DTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class loginCommand implements Command {
    String viewPage = null;
    String loggedInId = null;
    String password = null;;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        loggedInId = request.getParameter("id");
        password = request.getParameter("password");
        HttpSession session = request.getSession();

        DTO dto = new DTO();
        DAO dao = DAO.getInstance();
        
        if (!"admin".equals(loggedInId)) {
            ArrayList<DTO> rs = dao.getLoggedInMember(loggedInId);
            
            if (!rs.isEmpty()) {
                DTO member = rs.get(0);
                session.setAttribute("loggedInId", loggedInId);
                session.setAttribute("loggedIn", true);
                session.setAttribute("isAdmin", false);
                String status = member.getStatus();
                String storedPassword = member.getPassword();
                if (password.equals(storedPassword) && "활성".equals(status)) {
                    String name = member.getName();
                    String identityNum = member.getIdentityNum();
                    session.setAttribute("name", name);
                    System.out.println("로그인 완료");
                    
                    session.setAttribute("identityNum", identityNum);
                    System.out.println(identityNum);
                    viewPage = "Main.bank";
                } else {
                    System.out.println("비밀번호가 일치하지 않거나 없는 ID입니다.");
                }
            } else {
                System.out.println("비밀번호가 일치하지 않거나 없는 ID입니다.");
            }
        } else {
            ArrayList<DTO> rs = dao.getLoggedInAdmin(loggedInId);
            System.out.println("비었나 안비었나" + rs.isEmpty());
            System.out.println(rs.get(0).getId());
            
            
            if (!rs.isEmpty()) {
                DTO admin = rs.get(0);

                session.setAttribute("loggedInId", loggedInId);
                
                session.setAttribute("loggedIn", true);
                session.setAttribute("isAdmin", true);
                String storedPassword = admin.getPassword();
                
                if (password.equals(storedPassword)) {
                    String name = admin.getName();
                    session.setAttribute("name", name);
                    System.out.println(name);

                    viewPage = "Main.bank";
                } else {
                    System.out.println("비밀번호가 일치하지 않습니다. 1번");
                }
            } else {
                System.out.println("비밀번호가 일치하지 않습니다. 2번");
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
