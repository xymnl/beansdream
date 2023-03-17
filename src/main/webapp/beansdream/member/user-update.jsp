<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
	String num = request.getParameter("num");
	System.out.println("어드민 업데이트 num 값"+ num);
	/*String num = (String) session.getAttribute("num");*/		
%>
<jsp:useBean id="vo" class="com.beans.app.AppVO" />
<jsp:useBean id="dao" class="com.beans.app.AppDAO" />
<% vo = dao.getmemberList(num); %>

<jsp:include page="../include/header.jsp" flush="false" />

	<div class="sub-bn sub-bn-bg-2">
		<h4>'<%= vo.getName() %>' 님의 수강신청 내역 수정</h4>
	</div>
	
	<div class="up-container">
		<div class="up-table">
			<ul>
				<li class="up-title">고객 유형 선택</li>
				<li>
					<input type="radio" name="productType" value="1" checked>일반
					<input type="radio" name="productType" value="2">내일 배움 카드 소지자
				</li>
			</ul>
			<ul>
				<li class="up-title">바리스타 과정 선택</li>
				<li>
					<input type="radio" name="process" value="1" checked>초급반
					<input type="radio" name="process" value="2">중급반
					<input type="radio" name="process" value="3">고급반
				</li>
			</ul>
			<ul>
				<li class="up-title">방문 날짜 선택</li>
<%
	if(vo.getVisitDate() == null) {
%>
		<li>온라인 신청</li>
<%
	}else {
%>
				<li>
					<input type="date" name="visitDate">
				</li>
<%
	}
%>
			</ul>
			<ul>
				<li class="up-title">시간 선택</li>
<%
	if(vo.getVisitTime() == null) {
%>
<li>온라인 신청</li>
<%
	}else {
%>
				<li>
					<input type="radio" name="visitTime" value="9">&nbsp&nbsp09:00
					<input type="radio" name="visitTime" value="10">&nbsp&nbsp10:00
					<input type="radio" name="visitTime" value="11">&nbsp&nbsp11:00
					<input type="radio" name="visitTime" value="12">&nbsp&nbsp12:00
					<p></p>
					<input type="radio" name="visitTime" value="13">&nbsp&nbsp13:00
					<input type="radio" name="visitTime" value="14">&nbsp&nbsp14:00
					<input type="radio" name="visitTime" value="15">&nbsp&nbsp15:00
					<input type="radio" name="visitTime" value="16">&nbsp&nbsp16:00
				</li>
<%
	}
%>
			</ul>
			<ul>
				<li class="up-title">이름</li>	<li><%= vo.getName() %></li>
			</ul>
			<ul>
				<li class="up-title">휴대폰 번호</li>	<li><%= vo.getNumber() %></li>
			</ul>
		</div>
	</div>
		
	<div class="clear"></div>
	
	<div class="flex">
		<button onClick="javascript:history.back()" class="btn appBack">뒤로가기</button>
		<a href="../member/admin-memberList.jsp" class="btn btn-dark">변경완료</a>
	</div>
</body>
</html>