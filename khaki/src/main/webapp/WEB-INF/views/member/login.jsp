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
  <title>
    1등 카셰어링, khaki
  </title>
  <!-- Favicon -->
  <link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- reCaptcha -->
 <script src="https://www.google.com/recaptcha/api.js" async defer></script>
 <!-- 네이버 아이디 로그인 -->
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 <!-- 카카오 아이디 로그인  -->
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				// 로그인 시도 횟수 세는 세션
				// 5회 시도까지 접속 못하면 매크로로 의심하여 자동입력방지 기능 동작
				if(sessionStorage.getItem('loginCnt') == null){
				sessionStorage.setItem('loginCnt', '0')
				} else if((sessionStorage.getItem('loginCnt').length > 4)){
					$("#reCaptcha").show()
				}
				
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
					
				/* 아이디 저장 Cookie명 userid */
				var cookie = '${userid}'
				if(cookie != ''){
				$("#id").val(cookie)
				$("#id_save").attr("checked",true)
				$('#forCookie').attr('value','yes')
				}
				
				$('#loginBtn').click(
						function(){
							
							// 리캡차가 동작하는 경우 절차를 거쳐야만 로그인
							if(sessionStorage.getItem('loginCnt').length > 4){
								var v = grecaptcha.getResponse()
								if(v.length == 0){ // 0일 경우 체크가 안된것
									alert("자동입력방지 버튼을 클릭해주세요.")
									return false
								}
							}
									var d = $('#loginF').serialize()
									$.ajax({
									type : 'POST',
									url: 'loginCheck.do',
									data: d,
									success: function(result){
										var check = result
										if(check.trim() != 'yes'){
											// 아이디 비밀번호가 안맞을 경우
											alert("로그인 계정을 다시 확인해주세요.")
											if(sessionStorage.getItem('loginCnt').length < 5){
												sessionStorage.setItem('loginCnt', sessionStorage.getItem('loginCnt').concat('0'))
											} else {
												$("#reCaptcha").show()
											}
											location.reload(true);
										}else{
											// 아이디 비밀번호가 맞을 경우
											// 리캡차가 동작하는 경우 절차를 거쳐야만 로그인
										
											sessionStorage.removeItem('loginCnt')
											$('#loginF').submit()
										}
									}
								})					
						})
						
				$('#id_save').click(
						function() { // 아이디 저장
							if($('#id_save').is(':checked')){
								alert("개인 정보 보호를 위해 공용 PC에서는 사용에 유의해 주십시오.")
								$('#forCookie').attr('value','yes')
							} else {
								$('#forCookie').attr('value','no')
							}
				})
				
				$('#findId').click( function() { // 아이디 찾기 모달
					$('#modal-body-findId').append('<iframe src="findId.do" width="420" height="440" frameborder="0" '
							+ 'style="box-shadow: 0 15px 35px rgba(50, 50, 93, 0.2), 0 5px 15px rgba(0, 0, 0, 0.17);'
							+ 'border-top-left-radius: 0.4375rem; border-top-right-radius: 0.4375rem;'
							+ 'border-bottom-left-radius: 0.4375rem; border-bottom-right-radius: 0.4375rem;"></iframe>')
					$('#modal-findId').modal({backdrop: 'static'});	
				})
				
				$('#findPw').click( function() { // 비밀번호 찾기 모달
					$('#modal-body-findPw').append('<iframe src="findPw.do" width="420" height="440" frameborder="0" '
							+ 'style="box-shadow: 0 15px 35px rgba(50, 50, 93, 0.2), 0 5px 15px rgba(0, 0, 0, 0.17);'
							+ 'border-top-left-radius: 0.4375rem; border-top-right-radius: 0.4375rem;'
							+ 'border-bottom-left-radius: 0.4375rem; border-bottom-right-radius: 0.4375rem;"></iframe>')
					$('#modal-findPw').modal({backdrop: 'static'});	
				})
				
				window.closeModal = function(){ // 모달 닫기 펑션
					$('.modal').modal('hide')
					$('.modal-body').empty() // iframe 제거
				}
				
				$('.close').click(
					function () {
						window.closeModal();
				})
		})
</script>
</head>

