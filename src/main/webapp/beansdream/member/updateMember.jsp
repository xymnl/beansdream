<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>
<jsp:useBean id="vo" class="com.beans.member.MemberVO" />
<jsp:useBean id="dao" class="com.beans.member.MemberDAO" />
<% vo = dao.getMyInfo(id); %>
    
<jsp:include page="../include/header.jsp" flush="false" />
<script>
	function zipCheck() {
		url = "zipCheck.jsp?check=y";
		window.open(url, "ZipCodeCheck", "width=500, height=500, scrollbars=yes");
	}
</script>

	<div class="sub-bn sub-bn-bg-2">
		<h4>정보 업데이트</h4>
	</div>
	
	<div class="mb-container join-container">
		<form name="regFrm" action="updateMemberPro.jsp" method="post">
			<ul>
				<li><input type="text" name="id" class="form-control" value="<%=id %>" readonly autofocus required></li>
				<li><input type="password" name="pwd" value="<%=vo.getPwd() %>" class="form-control" required></li>
				<li><input type="text" name="name" value="<%=vo.getName() %>" class="form-control" required></li>
				<li>
					성별 : 
					<input type="radio" name="gender" value="1" checked> 남자 &nbsp;&nbsp; 
					<input type="radio" name="gender" value="2"> 여자
				</li>
				<li>생일 : <input type="text" name="birth" value="<%=vo.getBirth() %>" class="form-control input-birth"></li>
				<li>
					<input type="text" name="zipcode" value="<%=vo.getZipcode() %>" class="form-control input-zipcode" readonly>
					<input type="button" value="우편번호 찾기" class="btn btn-dark btn-zipcode" onClick="zipCheck()">
				</li>
				<li><input type="text" name="addr" value="<%=vo.getAddr() %>" class="form-control"></li>
				<li><input type="text" name="mobile" value="<%=vo.getMobile() %>" class="form-control"></li>
				<li><input type="email" name="email" value="<%=vo.getEmail() %>" class="form-control" required></li>
			</ul>
			
			<div class="flex">
				<button type="submit" class="btn btn-dark">수정완료</button>
				<a href="mypage.jsp" class="btn btn-dark">나의정보</a>
			</div>
		</form>
	</div>










