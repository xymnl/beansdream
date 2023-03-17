<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="com.beans.member.MemberVO" />

<jsp:setProperty name="vo" property = "*" />
<jsp:useBean id="dao" class="com.beans.member.MemberDAO" />

<%
	boolean result = dao.insertMember(vo);

	if(result) {
%>
	<script>
		alert("회원가입을 하였습니다.");
		location.href="login.jsp";
	</script>
<%
	}else {
%>
	<script>
		alert("회원가입에 실패했습니다.");
		history.back();
	</script>
<%
	}
%>