package Command.manage.users;

import java.io.IOException;
import Command.Command;
import dataControl.about.member.DAO;
import dataControl.about.member.DTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
public class manageMember implements Command {
    String viewPage = null;
   
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        
        HttpSession session = request.getSession();
        boolean isAdmin = (boolean) session.getAttribute("isAdmin"); 
        DTO dto = new DTO();
        DAO dao = DAO.getInstance();
        boolean result = false;
        System.out.println("어드민 계정 여부" + isAdmin);
        
        if (isAdmin) {
        String id = (String) session.getAttribute("userId");
        System.out.println(id);
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String identityNum = request.getParameter("resident_number");
        String phoneNum = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String postalCode = request.getParameter("sample4_postcode");
        String address = request.getParameter("sample4_roadAddress");
        String jibunAddress = request.getParameter("sample4_jibunAddress");
        String detailAddress = request.getParameter("sample4_detailAddress");
        String extraAddress = request.getParameter("sample4_extraAddress");
        String grade = request.getParameter("grade");
        String status = request.getParameter("status");
        
        dto.setId(id);
        dto.setPassword(password);
        dto.setName(name);
        dto.setIdentityNum(identityNum);
        dto.setPhoneNum(phoneNum);
        dto.setEmail(email);
        dto.setPostalCode(postalCode);
        dto.setAddress(address);
        dto.setJibunAddress(jibunAddress);
        dto.setDetailAddress(detailAddress);
        dto.setExtraAddress(extraAddress);
        dto.setGrade(grade);
        dto.setStatus(status);
        
        result = dao.updateMember(dto);
        if (result == true) {

            viewPage = "/manageAdmin.bankadmin";
        } else {

            viewPage = null;
        }
        } else {
            String id = (String) session.getAttribute("loggedInId");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String identityNum = request.getParameter("resident_number");
            String phoneNum = request.getParameter("phone_number");
            String email = request.getParameter("email");
            String postalCode = request.getParameter("sample4_postcode");
            String address = request.getParameter("sample4_roadAddress");
            String jibunAddress = request.getParameter("sample4_jibunAddress");
            String detailAddress = request.getParameter("sample4_detailAddress");
            String extraAddress = request.getParameter("sample4_extraAddress");
            String grade = request.getParameter("grade");
            String status = request.getParameter("status");        
            
            dto.setId(id);
            dto.setPassword(password);
            dto.setName(name);
            dto.setIdentityNum(identityNum);
            dto.setPhoneNum(phoneNum);
            dto.setEmail(email);
            dto.setPostalCode(postalCode);
            dto.setAddress(address);
            dto.setJibunAddress(jibunAddress);
            dto.setDetailAddress(detailAddress);
            dto.setExtraAddress(extraAddress);
            dto.setGrade(grade);
            dto.setStatus(status);
            
            result = dao.updateMember(dto); 
        }
        
        if (result == true) {

            viewPage = "/checkMemberById.bank";
        } else {

            viewPage = null;
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
