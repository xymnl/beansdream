<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>
<jsp:useBean id="vo" class="com.beans.member.MemberVO" />
<jsp:useBean id="dao" class="com.beans.member.MemberDAO" />
<% vo = dao.getMyInfo(id); %>


<jsp:include page ="../include/header.jsp" flush="false" />

	<div class="sub-bn sub-bn-bg-3">
		<h4>나의 정보</h4>
	</div>	
	
	<div class="my-container">
		<div class="my-table">
			<ul class="mySubject"> <li class="mytitle">아이디</li> <li class="mySub"> <%= id %></li> </ul>
			<ul> <li class="mytitle">비밀번호</li> <li class="mySub"> <%= vo.getPwd() %></li> </ul>
			<ul> <li class="mytitle">이름</li> <li class="mySub"> <%= vo.getName() %></li> </ul>
<%
	String gender = null;
	if(vo.getGender().equals("1")) {
		gender = "남자";
	}else {
		gender = "여자";
	}
%>
			<ul> <li class="mytitle">성별</li> <li class="mySub"> <%=gender%></li> </ul>
			<ul> <li class="mytitle">생일</li> <li class="mySub"> <%= vo.getBirth() %></li> </ul>
			<ul><li class="mytitle">주소</li><li class="mySub"><%=vo.getZipcode() %> &nbsp; <%=vo.getAddr() %></li></ul>
<%
	System.out.println("마이페이지에서 받아오는 우편번호 값 : " + vo.getZipcode());
%>
			<ul> <li class="mytitle">연락처</li> <li class="mySub"> <%= vo.getMobile() %></li> </ul>
			<ul> <li class="mytitle">이메일</li> <li class="mySub"> <%= vo.getEmail() %></li> </ul>
		</div>
	</div>
	
	<div class="clear"></div>
	
	<div class="flex">
<%
	if(id.equals("admin")){
%>
		<a href="logout.jsp" class="btn btn-dark">로그아웃</a>
		<a href="../app/appList.jsp" class="btn btn-dark mypagebtn">수강신청목록</a>
		<a href="updateMember.jsp" class="btn btn-dark">정보수정</a>
		<a href="deleteMemberPro.jsp" class="btn btn-dark">회원탈퇴</a>
<%
	}else {
%>
		<a href="logout.jsp" class="btn btn-dark">로그아웃</a>
		<a href="updateMember.jsp" class="btn btn-dark">정보수정</a>
		<a href="deleteMemberPro.jsp" class="btn btn-dark">회원탈퇴</a>
<%
	}
%>
	</div>

</body>
</html>