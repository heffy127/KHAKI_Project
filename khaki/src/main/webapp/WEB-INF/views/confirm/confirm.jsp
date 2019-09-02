<%@page import="org.springframework.ui.Model"%>
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
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script>
  	$(function(){
  		var initial_amount = $("#confirm_amount").text();
  		$(".coupon_method").change(function(){
  			$("#confirm_amount").text(initial_amount);
	  		var couponVal = $('select[name=coupon_method]').val();
			var amount = $("#confirm_amount").text();
			var result = amount - couponVal;
			$("#confirm_amount").text(result);
			$("#discount_label").remove();
			$("#amount_div").append("  <label id=\"discount_label\" style=\"font-size: 15px; color: red;\">(할인적용)</label>");
			var amount = parseInt($("#confirm_amount").text());
	  		amount = parseInt(amount * 0.03);
	  		$("#confirm_point").text(amount);
  			
  		})
  		
  		$("#select_couponMethod").hide();
  		$("#cpCheckLabel").click(function() {
  			$("#couponCheckBox").click();
  		})
  		$("#couponCheckBox").change(function(){
  			if ($("input:checkbox[id='couponCheckBox']").is(":checked") == true){
  				var cp_id = $("#cp_id").val();
  				$.ajax({
	  			      url:"couponConfirm.do",
	  			      data : {
	  			    	  "cp_id" : cp_id
	  			      },
	  			      success:function(data){
	  			    	  
	  			    	  $("#cp_method").children().remove();
	  			    	  console.log(data);
	  			    	  $("#cp_method").append(data);
	  			      },
	  			      error : function(xhr, status) {
	  		              alert(xhr + " : " + status);
	  		          }
	  			});
  				$("#select_couponMethod").show();
  			} else {
  				$("#discount_label").remove();
  				$("#confirm_amount").text($("#firsr_amount").val());
  				$("#select_couponMethod").hide();
  			}
  		})
  		
  		var amount = parseInt($("#confirm_amount").text());
  		amount = parseInt(amount * 0.03);
  		$("#confirm_point").text(amount);
  		
  		
  		
  		/* $("#select_couponMethod").click(function(){
			var cp_id = $("#cp_id").val();
  			$.ajax({
			      url:"couponConfirm.do",
			      data : {
			    	  "cp_id" : cp_id
			      },
			      success:function(data){
					  // $("#cp_method").children().remove();
			    	  // console.log(data);
					  // $("#cp_method").append("<option value=\"\" class=\"cpu_choice\" id=\"cpu_choice\">- 쿠폰 선택  -</option>");
			    	  // $("#cp_method").append(data);//aaaabbzzzz
			    	  
			    	  $("#cp_method").children().remove();
			    	  console.log(data);
			    	  $("#cp_method").append(data);//aaaabbzzzz
			      },
			      error : function(xhr, status) {
		              alert(xhr + " : " + status);
		          }
			});
  		}) */
		
  		
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
    
    
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col">
          <div class="card shadow border-0">
          	<div class="confirm_area">
          	  <div class="confirm_content">
          	  	<div class="c_content_title">
          	  		<img src="https://image.flaticon.com/icons/svg/179/179372.svg" style="width: 2.777%; margin-left: 1%; margin-right: 1%;">선택 상품 확인
          	  	</div>
          	  	<div>
          	  		<table class="c_content">
          	  			<tr>
          	  				<td rowspan="6" style="width: 30%;"><img style="width: 100%;" src="http://www.top-rider.com/news/photo/201803/26912_85506_4812.jpg"></td>
          	  				<td class="c_content_1">차량번호 : </td>
          	  				<td class="c_content_2" style="width: 15%;" id="confirm_carNum">${payDTO.buy_carNum }</td>
          	  				<td class="c_content_1">차종 : </td>
          	  				<td class="c_content_2" id="confirm_carModel">${payDTO.buy_carModel }</td>
          	  			</tr>
          	  			<tr>
          	  				<td class="c_content_1">대여시간 : </td>
          	  				<td class="c_content_2" id="confirm_startTime">${payDTO.buy_startTime }</td>
          	  				<td class="c_content_1">반납시간 : </td>
          	  				<td class="c_content_2" id="confirm_endTime">${payDTO.buy_endTime }</td>
          	  			</tr>
          	  			<tr>
          	  				<td class="c_content_1">보험종류 : </td>
          	  				<td class="c_content_2" id="confirm_carIns">${payDTO.buy_carIns }</td>
          	  				<td class="c_content_1">예상적립포인트 : </td>
          	  				<td class="c_content_2"><span id="confirm_point">${payDTO.buy_point }</span>p</td>
          	  			</tr>
          	  			<tr>
          	  				<td class="c_content_1">대여주소 : </td>
          	  				<td colspan="3" class="c_content_2" id="confirm_startLocation">${payDTO.buy_startLocation }</td>
          	  			</tr>
          	  			<tr>
          	  				<td class="c_content_1">반납주소 : </td>
          	  				<td colspan="3" class="c_content_2" id="confirm_returnLocation">${payDTO.buy_startLocation }</td>
          	  			</tr>
          	  			<tr>
          	  				<td class="c_content_1">결제금액 : </td>
          	  				<td class="c_content_2" id="amount_div"><img style="width: 15%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_amount">${payDTO.buy_amount }</div>원</td>
          	  				<td class="c_content_1">결제수단 선택 : </td>
          	  				<td class="c_content_2">
								<div class="fl_left" id="select_payMentMethod">
									<select name="pay_method" id="region_2_n" class="form-control_jkh input-sm">
										<option value="" class="" selected>- 결제 수단 선택 -</option>
										<option value="card" class="payment_method">신용카드</option>
										<option value="trans" class="payment_method" >실시간계좌이체</option>
										<option value="vbank" class="payment_method" >가상계좌</option>
										<option value="phone" class="payment_method" >휴대폰소액결제</option>
					  				</select>
								</div>
							</td>
          	  			</tr>
          	  			<tr>
          	  				<td class="c_content_1" id="couponCheckTd" style="text-align: center;">
          	  					<input type="checkbox" id="couponCheckBox" name="coupon" value="coupon" /><label id="cpCheckLabel" style="cursor: pointer; padding-left: 5%;">쿠폰 적용하기</label>
          	  				</td>
          	  				<td colspan="2">
          	  					<div class="fl_left" id="select_couponMethod" style="padding-right: 2%;">
									<select name="coupon_method" id="cp_method" class="form-control_jkh input-sm coupon_method" style="margin-top: 1.3%; height: 60px;">
										
					  				</select>
								</div>
          	  				</td>
          	  				<td colspan="2">
          	  					<button type="button" class="btn btn-outline-danger c_content_payBtn" id="check_module">결제하기</button>
          	  				</td>
          	  			</tr>
          	  		</table>
          	  	</div>
          	  	<input type="hidden" id="firsr_amount" value="10"> <!-- confirm페이지에서 처음들어온 금액 -->
          	  	<form action="couponConfirm.do" id="couponFrm" name="couponFrm">
	          	  	<input type="hidden" id="cp_id" name="cp_id" value="${sessionId }">
	          	  	<input type="hidden" id="cp_title" name="cp_title" value=" ">
	          	  	<input type="hidden" id="cp_type" name="cp_type" value=" ">
	          	  	<input type="hidden" id="cp_per" name="cp_per" value=" ">
	          	  	<input type="hidden" id="cp_mon" name="cp_mon" value=" ">
	          	  	<input type="hidden" id="cp_end" name="cp_end" value=" ">
          	  	</form>
          	  	<form action="payResult.do" id="payInsert" name="payInsert">
          	  		<input type="hidden" id="buy_num" name="buy_num" value="1">
          	  		<input type="hidden" id="buy_id" name="buy_id" value=""> <!-- session에서 가져온 id -->
          	  		<input type="hidden" id="buy_carIns" name="buy_carIns" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_startTime" name="buy_startTime" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_endTime" name="buy_endTime" value=""> <!-- table과 동일한 데이터 -->
          	  		
          	  		<input type="hidden" id="buy_real_endTime" name="buy_real_endTime" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_driveDistance" name="buy_driveDistance" value=""> <!-- 주행거리(나중에 추가 됨) -->
          	  		<input type="hidden" id="buy_startLocation" name="buy_startLocation" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_returnLocation" name="buy_returnLocation" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_real_returnLocation" name="buy_real_returnLocation" value=""> <!-- table과 동일한 데이터 -->
          	  		
          	  		<input type="hidden" id="buy_carNum" name="buy_carNum" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_carModel" name="buy_carModel" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_point" name="buy_point" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_amount" name="buy_amount" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_addAmount" name="buy_addAmount" value=""> <!-- 추가금액(나중에 추가 됨) -->
          	  		
          	  		<input type="hidden" id="buy_totalAmount" name="buy_totalAmount" value=""> <!-- 총 금액(나중에 추가 됨) -->
          	  		<input type="hidden" id="buy_accident" name="buy_accident" value=""> <!-- 사고정보(나중에 추가 됨) -->
          	  		<input type="hidden" id="buy_coupon" name="buy_coupon" value=""> <!-- table과 동일한 데이터 -->
          	  		<input type="hidden" id="buy_discount" name="buy_discount" value=""> <!-- 할인받은 금액 -->
          	  		<input type="hidden" id="buy_impUid" name="buy_impUid" value=""> <!-- 주문번호(script에서 결제할때 추가 됨) -->
          	  	</form>
          	  	<script>
				$("#check_module").click(function () {
					var sessionId = '<%=(String)session.getAttribute("sessionId")%>';
					
					
					
					// db전송할 때 대여시간과 반납시간을 년.월.일 시:분 형태로 바꿈
					var startTime_sp = String($("#confirm_startTime").text()).split("");
					var endTime_sp = String($("#confirm_endTime").text()).split("");
					var startTime = "";
					var endTime = "";
			  		for (var i = 0; i < startTime_sp.length; i++) {
			  			startTime += startTime_sp[i];
			  			if(i == 1 || i == 3) {
			  				startTime += ".";
			  			} else if(i == 5){
			  				startTime += " ";
			  			} else if(i == 7) {
			  				startTime += ":";
			  			}
			  		}
			  		for (var i = 0; i < endTime_sp.length; i++) {
			  			endTime += endTime_sp[i];
			  			if(i == 1 || i == 3) {
			  				endTime += ".";
			  			} else if(i == 5){
			  				endTime += " ";
			  			} else if(i == 7) {
			  				endTime += ":";
			  			}
			  		}
					var coupon_v = $('select[name=coupon_method]').val();
					var coupon_t = $('#cp_method option:checked').text();
					alert(coupon_v);
					alert(coupon_t);
					$("#buy_id").val(sessionId);
			  		$("#buy_carIns").val($("#confirm_carIns").text());
			  		$("#buy_startTime").val(startTime);
					$("#buy_endTime").val(endTime); 		
					$("#buy_startLocation").val($("#confirm_startLocation").text()); 		
					$("#buy_returnLocation").val($("#confirm_returnLocation").text()); 		
					$("#buy_carNum").val($("#confirm_carNum").text()); 		
					$("#buy_carModel").val($("#confirm_carModel").text()); 		
					$("#buy_point").val($("#confirm_point").text()); 		
					$("#buy_amount").val($("#confirm_amount").text()); 
					$("#buy_coupon").val(coupon_t);
					$("#buy_discount").val(coupon_v);
					
					
					// 결제 필수파라미터 부분
					var radioVal = $('select[name=pay_method]').val();
					var buy_id_data = sessionId; // session id
					var buy_name_data = "정기현"; // session id로 db조회했을 때 회원 이름
					var buy_email = "jeongkyoni@gmail.com"; // session id로 db조회했을 때 회원 이메일
					var buy_phone = "010-5048-7705"; // session id로 db조회했을 때 회원 휴대폰번호
					var buy_addr = "서울특별시 중랑구 면목동 547-15번지 옥탑"; // session id로 db조회했을 때 회원 주소
					var buy_carModel_data = $("#confirm_carModel").text();
					var buy_amount_data = $("#confirm_amount").text();
					
					var IMP = window.IMP; // 생략가능
					IMP.init('imp74838776');
					// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
					// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
					IMP.request_pay({
						pg: 'inicis', // version 1.1.0부터 지원.
						/*
						'kakao':카카오페이,
						html5_inicis':이니시스(웹표준결제)
						'nice':나이스페이
						'jtnet':제이티넷
						'uplus':LG유플러스
						'danal':다날
						'payco':페이코
						'syrup':시럽페이
						'paypal':페이팔
						*/
						pay_method: radioVal,
						/*
						'samsung':삼성페이,
						'card':신용카드,
						'trans':실시간계좌이체,
						'vbank':가상계좌,
						'phone':휴대폰소액결제
						*/
						merchant_uid: 'merchant_' + new Date().getTime(),
						/*
						merchant_uid에 경우
						https://docs.iamport.kr/implementation/payment
						위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
						참고하세요.
						나중에 포스팅 해볼게요.
						*/
						name: buy_carModel_data,
						//결제창에서 보여질 이름
						amount: buy_amount_data,
						//가격
						buyer_email: buy_email,
						buyer_name: buy_name_data,
						buyer_tel: buy_phone,
						buyer_addr: buy_addr
						/*
						모바일 결제시,
						결제가 끝나고 랜딩되는 URL을 지정
						(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
						*/
					}, function (rsp) {
						console.log(rsp);
						if (rsp.success) {
							// rsp.imp_uid은 아임포트 거래고유번호(상품주문번호로 사용가능)
							var msg = '결제가 완료되었습니다.';
							msg += '고유ID : ' + rsp.imp_uid;
							msg += '상점 거래ID : ' + rsp.merchant_uid;
							msg += '결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
							$("#buy_impUid").val(rsp.imp_uid);
							result = "ok";
						} else {
							var msg = '결제에 실패하였습니다.';
							msg += '에러내용 : ' + rsp.error_msg;
						}
						if(result == "ok"){
							var params = $("form[name=payInsert]").serialize();
							console.log(params);
							$.ajax({
							      url:"payResult.do",
							      data : params,
							      success:function(data){
							    	  alert("결제가 완료 되었습니다.\n예약페이지로 이동합니다.");
							    	  location.href="map.do";
							      },
							      error : function(xhr, status) {
						              alert(xhr + " : " + status);
						          }
							});
						}else{
							alert("실패");
						}
					});
					
				});
				</script>
          	  </div>
          	</div>
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