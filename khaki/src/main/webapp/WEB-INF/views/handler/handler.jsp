<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<html>
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
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		// handler_btn(핸들러 신청하기) 버튼 클릭 시 신청자의 useCount(카키 이용 횟수)를 확인하여 5회 이상일 경우 신청 가능
  		$("#handler_btn").click(function(){ // handler_btn(핸들러 신청하기) 버튼 클릭 시
  			var id = '<%=(String)session.getAttribute("sessionId")%>';  // sessionId를 [id]라는 변수에 담아서
  			if(id == "null") {
  				swal("로그인이 필요한 서비스 입니다.\n 로그인 후 이용 해주세요.");
  				location.href="login.do";
  			} else {
  				$.ajax({ // ajax 실행
  	  		      url:"handlerUseCountCheck.do", // session id의 useCount(이용횟수)를 확인하기 위해 handlerUseCountCheck.do를 실행
  	  		      data : {
  	  		    	  "id" : id // data는 위에서 변수로 저장한 sessionId
  	  		      },
  	  		      success:function(data){ // ajax가 성공했을 때
  	  		    	  if(data == "Y") { // handler/handlerUseCountCheck에 데이터가 Y일 경우 핸들러 신청 가능.
  	  		    	  	  $("#exampleModal").modal({}) // data == Y 일 경우 modal 나타남
  	  		    	  } else { // handler/handlerIdCheck에 데이터가 N이거나 NULL일 경우 핸들러 신청 불가.
  	  		    		  swal("핸들러 신청 조건이 맞지 않아 신청이 불가합니다.\n다시 한 번 확인 후 이용해 주세요.");
  	  		    	  }
  	  		      },
  	  		      error : function(xhr, status) { // ajax가 실패했을 때
  	  	              swal(xhr + " : " + status); // 실패 내용 확인
  	  	          }
  				}) // ajax end
  			
  			} // session else end
  		}) // handler_btn click function end
  		
  	
  		
  	}) // ajax function end
  </script>
</head>

<body class="">
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="home.do">
        <img src="resources/assets/img/brand/khaki2.png" class="navbar-brand-img" alt="...">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <li class="nav-item dropdown">
          <a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="ni ni-bell-55"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="Image placeholder" src="resources/assets/img/theme/team-1-800x800.jpg">
              </span>
            </div>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </a>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </a>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="../index.html">
                <img src="resources/assets/img/brand/blue.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <!-- Form -->
        <form class="mt-4 mb-3 d-md-none">
          <div class="input-group input-group-rounded input-group-merge">
            <input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
            <div class="input-group-prepend">
              <div class="input-group-text">
                <span class="fa fa-search"></span>
              </div>
            </div>
          </div>
        </form>
                <!-- 왼쪽 공통 메뉴 -->
        <ul class="navbar-nav">
          <li class="nav-item ">
          	<a class=" nav-link" href="home.do"> 
          		<i class="ni ni-shop text-black"></i> Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="map.do">
              <i class="ni ni-square-pin text-orange"></i> 카셰어링
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="board.do">
              <i class="ni ni-bullet-list-67 text-blue"></i> 자유게시판
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="notice.do">
              <i class="ni ni-air-baloon text-red"></i> 공지사항
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="coupon.do">
              <i class="ni ni-collection text-green"></i> 쿠폰
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" id="handler_a" style="cursor: pointer;">
              <i class="ni ni-user-run text-yellow"></i> 핸들러
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="cctv.do">
              <i class="ni ni-tv-2 text-black"></i> 교통상황 CCTV
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="nanumCar.do">
              <i class="ni ni-delivery-fast text-blue"></i> 나눔카
            </a>
          </li>
         </ul>
       <!--  -->
       <hr>
      </div>
   </div>
