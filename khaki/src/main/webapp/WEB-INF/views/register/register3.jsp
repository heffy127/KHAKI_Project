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
				
				// 메일 푸시 동의했을경우 강제 이메일 체크
				if(${memberDTO.emailPush == 1}){
					$('#email_checkbox').attr('disabled',true)
				}
				
				//자바스크립트 정규표현식
				var idType = /^[a-z0-9+]{6,15}$/; // 영소문자, 숫자, 6~15자에만 필터링해줌
				var pwType = /^(?=.*[0-9])(?=.*[!?@#$%^&*])(?=.*[a-zA-Z])[a-zA-Z0-9!?@#$%^&*]{8,18}$/; 
				//			최소 하나 이상의 숫자           문자                         영어              영어 숫자 문자만 입력   8~18자리
				var nameType = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/ // ㄱ에서ㅎ 또는 ㅏ에서ㅣ 또는 가에서힣
				var email_idType = /^(?=.*[A-Za-z0-9])[A-Za-z0-9+]*$/; // 영어, 숫자 필터링해줌 (무조건 1개 이상 입력)
				var email_siteType = /^[a-zA-Z0-9.]+\.[a-zA-Z]{2,5}$/; 
				//                        영어 숫자 .   .이후 영어 2~5자리로 끝내야함
				
				// 아이디 유효성 검사
				$('#id').keyup(
					function(event) {
							if (idType.test($(this).val())) {
								// 실시간 id 중복체크
								var idCheck = $("#id").val()
								$.ajax({
									url: "idCheck.do?idCheck="+idCheck,
									success: function(result){
										var check = result
										if(check.trim() != 'null'){
											$('#id_span').attr('style',"color: red; font-size: '1';").text('중복된 아이디입니다.')
											$('#id').attr('class',"form-control is-invalid")
										}else{
											$('#id_span').attr('style',"color: green; font-size: '1';").text("사용 가능한 아이디입니다.")
											$('#id').attr('class',"form-control is-valid")
										}
									}
								})
							} else {
								$(this).attr('class',"form-control is-invalid")
								$('#id_span').attr('style',"color: red; font-size: '1';").text("영소문자 또는 숫자 6~15글자")
							}
						})
				
				// 비밀번호 유효성 검사
				$('#pw').keyup(
						function(event) {
							
							// 입력할때마다 비밀번호 확인과 비교
							if ($('#pw').val() == $('#pwChk').val()) {
								$('#pwChk').attr('class',"form-control is-valid")
								$('#pwChk_span').attr('style',"color: green; font-size: '1';").text("비밀번호와 일치합니다.")
							} else {
								$('#pwChk').attr('class',"form-control is-invalid")
								$('#pwChk_span').attr('style',"color: red; font-size: '1';").text("비밀번호와 불일치합니다.")
							}
							
							if (pwType.test($(this).val())) { // 정규식 조건 통과
								$(this).attr('class',"form-control is-valid")
								$('#pw_span').attr('style',"color: green; font-size: '1';").text("사용 가능한 비밀번호입니다.")
							} else {
								$(this).attr('class',"form-control is-invalid")
								$('#pw_span').attr('style',"color: red; font-size: '1';").text("영문, 숫자, 특수문자 혼합 8~18글자")
							}
						})
				
				// 비밀번호 확인 검사
				$('#pwChk').keyup(
						function(event) {
							if ($('#pw').val() == $(this).val()) {
								$(this).attr('class',"form-control is-valid")
								$('#pwChk_span').attr('style',"color: green; font-size: '1';").text("비밀번호와 일치합니다.")
							} else {
								$(this).attr('class',"form-control is-invalid")
								$('#pwChk_span').attr('style',"color: red; font-size: '1';").text("비밀번호와 불일치합니다.")
							}
						})
				
				// 한글 실명 입력 검사
				$('#name').keyup(
							function(event){
								if(nameType.test($('#name').val())) {
									$(this).attr('class','form-control form-control-alternative')
									$('#name_span').attr('style',"color: #4f4b94; font-size: '1';").text("본인확인 용도로 사용됩니다.")
								} else {
									$(this).attr('class',"form-control is-invalid")
									$('#name_span').attr('style',"color: red; font-size: '1';").text("한글 실명으로 입력해주세요.")
								}
							})

							
				// 이메일 정보 입력 여부 체크박스
				$('#email_checkbox').click(
					function(){
						// 이메일 체크박스 체크 되어있을때
						if($("#email_checkbox").is(":checked")){
							$('#email_id').attr('disabled',false)
							$('#email_site').attr('disabled',false)
							$('#email_select').attr('disabled',false)
							$('#forAuthBtn').attr('disabled',false)
							$('#email_span').text("이메일 입력")
							
						} else {
							//이메일 체크박스 체크 안되어있을때
							alert("이메일 정보 입력을 통해\nKHAKI에서 제공하는 다양한 혜택정보 수신과\n이메일을 통한 계정찾기 기능을 이용하실 수 있습니다.")
							$('#email_id').val("")
							$('#email_id').attr('disabled',true)
							$('#email_site').attr('disabled',true)
							$('#email_select').attr('disabled',true)
							$('#forAuthBtn').attr('disabled',true)
							$('#email_span').text("")
						}
					}		
				)
							
				// 이메일 아이디 유효성 검사
				$('#email_id').keyup(
					function(){
						if($('#email_span').text() == '이메일 인증이 완료되었습니다.'){
							return false
						}
						if(email_idType.test($('#email_id').val())){
							$(this).attr('class','form-control is-valid')
							if(email_idType.test($('#email_id').val()))
							$.ajax({
									url: "emailCheck.do",
									type: 'POST',
									data: {	
											"email_id":$('#email_id').val(),
											"email_site":$('#email_site').val()
											},
									success: function(result){
										var check = result
										if(check.trim() != 'null'){
											$('#email_span').attr('style',"color: red; font-size: '1';").text('중복된 이메일입니다.')
											$('#email_id').attr('class',"form-control is-invalid")
											$('#email_site').attr('class',"form-control is-invalid")
										}else{
											if(email_siteType.test($('#email_site').val())){
												$('#email_span').attr('style',"color: #4f4b94; font-size: '1';").text("이메일 인증을 진행해주세요.")
												$('#email_id').attr('class',"form-control is-valid")
												$('#email_site').attr('class',"form-control is-valid")
											}
											 else {
												$(this).attr('class',"form-control is-invalid")
												$('#email_span').attr('style',"color: red; font-size: '1';").text("이메일 형식을 확인해주세요.")
												$('#email_site').attr('class',"form-control is-invalid")
											}
										}
									}
								})
						} else {
							$(this).attr('class',"form-control is-invalid")
							$('#email_span').attr('style',"color: red; font-size: '1';").text("이메일 형식을 확인해주세요.")
						}
				})

				// email_site 직접 입력 유효성 검사
				$('#email_site').keyup( 
					function(){
						if($('#email_span').text() == '이메일 인증이 완료되었습니다.'){
							return false
						}
						if(email_siteType.test($('#email_site').val())){
							$(this).attr('class','form-control is-valid')
							if(email_siteType.test($('#email_site').val()))
								$.ajax({
									url: "emailCheck.do?email_id="+$('#email_id').val() + "&" + "email_site=" + $('#email_site').val(),
									success: function(result){
										var check = result
										if(check.trim() != 'null'){
											$('#email_span').attr('style',"color: red; font-size: '1';").text('중복된 이메일입니다.')
											$('#email_id').attr('class',"form-control is-invalid")
											$('#email_site').attr('class',"form-control is-invalid")
										}else{
											if(email_idType.test($('#email_id').val())){
												$('#email_span').attr('style',"color: #4f4b94; font-size: '1';").text("이메일 인증을 진행해주세요.")
												$('#email_id').attr('class',"form-control is-valid")
												$('#email_site').attr('class',"form-control is-valid")
											}
											 else {
												$(this).attr('class',"form-control is-invalid")
												$('#email_span').attr('style',"color: red; font-size: '1';").text("이메일 형식을 확인해주세요.")
												$('#email_site').attr('class',"form-control is-invalid")
											}
										}
									}
								})
						}else{
							$(this).attr('class',"form-control is-invalid")
							$('#email_span').attr('style',"color: red; font-size: '1';").text("이메일 형식을 확인해주세요.")
						}	
								})

				// email select박스 선택 시 이메일 입력창 자동 삽입 및 유효성 검사
				$('#email_select').change(
					function(){
						if($('#email_select option:selected').val() == '' ){
							$('#email_site').val($('#email_select option:selected').val())
							$('#email_site').attr('readonly',false)
							$('#email_site').attr('class',"form-control is-invalid")
							$('#email_span').attr('style',"color: red; font-size: '1';").text("이메일 형식을 확인해주세요.")
						}else{
							$('#email_site').val($('#email_select option:selected').val())
							$('#email_site').attr('readonly',true)
								$.ajax({
										url: "emailCheck.do?email_id="+$('#email_id').val() + "&" + "email_site=" + $('#email_site').val(),
										success: function(result){
											var check = result
											if(check.trim() != 'null'){
												$('#email_span').attr('style',"color: red; font-size: '1';").text('중복된 이메일입니다.')
												$('#email_id').attr('class',"form-control is-invalid")
												$('#email_site').attr('class',"form-control is-invalid")
												return false
											}else{
												if(email_idType.test($('#email_id').val())){
													$('#email_span').attr('style',"color: #4f4b94; font-size: '1';").text("이메일 인증을 진행해주세요.")
													$('#email_id').attr('class',"form-control is-valid")
													$('#email_site').attr('class',"form-control is-valid")
												}
												else {
													$('#email_span').attr('style',"color: red; font-size: '1';").text("이메일 형식을 확인해주세요.")
													$('#email_site').attr('class',"form-control is-invalid")
												}
											}
										}
									})
							
						}
				})
				
				var khakiAuth // KHAKI가 생성하는 인증번호
				var userAuth // 사용자로부터 받는 인증번호
				
				// 이메일 인증
				$('#forAuthBtn').click(
					function () {
						if($('#email_span').text().trim() == "이메일 인증을 진행해주세요.")
						{
							$('#email_span').text("이메일 인증 후 다음 버튼을 눌러주세요.")
							$('#forAuthBtn').attr('class', 'btn btn-warning')
							$('#forAuthBtn').text('발송중')
							$('#forAuthBtn').attr('disabled', true)
							var d = $('#regi3').serialize()
							$.ajax({
								url: "emailAuth.do",
								data: d,
								success: function(result){
									khakiAuth = result.trim() 
									// 메일로 보낸 인증번호를 가져온 후
									// next버튼 눌렀을때 사용자가 세션을 통해 보내온 인증번호와 비교하게 됨
									alert("입력하신 이메일 계정으로 인증메일를 발송했습니다.")
									$('#forAuthBtn').attr('class', 'btn btn-success')
									$('#forAuthBtn').text('발송완료')
									$('#forAuthBtn').attr('disabled', true)
									$('#email_id').attr('readonly', true)
									$('#email_site').attr('readonly', true)
									$('#email_site').attr('readonly', true)
									$('#email_select').attr('disabled', true)
								}
							})


							}else{
								alert("이메일 형식을 확인해주세요.")
							}
					}
				)

					
				
				$('#next').click(
					function () {
						if($('#id_span').text() != '사용 가능한 아이디입니다.'){
							alert('아이디 입력 정보를 다시 확인해주세요.')
							$('#id').focus()
							return false
						}

						if($('#pw_span').text() != '사용 가능한 비밀번호입니다.'){
							alert('비밀번호 입력 정보를 다시 확인해주세요.')
							$('#pw').focus()
							return false
						}

						if($('#pwChk_span').text() != '비밀번호와 일치합니다.'){
							alert('비밀번호 확인 입력 정보를 다시 확인해주세요.')
							$('#pwChk').focus()
							return false
						}

						if($('#name_span').text() != '본인확인 용도로 사용됩니다.'){
							alert('실명 입력 정보를 다시 확인해주세요.')
							$('#name').focus()
							return false
						}
						
						if($("#email_checkbox").is(":checked")){
							if($('#email_span').text() == '이메일 인증 후 다음 버튼을 눌러주세요.'){
								// 사용자가 가입 인증을 제대로 했는지 파악
								var d = 1
								$.ajax({  // 세션을 통해 보내온 인증번호를 ajax를 통해 다른 jsp에서 받아옴
									url: "emailAuth_next.do",
									data: d,
									success: function(result){
										userAuth = result.trim()
										// khaki 인증번호와 사용자가 세션을 통해 보내온 인증번호 비교
										if(khakiAuth != userAuth || khakiAuth == null){
											alert('이메일 인증 정보를 다시 확인해주세요.')
											return false
										}else{
											// 이메일 인증을 위한 세션 삭제
											sessionStorage.removeItem("sessionAuthNum");
											$('#regi3').submit();
										}
									}
								})
							} else {
								alert('이메일 정보를 정확히 입력 후\n인증메일을 통해 이메일 인증을 진행해주세요.')
							}
					} else{
						$('#regi3').submit();
					}
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
				<div class="col-12 col-md-8">
					<div class="card bg-secondary shadow border-0">
						<div class="card-header bg-transparent pb-5_1" align="center">
							<h4>
								<font color="#bb54ff">① 기본정보 입력</font><font color="gray">&nbsp;&nbsp;&nbsp;→&nbsp;&nbsp;&nbsp;②
									추가정보 입력</font>
							</h4>
						</div>
						<!-- 기본정보 입력 -->
						<div class="card-body px-lg-5 py-lg-5" align="center">
							<form id="regi3" name="regi3" action="register4.do" method="post">
								<input type="hidden" value="${memberDTO.smsPush}" name="smsPush">
								<input type="hidden" value="${memberDTO.emailPush}" name="emailPush">
								<input type="hidden" value="${socialDTO.social_id}" name="social_id">
								<input type="hidden" value="${socialDTO.social_type}" name="social_type">
								<div class="col-9" align="left">

									<input type="text"
										class="form-control form-control-alternative"
										placeholder="아이디" id="id" name="id">
									<div align="left" style="padding-top: 5px;">
										&nbsp;&nbsp; <span id="id_span"
											style="color: gray; font-size: '1';">영소문자 또는 숫자 6~15글자</span>
									</div>
									<br> <input type="password"
										class="form-control form-control-alternative"
										placeholder="비밀번호" id="pw" name="pw">
									<div align="left" style="padding-top: 5px;">
										&nbsp;&nbsp; <span id="pw_span"
											style="color: gray; font-size: '1';">영문, 숫자, 특수문자 혼합
											8~16글자</span>
									</div>
									<br> <input type="password"
										class="form-control form-control-alternative"
										placeholder="비밀번호 확인" id="pwChk">
									<div align="left" style="padding-top: 5px;">
										&nbsp;&nbsp; <span id="pwChk_span"
											style="color: gray; font-size: '1';">비밀번호를 한번 더 입력</span>
									</div>
									<br> <input type="text"
										class="form-control form-control-alternative"
										placeholder="이름(실명)" id="name" name="name">
									<div align="left" style="padding-top: 5px;">
										&nbsp;&nbsp; <span id="name_span"
											style="color: gray; font-size: '1';">실명 입력</span>
									</div>
									<br>

									<div class="custom-control custom-checkbox mb-3">
										<input class="custom-control-input" id="email_checkbox" type="checkbox" checked="checked"> 
										<label class="custom-control-label" for="email_checkbox">이메일 정보 (메일푸시, 이메일로 계정 찾기)</label>
									</div>
 
									<table>
										<tr>
											<td><input type="text"
												class="form-control form-control-alternative" id="email_id"
												name="email_id"></td>
											<td>&nbsp;@&nbsp;</td>
											<td><input type="text"
												class="form-control form-control-alternative"
												id="email_site" name="email_site"></td>
											<td>&nbsp;</td>
											<td><select id="email_select" size="1"
												style="height: 45px; border: 1 solid gray;">
													<option value="">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="gmail.com">gmail.com</option>
													<option value="outlook.com">outlook.com</option>
											</select></td>
										</tr>
									</table>

									<table>
										<tr>
											<td width="80%">
												<div align="left" style="padding-top: 5px;">
													&nbsp;&nbsp; <span id="email_span"
														style="color: gray; font-size: '1';">이메일 입력</span>
												</div>
											</td>
											<td width="20%">
												<button type="button" class="btn btn-success"
													id="forAuthBtn" style="height: 40px;">인증메일</button>
											</td>
										</tr>
									</table>
									<br>

								</div>
								<!-- 뒤로, 다음 버튼 -->
								<div align="center">
									<a href="javascript:history.back()">
										<button type="button" class="btn btn-secondary btn-lg"
											style="background-color: #b3afaf;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뒤로
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
									</a> &nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-primary btn-lg" id="next">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다음
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</div>

							</form>

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