<body class="bg-default">
  <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
      <div class="container px-4">
        <a class="navbar-brand" href="home.do">
          <img src="resources/assets/img/brand/khaki_burned2.png" />
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar-collapse-main">
          <!-- Collapse header -->
          <div class="navbar-collapse-header d-md-none">
            <div class="row">
              <div class="col-6 collapse-brand">
                <a href="home.do">
                  <img src="resources/assets/img/brand/khaki2.png">
                </a>
              </div>
              <div class="col-6 collapse-close">
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                  <span></span>
                  <span></span>
                </button>
              </div>
            </div>
          </div>
          <!-- Navbar items -->
         <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link nav-link-icon" href="home.do">
                <i class="ni ni-planet"></i>
                <span class="nav-link-inner--text">Home</span>
              </a>
            </li>
			  <li class="nav-item">
			    <a class="nav-link nav-link-icon" href="login.do">
			       <i class="ni ni-key-25"></i>
			          <span class="nav-link-inner--text">로그인</span>
			    </a>
			  </li>
            <li class="nav-item">
              <a class="nav-link nav-link-icon" href="register.do">
                <i class="ni ni-circle-08"></i>
                <span class="nav-link-inner--text">회원가입</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Header -->
    <div class="header bg-gradient-success py-7 py-lg-8">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-lg-5 col-md-6">
              <h1 class="text-white">환영합니다!</h1>
              <p style="color: white;">언제 어디서나 내가 필요한만큼<br>
              		대한민국 1등 카셰어링, KHAKI와 함께 즐거운 드라이빙!
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <!-- Page content -->
    <div class="container mt--8 pb-5">
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary shadow border-0">
            <div class="card-header bg-transparent pb-5">
              <div class="text-muted text-center mt-2 mb-3"><small><b>소셜 로그인</b></small></div>
              
              <div class="btn-wrapper text-center">
              	<!-- 네이버 아이디 버튼 (숨김처리) -->
                <div id="naver_id_login" style="display: none !important;">
                </div>
                 <a href="#" class="btn btn-neutral btn-icon" style="border: 2px solid #31c408"; id="naverBtn">
                  <span class="btn-inner--icon"><img src="resources/assets/img/icons/common/Naver.jpg"></span>
                  <span class="btn-inner--text">Naver</span>
                </a>
                <!-- 카카오 아이디 버튼 (숨김처리) -->
                <a id="kakao-login-btn" style="display: none !important;"></a>
                <a href="#" class="btn btn-neutral btn-icon" style="border: 2px solid #edc600"; id="kakaoBtn">
                  <span class="btn-inner--icon"><img src="resources/assets/img/icons/common/Kakao.png"></span>
                  <span class="btn-inner--text">Kakao</span>
                </a>
              </div>
              
            </div>
            <div class="card-body px-lg-5 py-lg-5">
              <div class="text-center text-muted mb-4">
                <h3 style="color: #9e9e9e;">KHAKI 아이디로 로그인</h3>
              </div>
              
              <!-- Form -->
              <form role="form" id="loginF" name="loginF" action="sessionLogin.do" method="post">
                <div class="form-group mb-3">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-single-02"></i></span>
                    </div>
                    <input class="form-control" placeholder="아이디" type="text" id="id" name="id">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="비밀번호" type="password" id="pw" name="pw">
                  </div>
                </div>
                <div class="custom-control custom-control-alternative custom-checkbox">
                  <input class="custom-control-input" id="id_save" type="checkbox">
                  <label class="custom-control-label" for="id_save">
                    <span class="text-muted">아이디 저장</span>
                  </label>
                  <input type="hidden" name="forCookie" id="forCookie" value="no">
                </div>
                <!-- reCaptcha -->
                <div id="reCaptcha" style="display: none" align="center">
                	<div class="g-recaptcha" data-sitekey="6LejpLQUAAAAAD75JKoObErN4BsK2U4QzBg7L9Fs" style="margin-top: 15px;"></div>
                </div>
                <div class="text-center">
                  <button type="button" class="btn btn-primary my-4" id="loginBtn">로그인</button>
                </div>
              </form>
              
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-6">
           		
            </div>
            <div class="col-6 text-center">
              <a href="#none" class="text-light" id="findId"><small>아이디 찾기</small></a> |
              <a href="#none" class="text-light" id="findPw"><small>비밀번호 찾기</small></a>
              
              <!-- 아이디 찾기 모달 -->
      <div class="modal fade" id="modal-findId" tabindex="-1" role="dialog" aria-labelledby="modal-findId" aria-hidden="true">
   			 <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
      			  <div class="modal-content" style="background: #e9f7d2;">
        	
         			   <div class="modal-header" style="padding: 0.3rem">
               			 	<button type="button" class="close" id="modal-close">
                   		 	<span>×</span>
                			</button>
            			</div>
            
            	<div class="modal-body" id="modal-body-findId">
            	
                
            	</div>
            
        	</div>
       	</div>
    </div>
    
    		<!-- 비밀번호 찾기 모달 -->
      <div class="modal fade" id="modal-findPw" tabindex="-1" role="dialog" aria-labelledby="modal-findPw" aria-hidden="true">
   			 <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
      			  <div class="modal-content" style="background: #f7ded2;">
        	
         			   <div class="modal-header" style="padding: 0.3rem">
               			 	<button type="button" class="close" id="modal-close">
                   		 	<span>×</span>
                			</button>
            			</div>
            
            	<div class="modal-body" id="modal-body-findPw">
            	
                
            	</div>
            
        	</div>
       	</div>
    </div>
              
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="py-5">
      <div class="container">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              © 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
            </div>
          </div>
          <div class="col-xl-6">
            <ul class="nav nav-footer justify-content-center justify-content-xl-end">
              <li class="nav-item">
                <a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a>
              </li>
              <li class="nav-item">
                <a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a>
              </li>
              <li class="nav-item">
                <a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a>
              </li>
              <li class="nav-item">
                <a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a>
              </li>
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
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
 <script type="text/javascript">
    /* 네이버 아이디 로그인 */
  	var naver_id_login = new naver_id_login("FeRQ2NAEFDfGZe9uWQc8", "http://localhost:9999/khaki/callback_login.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,49);
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
		url: "checkSocialJoin.do?social_id=" + kakao_id + "&social_type=kakao",
		success: function(result){
			var check = result
			if(check.trim() != 'null'){ // Social 테이블에 저장된 값 있으면 바로 로그인
				location.href = "sessionLogin.do?id=" + check
				
			}else{
				alert("카카오 소셜 로그인 가입정보가 없습니다.\n회원가입 페이지로 이동합니다.")
				location.href = "register.do"
			}
		}
	})
        }
       })
      },
    fail: function(err) {
         alert(JSON.stringify(err));
        }
      });
</script>
</body>

</html>