</nav>
  <div class="main-content">
  <!-- Navbar -->
   <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
         <!-- Brand -->
         <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="#none" onclick="location.reload(true)">Handler</a>
        <!-- 우측 상단 프로필 -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
				<c:choose>
						<c:when test="${sessionName != null }">
            		<a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			              <div class="media align-items-center">
			                <span class="avatar avatar-sm rounded-circle">
			                  <img alt="Image placeholder" src="${sessionPhoto}" style="width: 40px; height: 40px;">
			                </span>
			                <div class="media-body ml-2 d-none d-lg-block">
			                  <span class="mb-0 text-sm  font-weight-bold">${sessionName} 님</span>
			                </div>
			              </div>
		            </a>
		             	 </c:when>
	              <c:when test="${sessionName == null }">
					<div>
						<a href="login.do" style="color: white; font-weight: bold;">&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;</a>
					</div>
	              </c:when>
				</c:choose>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="profile.do" class="dropdown-item">
                <i class="ni ni-circle-08"></i>
                <span>회원정보 관리</span>
              </a>
              <a href="profile.do?tab=2" class="dropdown-item">
                <i class="ni ni-time-alarm"></i>
                <span>예약정보 관리</span>
              </a>
              <a href="profile.do?tab=3" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>핸들러 관리</span>
              </a>
              <a href="profile.do?tab=4" class="dropdown-item">
                <i class="ni ni-book-bookmark"></i>
                <span>나의 쿠폰북</span>
              </a>
              <a href="profile.do?tab=5" class="dropdown-item">
                <i class="ni ni-align-center"></i>
                <span>내가 쓴 글 확인</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="sessionLogout.do" class="dropdown-item">
                <i class="ni ni-button-power"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
        <!--  -->
      </div>
   </nav>
   <!-- End Navbar -->
    <!-- Header -->
    <div class="header bg-gradient-default pb-7 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">

        </div>
      </div>
    </div>
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col">
          <div class="card shadow border-0" style="padding: 40px;">
          	<div class="h_head">
				<label>언제 어디서든 핸들로 부가 수입을 올리는, 핸들러 서비스</label>
			</div>
			<div class="h_head2">
				핸들러 서비스에서 차량이동, 주차, 세차 등<br>다양한 미션을 수행하고 수입을 올려보세요.
			</div>
			<div class="h_head3">
				'핸들러 서비스'에 가입하면, 내가 원하는 시간에 언제든 핸들이 가능합니다!
			</div>
			<div class="h_c">
				<div class="h_content">
					<img src="resources/assets/img/brand/h_content1.jpg" style="width: 100%;">
					<label class="h_c_label">재밌고,<br> 다양한 미션!</label><br>
					<label class="h_c_label2">차량을 활용한 다양한 미션을<br>
						수행하면서 또 다른 드라이빙의 재미를
						느껴보세요.</label>
				</div>
				<div class="h_content">
					<img src="resources/assets/img/brand/h_content2.jpg" style="width:100%;">
					<label class="h_c_label">언제나,<br>원하는 시간에!</label><br>
					<label class="h_c_label2">주중 뿐만 아니라, 저녁, 심야시간에도! <br>
						내가 편한시간에 언제든지
						핸들할 수 있어요.</label>
				</div>
				<div class="h_content">
					<img src="resources/assets/img/brand/h_content3.jpg" style="width: 100%">
					<label class="h_c_label">추가로,<br>원하는 만큼!</label><br>
					<label class="h_c_label2">완료일 이후 정해진 기간에 맞춰 입금되는
						핸들 리워드, 성공적인 투잡을 위해 
						핸들러 서비스와 함께해요.</label>
				</div>
			</div>
			<div class="h_u">
				<div class="h_u_head">핸들러 이용 방법</div>
				<div class="h_u_use1">
					<img src="resources/assets/img/brand/h_use1.png" style="width: 100%;">
					<label class="h_u_use1_h">가입하기</label>
					<label class="h_u_use1_c">카키 이용 5회 이상 이용자에 한해 가입이 가능합니다!</label>
				</div>
				<div class="h_u_use_arrow">
					<img src="resources/assets/img/brand/h_use_arrow.png" style="width: 100%;">
				</div>
				<div class="h_u_use1">
				<img src="resources/assets/img/brand/h_use2.png" style="width: 100%;">
					<label class="h_u_use1_h">핸들잡기</label>
					<label class="h_u_use1_c">다양한 미션을 수행하여 포인트를 적립하세요!</label>
				</div>
				<div class="h_u_use_arrow">
					<img src="resources/assets/img/brand/h_use_arrow.png" style="width: 100%;">
				</div>
				<div class="h_u_use1">
					<img src="resources/assets/img/brand/h_use3.png" style="width: 100%;">
					<label class="h_u_use1_h">포인트받기</label>
					<label class="h_u_use1_c">미션 완료 후, 미션에 따라 포인트를 차등 지급해 드려요.</label>
				</div>
				<div class="h_u_info">
				<nav id="h_u_nav1">
					<label class="h_u_info_h">이용안내 / 가입대상</label>
				</nav>
					<label class="h_u_info_c">핸들러 서비스는 전국으로 확대 될 예정입니다.<br>
							운전면허 취득 만 1년 이상, 카키 차량예약 이용 횟수 5회 이상의 조건을 동시에 만족하는 분들은 핸들러를 신청할 수 있습니다.<br></label>
				</div>
				<div class="h_u_info">
				<nav id="h_u_nav2">
					<label class="h_u_info_h">혜택</label>
				</nav>
					<label class="h_u_info_c">
							1.핸들러의 안전을 위하여 모든 핸들에 자차면책보험이 적용됩니다. <br>
							2.보험은 KHAKI 보험약관을 준수합니다.</label>
				</div>
			</div>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-lg btn-block" id="handler_btn" style="margin-top: 5%; margin-bottom: 5%; font-size: 35px; font-family: 'Nanum Gothic Coding', monospace;">핸들러 신청하기</button>
			
			<!-- 지역선택 Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">핸들러 신청 완료</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="form-group">
						<div class="col-sm-3_jkh">
							<div id="association_out" style="width: 100%; height:auto; text-align: center;">
								<label id="handler_label1"><img src="https://image.flaticon.com/icons/svg/762/762048.svg" style="width: 9%; margin-right: 3%;">환영합니다!<img src="https://image.flaticon.com/icons/svg/762/762048.svg" style="width: 9%; margin-left: 3%;"></label>
								<label id="handler_label2"><b id="handler_label3">원하는 </b>시간에! <b id="handler_label3">원하는 </b> 만큼!</label><br>
								<label id="handler_label2">핸들러 서비스를 통하여 더 많은 <b id="handler_label3">혜택</b>을 누려보세요!</label>
								<label id="handler_label2"><b style="color: #7ea07c; font-size: 25px; text-shadow: 2px 1px 1px #10450c;">KHAKI</b> HANDLER SERVICE</label>
							</div>
						</div>
					</div>
			      </div>
			      <div class="modal-footer">
			        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
			        <button type="button" class="btn btn-outline-default" style="width: 100%; font-size: 20px;" id="hanlderToMoveBtn" onclick="location.href='handlerBoard.do'" data-dismiss="modal">이용하러 가기<img src="https://image.flaticon.com/icons/svg/1879/1879039.svg" style="width: 10%; margin-top: 5%; margin-left: 2%;"></button>
			      </div>
			    </div>
			  </div>
			</div> <!-- modal End -->
			
			
		  </div>
        </div>
      </div>
      <!-- Footer -->
      <!-- Footer -->
      <footer class="footer">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              &copy; 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
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
      </footer>
    </div>
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
</body>

</html>