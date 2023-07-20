package Command.join;

import java.io.IOException;
import java.util.List;

import Command.Command;
import dataControl.about.member.DAO;
import dataControl.about.member.DTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class joinCommand implements Command {
    String viewPage = null;
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String bankCode = request.getParameter("bankCode");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String identityNum = request.getParameter("resident_number");
        String phoneNum = request.getParameter("phone");
        String email = request.getParameter("email");
        String postalCode = request.getParameter("sample4_postcode");
        String address = request.getParameter("sample4_roadAddress");
        String jibunAddress = request.getParameter("sample4_jibunAddress");
        String detailAddress = request.getParameter("sample4_detailAddress");
        String extraAddress = request.getParameter("sample4_extraAddress");

        DTO dto = new DTO();
        DAO dao = DAO.getInstance();

        dto.setId(id);
        dto.setBankCode(bankCode);
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
        
        System.out.println("아이디=> : " + dto.getId());
        List<String> dupliCheck = dao.checkDuplicates(dto);
        System.out.println("중복된 필드:");
        for (String field : dupliCheck) {
            System.out.println(field);
        }

        
        
//        System.out.println("Duplicate Fields:"+ dupliCheck);
        if (!dupliCheck.isEmpty()) {
            session.setAttribute("dupliList", dupliCheck);
        } else {
        boolean result = dao.insertMember(dto);
        System.out.println("두번찍히는거 확인용");
        if (result == true) {
            viewPage = "Main.bank";
        } else {
            viewPage = null;
            }
        }
    }
    @Override
    public String getViewPage() {
        if (viewPage == null) {
            viewPage = "error.bank";
        }
        return viewPage;
    }

}