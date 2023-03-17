<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>
<!-- <jsp:useBean id="vo" class="com.beans.member.MemberVO" /> -->

<jsp:useBean id="dao" class="com.beans.member.MemberDAO" />

 <% // vo = dao.getMyInfo(id); %> 
    
<jsp:include page="../include/header.jsp" flush="false" />

	<div class="sub-bn sub-bn-bg-2">
		<h4>Member Update</h4>
	</div>
	
	<div class="mb-container join-container">
		<form name="regFrm" action="updateMemberPro.jsp" method="post">
			<ul>
				<li><input type="text" name="id" class="form-control" value="<%=id %>" readonly autofocus required></li>
				<li><input type="password" name="pwd" value="<%=vo.getPwd() %>" class="form-control" required></li>
				<li><input type="text" name="name" value="<%=vo.getName() %>" class="form-control" required></li>
				<li>생년월일 : <input type="text" name="birth" value="<%=vo.getBirth() %>" class="form-control input-birth"></li>
				<li><input type="text" name="addr" value="<%=vo.getAddr() %>" class="form-control"></li>
				<li><input type="text" name="mobile" value="<%=vo.getMobile() %>" class="form-control"></li>
				<li><input type="email" name="email" value="<%=vo.getEmail() %>" class="form-control" required></li>
			</ul>
			<div class="flex">
				<button type="submit" class="btn btn-dark">정보수정</button>
				<a href="mypage.jsp" class="btn btn-dark">나의정보</a>
			</div>
		</form>
	</div>









