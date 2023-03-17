<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="com.beans.app.AppDAO" />
<% String id = (String) session.getAttribute("idKey"); %>

<%
	if(id != null) {
		session.setAttribute("idKey", id);
%>
	<script>
		location.href="appFrm.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("로그인이 필요한 영역입니다. 로그인 또는 회원가입을 해주세요.");
		location.href="../member/login.jsp";
	</script>
<%
	}
%>