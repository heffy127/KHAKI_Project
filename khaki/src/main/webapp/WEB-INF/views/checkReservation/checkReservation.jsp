<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script>
	$(function() {
		// 현재날짜와 반납한날짜를 비교하여 5일 이상 지나지 않은 주문건만 환불 가능.
		// 5일이 지난 주문건은 환불 불가하며 고객센터로 문의해야 관리자(상담사)가 확인 후 처리 가능.
		var date = new Date();
		var year= String(date.getFullYear());
	    var mon = (date.getMonth()+1)>9 ? ''+(date.getMonth()+1) : '0'+(date.getMonth()+1);
	    var day = date.getDate()>9 ? ''+date.getDate() : '0'+date.getDate();
	    var yr = year.substring(2,4);
	    var now = yr+mon+day;
	    now *= 1;
	    var index = $("#i_storage").val();
	    index *= 1;
	    for (var i = 0; i < index; i++) {
	    	var confirm_endTime = $("#confirm_endTime"+i).text();
	    	confirm_endTime = confirm_endTime.split(".");
	    	confirm_endTime[2] = confirm_endTime[2].split(" ");
	    	end = confirm_endTime[0] + confirm_endTime[1] + confirm_endTime[2];
	    	end = end.substring(0,6);
	    	end *= 1;
	    	confirm_endTime = Number(end);
	    	if(String(now).substring(2,4) == String(confirm_endTime).substring(2,4)) { // 현재 월과 결제한 월이 같을 경우 (ex. 현재=9월 결제=9월)
	    		if((now - confirm_endTime) > 4) {
		    	    $("#refund_btn"+i).attr("disabled", "disabled");
		    	    $("#refund_btn"+i).text("환불 불가 - 고객센터에 문의 하세요.");
			    }
	    	} else if (Number(String(now).substring(2,4)) == 1) { // 현재 월이 1월일 경우
	    		if(Number(String(now).substring(4,6)) > 4) { // 5일 이전 결제건은 환불 불가
	    			$("#refund_btn"+i).attr("disabled", "disabled");
		    	    $("#refund_btn"+i).text("환불 불가 - 고객센터에 문의 하세요.");
	    		}
	    	} else if (Number(String(now).substring(2,4)) > Number(String(confirm_endTime).substring(2,4))) { // 현재 월이 결제한 월보다 클 경우(ex. 현재=10월 결제=9월)
	    		if(Number(String(now).substring(4,6)) > 3) { // 5일 이전 결제건은 환불 불가
	    			$("#refund_btn"+i).attr("disabled", "disabled");
		    	    $("#refund_btn"+i).text("환불 불가 - 고객센터에 문의 하세요.");
	    		}
	    	}
	    	
        }
	    
		for (var i = 0; i < parseInt(index); i++) {
	    	$("#refund_btn"+i).click(function(){
	    		if(!$(this).hasClass("disabled")) {
	    			alert("환불 신청 db처리");
	    		}
	    	})
	    }
	    
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
          		<i class="ni ni-tv-2 text-black"></i> Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="map.do">
              <i class="ni ni-square-pin text-orange"></i> Map
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="board.do">
              <i class="ni ni-bullet-list-67 text-blue"></i> board
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
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html">
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">Map</a>
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
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="resources/assets/img/theme/team-4-800x800.jpg">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold">Jessica Jones</span>
                </div>
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
      </div>
    </nav>
    <!-- End Navbar -->
   <!-- Header -->
    <div class="header bg-gradient-success pb-8 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">
        
        </div>
      </div>
    </div>
    <!-- adddddddddddsddd -->
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col">
          <div class="card shadow border-0">
          	<!-- checkReservation -->
          	<div class="c_content_title" style="margin-top: 3%; margin-left: 3%;">
          		<img src="https://image.flaticon.com/icons/svg/179/179372.svg" style="width: 2.777%; margin-left: 1%; margin-right: 1%;">나의 결제 내역 확인
          	</div>
          	<%
            	int i = 0;
           	%>
          	<c:forEach var="pdto" items="${plist}">
            	<c:if test="${pdto.buy_id eq sessionId}">
          			<div class="confirm_area">
          	  			<div class="confirm_content">
          					<table class="c_content">
                  				<tr><!-- ddddd -->
          	  						<td rowspan="6" style="width: 30%;"><img style="width: 100%;" src="http://www.top-rider.com/news/photo/201803/26912_85506_4812.jpg"></td>
          	  						<td class="c_content_1">차량번호 : </td>
          	  						<td class="c_content_2" style="width: 15%;" id="confirm_carNum">${pdto.buy_carNum }</td>
          	  						<td class="c_content_1">차종 : </td>
          	  						<td class="c_content_2" id="confirm_carModel">${pdto.buy_carIns }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">대여시간 : </td>
          	  						<td class="c_content_2" id="confirm_startTime<%=i%>">${pdto.buy_startTime }</td>
          	  						<td class="c_content_1">반납시간 : </td>
          	  						<td class="c_content_2" class="confirm_endTime" id="confirm_endTime<%= i %>">${pdto.buy_endTime }</td>
          	  						
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">보험종류 : </td>
          	  						<td class="c_content_2" id="confirm_carIns">${pdto.buy_carIns }</td>
          	  						<td class="c_content_1">예상적립포인트 : </td>
          	  						<td class="c_content_2" id="confirm_point">${pdto.buy_point }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">대여주소 : </td>
          	  						<td colspan="3" class="c_content_2" id="confirm_startLocation">${pdto.buy_startLocation }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">반납주소 : </td>
          	  						<td colspan="3" class="c_content_2" id="confirm_returnLocation">${pdto.buy_returnLocation }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">결제금액 : </td>
          	  						<td class="c_content_2"><img style="width: 15%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_amount">${pdto.buy_amount }</div>원</td>
          	  						<td class="c_content_1">추가금액 : </td>
          	  						<td class="c_content_2"><img style="width: 9.3%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_addAmount">${pdto.buy_addAmount }</div>원</td>
          	  					</tr>
          	  					<tr>
          	  						<td></td>
          	  						<td class="c_content_1" style="font-size: 28px;">총 금액 : </td>
          	  						<td class="c_content_2"><img style="width: 15%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_totalAmount">${pdto.buy_totalAmount }</div>원</td>
          	  						<td colspan="2">
          	  							<button type="button" class="btn btn-outline-danger c_content_payBtn" id="refund_btn<%= i %>">환불신청하기</button>
          	  						</td>
          	  					</tr>
              				 </table>
              				 <%
          	  					i += 1;
          	  				 %>
          				</div>
          			</div>
				</c:if>
			</c:forEach>
			<input type="hidden" id="i_storage" value="<%= i %>">
          	
          
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
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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