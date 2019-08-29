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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		if(${socialDTO.social_id} != null){ /* 소셜 데이터 값이 존재하는 경우 hidden으로 넘겨주도록 설정*/
			var social_id = '${socialDTO.social_id}'
			var social_type = '${socialDTO.social_type}'
			$('#social_id').attr("value",'${socialDTO.social_id}')
			$('#social_type').attr("value",'${socialDTO.social_type}')
			if(social_type == 'naver'){
				$('#accountTitle').empty()
				$('#accountTitle').append(
					"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" 
					+ "<font size='5'><b>회원가입</b>&nbsp;<font size='2'>with</font>&nbsp;<font size='3' color='#17bf44'><b>Naver</b></font></font>"
				)
				
			} else if(social_type == 'kakao'){
				$('#accountTitle').empty()
				$('#accountTitle').append(
					"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" 
					+ "<font size='5'><b>회원가입</b>&nbsp;<font size='2'>with</font>&nbsp;<font size='3' color='#ffd736'><b>KaKao</b></font></font>"
				)
			}
		}

		// 전체동의
		$("#checkAll").click(function() {
			//최상단 체크박스 클릭 input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			if ($("#checkAll").prop("checked")) {
				$("input[name=chk]").prop("checked", true);
			} else {
				//클릭이 안되있으면 input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=chk]").prop("checked", false);
			}
		})
		
		// 약관 모달 동의버튼
		$("#proBtn1").click(function() {
			if(!$("#chk1").prop("checked")){
				$("#chk1").click()
			}
			$(".modal").modal("hide")
		})
		$("#proBtn2").click(function() {
			if(!$("#chk2").prop("checked")){
				$("#chk2").click()
			}
			$(".modal").modal("hide")
		})
		$("#proBtn3").click(function() {
			if(!$("#chk3").prop("checked")){
				$("#chk3").click()
			}
			$(".modal").modal("hide")
		})
		$("#proBtn4").click(function() {
			if(!$("#chk4").prop("checked")){
				$("#chk4").click()
			}
			$(".modal").modal("hide")
		})
		
		// 문자, 이메일 수신 버튼
		$("#smsBtn").click(function() {
			$("#smsPush_chk").click()
		})
		$("#emailBtn").click(function() {
			$("#emailPush_chk").click()
		})
		
		// 다음버튼
		$("#next").click(function() {
			if($("#chk1").is(":checked") && $("#chk2").is(":checked") && $("#chk3").is(":checked") && $("#chk4").is(":checked") ){
				
				if($("#smsPush_chk").is(":checked"))
					$("#smsPush").attr("value","1")
				
				if($("#emailPush_chk").is(":checked"))
					$("#emailPush").attr("value","1")
				
				$('#registerF').submit()
				
			} else {
				alert("필수항목 약관을 체크해주세요. ")
			}
		})
	})
</script>
</head>

