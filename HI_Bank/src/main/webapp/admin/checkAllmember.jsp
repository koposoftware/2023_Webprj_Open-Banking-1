<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<link rel="stylesheet" href="/static/css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
 @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');  

</style>
<script>
window.addEventListener("wheel", function(e){
    e.preventDefault();
},{passive : false});

var mHtml = $("html");
var page = 1;

mHtml.animate({scrollTop : 0}, 10);

$(window).on("wheel", function(e) {
    if(mHtml.is(":animated")) return;
    if(e.originalEvent.deltaY > 0) {
        if(page == 5) return;
        page++;
    } else if(e.originalEvent.deltaY < 0) {
        if(page == 1) return;
        page--;
    }
    var posTop = (page-1) * $(window).height();
    mHtml.animate({scrollTop : posTop});
});
</script>
</head>
<body>
<header class="header-fixed">
	<jsp:include page="/include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>
	
    <div id ="menu_wrap">
	<h1>Member List</h1>
	<table class="custom-table" style="width: 80%; margin:0 auto;">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Password</th>
				<th>Identity Number</th>
				<th>Phone Number</th>
				<th>Email</th>
				<th>Postal Code</th>
				<th>Address</th>
				<th>Detail Address</th>
				<th>Jibun Address</th>
				<th>Extra Address</th>
				<th>Grade</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<% List<DTO> memberList = (List<DTO>) request.getAttribute("memberList"); %>
			<% for (DTO dto : memberList) { %>
			<tr>
				<td><%= dto.getId() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getPassword() %></td>
				<td><%= dto.getIdentityNum() %></td>
				<td><%= dto.getPhoneNum() %></td>
				<td><%= dto.getEmail() %></td>
				<td><%= dto.getPostalCode() %></td>
				<td><%= dto.getAddress() %></td>
				<td><%= dto.getDetailAddress() %></td>
				<td><%= dto.getJibunAddress() %></td>
				<td><%= dto.getExtraAddress() %></td>
				<td><%= dto.getGrade() %></td>
				<td><%= dto.getStatus() %></td>

				<td>
					<form action="manageMemberInput.bank" method="post" style="border: none;">
						<input type="hidden" name="loggedInId" value="<%= dto.getId() %>">
						<button type="submit" class="custom-button">Edit</button>
					</form>
				</td>
				<% } %>
			
		</tbody>
	</table>
		</div>
	<div>
	<jsp:include page="/include/mainFooter.jsp"></jsp:include>`
    </div>
</body>
</html>
