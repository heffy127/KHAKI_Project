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
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>1등 카셰어링, khaki</title>
	<!-- Favicon -->
	<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- Icons -->
	<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
	<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
	<!-- CSS Files -->
	<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	$(document).ready(
			function() {
				var recoType = /^[a-z0-9+]{1,15}$/; // 영소문자, 숫자, 6~15자에만 필터링해줌
				var phoneType = /^(?=.*[0-9])[0-9+]*$/; // 숫자만 필터링

				// 휴대폰 번호 유효성 검사
				$('#phone1').keyup(
					function(event){
						if(phoneType.test($(this).val())){
							$(this).attr('class',"form-control is-valid")
							if(phoneType.test($('#phone2').val()) && phoneType.test($('#phone3').val())){
								$.ajax({
									url: "phoneCheck.do?phone1="+$('#phone1').val()+"&phone2="+$('#phone2').val()+"&phone3="+$('#phone3').val(),
									success: function(result) {
									var check = result
									if(check.trim() != 'null'){
										$('#phone1').attr('class',"form-control is-invalid")
										$('#phone2').attr('class',"form-control is-invalid")
										$('#phone3').attr('class',"form-control is-invalid")
										$('#phone_span').attr('style',"color: red; font-size: '1';").text('휴대폰 번호가 중복됩니다.')
									} else {
										$('#phone1').attr('class',"form-control is-valid")
										$('#phone2').attr('class',"form-control is-valid")
										$('#phone3').attr('class',"form-control is-valid")
										$('#phone_span').attr('style',"color: gray; font-size: '1';").text('휴대폰 번호 인증을 진행해주세요.')
									}
								}		
							  })
							}else{
								$('#phone_span').attr('style',"color: red; font-size: '1';").text('휴대폰 번호 정보를 정확히 입력해주세요.')
							}
						}else{
							$(this).attr('class',"form-control is-invalid")
							$('#phone_span').attr('style',"color: red; font-size: '1';").text('휴대폰 번호 정보를 정확히 입력해주세요.')
						}
					}
				)

				$('#phone2').keyup(
					function(event){
						if(phoneType.test($(this).val())){
							$(this).attr('class',"form-control is-valid")
							if(phoneType.test($('#phone1').val()) && phoneType.test($('#phone3').val())){
								$.ajax({ // 휴대폰 중복 체크
									url: "phoneCheck.do?phone1="+$('#phone1').val()+"&phone2="+$('#phone2').val()+"&phone3="+$('#phone3').val(),
									success: function(result) {
									var check = result
									if(check.trim() != 'null'){
										$('#phone1').attr('class',"form-control is-invalid")
										$('#phone2').attr('class',"form-control is-invalid")
										$('#phone3').attr('class',"form-control is-invalid")
										$('#phone_span').attr('style',"color: red; font-size: '1';").text('휴대폰 번호가 중복됩니다.')
									} else {
										$('#phone1').attr('class',"form-control is-valid")
										$('#phone2').attr('class',"form-control is-valid")
										$('#phone3').attr('class',"form-control is-valid")
										$('#phone_span').attr('style',"color: gray; font-size: '1';").text('휴대폰 번호 인증을 진행해주세요.')
									}
								}		
							  })
							}else{
								$('#phone_span').attr('style',"color: red; font-size: '1';").text('휴대폰 번호 정보를 정확히 입력해주세요.')
							}
						}else{
							$(this).attr('class',"form-control is-invalid")
							$('#phone_span').attr('style',"color: red; font-size: '1';").text('휴대폰 번호 정보를 정확히 입력해주세요.')
						}
					}
				)
				
				$('#phone3').keyup(
					function(event){
						if(phoneType.test($(this).val())){
							$(this).attr('class',"form-control is-valid")
							if(phoneType.test($('#phone1').val()) && phoneType.test($('#phone2').val())){
								$.ajax({
									url: "phoneCheck.do?phone1="+$('#phone1').val()+"&phone2="+$('#phone2').val()+"&phone3="+$('#phone3').val(),
									success: function(result) {
									var check = result
									if(check.trim() != 'null'){
										$('#phone1').attr('class',"form-control is-invalid")
										$('#phone2').attr('class',"form-control is-invalid")
										$('#phone3').attr('class',"form-control is-invalid")
										$('#phone_span').attr('style',"color: red; font-size: '1';").text('휴대폰 번호가 중복됩니다.')
									} else {
										$('#phone1').attr('class',"form-control is-valid")
										$('#phone2').attr('class',"form-control is-valid")
										$('#phone3').attr('class',"form-control is-valid")
										$('#phone_span').attr('style',"color: gray; font-size: '1';").text('휴대폰 번호 인증을 진행해주세요.')
									}
								}		
							  })
							}else{
								$('#phone_span').attr('style',"color: red; font-size: '1';").text('휴대폰 번호 정보를 정확히 입력해주세요.')
							}
						}else{
							$(this).attr('class',"form-control is-invalid")
							$('#phone_span').attr('style',"color: red; font-size: '1';").text('휴대폰 번호 정보를 정확히 입력해주세요.')
						}
					}
				)


				$('#forAuthBtn').click(
					function () {
						if($('#phone_span').text() != '휴대폰 번호 인증을 진행해주세요.'){
							swal("휴대폰 번호 입력 정보를 다시 확인해주세요.")
							return false
						}
						var phone = $('#phone1').val() + "-" + $('#phone2').val() + "-" + $('#phone3').val()
						$('#modal-body').append('<iframe src="#"  width="340" height="120" frameborder="0" id="iframe"'  
								+ 'style="box-shadow: 0 15px 35px rgba(50, 50, 93, 0.2), 0 5px 15px rgba(0, 0, 0, 0.17);'
								+ 'border-top-left-radius: 0.4375rem; border-top-right-radius: 0.4375rem;'
								+ 'border-bottom-left-radius: 0.4375rem; border-bottom-right-radius: 0.4375rem;"></iframe>') // 휴대폰 번호 인증 iframe 생성
						$('#iframe').attr("src", "smsPhoneAuth.do?phone=" + phone)
						$('#modal-phoneCheck').modal({backdrop: 'static'}); // 모달 닫힘 방지 
					}
				)

				$('#modal-close').click(
					function () {
						window.closeModal_normal();
				})

				window.closeModal = function(){ // 휴대폰 번호 인증 후 모달이 자동으로 닫힐 때 실행
					$('#modal-phoneCheck').modal('hide')
					$('#phone1').attr('readonly',true)
					$('#phone2').attr('readonly',true)
					$('#phone3').attr('readonly',true)
					$('#forAuthBtn').attr('disabled',true)
					$('#modal-body').empty() // iframe 제거
					$('#phone_span').text('휴대폰 번호 인증이 완료되었습니다.')
					<%session.removeAttribute("sessionPhoneAuth");%>
				}
				
				window.closeModal_normal = function(){ // 휴대폰 번호 인증 모달이 버튼으로 닫힐 때 실행
					$('#modal-phoneCheck').modal('hide')
					$('#modal-body').empty() // iframe 제거
					<%session.removeAttribute("sessionPhoneAuth");%>
					
				}

				

				// 추천인 존재 여부 검사
				$('#reco').keyup(
					function(event) {
						if($("#reco").val().trim() == ''){
							$('#reco_span').attr('style',"color: gray; font-size: '1';").text('다른 KHAKI 회원이 있으면 적어주세요.')
							return false
						}
						if (recoType.test($(this).val())) {
							// 실시간 추천인 체크
							var idCheck = $("#reco").val()
							$.ajax({
								url: "idCheck.do?idCheck=" + idCheck,
								success: function(result){
									var check = result
									if(check.trim() != 'null'){
										$('#reco_span').attr('style',"color: green; font-size: '1';").text('존재하는 회원입니다.')
									}else{
										$('#reco_span').attr('style',"color: red; font-size: '1';").text("존재하지 않는 회원입니다.")
									}
								}
								})
								
							} else{
								$('#reco_span').attr('style',"color: red; font-size: '1';").text("존재하지 않는 회원입니다.")
							}
						})

				$('#next').click(
					function () {
						if($('#phone_span').text() != '휴대폰 번호 인증이 완료되었습니다.'){
							swal('휴대폰 번호 입력 정보를 다시 확인해주세요.')
							$('#phone1').focus()
							return false
						}

						if($('#postcode').val() == null || $('#postcode').val().trim() == "" ){
							swal('주소 입력 정보를 다시 확인해주세요.')
							return false
						}

						if($('#reco_span').text() == '존재하지 않는 회원입니다.'){
							swal('추천인 입력 정보를 다시 확인해주세요.')
							$('#reco').focus()
							return false
						}

						$('#modal-submit').modal({backdrop: 'static'}); // 모달 닫힘 방지 
						
				})
				
				$('#goHome').click(
					function () {
						$("#regi4").attr("action", "smsRegister.do?go=home");
						$('#regi4').submit()
					}
				)
				$('#goLicense').click(
					function () {
						$("#regi4").attr("action", "smsRegister.do?go=license");
						$('#regi4').submit()
					}
				)
			})

		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if(data.userSelectedType === 'R'){
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if(data.buildingName !== '' && data.apartment === 'Y'){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if(extraAddr !== ''){
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("extraAddress").value = extraAddr;
					
					} else {
						document.getElementById("extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress").focus();
				}
			}).open();
		}
	</script>
	</head>

	<body class="bg-default">
	<div class="main-content">
		<!-- Navbar -->
		<nav class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
			<div class="container px-4">
				<a class="navbar-brand" href="home.do"> <img src="resources/assets/img/brand/khaki_burned.png" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse-main"
					aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbar-collapse-main">
					<!-- Collapse header -->
					<div class="navbar-collapse-header d-md-none">
						<div class="row">
							<div class="col-6 collapse-brand">
								<a href="resources/home.do"> <img src="resources/assets/img/brand/blue.png">
								</a>
							</div>
							<div class="col-6 collapse-close">
								<button type="button" class="navbar-toggler" data-toggle="collapse"
									data-target="#navbar-collapse-main" aria-controls="sidenav-main"
									aria-expanded="false" aria-label="Toggle sidenav">
									<span></span> <span></span>
								</button>
							</div>
						</div>
					</div>
					<!-- Navbar items -->
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link nav-link-icon" href="home.do"> <i
									class="ni ni-planet"></i> <span class="nav-link-inner--text">Home</span>
							</a></li>
						<li class="nav-item"><a class="nav-link nav-link-icon" href="login.do"> <i
									class="ni ni-key-25"></i> <span class="nav-link-inner--text">로그인</span>
							</a></li>
						<li class="nav-item"><a class="nav-link nav-link-icon" href="register.do"> <i
									class="ni ni-circle-08"></i> <span class="nav-link-inner--text">회원가입</span>
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
				<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1"
					xmlns="http://www.w3.org/2000/svg">
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
								<h4><font color="gray">① 기본정보 입력&nbsp;&nbsp;&nbsp;→&nbsp;&nbsp;&nbsp;</font><font color="#bb54ff">② 추가정보 입력</font></h4>
						</div>
						<!-- 추가정보 입력 -->
						<div class="card-body px-lg-5 py-lg-5" align="center">
							<form id="regi4" name="regi4" action="" method="post">
								<input type="hidden" value="${memberDTO.id}" name="id">
								<input type="hidden" value="${memberDTO.pw}" name="pw">
								<input type="hidden" value="${memberDTO.name}" name="name">
								<input type="hidden" value="${memberDTO.email_id}" name="email_id">
								<input type="hidden" value="${memberDTO.email_site}" name="email_site">
								<input type="hidden" value="${memberDTO.smsPush}" name="smsPush">
								<input type="hidden" value="${memberDTO.emailPush}" name="emailPush">
								<input type="hidden" value="${socialDTO.social_id}" name="social_id">
								<input type="hidden" value="${socialDTO.social_type}" name="social_type">
								
								<div class="col-10" align="left">
									<table>
										<tr>
											<td>
												<input type="text" class="form-control form-control-alternative" maxlength="3"
													style="text-align: center; font-size: 18px;" id="phone1" name="phone1">
											</td>
											<td>
												&nbsp;-&nbsp;
											</td>
											<td>
												<input type="text" class="form-control form-control-alternative" maxlength="4"
													style="text-align: center; font-size: 18px;" id="phone2" name="phone2">
											</td>
											<td>
												&nbsp;-&nbsp;
											</td>
											<td>
												<input type="text" class="form-control form-control-alternative" maxlength="4"
													style="text-align: center; font-size: 18px;" id="phone3" name="phone3">
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												<button type="button" class="btn btn-outline-success" id="forAuthBtn">인증번호</button>
											</td>
										</tr>
									</table>
									
										<div align="left" style="padding-top: 15px;">&nbsp;&nbsp;
											<span id="phone_span" style="color: gray; font-size: '1';">휴대폰 번호</span>
										</div>
										
								      <div class="modal fade" id="modal-phoneCheck" tabindex="-1" role="dialog" aria-labelledby="modal-phoneCheck" aria-hidden="true">
									    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
									        <div class="modal-content bg-gradient-success">
									        	
									             <div class="modal-header">
									                <h5 class="modal-title" id="modal-title-default" style="color: #f5f5f5;">휴대폰 번호 인증</h5>
									             </div>
									            
									            <div class="modal-body" align="center" id="modal-body" style="padding: 0.5rem;">
									            	
									            	
									                
									            </div>
									            
									            <div class="modal-footer" style="padding: 0.5rem;">
									                <button type="button" class="btn btn-link  ml-auto" id="modal-close" style="color: #f5f5f5; font-size: 20px">닫기</button> 
									            </div>
									            
									        </div>
									    </div>	
								    </div>
    
										
									
									<br>

									<table>
										<tr height='65px'>
											<td width="90%">
												<input type="text" class="form-control form-control-alternative" 
												id="postcode" placeholder="우편번호" readonly="readonly" name="postcode">
											</td>
											<td>
												&nbsp;
											</td>
											<td width="10%">
												<input type="button" class="btn btn-outline-info" 
												value="우편번호 찾기" onclick="execDaumPostcode()"><br>
											</td>
										</tr>
									</table>

								
									<input type="text" class="form-control form-control-alternative" 
												id="address" placeholder="주소" readonly="readonly" name="address1">
										

									<table>
										<tr height='65px'>
											<td width="60%">
												<input type="text" class="form-control form-control-alternative" 
												id="detailAddress" placeholder="상세주소" name="address2">
											</td>
											<td>
												&nbsp;
											</td>
											<td width="40%">
												<input type="text" class="form-control form-control-alternative" 
												id="extraAddress" placeholder="참고항목" readonly="readonly" name="address3">
											</td>
										</tr>
									</table>
									<div align="left" style="padding-top: 5px;">&nbsp;&nbsp;
										<span id="email_span" style="color: gray; font-size: '1';">주소항목은 필수입니다.<br>
										&nbsp;&nbsp;&nbsp;KHAKI의 다양한 이벤트를 통해 경품을 받으실 수 있어요.</span>
									</div>
									<hr style="border: dashed 1px #e6e6e6;">
									<input type="text" class="form-control form-control-alternative" 
									placeholder="추천인" id="reco" name="reco">
									<div align="left" style="padding-top: 5px;">&nbsp;&nbsp;
										<span id="reco_span" style="color: gray; font-size: '1';">다른 KHAKI 회원이 있으면 적어주세요.</span>
									</div>
								<br>

									
								</div>
								<br>
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

									<div class="modal fade" id="modal-submit" tabindex="-1" role="dialog" aria-labelledby="modal-submit" aria-hidden="true">
									<div class="modal-dialog modal-danger modal-dialog-centered modal-" role="document">
										<div class="modal-content bg-gradient-success">
											
											<div class="modal-header" style="justify-content: center;">
													<h5 class="modal-title" id="modal-title-notification">회원가입 기념 100포인트가 지급되었습니다.</h5>
											</div>
											
											<div class="modal-body">
												
												<div class="py-3 text-center">

													<i class="ni ni-bus-front-12 ni-4x"></i>

													<h3 class="heading mt-4">KHAKI에 가입해주셔서 감사합니다!</h3>
													<p>
														최종적으로 회원님의 <font size="4"><b>면허 정보</b></font>를 등록해주셔야<br>
														KHAKI에서 제공하는 카셰어링 서비스를 이용하실 수 있습니다.<br>
														<b>지금 등록하러 가시겠습니까?</b>
													</p>
												</div>
												
											</div>
											
											<div class="modal-footer">
												<button type="button" class="btn btn-white" id="goLicense">네, 지금 등록할래요!</button>
												<button type="button" class="btn btn-link text-white ml-auto" id="goHome"> 나중에 등록할게요</button> 
											</div>
											
										</div>
									</div>
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
							&copy; 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1"
								target="_blank">Creative Tim</a>
						</div>
					</div>
					<div class="col-xl-6">
						<ul class="nav nav-footer justify-content-center justify-content-xl-end">
							<li class="nav-item"><a href="https://www.creative-tim.com" class="nav-link"
									target="_blank">Creative Tim</a></li>
							<li class="nav-item"><a href="https://www.creative-tim.com/presentation" class="nav-link"
									target="_blank">About Us</a></li>
							<li class="nav-item"><a href="http://blog.creative-tim.com" class="nav-link"
									target="_blank">Blog</a></li>
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
	<script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token: "ee6fab19c5a04ac1a32a645abde4613a",
			application: "argon-dashboard-free"
		});
	</script>
</body>

</html>