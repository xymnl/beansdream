<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<jsp:include page="../include/header.jsp" flush="false" />

	<div class="sub-bn sub-bn-bg-2">
		<h4>Member Join</h4>
	</div>
	
	<div class="mb-container join-container">
		<form name="regFrm" action="memberJoinPro.jsp" method="post">
			<ul>
				<li class="li-flex">
					<input type="text" name="id" placeholder="아이디 입력" class="form-control input-id" autofocus required>
					<input type="button" value="아이디 중복 확인" onClick="idCheck(this.form.id.value)" class="btn btn-dark input-button">
				</li>
				<li><input type="password" name="pwd" placeholder="비밀번호 입력" class="form-control" required></li>
				<li><input type="password" name="repwd" placeholder="비밀번호 확인" class="form-control" required></li>
				<li><input type="text" name="name" placeholder="이름 입력" class="form-control" required></li>
				<li>
					성별 : 
					<input type="radio" name="gender" value="1" checked> 남자 &nbsp;&nbsp;
					<input type="radio" name="gender" value="2"> 여자
				</li>
				<li>
					생일 : <input type="date" value="2000-01-01" name="birth" class="form-control input-birth">
				</li>
				<li class="li-flex">
					<input type="text" name="zipcode" placeholder="우편번호" class="form-control input-zipcode" readonly>
					<input type="button" value="우편번호 찾기" class="btn btn-dark btn-zipcode" onClick="zipCheck()">
				</li>
				<li><input type="text" name="addr" placeholder="주소" class="form-control addr"></li>
				<li><input type="text" name="mobile" placeholder="휴대폰 번호 입력 '-'를 포함하여 입력해주세요." class="form-control"></li>
				<li><input type="email" name="email" placeholder="이메일 입력 eg. beansdream@bean.com" class="form-control" required></li>
			</ul>
			<div class="flex">
				<button onClick="submitCheck()" class="btn btn-dark">회원가입하기</button>
				<button type="reset" class="btn btn-dark">다시쓰기</button>
				<a href="login.jsp" class="btn btn-dark">로그인</a>
			</div>
		</form>
	</div>
	<div class="clear"></div>















