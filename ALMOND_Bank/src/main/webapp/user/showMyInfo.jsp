<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="static/css/styles.css">
<meta charset="UTF-8">
<title>유저정보</title>
<link rel="stylesheet" href="/static/css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<style>
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
 @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');  

</style>
</head>
<body>
	<jsp:include page ="/include/menuHeader.jsp"></jsp:include>
  <div class="container">
    <h1>유저정보조회</h1>
    <hr>
    <br>
    <%	
    	String id;
		boolean isAdmin = (boolean) session.getAttribute("isAdmin");
    	if (!isAdmin) {
    	    id = (String) session.getAttribute("loggedInId");    
    	} else {
    	    id = (String) session.getAttribute("userId");
    	}
    	
        DAO dao = DAO.getInstance();
        DTO dto = dao.checkMemberById(id);        

        session.setAttribute("name", dto.getName());
        session.setAttribute("phoneNum", dto.getPhoneNum());
        session.setAttribute("email", dto.getEmail());
        session.setAttribute("postalCode", dto.getPostalCode());
        session.setAttribute("address", dto.getAddress());
        session.setAttribute("jibunAddress", dto.getJibunAddress());
        session.setAttribute("detailAddress", dto.getDetailAddress());
        session.setAttribute("grade", dto.getGrade());
        session.setAttribute("identityNum", dto.getIdentityNum());
        session.setAttribute("extraAddress", dto.getExtraAddress());
        System.out.println("여기 id null값 체크" + id);
    %>
    
    <div class="user-box">
      <div class="user-info">
        <div class="user-input">
          <strong>이름</strong>
          <input type="text" value="<%=dto.getName() %>" readonly>
        </div>
        <div class="user-input">
          <strong>전화번호</strong>
          <input type="text" value="<%=dto.getPhoneNum()%>" readonly>
        </div>
        <div class="user-input">
          <strong>Email</strong>
          <input type="text" value="<%=dto.getEmail() %>" readonly>
        </div>
        <div class="user-input">
          <strong>우편번호</strong>
          <input type="text" value="<%=dto.getPostalCode() %>" readonly>
        </div>
         <div class="user-input">
          <strong>도로명주소</strong>
          <input type="text" value="<%=dto.getAddress() %>" readonly>
        </div>
         <div class="user-input">
          <strong>지번주소</strong>
          <input type="text" value="<%=dto.getJibunAddress() %>" readonly>
        </div>
         <div class="user-input">
          <strong>상세주소</strong>
          <input type="text" value="<%=dto.getDetailAddress() %>" readonly>
        </div>
        <div class="user-input">
          <strong>유저등급</strong>
          <input type="text" value="<%=dto.getGrade() %>" readonly>
        </div>
      </div> 
      <br><br>
      <div class="button-container">
		  <button onclick="manageMyInfoInput('<%=dto.getId() %>')" class="info-button">개인 정보 수정</button>
		  <button onclick="deleteMember('<%=dto.getId() %>')" class="delete-button">회원 탈퇴</button>
		  <button onclick="location.href='./Main.bank'" class="back-button">메인페이지로 이동하기</button>
		</div>
    
  </div>
  <script>
    function manageMyInfoInput(id) {
      window.location.href = "manageMemberInput.bank";
    }
    function deleteMember(id) {
        window.location.href = "deleteMember.bank";
      }
  </script>
</body>
</html>