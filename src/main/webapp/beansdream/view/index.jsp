<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<jsp:include page="../include/header.jsp" flush="false" />

<% String id = (String) session.getAttribute("idKey"); %>

<div id="fullpage"> <!-- fullpage 영역 -->

		<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
			<source src="../video/coffee.mp4">
		</video>
		<div class="section " id="section0"> <!-- main 영역 -->
			<div class="m-box">
				<div class="m-box1"></div>
				<div class="m-box2"></div>
				<div class="m-box3"></div>
				<div class="m-box4"></div>
				<div class="m-box5"></div>
			</div>
			<div class="container">
				<h1 class="m-t1">what is a</h1>
				<h1 class="m-t2">good</h1>
				<h1 class="m-t3">coffee?</h1>
			</div>
			<div class="m-scroll">
				<p class="m-scroll-1"><i class="fa-solid fa-chevron-down"></i></p>
				<p class="m-scroll-2"><i class="fa-solid fa-chevron-down"></i></p>
				<p class="m-scroll-txt">Scroll Down</p>
			</div>
		</div> <!-- main 영역 끝-->

		<div class="section" id="section1"> <!-- introduce 영역 -->
			<div class="fs-carousel">
		        <div class="flexslider carousel">
      	            <div class="id-title">
						<h2>introduce</h2>
						<p>프리미엄 원두와 최고의 커피향을 제공합니다.</p>
					</div>
		            <ul class="slides">
		                <li>
	                		<ul class="cir-wrap">
			                	<li class="item cir-item">
			                    	<div class="cir cir-1">
			                        	<h3>Bourbon Santos</h3>
				                        <p>from Brazil</p>
				                        <a href="#">more</a>
			                    	</div>
			                    	<!-- <div class="id-thumb id-bg-1"></div> -->	
			                	</li>
		                	</ul>
		                </li>
		                <li>
		                	<ul class="cir-wrap">
			                	<li class="item cir-item">
			                    	<div class="cir cir-2">
			                    	<div class="id-thumb-2"></div>
			                        	<h3>Ache Gayo</h3>
				                        <p>from Indonesia</p>
				                        <a href="#">more</a>
			                    	</div>
			                    		
			                	</li>
		                	</ul>
		                </li>
		                <li>
							<ul class="cir-wrap">
			                	<li class="item cir-item">
			                    	<div class="cir cir-3">
			                    	<div class="id-thumb-3"></div>
			                        	<h3>Kenya Coffee</h3>
				                        <p>from Kenya in Africa</p>
				                        <a href="#">more</a>
			                    	</div>
			                    	<!-- <div class="id-thumb id-bg-1"></div> -->	
			                	</li>
		                	</ul>
		                </li>
		            </ul>
		        </div>
		    </div>
		</div> <!--  introduce 끝  -->

		<div class="section" id="section2"> <!-- extraction 영역 -->
			<div class="ec-mainbg" id="extraction"> 		<!-- ec영역 전체박스 -->
				<div class="ec-bg1box"></div>			<!-- 배경이미지 -->
				<div class="ec-bg1 mainbg1-1"></div>			<!-- 1~25번까지 배경 오퍼시티 박스 -->
				<div class="ec-bg1 mainbg1-2"></div>
				<div class="ec-bg1 mainbg1-3"></div>
				<div class="ec-bg1 mainbg1-4"></div>
				<div class="ec-bg1 mainbg1-5"></div>
				<div class="ec-bg1 mainbg1-6"></div>
				<div class="ec-bg1 mainbg1-7"></div>
				<div class="ec-bg1 mainbg1-8"></div>
				<div class="ec-bg1 mainbg1-9"></div>
				<div class="ec-bg1 mainbg1-10"></div>
				<div class="ec-bg1 mainbg1-11"></div>
				<div class="ec-bg1 mainbg1-12"></div>
				<div class="ec-bg1 mainbg1-13"></div>
				<div class="ec-bg1 mainbg1-14"></div>
				<div class="ec-bg1 mainbg1-15"></div>
				<div class="ec-bg1 mainbg1-16"></div>
				<div class="ec-bg1 mainbg1-17"></div>
				<div class="ec-bg1 mainbg1-18"></div>
				<div class="ec-bg1 mainbg1-19"></div>
				<div class="ec-bg1 mainbg1-20"></div>
				<div class="ec-bg1 mainbg1-21"></div>
				<div class="ec-bg1 mainbg1-22"></div>
				<div class="ec-bg1 mainbg1-23"></div>
				<div class="ec-bg1 mainbg1-24"></div>
				<div class="ec-bg1 mainbg1-25"></div>

				<div class="ec-container">			<!-- 안전영역 -->
					<div class="ec-txtbox">			<!-- 메인 텍스트 영역 -->
						<h2 class="ec-main-txt">extraction</h2>			<!-- 메인텍스트 -->
						<p class="ec-sub-txt">최고의 원두를 다양한 추출방법으로 즐겨보세요.</p>			<!-- 서브텍스트 -->
					</div>
					<ul class="ec-mainbox">			<!-- 메인박스 영역 -->
						<li><a href="#">에스프레소</a></li>			<!-- JS-click이벤트 -->
						<li><a href="#">콜드브루</a></li>
						<li><a href="#">프렌치 프레스</a></li>
					</ul>
					<ul class="ec-subbox">			<!-- 서브박스 영역 -->
						<li class="ec-txt ecatv"><p>세 가지 추출방법으로 <br>원두를 즐겨보세요 !!</p></li>			<!-- JS-click이벤트 -->
						<li class="ec-txt"><p>원두 가루를 담고 고온,고압으로 물을 가열하여<br>원두가루에 통과시켜 원액을 추출한다.</p></li>
						<li class="ec-txt"><p>찬물을 한 방울씩 떨어뜨려 추출한다.<br>방울간격은 원두 분쇄도, 로스팅 정도를 보고<br>2~5초 사이로 결정한다.</p></li>
						<li class="ec-txt"><p>핸드드립용 보다 굵게 분쇄한 원두를 사용,<br>90도 내외의 뜨거운 물로 우려준다.<br>2~3분 이상 우리게 되면 쓴 맛이 날 수 있다.</p></li>
					</ul>
				</div> <!-- 안전영역 끝 -->

			</div> <!-- ec영역 전체박스 끝 -->
		</div>	<!-- extraction 영역 끝 -->

	<div class="section" id="section3"> 
	    <div class="ct-mainbg" id="contact">
			<div class="ct-container">
				<div class="ct-title">
					<h2>contact</h2>
					<p>원하는 바리스타 과정에 함께하세요.</p>
				</div>
				<div class="subTitle">
					<h3>상담 유형을 선택해주세요</h3>
					<div class="ct-box">
