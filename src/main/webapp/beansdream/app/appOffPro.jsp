<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% request.setCharacterEncoding("utf-8"); %>
    
    
<jsp:useBean id="vo" class="com.beans.app.AppVO" />

<jsp:setProperty name="vo" property = "*" />
<jsp:useBean id="dao" class="com.beans.app.AppDAO" />

<%
	boolean result = dao.insertAppOff(vo);
	
	if(result) {
%>
	<script>
		alert("상담 신청이 완료되었습니다.");
		location.href="../view/index.jsp#ctPage";
	</script>
<%
	}else {
%>
	<script>
		alert("상담 신청에 실패하였습니다. 다시 시도해주세요.");
		history.back();
	</script>
<%
	}
%>