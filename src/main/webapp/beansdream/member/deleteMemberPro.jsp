<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>
<jsp:useBean id="dao" class="com.beans.member.MemberDAO" />
<%
	boolean result = dao.deleteMember(id);
	
	if(result) { //DELETE문이 성공하면 result에 true, 실패하면 result에 false가 저장된다.
%>
	<script>
		alert("회원 탈퇴 하였습니다.");
		location.href="login.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("회원 탈퇴에 실패했습니다.");
		history.back(); //이전 페이지(mypage.jsp)로 되돌아 간다.
	</script>
<%
	}
%>






