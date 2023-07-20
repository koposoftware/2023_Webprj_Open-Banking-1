package naver.login;

import java.io.IOException;
import java.util.ArrayList;
import Command.Command;
import dataControl.about.member.DAO;
import dataControl.about.member.DTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class naverLoginCommand implements Command {
    String viewPage = null;
    String loggedInId = null;
    String password = null;;
    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = (String) request.getAttribute("id");
        String mail = (String) request.getAttribute("mail");
        String name = (String) request.getAttribute("name");
        String cp = (String) request.getAttribute("cp");
        
        System.out.println(id + mail + name + cp);
        
        DAO memberDAO = DAO.getInstance(); // DAO 인스턴스 생성 방식 변경
        
        boolean customerExists = memberDAO.checkNaverLogin(cp);
        
        if (customerExists) {
            //로그인 성공한걸로 간주하고 메인 페이지로 넘어감
            loggedInId = id;
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
                    session.setAttribute("name", name);
                    System.out.println("로그인 완료");
                    viewPage = "Main.bank";
                } else {
                    System.out.println("없는 ID입니다.");
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
                    session.setAttribute("name", name);
                    viewPage = "Main.jsp";
                } else {
                    System.out.println("구)관리자 비밀번호 체크");
                }
                }
            }           
            
        else {
            //네이버 프로필 값을 유지하고 naverJoinInput.jsp로 넘어감
            request.setAttribute("id", id);
            request.setAttribute("mail", mail);
            request.setAttribute("name", name);
            request.setAttribute("cp", cp);
            viewPage="join/naverJoinInput.jsp";
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