<%
	if(id == null){
%>
						<button onClick="check_appOff('<%= id %>')" class="btn btn-dark ct-btn"> 방문 <span>상담 신청</span></button>
						<button onClick="check_appOn('<%= id %>')" class="btn btn-dark ct-btn"> 온라인 <span>상담 신청</span></button>

<%
	}else {
		if (id.equals("admin")){
%>
					<button onClick="check_appOff('<%= id %>')" class="btn btn-dark ct-btn"> 방문 <span>상담 신청</span> </button>
					<button onClick="check_appOn('<%= id %>')" class="btn btn-dark ct-btn"> 온라인 <span>상담 신청</span></button>
					<button onClick="check_appList()" class="btn btn-dark ct-btn"> <span>상담 신청</span>목록 </button>
<%
		}else {
%>
					<button onClick="check_appOff('<%= id %>')" class="btn btn-dark ct-btn"> 방문 <span>상담 신청</span> </button>
					<button onClick="check_appOn('<%= id %>')" class="btn btn-dark ct-btn"> 온라인 <span>상담 신청</span> </button>
<%
		}
	}
%>
					</div>
					<h3>상담신청 운영 시간 안내</h3>
					<div class="ct-box">
						<div class="ct-guide">
							<h5>방문 상담 신청</h5>
							<div class="cont">
								<p>방문상담 예약신청</p>
								<p>평일 09:00 ~ 22:00 / 토요일 09:00 ~ 18:00</p>
							</div>
						</div>
						<div class="ct-guide">
							<h5>온라인 상담 신청</h5>
							<div class="cont">
								<p>24시간 접수 가능</p>
								<p>과정별 전문 컨설턴트가 상담 신청 내용 확인 후 유선으로 연락 드립니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	</div> <!-- fullpage 영역 끝 -->
	
	<script>
		function check_appOff(id) {
			if(id == 'null'){
				alert("로그인이 필요합니다. 로그인 또는 회원가입을 해주세요.");
				 location.href="../member/login.jsp";
				
			}else {
				location.href="../app/appOff.jsp";
			}
		}
		function check_appOn(id) {
			if(id == 'null'){
				alert("로그인이 필요합니다. 로그인 또는 회원가입을 해주세요.");
				 location.href="../member/login.jsp";
				
			}else {
				location.href="../app/appOn.jsp";
			}
		}
		function check_appList() {
			location.href="../app/appList.jsp";
		}
	</script>
	
</body>
</html>