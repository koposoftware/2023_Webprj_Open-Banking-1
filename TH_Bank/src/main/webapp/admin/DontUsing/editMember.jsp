<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="DataObject.MemberDAO" %>
<%@ page import="DataObject.MemberDTO" %>
<%@ page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String memberId = request.getParameter("id");
    System.out.println(memberId);
    MemberDAO memberDAO = new MemberDAO();
    ArrayList<MemberDTO> members = memberDAO.getLoggedInMember(memberId);

    if (members.size() > 0) {
        MemberDTO member = members.get(0);
        // 회원 정보 업데이트 처리
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String status = request.getParameter("status");
        String role = request.getParameter("role");

        boolean success = memberDAO.updateMgr(memberId, name, email, status, role);

        System.out.println(status + role);
        if (success) {
            // 업데이트 성공 시 메시지 출력
%>
            <h2>회원 정보가 업데이트되었습니다.</h2>
            <table>
                <tr>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>회원상태</th>
                    <th>회원권한</th>
                </tr>
                <tr>
                    <td><%= memberId %></td>
                    <td>******</td> <!-- 비밀번호 마스킹 처리 -->
                    <td><%= name %></td>
                    <td><%= maskPhoneNumber(member.getPhoneNumber()) %></td>
                    <td><%= email %></td>
                    <td><%= status %></td>
                    <td><%= role %></td>
                </tr>
            </table>
            <br>
            <a href="manageUser.jsp">회원 관리로 돌아가기</a>
            <a href="Main.jsp">메인페이지로 돌아가기</a><!-- manageUser.jsp로 이동하는 버튼 -->
<%
        } else {
            // 업데이트 실패 시 메시지 출력
%>
            <h2>회원 정보 업데이트에 실패했습니다.</h2>
<%
        }
    } else {
%>
        <h2>회원 정보를 가져오지 못했습니다.</h2>
<%
    }
%>

<%!
    // 전화번호 마스킹 처리 함수
    public String maskPhoneNumber(String phoneNumber) {
        if (phoneNumber == null || phoneNumber.isEmpty()) {
            return phoneNumber;
        }
        if (phoneNumber.startsWith("010") && phoneNumber.length() >= 10) {
            String front = phoneNumber.substring(0, 4);
            String masked = phoneNumber.substring(4).replaceAll("\\d", "*");
            return front + masked;
        } else {
            return phoneNumber;
        }
    }
%>
 --%>