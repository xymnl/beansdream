<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String num = request.getParameter("num"); %>
<jsp:useBean id="dao" class="com.beans.app.AppDAO" />
<%
	boolean result = dao.deleteClass(num);
	
	if(result) {
%>
	<script>
		alert("삭제 하였습니다.");
		location.href="../app/appList.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("삭제에 실패했습니다. 잠시 후 다시 시도해주세요.");
		history.back();
	</script>
<%
	}
%>