<body class="bg-default">
	<div class="main-content">
		<!-- Navbar -->
		<nav class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
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
				<div class="col-12 col-md-8">
					<div class="card bg-secondary shadow border-0">
						<div class="card-header bg-transparent pb-5_1">
							<div class="text-muted text-center mt-2 mb-4" id="accountTitle">
								<font size="5"><b>회원가입</b></font>
							</div>
							<div class="text-center">
								<small> <b>약관에는 '타인명의도용불가', '차량이용규정' 등 중요 내용이 담겨
										있습니다.<br> 약관 동의 체크는 해당 약관을 모두 읽고 숙지하였으며 이에 동의함을 의미합니다.
								</b>
								</small>
							</div>
						</div>
						<!-- 약관 check 박스 -->
						
						<div class="card-body px-lg-5 py-lg-5" align="center">
							<div class="col-9" align="center">

								<div class="custom-control custom-checkbox mb-3" align="left">
									&nbsp;&nbsp;&nbsp;&nbsp; 
									<input class="custom-control-input" id="checkAll" type="checkbox"> <label
										class="custom-control-label" for="checkAll">
										<font size="4"><b>모두 동의합니다.</b></font></label>
								</div>

								<hr style="margin-block-start: 0.2em; margin-block-end: 0.2em;">

								<div align="left">
									<br>
									<!-- 약관 modal -->
									<input type="checkbox" name="chk" value="" id="chk1"> <a href="#" data-toggle="modal"
										data-target="#modal-provision1">&nbsp;&nbsp;KHAKI 회원 이용약관<font
										color="red"> (필수)</font>
									</a>
									<div class="modal fade" id="modal-provision1" tabindex="-1"
										role="dialog" aria-labelledby="modal-default"
										aria-hidden="true">
										<div class="modal-dialog modal- modal-dialog-centered modal-"
											role="document">
											<div class="modal-content">

												<div class="modal-header">
													<h3 class="modal-title" id="modal-title-default">KHAKI
														회원이용약관</h3>
												</div>

												<div class="modal-body">

													<iframe src="provision1.do" width="460" height="450"
														frameborder="0"></iframe>

												</div>

												<div class="modal-footer">
                									<button type="button" class="btn btn-primary" id="proBtn1">동의합니다</button>
               										 <button type="button" class="btn btn-danger  ml-auto" data-dismiss="modal">닫기</button> 
          									    </div>

											</div>
										</div>
									</div>

									<br> <input type="checkbox" name="chk" value="" id="chk2"><a href="#"
										data-toggle="modal" data-target="#modal-provision2">&nbsp;&nbsp;개인정보
										취급방침에 동의<font color="red"> (필수)</font>
									</a>
									<div class="modal fade" id="modal-provision2" tabindex="-1"
										role="dialog" aria-labelledby="modal-default"
										aria-hidden="true">
										<div class="modal-dialog modal- modal-dialog-centered modal-"
											role="document">
											<div class="modal-content">

												<div class="modal-header">
													<h3 class="modal-title" id="modal-title-default">개인정보
														취급방침에 동의</h3>
												</div>

												<div class="modal-body">

													<iframe src="provision2.do" width="460" height="450" frameborder="0"></iframe>


												</div>

												<div class="modal-footer">
                									<button type="button" class="btn btn-primary" id="proBtn2">동의합니다</button>
               										 <button type="button" class="btn btn-danger  ml-auto" data-dismiss="modal">닫기</button> 
          									    </div>

											</div>
										</div>
									</div>

									<br> <input type="checkbox" name="chk" value="" id="chk3"><a href="#"
										data-toggle="modal" data-target="#modal-provision3">&nbsp;&nbsp;자동차대여
										표준 약관에 동의<font color="red"> (필수)</font>
									</a>
									<div class="modal fade" id="modal-provision3" tabindex="-1"
										role="dialog" aria-labelledby="modal-default"
										aria-hidden="true">
										<div class="modal-dialog modal- modal-dialog-centered modal-"
											role="document">
											<div class="modal-content">

												<div class="modal-header">
													<h3 class="modal-title" id="modal-title-default">자동차대여 표준 약관에 동의</h3>
												</div>

												<div class="modal-body">

													<iframe src="provision3.do" width="460" height="450"
														frameborder="0"></iframe>


												</div>

												<div class="modal-footer">
                									<button type="button" class="btn btn-primary" id="proBtn3">동의합니다</button>
               										 <button type="button" class="btn btn-danger  ml-auto" data-dismiss="modal">닫기</button> 
          									    </div>

											</div>
										</div>
									</div>

									<br> <input type="checkbox" name="chk" value="" id="chk4"><a href="#"
										data-toggle="modal" data-target="#modal-provision4">&nbsp;&nbsp;위치기반
										서비스 이용 약관에 동의<font color="red"> (필수)</font>
									</a>
									<div class="modal fade" id="modal-provision4" tabindex="-1"
										role="dialog" aria-labelledby="modal-default"
										aria-hidden="true">
										<div class="modal-dialog modal- modal-dialog-centered modal-"
											role="document">
											<div class="modal-content">

												<div class="modal-header">
													<h3 class="modal-title" id="modal-title-default">위치기반
														서비스 이용 약관에 동의</h3>
												</div>

												<div class="modal-body">

													<iframe src="provision4.do" width="460" height="450"
														frameborder="0"></iframe>


												</div>

												<div class="modal-footer">
                									<button type="button" class="btn btn-primary" id="proBtn4">동의합니다</button>
               										 <button type="button" class="btn btn-danger  ml-auto" data-dismiss="modal">닫기</button> 
          									    </div>

											</div>
										</div>
									</div>
									<br>
									<br>
									
									<!-- 마케팅 정보 수신 동의 -->
									<div align="left">
										<font size="4"><b>마케팅 정보 수신 동의 (선택)</b></font>

										<hr style="margin-block-start: 0.2em; margin-block-end: 0.8em;">
										<input type="checkbox" name="chk" id="smsPush_chk" value=""> <a href="#none" id="smsBtn">문자수신</a> &nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="chk" id="emailPush_chk" value=""> <a href="#none" id="emailBtn">이메일수신</a>
									</div>
									<br>
									<form id="registerF" name="registerF" action="register3.do">
										<input type="hidden" value="0" id="smsPush" name="smsPush">
										<input type="hidden" value="0" id="emailPush" name="emailPush">
										<input type="hidden" value="null" id="social_id" name="social_id">
										<input type="hidden" value="null" id="social_type" name="social_type">
										<!-- 뒤로, 다음 버튼 -->
										<div align="center">
											<a href="javascript:history.back()">
											<button type="button" class="btn btn-secondary btn-lg" style="background-color: #b3afaf;">
											 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뒤로 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
											 </a>
											 &nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-primary btn-lg" id="next"> 
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다음 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
										</div>
									</form>
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
									href="https://www.creative-tim.com/presentation"
									class="nav-link" target="_blank">About Us</a></li>
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
</body>

</html>