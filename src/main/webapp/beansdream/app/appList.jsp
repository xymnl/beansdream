<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Vector" %>	
<%@ page import = "com.beans.app.AppVO" %>

<%@ page import="java.util.Vector" %>
<%@ page import="com.beans.app.AppVO" %>

<jsp:useBean id="dao" class="com.beans.app.AppDAO" />
<% Vector<AppVO> mlist = dao.getMemberList(); %>

<jsp:include page="../include/header.jsp" flush="false" />

	<div class="appList">
		<h4 class="listTitle">상담 신청 목록</h4>
		<p style="color:#FFF" style="text-align:center">순번을 누르시면 수정 화면으로 이동됩니다.</p>
	</div>
<%
	if(mlist.isEmpty()) { 
%>
		<h3 class="list-none">수강 신청 목록이 없습니다.</h3>
<%
	}else {
%>
		<div class="search-box">
			<input type="text" placeholder="검색어 입력" id="search" class="input-box">
		</div>
		
		<div class="ap-container">
			<div class="app-table">
	            <ul class="subject">
	                <li>순번</li>
	                <li>고객 유형</li>
	                <li>바리스타 과정</li>
	                <li>방문 날짜</li>
	                <li>방문 시간</li>
	                <li>이름</li>
	                <li>연락처</li>
	                <li>삭제하기</li>
	            </ul>
<%
		for (int i=0; i<mlist.size(); i++) {
			AppVO mvo = mlist.get(i);
			String num = mvo.getNum();
%>
		<form name="deleteFrm" id="deleteFrm" action="../member/admin-deleteMemberPro.jsp" method="post">
			<input type="hidden" name="num" value="<%=num %>" >
		</form>
            <ul class="sublist">
                <li><%= num %></li>
<%
			String productType = null;
			if(mvo.getProductType().equals("1")){
				productType = "일반";
			}else {
				productType = "내일 배움 카드 소지자";
			}
%>
                <li><%=productType %></li>
<%
			String process = null;
			if(mvo.getProcess().equals("1")) {
				process = "초급 과정";
			}else if (mvo.getProcess().equals("2")) {
				process = "중급 과정";
			}else {
				process = "고급 과정";
			}
%>
                <li><%=process %></li>
<%
			String visitDate = mvo.getVisitDate();
			if(visitDate == null){
%>
                <li>온라인 신청</li>
<%
			}else {
%>
                <li><%=visitDate %></li>
<%
			}
			String visitTime = mvo.getVisitTime();
			
			if(mvo.getVisitTime()==null) {
				visitTime = "온라인 신청";
			}else if(mvo.getVisitTime().equals("9")) {
				visitTime = "오전 9시";
			}else if (mvo.getVisitTime().equals("10")) {
				visitTime = "오전 10시";
			}else if (mvo.getVisitTime().equals("11")) {
				visitTime = "오전 11시";
			}else if (mvo.getVisitTime().equals("12")) {
				visitTime = "오전 12시";
			}else if (mvo.getVisitTime().equals("13")) {
				visitTime = "오후 1시";
			}else if (mvo.getVisitTime().equals("14")) {
				visitTime = "오후 2시";
			}else if (mvo.getVisitTime().equals("15")) {
				visitTime = "오후 3시";
			}else {
				visitTime = "오후 4시";
			}
%>
                <li><%=visitTime %></li>
<%
			String name = mvo.getName();
%>
                <li><%=name %></li>
<%
			String number = mvo.getNumber(); 
%>
                <li><%=number %></li>
                <li><button onClick="deleteClass()" class="btn btn-dark userDbtn" >삭제</button></li>
            </ul>

<%
		}
	}
%>
			</div>
		</div>
	
	<div class="clear"></div>
	
	<div class="flex">
		<button onClick="javascript:history.back()" class="btn appBack">뒤로가기</button>
		<a href="../member/admin-memberList.jsp" class="btn btn-dark">회원목록</a>
	</div>

<script>
	function deleteClass() {
		console.log("하이");
		$("#deleteFrm").submit();
	}
	$('#search').keyup(function() {
		var value = $(this).val().toLowerCase();
		$('.sublist').filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
		});
	});
	
</script>
</body>
</html>