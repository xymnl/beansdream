<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="../include/header.jsp" flush="false" />


<div class="app-title">
	<h2>온라인상담신청</h2>
	<p>온라인 상담 예약을 위해 필요한 정보를 알려주세요. </p>
</div>
<div class="insert-block">
	<h3>온라인 상담 예약 정보 입력</h3>
</div>
<form name="loginFrm" action="appOnPro.jsp" method="post">
	<table class="apptbl">
		<tr>
			<td class="tbl-title">고객 유형 선택</td>
			<td class="tbl-elm">
			  <input type="radio" name="productType" value="1" checked>일반
			  <input type="radio" name="productType" value="2">내일 배움 카드 소지자
			</td>
		</tr>
		<tr>
			  <td class="tbl-title">바리스타 과정 선택</td>
			  <td class="tbl-elm">
			    <input type="radio" name="process" value="1" checked>초급반
			    <input type="radio" name="process" value="2">중급반
			    <input type="radio" name="process" value="3">고급반
			  </td>
		</tr>
		
		<tr><td class="tbl-title">이름</td><td><input type="text" name="name" class="input-text" placeholder="한글만 2글자 이상 입력해주세요."> </tr>
		<tr><td class="tbl-title">휴대폰 번호</td><td><input type="text" name="number" class="input-text" placeholder="'-'와 같이 입력해주세요."></td></tr>
	</table>
	<div class="agree-block">
		<h3>개인정보 수집 및 이용에 대한 방침 동의</h3>
		<input type="checkbox" name="agree" value="agree" class="checkbox" required><span  class="bold">개인정보 수집 및 이용에 대한 방침에 동의합니다.</span>
		<a>※ 입력하신 정보는 상담 목적 외에 사용되지 않습니다.</a>
		<div class="agreebox">
			<p>한솔요리학원은 의견을 주시는 기업 및 개인을 대상으로 아래와 같이 개인정보를 수집하고 있습니다.</p>
			<ol>
				<li>수집 개인정보 항목 : 성명, 휴대폰, 선택과정</li>
				<li>개인정보의 수집 및 이용목적 : 온라인 상담신청, 수강료상담,국비지원상담, 요리대회상담, 이벤트 및 CA상담,지점별위치조회, 시간표(개강일)상담, 입시진학상담, 요리유학상담에 필요한 개인정보를 수집, 수집한 정보는 과정문의 & 상담신청에 관한 담당자들의 전화상담</li>
				<li>개인정보의 이용기간 : 모든 검토가 완료된 후 5년간 이용자의 조회를 위하여 보관하며, 이 후 해당정보를 지체없이 파기합니다.</li>
			</ol>
			<p>단, 보유기간을 이용자에게 미리 고지하거나 개별적으로 이용자의 동의를 받은 경우 고지하거나 개별 동의한 기간 보관함.</p>
		</div>
	</div>
	
	<div class="flex apponoff">
		<input type="submit" value="온라인 상담 신청 하기" class="btn btn-dark">
	</div>
	<div class="movePage">
		<a href="appOff.jsp" class="btn btn-dark">방문 상담 신청</a>
		<a href="../view/index.jsp" class="btn btn-dark">홈 화면 이동</a>
	</div>
</form>


</body>
</html>