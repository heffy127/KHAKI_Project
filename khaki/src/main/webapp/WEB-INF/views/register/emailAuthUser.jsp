<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--

=========================================================
* Argon Dashboard - v1.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2019 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>1등 카셰어링, khaki</title>
<!-- Favicon -->
<link href="resources/assets/img/brand/favicon.png" rel="icon"
	type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="resources/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />
<link
	href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
					$('#forTimelimit').text("")
						
						var timer = 5;
						var interval = setInterval(function () { // 타이머
									//setInterval(function() { ... }, 지연시간);
							
							$('#time').text("")
							$('#time').text(timer)

							if(--timer < 0){ // timer가 0보다 작아질때
								timer = 0;
								window.close()
							}
							
						}, 1000)
						
						
				
		 })
</script>
</head>

<body class="bg-default">
	<%
		/* 
		이메일 인증을 제대로 했는지 파악하기 위해 세션생성
		해당 세션에는 인증번호 정보가 담겨있어서
		사용자에게 보낸 인증번호와 사용자의 메일 링크를 통해 넘어온 인증번호가 일치하지않으면
		(ex. 이전 인증 메일을 가지고 시도하는 경우 )
		이메일 인증을 허가하지 않음
		*/
		String auth = (String)request.getAttribute("emailAuthNum");
		session.setAttribute("sessionAuthNum", auth);
	%>
	<div class="main-content">
		<!-- Navbar -->
		<nav
			class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
			
		</nav>
		<!-- Header -->
		<div class="header bg-gradient-primary py-7 py-lg-8">
			<div class="container">
				<div class="header-body text-center mb-7">
					<div class="row justify-content-center">
						<div class="col-lg-5 col-md-6">
							<h1 class="text-white">이메일 인증이 완료되었습니다.</h1>
							<h2 class="text-white">기존 회원가입 페이지에서 계속 진행해주세요.</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="separator separator-bottom separator-skew zindex-100">
				<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none"
					version="1.1" xmlns="http://www.w3.org/2000/svg">
					<polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
				</svg>
			</div>
		</div>
		<!-- Page content -->
		<div class="container mt--8 pb-5">
			<!-- Table -->
			<div class="row justify-content-center">
				<div class="col-12 col-md-8">
					<div class="card bg-secondary shadow border-0">
						<!-- 기본정보 입력 -->
						<div class="card-body px-lg-5 py-lg-5" align="center">
							<h1>이 페이지는 <span id="time" style="color: red;"></span>초뒤에 자동으로 닫힙니다.</h1>
							 <img src="resources/assets/img/brand/khaki2.png">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		
	</div>
	<!--   Core   -->
	<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
			window.TrackJS && TrackJS.install({
				token : "ee6fab19c5a04ac1a32a645abde4613a",
				application : "argon-dashboard-free"
			});
		</script>
</body>

</html>