<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Beans Dream</title>
	<link rel="shortcut icon" href="../imgs/favicon.ico">
	<link rel="stylesheet" href="../fullpage/jquery.fullPage.css">
	<link rel="stylesheet" href="../css/extraction.css">
	<link rel="stylesheet" href="../css/contact.css">
	<link rel="stylesheet" href="../css/main.css">
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/header.css">
	<link rel="stylesheet" href="../css/member-style.css">
	<link rel="stylesheet" href="../css/app-style.css">
	<link rel="stylesheet" href="../css/fs-carousel.css">
	<link rel="stylesheet" href="../css/flexslider.css">
	<link rel="stylesheet" href="../css/introduce.css">
    
	<script src="https://kit.fontawesome.com/2e9d95ab38.js" crossorigin="anonymous"></script>
	<script src="../js/jquery-1.12.4.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
	<script type="text/javascript" src="../fullpage/scrolloverflow.js"></script>
	<script type="text/javascript" src="../fullpage/jquery.fullPage.js"></script>
	<script src="../js/extraction.js"></script>
	<script src="../js/header.js"></script>
	<script src="../js/main.js"></script>
	<script src="../js/member-script.js"></script>
    <script src="../js/jquery.flexslider.js"></script>
    <script src="../js/fs-carousel.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#fullpage').fullpage({
	            anchors: ['firstPage', 'idPage', 'ecPage', 'ctPage'],
	            menu: '#menu',
	            scrollingSpeed: 800
         	});
		});
	</script>
</head>
<body>
	
	<header>
		<a href="#" id="trigger">
			<span></span>
			<span></span>
			<span></span>
		</a>
		<h1 class="m-logo fhdlogo"><a href="../view/index.jsp" id="fhd-1st"><img src="../imgs/fhdlogo.png" alt="main-logo"></a></h1>
		<h1 class="m-logo tbllogo"><a href="../view/index.jsp" id="tbl-1st"><img src="../imgs/tbllogo.png" alt="main-logo"></a></h1>
		<nav>
			<ul class="topmenu">
<%
	if (id != null) {
%>
    	<li class="w-txt"><a href="#"><strong><%=id %></strong>님 환영합니다.</a></li>
        <li><a href="../member/logout.jsp">로그아웃</a></li>
        <li><a href="../member/mypage.jsp">마이페이지</a></li>
<%
		if(id.equals("admin")) {
%>
			<li><a href="../member/admin-memberList.jsp">회원목록</a></li>
<%
		}
	}else {
%>
		<li><a href="../member/login.jsp">login</a></li>
		<li><a href="../member/memberJoin.jsp">Join</a></li>
<%
	}
%>
			</ul>
			<ul id="mmenu">
				<li><a href="../view/index.jsp#idPage" id="2page"class="ml">introduce</a></li>
				<li><a href="../view/index.jsp#ecPage" id="3page"class="ml2">extraction</a></li>
				<li><a href="../view/index.jsp#ctPage" id="4page"class="ml4">contact</a></li>
			</ul>
		</nav>
	</header> 