<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <!-- 네이버 아이디 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 카카오 아이디 로그인  -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			
			// 네이버 소셜 로그인 버튼 클릭
			$('#naverBtn').click(
				function() {
					$('#naver_id_login_anchor').click()
			})
			
			// 카카오 소셜 로그인 버튼 클릭
			$('#kakaoBtn').click(
				function() {
					$('#kakao-login-btn').click()
			})
		})

</script>
</head>

<body class="bg-default">
	<div class="main-content">
		<!-- Navbar -->
		<nav
			class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
			<div class="container px-4">
				<a class="navbar-brand" href="home.do"> <img
					src="resources/assets/img/brand/khaki_burned.png" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbar-collapse-main"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbar-collapse-main">
					<!-- Collapse header -->
					<div class="navbar-collapse-header d-md-none">
						<div class="row">
							<div class="col-6 collapse-brand">
								<a href="resources/home.do"> <img
									src="resources/assets/img/brand/blue.png">
								</a>
							</div>
							<div class="col-6 collapse-close">
								<button type="button" class="navbar-toggler"
									data-toggle="collapse" data-target="#navbar-collapse-main"
									aria-controls="sidenav-main" aria-expanded="false"
									aria-label="Toggle sidenav">
									<span></span> <span></span>
								</button>
							</div>
						</div>
					</div>
					<!-- Navbar items -->
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link nav-link-icon"
							href="home.do"> <i class="ni ni-planet"></i> <span
								class="nav-link-inner--text">Home</span>
						</a></li>
						<li class="nav-item"><a class="nav-link nav-link-icon"
							href="login.do"> <i class="ni ni-key-25"></i> <span
								class="nav-link-inner--text">로그인</span>
						</a></li>
						<li class="nav-item"><a class="nav-link nav-link-icon"
							href="register.do"> <i class="ni ni-circle-08"></i> <span
								class="nav-link-inner--text">회원가입</span>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- Header -->
		<div class="header bg-gradient-primary py-7 py-lg-8">
			<div class="container">
				<div class="header-body text-center mb-7">
					<div class="row justify-content-center">
						<div class="col-lg-5 col-md-6">
							<h1 class="text-white">아직 KHAKI 회원이 아니신가요?</h1>
							<p style="color: white;">
								가고 싶은 곳 어디든 발이 되어주는<br> 대한민국 1등 카셰어링, KHAKI와 함께하세요.
							</p>
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
				<div class="col-lg-6 col-md-8">
					<div class="card bg-secondary shadow border-0">
						<div class="card-header bg-transparent pb-5_jyp">
						<div class="text-muted text-center mt-2 mb-4"><font size="5"><b>회원가입</b></font></div>
							<div class="text-center">
								<small><b>지금 바로 KHAKI와 함께하세요!</b></small>
							</div>
						</div>
						<div class="card-body px-lg-5 py-lg-5_jyp">
									<div class="text-center text-muted mb-4">
              			</div>
							<a href="register2.do?social_id=null&social_type=null">
							<button type="button" class="btn btn-outline-default">
								<img src="resources/assets/img/icons/register/khaki.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KHAKI에서 이메일로
								회원가입
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</button>
						</a>
							<br>
							<br>
							<!-- 네이버 아이디 버튼 (숨김처리) -->
							<div id="naver_id_login" style="display: none !important;">
							</div>
							<button type="button" class="btn btn-outline-success" id="naverBtn">
								<img src="resources/assets/img/icons/register/naver.jpg">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 네이버 아이디로 회원가입
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</button>
							<br>
							<br>
							<!-- 카카오 아이디 버튼 (숨김처리) -->
                			<a id="kakao-login-btn" style="display: none !important;"></a>
							<button type="button" class="btn btn-outline-warning" id="kakaoBtn">
								<img src="resources/assets/img/icons/register/kakao.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 카카오 아이디로 회원가입
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="py-5">
		<div class="container">
			<div class="row align-items-center justify-content-xl-between">
				<div class="col-xl-6">
					<div class="copyright text-center text-xl-left text-muted">
						&copy; 2018 <a href="https://www.creative-tim.com"
							class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
					</div>
				</div>
				<div class="col-xl-6">
					<ul
						class="nav nav-footer justify-content-center justify-content-xl-end">
						<li class="nav-item"><a href="https://www.creative-tim.com"
							class="nav-link" target="_blank">Creative Tim</a></li>
						<li class="nav-item"><a
							href="https://www.creative-tim.com/presentation" class="nav-link"
							target="_blank">About Us</a></li>
						<li class="nav-item"><a href="http://blog.creative-tim.com"
							class="nav-link" target="_blank">Blog</a></li>
						<li class="nav-item"><a
							href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md"
							class="nav-link" target="_blank">MIT License</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
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
	 <script type="text/javascript">
	  	var naver_id_login = new naver_id_login("FeRQ2NAEFDfGZe9uWQc8", "http://localhost:9999/khaki/callback_register.do");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 3 ,49);
	  	naver_id_login.setDomain("http://localhost:9999/");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
  </script>
    <script type='text/javascript'>
  	/* 카카오 아이디 로그인 */
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('3193e740ee4757b5fed476c12b4b677e');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
  	success: function(authObj) {
   	 Kakao.API.request({
     url: '/v1/user/me',
     success: function(res) {
        var kakao_id = res.id //<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
        $.ajax({ // 소셜 로그인에 id가 저장되어 있는지 조회
			url: "checkSocialJoin.do",
			type: 'POST',
			data: {	
					"social_id" : kakao_id,
					"social_type" : "kakao"
					},
			success: function(result){
				var check = result.trim()
				if(check != 'null'){ // Social 테이블에 저장된 값 있으면 바로 로그인
					swal("이미 가입된 회원이십니다.")
					location.href = "sessionLogin.do?id=" + check
					
				}else{ // 가입 안된 상태이므로 가입창으로 넘어감  
					location.href = "register2.do?social_id=" + kakao_id + "&social_type=kakao"
				}
			}
	})
        }
       })
      },
    fail: function(err) {
         swal(JSON.stringify(err));
        }
      });
</script>
</body>

</html>