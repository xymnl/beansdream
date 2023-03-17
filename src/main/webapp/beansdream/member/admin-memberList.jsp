<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Vector" %>
<%@ page import="com.beans.member.MemberVO" %>

<jsp:useBean id="dao" class="com.beans.member.MemberDAO" />
<% Vector<MemberVO> mlist = dao.getMemberList(); %>

<jsp:include page="../include/header.jsp" flush="false" />

	<div class="sub-bn sub-bn-bg-3">
		<h4>회원목록</h4>
	</div>
	
	<div class="flex adList">
		<input type="text" placeholder="검색어 입력" id="search" class="search-box">
	</div>

	<div class="ad-wrap">
		<div class="ad-table">
<%
if(mlist.isEmpty()) {
%>
			<ul><li>회원 목록이 없습니다.</li></ul>
<%
}else{
	for(int i=0; i<mlist.size(); i++) {
		MemberVO mvo = mlist.get(i);
		String id = mvo.getId();
		String name = mvo.getName();
		String zipcode = mvo.getZipcode();
		String addr = mvo.getAddr();
		String birth = mvo.getBirth();
		String mobile = mvo.getMobile();
		String email = mvo.getEmail();
%>
			<ul class="slide">
				<li class="ad-item">
				<h3>회원정보</h3>
				<h6 class="ad-title">아이디</h6>	<span class="ad-sub"><button type="button" id="userid" class="btn btn-dark adbt" value="<%=id %>"><%=id %></button></span>
				<h6 class="ad-title">이름</h6><span class="ad-sub"><%=name %></span>
<%
String gender = null;
if(mvo.getGender().equals("1")) {
	gender = "남자";
}else{
	gender = "여자";
}
%>
				<h6 class="ad-title">성별</h6><span class="ad-sub"><%=gender %></span>
				<h6 class="ad-title">생일</h6><span class="ad-sub"><%=birth %></span>
				<h6 class="ad-title">우편번호</h6><span class="ad-sub"><%=zipcode %></span>
				<h6 class="ad-title">주소</h6><span class="ad-sub ad-addr"><%=addr %></span>
				<h6 class="ad-title">연락처</h6><span class="ad-sub"><%=mobile %></span>
				<h6 class="ad-title">이메일</h6><span class="ad-sub"><%=email %></span>
				</li>
			</ul>
<%
	} //for-end
} //else-end
%>	
		</div>
	</div>
	
	<script>
	$('button#userid').on('click', function(){
		var id = $(this).val(); 
		alert(id+'님을 선택했습니다.'); 
		var url = 'admin-update.jsp?userid='+id;
		$(location).attr('href', url); 
	});
	$('#search').keyup(function() {
		var value = $(this).val().toLowerCase();
		$('.adtable').filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
		});
	});
</script>
	
</body>
</html>