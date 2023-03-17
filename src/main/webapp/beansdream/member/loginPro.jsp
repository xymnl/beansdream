<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="com.beans.member.MemberDAO" />
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id"); // login.jsp - name 속성값!
	String pwd = request.getParameter("pwd");

	boolean result = dao.loginCheck(id, pwd);
	
	System.out.println("입력한 아이디 값 : "+ id);
	
	if(result) {
		session.setAttribute("idKey", id);
%>
	<script>
		alert("로그인에 성공했습니다.");
		location.href="member.jsp";
	</script>
<%
	}else {
%>
	<script>
		alert("로그인에 실패했습니다.");
		location.href="login.jsp";
	</script>
<%		
	}
%>