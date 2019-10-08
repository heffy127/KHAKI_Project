<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--

=========================================================
* Argon Dashboard - v1.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2019 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)

* Coded by Creative Tim

=\========================================================

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
  <!-- 글씨체 -->
  <link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
  <!-- JQuery CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- 글쓰기 버튼 실행 -->
  <script type="text/javascript">
  $(function(){
		$(".download").click(function(){
			var sId = "<%= session.getAttribute("sessionId")%>"
			var retVal = confirm("쿠폰을 다운받으시겠습니까?");
			if(sId != 'null'){ // 회원이 아니면 다운 불가
				
				if(retVal == true){
					// title 합치기
		  			var cTi1 = $(this).parent().children("#realCp1").text().trim();
		  			var cTi2 = $(this).parent().children("#realCp2").text().trim();
		  			var cp_title = cTi1 + cTi2 ; 
		  			
		  			var cp_num = $(this).parent().children("#realDiscount").text().trim(); //할인정도(값)
		  			
		  			var type = $(this).parent().children("#realOption").text().trim(); //할인종류
		  			var cp_type = "";
		  			if(type == '%'){
		  				cp_type = 'P';
		  			}else{
		  				cp_type = 'M';
		  			}
		  			
		  			var time = $(this).parent().children("#endTimeText").text().trim(); // 시간 텍스트 받아오기
		  			var cp_end = time.split(' 까지')[0]; // 한글 잘라내고 날짜만 db에 넣는 작업
		  			
		  			var cp_name = $(this).children("#real").val().trim(); // 쿠폰 아이디
					var cp_condition = $(this).children("#condition").val().trim(); // 쿠폰 종류

		  			$.ajax({
		  			      url:"couponUseInsert.do",
		  			      data : {
		  			    	  "num" : 0,
		  			    	  "cp_id" : sId,
		  			    	  "cp_title" : cp_title,
		  			    	  "cp_num" : cp_num,
		  			    	  "cp_type" : cp_type,
		  			    	  "cp_end" : cp_end,
		  			    	  "cp_using" : 'N',
		  			    	  "cp_condition" : cp_condition,
		  			    	  "cp_name" : cp_name
		  			      },
		  			      success:function(data){
				  			alert("쿠폰 다운이 완료되었습니다.");
				  			location.href = "coupon.do";
		  			      },
		  			      error : function(xhr, status) {
		  		              alert(xhr + " : " + status);
		  		          }
		  			});
		  			
				}
				
			}else{
				alert("로그인 후 다시 시도해 주십시오.");
			}
		});
	})
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
            <div class\=" dropdown-header noti-title">
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
              <a href="home.do">
                <img \src="resources/assets/img/brand/khaki2.png">
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
        <!-- Navigation -->
       <!-- 왼쪽 공통 메뉴 -->
        <ul class="navbar-nav">
          <li class="nav-item ">
          	<a class=" nav-link" href="home.do"> 
          		<i class="ni ni-tv-2 text-black"></i> Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="map.do">
              <i class="ni ni-square-pin text-orange"></i> Map
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="board.do">
              <i class="fas fa-clipboard-list text-blue"></i> board
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="notice.do">
              <i class="ni ni-air-baloon text-red"></i> Notice
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="coupon.do">
              <i class="ni ni-collection text-green"></i> Coupon
            </a>
          </li>
         </ul>
        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
        <h6 class="navbar-heading text-muted">Documentation</h6>
        <!-- Navigation -->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html">
              <i class="ni ni-spaceship"></i> Getting started
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html">
              <i class="ni ni-palette"></i> Foundation
            </a>
          </li>
          <li class="nav-item">
            <a class\="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html">
              <i class="ni ni-ui-04"></i> Components
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
        <!-- Brand -->
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">Coupon <i class="fas fa-crown"></i></a>
        <!-- Form -->
        <form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
          <div class="form-group mb-0">
            <div class="input-group input-group-alternative">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-search"></i></span>
              </div>
              <input class="form-control" placeholder="Search" type="text">
            </div>
          </div>
        </form>
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
                <i class="ni ni-single-02"></i>
                <span>My profile</span>
              </a>
              <a href="profile.jsp" class="dropdown-item">
                <i class="ni ni-settings-gear-65"></i>
                <span>Settings</span>
              </a>
              <a href="profile.jsp" class="dropdown-item">
                <i class="ni ni-calendar-grid-58"></i>
                <span>Activity</span>
              </a>
              <a href="profile.jsp" class="dropdown-item">
                <i class="ni ni-support-16"></i>
                <span>Support</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="sessionLogout.do" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 400px; background-image: url(resources/assets/img/theme/admin-cover.png); background-size: cover; background-position: center top;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Header container -->
      <div class="container-fluid d-flex align-items-center">
        <div class="row">
          <div class="col-lg-12 col-md-12">
            <h3 class="display-2 text-white">쿠폰다운 <img width="50px;" src="resources/assets/img/icons/coupon/down.png"></h3>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid mt--7">
    
      <!-- 쿠폰 리스트 -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0" style="font-family: 'Hi Melody', cursive; font-size: 30px;">COUPON <i class="fas fa-crown"></i></h3> 
            </div>
              <div class="table align-items-center table-flush">
              	<div id="tabs-icons-text-6" role="tabpanel" aria-labelledby="tabs-icons-text-6-tab" >
      				<div style="width: 100%; float: left; border-right: 8px solid #f5f5f5; padding: 1%;">
				        <div id="cpPage" style="width:100%; text-align:center; margin-bottom: 10px; position: relative;">
							<div id="cp1" style="width: 100%; overflow: auto;">
								<h1>이용 금액별</h1>
								<c:forEach var="list" items="${list}">
									<c:if test="${list.cpCondition eq '1'}">
										<div id="cpFrame" style="width: 28%; height: 650px; float: left; margin: 0 2% 1% 2%; background-image: url('resources/assets/img/icons/coupon/coupon2.png'); background-size: 100% 600px;">
											<label id="realCp1" style="word-wrap:break-word; margin-top:-3%; padding: 80% 5% 0 5%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle1 }</label>
											<label id="realCp2" style="word-wrap:break-word; margin-top:-3%; margin-left: -4%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle2 }</label>
											<label id="realDiscount" style="word-wrap:break-word; margin-top:-10%; margin-bottom:-2%; width: 80%; color: #ffcd4a; font-size: 40px; font-weight: bold; text-align: center;">${list.discount}</label>
											<label id="realOption" style="color: #ffcd4a; font-size: 35px; font-weight: bold; text-align: center; margin-left: -22%;">
												<c:choose>
													<c:when test="${list.cOption eq 'M'}">원</c:when>
													<c:when test="${list.cOption eq 'P'}">%</c:when>
												</c:choose>
											</label>
											
											<label id="endTimeText" style="word-wrap:break-word; margin-top:-11%; width:100%; color: white; font-size: 25px; font-weight: bold; text-align: center;">
												${list.endDate} 까지 
											</label>
											<div id="download" class="download" style="word-wrap:break-word; margin-left:27%; background: #FDDA41; width: 150px; color: #5E9457; font-size: 30px; font-weight: bold; text-align: center; border: 1px solid #FDDA41; cursor: pointer;">
												<input type="hidden" id="real" value="${list.cId}" ><input type="hidden" id="condition" value="${list.cpCondition}">
												<div style="border: 1px solid white;">다운로드</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<hr color="#E1E1E1">
							<div id="cp2" style="width: 100%; overflow: auto;">
								<h1>이용 시간별</h1>
								<c:forEach var="list" items="${list}">
									<c:if test="${list.cpCondition eq '2'}">
										<div id="cpFrame" style="width: 28%; height: 650px; float: left; margin: 0 2% 1% 2%; background-image: url('resources/assets/img/icons/coupon/coupon2.png'); background-size: 100% 600px;">
											<label id="realCp1" style="word-wrap:break-word; margin-top:-3%; padding: 80% 5% 0 5%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle1 }</label>
											<label id="realCp2" style="word-wrap:break-word; margin-top:-3%; margin-left: -4%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle2 }</label>
											<label id="realDiscount" style="word-wrap:break-word; margin-top:-10%; margin-bottom:-2%; width: 80%; color: #ffcd4a; font-size: 40px; font-weight: bold; text-align: center;">${list.discount}</label>
											<label id="realOption" style="color: #ffcd4a; font-size: 35px; font-weight: bold; text-align: center; margin-left: -22%;">
												<c:choose>
													<c:when test="${list.cOption eq 'M'}">원</c:when>
													<c:when test="${list.cOption eq 'P'}">%</c:when>
												</c:choose>
											</label>
											
											<label id="endTimeText" style="word-wrap:break-word; margin-top:-11%; width:100%; color: white; font-size: 25px; font-weight: bold; text-align: center;">
												${list.endDate} 까지 
											</label>
											<div id="download" class="download" style="word-wrap:break-word; margin-left:27%; background: #FDDA41; width: 150px; color: #5E9457; font-size: 30px; font-weight: bold; text-align: center; border: 1px solid #FDDA41; cursor: pointer;">
												<input type="hidden" id="real" value="${list.cId}" ><input type="hidden" id="condition" value="${list.cpCondition}">
												<div style="border: 1px solid white;">다운로드</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<hr color="#E1E1E1">
							<div id="cp3" style="width: 100%; overflow: auto;">
								<h1>이용 시간대별</h1>
								<c:forEach var="list" items="${list}">
									<c:if test="${list.cpCondition eq '3'}">
										<div id="cpFrame" style="width: 28%; height: 650px; float: left; margin: 0 2% 1% 2%; background-image: url('resources/assets/img/icons/coupon/coupon2.png'); background-size: 100% 600px;">
											<label id="realCp1" style="word-wrap:break-word; margin-top:-3%; padding: 80% 5% 0 5%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle1 }</label>
											<label id="realCp2" style="word-wrap:break-word; margin-top:-3%; margin-left: -4%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle2 }</label>
											<label id="realDiscount" style="word-wrap:break-word; margin-top:-10%; margin-bottom:-2%; width: 80%; color: #ffcd4a; font-size: 40px; font-weight: bold; text-align: center;">${list.discount}</label>
											<label id="realOption" style="color: #ffcd4a; font-size: 35px; font-weight: bold; text-align: center; margin-left: -22%;">
												<c:choose>
													<c:when test="${list.cOption eq 'M'}">원</c:when>
													<c:when test="${list.cOption eq 'P'}">%</c:when>
												</c:choose>
											</label>
											
											<label id="endTimeText" style="word-wrap:break-word; margin-top:-11%; width:100%; color: white; font-size: 25px; font-weight: bold; text-align: center;">
												${list.endDate} 까지 
											</label>
											<div id="download" class="download" style="word-wrap:break-word; margin-left:27%; background: #FDDA41; width: 150px; color: #5E9457; font-size: 30px; font-weight: bold; text-align: center; border: 1px solid #FDDA41; cursor: pointer;">
												<input type="hidden" id="real" value="${list.cId}" ><input type="hidden" id="condition" value="${list.cpCondition}">
												<div style="border: 1px solid white;">다운로드</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
				         </div>
			      </div>
      
   				</div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
    </div>
  
</body>

</html>
