<%@page import="co.kr.khaki.notice.pagination"%>
<%@page import="co.kr.khaki.notice.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl 사용 태그 -->
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
    <!-- Jquery CDN -->
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <!-- Favicon -->
  <link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- Google font  -->
  <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Pen+Script&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script>
	$(function() {
		var color = new Array("#ffffff", '#FFF5F5', '#FFEDED', '#FEE4E4', '#FEDDDD', '#FED3D3', '#FFCCCC', '#FEC3C3', '#FEBBBB', '#FFB4B4', '#FEADAD', '#FEA5A5', '#FF9E9E', '#FE9797', '#FE8F8F', '#FE8787', '#FE8181', '#FF7B7B', '#FF7474', '#FE6D6D', '#FF6767', '#FE5F5F', '#FF6767', '#FE6D6D', '#FF7474', '#FF7B7B', '#FE8181', '#FE8787', '#FE8F8F', '#FE9797', '#FF9E9E', '#FEA5A5', '#FEADAD', '#FFB4B4', '#FEBBBB', '#FEC3C3', '#FFCCCC', '#FED3D3', '#FEDDDD', '#FEE4E4', '#FFEDED', '#FFF5F5');
		var x = 0;
		setInterval(function() {
			if(x == 42) {
				colorCountReset(x);
			}
			$("#neonText").css("color", color[x]);
			colorCount(x);
		}, 30);
		setInterval(function() {
			if(x == 42) {
				colorCountReset(x);
			}
			$("#infoInputPrecautions").css("color", color[x]);
			colorCount(x);
		}, 50);
		
		function colorCount(){
			x += 1;
		}
		function colorCountReset(){
			x = 0;
		}
		
		$("#location_select").change(function(){
			var selected = $("#location_select option:selected").val();
			if(selected == "지역") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option>선택</option>")
			} else if(selected == "서울") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='강남구'>강남구</option><option value='강동구'>강동구</option><option value='강북구'>강북구</option><option value='강서구'>강서구</option><option value='관악구'>관악구</option><option value='광진구'>광진구</option><option value='구로구'>구로구</option><option value='금천구'>금천구</option><option value='노원구'>노원구</option><option value='도봉구'>도봉구</option><option value='동대문구'>동대문구</option><option value='동작구'>동작구</option><option value='마포구'>마포구</option><option value='서대문구'>서대문구</option><option value='서초구'>서초구</option><option value='성동구'>성동구</option><option value='송파구'>송파구</option><option value='양천구'>양천구</option><option value='영등포구'>영등포구</option><option value='용산구'>용산구</option><option value='은평구'>은평구</option><option value='종로구'>종로구</option><option value='중구'>중구</option><option value='중랑구'>중랑구</option>");
			} else if(selected == "경기") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='가평군'>가평군</option><option value='고양시'>고양시</option><option value='과천시'>과천시</option><option value='광명시'>광명시</option><option value='광주시'>광주시</option><option value='구리시'>구리시</option><option value='군포시'>군포시</option><option value='김포시'>김포시</option><option value='남양주시'>남양주시</option><option value='동두천시'>동두천시</option><option value='부천시'>부천시</option><option value='성남시'>성남시</option><option value='수원시'>수원시</option><option value='시흥시'>시흥시</option><option value='안산시'>안산시</option><option value='안성시'>안성시</option><option value='안양시'>안양시</option><option value='양주시'>양주시</option><option value='양평시'>양평시</option><option value='여주시'>여주시</option><option value='연천시'>연천시</option><option value='오산시'>오산시</option><option value='용인시'>용인시</option><option value='의왕시'>의왕시</option><option value='의정부시'>의정부시</option><option value='이천시'>이천시</option><option value='파주시'>파주시</option><option value='평택시'>평택시</option><option value='포천시'>포천시</option><option value='하남시'>하남시</option><option value='화성시'>화성시</option>");
			} else if(selected == "인천") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='중구구'>중구</option><option value='동구구'>동구</option><option value='미추홀구'>미추홀구</option><option value='연수구'>연수구</option><option value='남동구'>남동구</option><option value='부평구'>부평구</option><option value='계양구'>계양구</option><option value='서구'>서구</option><option value='강화군'>강화군</option><option value='옹진군'>옹진군</option>");
			} else if(selected == "강원") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='춘천시'>춘천시</option><option value='원주시'>원주시</option><option value='강릉시'>강릉시</option><option value='동해시'>동해시</option><option value='태백시'>태백시</option><option value='속초시'>속초시</option><option value='삼척시'>삼척시</option><option value='홍천군'>홍천군</option><option value='횡성군'>횡성군</option><option value='영월군'>영월군</option><option value='평창군'>평창군</option><option value='정성군'>정성군</option><option value='철원군'>철원군</option><option value='화천군'>화천군</option><option value='양구군'>양구군</option><option value='인제군'>인제군</option><option value='고성군'>고성군</option><option value='양양군'>양양군</option>");
			} else if(selected == "대전") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='동구'>동구</option><option value='중구'>중구</option><option value='서구'>서구</option><option value='유성구'>유성구</option><option value='대덕구'>대덕구</option>");
			} else if(selected == "충북") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='청주시'>청주시</option><option value='충주시'>충주시</option><option value='제천시'>제천시</option><option value='보은군'>보은군</option><option value='옥천군'>옥천군</option><option value='영동군'>영동군</option><option value='증평군'>증평군</option><option value='진천군'>진천군</option><option value='괴산군'>괴산군</option><option value='음성군'>음성군</option><option value='단양군'>단양군</option>");
			} else if(selected == "충남") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='천안시'>천안시</option><option value='공주시'>공주시</option><option value='보령시'>보령시</option><option value='아산시'>아산시</option><option value='서산시'>서산시</option><option value='논산시'>논산시</option><option value='계룡시'>계룡시</option><option value='당진시'>당진시</option><option value='금산군'>금산군</option><option value='부여군'>부여군</option><option value='서천군'>서천군</option><option value='청양군'>청양군</option><option value='홍성군'>홍성군</option><option value='예산군'>예산군</option><option value='태안군'>태안군</option>");
			} else if(selected == "세종") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='반곡동'>반곡동</option><option value='소담동'>소담동</option><option value='보람동'>보람동</option><option value='대평동'>대평동</option><option value='가람동'>가람동</option><option value='한솔동'>한솔동</option><option value='나성동'>나성동</option><option value='새롬동'>새롬동</option><option value='다정동'>다정동</option><option value='어진동'>어진동</option><option value='종촌동'>종촌동</option><option value='고운동'>고운동</option><option value='아름동'>아름동</option><option value='도담동'>도담동</option><option value='조치원읍'>조치원읍</option><option value='연기면'>연기면</option><option value='연동면'>연동면</option><option value='부강면'>부강면</option><option value='금남면'>금남면</option><option value='장군면'>장군면</option><option value='연서면'>연서면</option><option value='전의면'>전의면</option><option value='전동면'>전동면</option><option value='소정면'>소정면</option>");
			} else if(selected == "광주") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='동구'>동구</option><option value='서구'>서구</option><option value='남구'>남구</option><option value='북구'>북구</option><option value='광산구'>광산구</option>");
			} else if(selected == "전북") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='전주시'>전주시</option><option value='군산시'>군산시</option><option value='익산시'>익산시</option><option value='정읍시'>정읍시</option><option value='남원시'>남원시</option><option value='김제시'>김제시</option><option value='완주군'>완주군</option><option value='진안군'>진안군</option><option value='무주군'>무주군</option><option value='장수군'>장수군</option><option value='임실군'>임실군</option><option value='순창군'>순창군</option><option value='고창군'>고창군</option><option value='부안군'>부안군</option>");
			} else if(selected == "전남") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='목포시'>목포시</option><option value='여수시'>여수시</option><option value='순천시'>순천시</option><option value='나주시'>나주시</option><option value='광양시'>광양시</option><option value='담양군'>담양군</option><option value='곡성군'>곡성군</option><option value='구례군'>구례군</option><option value='고흥군'>고흥군</option><option value='보성군'>보성군</option><option value='화순군'>화순군</option><option value='장흥군'>장흥군</option><option value='강진군'>강진군</option><option value='해남군'>해남군</option><option value='영암군'>영암군</option><option value='무안군'>무안군</option><option value='함평군'>함평군</option><option value='영광군'>영광군</option><option value='장성군'>장성군</option><option value='완도군'>완도군</option><option value='진도군'>진도군</option><option value='신안군'>신안군</option>");
			} else if(selected == "대구") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='중구'>중구</option><option value='동구'>동구</option><option value='서구'>서구</option><option value='남구'>남구</option><option value='북구'>북구</option><option value='수성구'>수성구</option><option value='달서구'>달서구</option><option value='달성군'>달성군</option>");
			} else if(selected == "경북") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='경산시'>경산시</option><option value='경주시'>경주시</option><option value='구미시'>구미시</option><option value='김천시'>김천시</option><option value='문경시'>문경시</option><option value='상주시'>상주시</option><option value='안동시'>안동시</option><option value='영주시'>영주시</option><option value='영천시'>영천시</option><option value='포항시'>포항시</option><option value='고령군'>고령군</option><option value='군위군'>군위군</option><option value='봉화군'>봉화군</option><option value='성주군'>성주군</option><option value='영덕군'>영덕군</option><option value='영양군'>영양군</option><option value='예천군'>예천군</option><option value='울릉군'>울릉군</option><option value='울진군'>울진군</option><option value='의성군'>의성군</option><option value='청도군'>청도군</option><option value='청송군'>청송군</option><option value='칠곡군'>칠곡군</option>");
			} else if(selected == "부산") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='강서구'>강서구</option><option value='금정군'>금정군</option><option value='기장군'>기장군</option><option value='남구'>남구</option><option value='동구'>동구</option><option value='서구'>서구</option><option value='중구'>중구</option><option value='동래구'>동래구</option><option value='부산진구'>부산진구</option><option value='사상구'>사상구</option><option value='사하구'>사하구</option><option value='수영구'>수영구</option><option value='연제구'>연제구</option><option value='영도구'>영도구</option><option value='해운대구'>해운대구</option>");
			} else if(selected == "울산") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='중구'>중구</option><option value='남구'>남구</option><option value='동구'>동구</option><option value='북구'>북구</option><option value='울주군'>울주군</option>");
			} else if(selected == "경남") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='거제시'>거제시</option><option value='김해시'>김해시</option><option value='마산시'>마산시</option><option value='밀양시'>밀양시</option><option value='사천시'>사천시</option><option value='양산시'>양산시</option><option value='진주시'>진주시</option><option value='진해시'>진해시</option><option value='창원시'>창원시</option><option value='통영시'>통영시</option><option value='거창군'>거창군</option><option value='고성군'>고성군</option><option value='남해군'>남해군</option><option value='산청군'>산청군</option><option value='의령군'>의령군</option><option value='창녕군'>창녕군</option><option value='하동군'>하동군</option><option value='함안군'>함안군</option><option value='함양군'>함양군</option><option value='합천군'>합천군</option>");
			} else if(selected == "제주") {
				$("#location_select2").children().remove();
				$("#location_select2").append("<option value='제주시'>제주시</option><option value='서귀포시'>서귀포시</option>");
			}
		})
		
		$("#carNumInput").keyup(function(){
			var carNumInput = $("#carNumInput").val();
			$("#carNumInput").val($.trim(carNumInput));
			carNumInput = carNumInput.split("");
			var x = 0;
			for (var i = 0; i < carNumInput.length; i++) {
				x += 1;
			}
			if(x == 7) {
				$("#carNumCheck").remove();
				if($.isNumeric(carNumInput[0]+carNumInput[1]) == true) {
					if($.isNumeric(carNumInput[2]) == false) {
						if($.isNumeric(carNumInput[3]+carNumInput[4]+carNumInput[5]+carNumInput[6]) == true) {
						} else {
							$("#carNumCheck").remove();
							$("#carNumDiv").append("<label id='carNumCheck' style='color: #ff4545;'>차량 번호를 확인해 주세요.</label>");
						}
					} else {
						$("#carNumCheck").remove();
						$("#carNumDiv").append("<label id='carNumCheck' style='color: #ff4545;'>차량 번호를 확인해 주세요.</label>");
					}
				} else {
					$("#carNumCheck").remove();
					$("#carNumDiv").append("<label id='carNumCheck' style='color: #ff4545;'>차량 번호를 확인해 주세요.</label>");
				}
			} else {
				$("#carNumCheck").remove();
				$("#carNumDiv").append("<label id='carNumCheck' style='color: #ff4545;'>차량 번호를 확인해 주세요.</label>");
			}
			if(carNumInput == "") {
				$("#carNumCheck").remove();
			}
			
		})
		
		$("#phoneNumInput").keyup(function(){
			var phoneNumInput = $("#phoneNumInput").val();
			$("#phoneNumInput").val($.trim(phoneNumInput));
			
			phoneNumInput = phoneNumInput.split("");
			var x = 0;
			for (var i = 0; i < phoneNumInput.length; i++) {
				x += 1;
			}
			
			if(x == 11) {
				$("#phoneNumCheck").remove();
				if($.isNumeric($("#phoneNumInput").val()) == true) {
					$("#phoneNumCheck").remove();
				} else {
					$("#phoneNumCheck").remove();
					$("#phoneNumDiv").append("<label id='phoneNumCheck' style='color: #ff4545;'>휴대폰 번호를 확인해 주세요.</label>");
				}
				
			} else {
				$("#phoneNumCheck").remove();
				$("#phoneNumDiv").append("<label id='phoneNumCheck' style='color: #ff4545;'>휴대폰 번호를 확인해 주세요.</label>");
			}
			
			if(phoneNumInput == "") {
				$("#phoneNumCheck").remove();
			}
			
		})
		
		
		$("#requestDayInput").keyup(function(){
			var requestDayInput = $("#requestDayInput").val();
			$("#requestDayInput").val($.trim(requestDayInput));
			
			requestDayInput = requestDayInput.split("");
			var x = 0;
			for (var i = 0; i < requestDayInput.length; i++) {
				x += 1;
			}
			
			if(x == 8) {
				$("#requestDayCheck").remove();
				if($.isNumeric($("#requestDayInput").val()) == true) {
					$("#requestDayCheck").remove();
				} else {
					$("#requestDayCheck").remove();
					$("#requestDayDiv").append("<label id='requestDayCheck' style='color: #ff4545;'>상담 희망날짜를 확인해 주세요.</label>");
				}
				
			} else {
				$("#requestDayCheck").remove();
				$("#requestDayDiv").append("<label id='requestDayCheck' style='color: #ff4545;'>상담 희망날짜를 확인해 주세요.</label>");
			}
			
			if(requestDayInput == "") {
				$("#requestDayCheck").remove();
			}
			
		})
		
		
		$("#distanceInput").keyup(function(){
			var distanceInput = $("#distanceInput").val();
			$("#distanceInput").val($.trim(distanceInput));
			
			distanceInput = distanceInput.split("");
			var x = 0;
			for (var i = 0; i < distanceInput.length; i++) {
				x += 1;
			}
			
			if(x <= 5) {
				$("#distanceCheck").remove();
				if($.isNumeric($("#distanceInput").val()) == true) {
					$("#distanceCheck").remove();
				} else {
					$("#distanceCheck").remove();
					$("#distanceDiv").append("<label id='distanceCheck' style='color: #ff4545;'>주행 거리를 확인해 주세요.</label>");
				}
				
			} else {
				$("#distanceCheck").remove();
				$("#distanceDiv").append("<label id='distanceCheck' style='color: #ff4545;'>주행 거리를 확인해 주세요.</label>");
			}
			
			if(distanceInput == "") {
				$("#distanceCheck").remove();
			}
			
		})
		
		$("#usedCarBtn").click(function(){
			result = confirm("입력하신 정보로 신청 하시겠습니까?");
			var name = $("#nameInput").val();
			var location_select = $("#location_select option:selected").val();
			var carNum = $("#carNumInput").val();
			var phone = $("#phoneinput").val();
			var visitDay = $("#requestDayInput").val();
			var distance = $("#distanceInput").val();
			
			var c = $("#carNumCheck").val();
			var l = $("#location_select option:selected").val();
			var p = $("#phoneNumCheck").val();
			var v = $("#requestDayCheck").val();
			var d = $("#distanceCheck").val();
			
			if(result == true) {
				if(name != "" && location_select != "지역" && carNum != "" && phone != "" && visitDay != "" && distance != "") {
					if(c == "undefined" || l != "지역" || p == "undefined" || v == "undefined" || d == "undefined") {
						alert("상담 신청이 완료 되었습니다.\n담당자 배정 후 연락드릴 예정입니다.");
						$("#usedCarSales").submit();						
					} else {
						alert("입력 정보를 다시 확인해주세요.")
					}
				} else {
					alert("입력 정보를 다시 확인해주세요.")
				}
				
			}
		})
		
		
		
	})
  </script>
</head>
<!-- aaabb -->
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
              <a href="home.do">
                <img src="resources/assets/img/brand/khaki2.png">
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
            <a class="nav-link" href="board.do">
              <i class="ni ni-bullet-list-67 text-blue"></i> board
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="notice.do">
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">Notice</a>
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
          <!-- Card stats -->
          <div class="row">
          	<div class="col">
          	</div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- aaaabbcccddeeffee -->
    <!-- white 테마 사용 -->
    <div class="container-fluid mt--7">
      <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-footer py-4" align="center">
            	<div class="nanum_main_area">
            		<div class="nanum_main_title">
            			<label style="display: table-cell; vertical-align: middle;"><b id="neonText" style="font-size: 80px;">소중한 내차,</b><br>간편한 상담 신청을 통해<br>쉽고 빠르게 판매할 수 있습니다.</label>
            		</div>
            		<div class="nanum_content_area1">
            			<label style="font-size: 35px;">중고차 매매를 KHAKI에서 해야 하는 <img src="https://image.flaticon.com/icons/svg/91/91611.svg" style="width: 8%; margin-bottom: 4%;">가지 이유!</label><br><br>
            			<div style="width: 33%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1910/1910054.svg" style="width: 40%; float: left;">
            				<div style="width: 60%; float: left; padding: 3% 3% 3% 6%; font-size: 25px; color: #ff7e7e;">
            					간편하고 편리한 과정
            				</div>
            				<div style="width: 60%; float: left; padding: 3% 3% 3% 6%;">
            					기본정보 입력만으로 신청 끝!<br>
            					원하는 장소와 시간에 맞춰<br>매입 상담사가 무료 방문하여 <br>견적 상담을 해드립니다.
            				</div>
            			</div>
            			<div style="width: 33%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1972/1972874.svg" style="width: 40%; float: left;">
            				<div style="width: 60%; float: left; padding: 3% 3% 3% 6%; font-size: 25px; color: #53a253;">
            					차를 팔아도 내 차처럼
            				</div>
            				<div style="width: 60%; float: left; padding: 3% 3% 3% 6%;">
            					차량 판매 후 카키 이용을 대비해<br>원하는 지역으로 차량 배치를<br>해드립니다.
            				</div>
            			</div>
            			<div style="width: 33%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/2072/2072739.svg" style="width: 40%; float: left;">
            				<div style="width: 60%; float: left; padding: 3% 3% 3% 6%; font-size: 25px; color: #7979f9;">
            					믿음직한 가격
            				</div>
            				<div style="width: 60%; float: left; padding: 3% 3% 3% 6%;">
            					카키가 보증하는 전문가와 상담하여 <br>만족스러운 견적산출이 가능합니다.
            				</div>
            			</div>
            		</div>
            		<div class="nanum_content_area2" style="background-color: #f9f9f9;">
            			<label style="font-size: 35px; margin-left: 2%;">중고차 매입 절차</label><br>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/2057/2057831.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 20px; color: #484848; margin-top: 5%;">신청서 작성</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126490.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1283/1283384.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 20px; color: #484848; margin-top: 5%;">유선 상담</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126490.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="resources/assets/img/usedCar/1.png" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 20px; color: #484848; margin-top: 5%;">현장 방문</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126490.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1743/1743650.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 20px; color: #484848; margin-top: 5%;">차량 점검/평가</div>
            			</div>
            			
            			<div style="width: 100%; text-align: right; padding-right: 4%; line-height: 250px;">
            				<img src="https://image.flaticon.com/icons/svg/118/118738.svg" style="width: 5%;">
            			</div>
            				
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1467/1467488.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 20px; color: #484848; margin-top: 5%;">명의 이전 완료 안내</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126492.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1773/1773506.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 20px; color: #484848; margin-top: 5%;">대금 송금</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126492.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/869/869019.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 20px; color: #484848; margin-top: 5%;">서류 및 차량 인도</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126492.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1006/1006657.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 20px; color: #484848; margin-top: 5%;">가격산정/협의</div>
            			</div>
            		</div>
            		<form id="usedCarSales" action="usedCarSales.do">
            		<div class="nanum_content_area1">
            			<label style="font-size: 35px;">상담신청 정보입력</label>
            			<hr style="border-color: black;">
            			<div style="width: 50%; float: left;">
            				<div style="width: 100%; overflow: auto; margin-bottom: 3%;">
	            				<div style="width: 30%; float: left;">
	            					<label style="margin-left: 10%;">이름</label>
	            				</div>
	            				<div style="width: 70%; float: left;">
	            					<input type="text" id="nameInput" name="name" style="width: 80%;" placeholder="이름을 입력해주세요.">
	            				</div>
            				</div>
            				<div style="width: 100%; overflow: auto; margin-bottom: 3%;">
	            				<div style="width: 30%; float: left;">
	            					<label style="margin-left: 10%;">지역</label>
	            				</div>
	            				<div style="width: 70%; float: left;">
		            				<select id="location_select" name="location1" style="width: 39.5%; height: 30px;">
		            					<option value="지역" selected>지역</option>
		            					<option value="서울">서울</option>
		            					<option value="경기">경기</option>
		            					<option value="인천">인천</option>
		            					<option value="강원">강원</option>
		            					<option value="대전">대전</option>
		            					<option value="충북">충북</option>
		            					<option value="충남">충남</option>
		            					<option value="세종">세종</option>
		            					<option value="광주">광주</option>
		            					<option value="전북">전북</option>
		            					<option value="전남">전남</option>
		            					<option value="대구">대구</option>
		            					<option value="경북">경북</option>
		            					<option value="부산">부산</option>
		            					<option value="울산">울산</option>
		            					<option value="경남">경남</option>
		            					<option value="제주">제주</option>
		            				</select>
		            				<select id="location_select2" name="location2" style="width: 39.5%; height: 30px;">
		            					<option value="0" selected>선택</option>
		            				</select>
	            				</div>
	            			</div>
	            			<div style="width: 100%; overflow: auto; margin-bottom: 3%;">
	            				<div style="width: 30%; float: left;">
	            					<label style="margin-left: 10%;">차량번호</label>
	            				</div>
	            				<div id="carNumDiv" style="width: 70%; float: left;">
	            					<input id="carNumInput" name="carNum" type="text" style="width: 80%;" maxlength="7" placeholder="차량번호를 입력 해주세요. (예시)01가1234">
	            				</div>
	            			</div>
            			</div>
            			<div style="width: 50%; float: left; overflow: auto;">
            				<div style="width: 100%; overflow: auto; margin-bottom: 3%;">
	            				<div style="width: 30%; float: left;">
	            					<label style="margin-left: 10%;">휴대전화</label>
	            				</div>
	            				<div id="phoneNumDiv" style="width: 70%; float: left;">
	            					<input id="phoneNumInput" name="phone" type="text" style="width: 80%;" maxlength="11" placeholder="'-'빼고 입력해주세요. (예시)01012345678">
	            				</div>
	            			</div>
            				<div style="width: 100%; overflow: auto; margin-bottom: 3%;">
	            				<div style="width: 30%; float: left;">
	            					<label style="margin-left: 10%;">방문 희망일시</label>
	            				</div>
	            				<div id="requestDayDiv" style="width: 70%; float: left;">
	            					<input id="requestDayInput" name="visitDay" type="text" style="width: 80%;" maxlength="8" placeholder="방문 희망일시를 입력 해주세요.(예시)20190920">
	            				</div>
	            			</div>
            				<div style="width: 100%; overflow: auto; margin-bottom: 3%;">
	            				<div style="width: 30%; float: left;">
	            					<label style="margin-left: 10%;">주행거리</label>
	            				</div>
	            				<div id="distanceDiv" style="width: 70%; float: left;">
	            					<input id="distanceInput" name="distance" type="text" style="width: 80%; margin-right: 2%;" maxlength="5" placeholder="100,000km 이하의 차량만 매매가 가능합니다.">km
	            				</div>
	            			</div>
            			</div>
            			<div style="width: 100%; font-family: 'Jua', sans-serif; margin-bottom: 5%; overflow: auto;" class="infoInputPrecautions">
            				<label style="font-size:25px; color:red; margin-top: 10%; margin-bottom: 5%;" id="infoInputPrecautions">정보 입력 시 주의사항</label>
            				<ul>
            					<li><label style="color: #585858; font-weight: bold; font-size: 20px;">이름 :</label> 본인의 본명을 적어주세요.</li>
            					<li style="list-style: none; margin-left: 5%;">별명이나 닉네임을 입력하실 경우 상담에 어려움이 있습니다.</li>
            					<li><label style="color: #585858; font-weight: bold; font-size: 20px;">지역 :</label> 차량 점검 및 평가를 받을 지역으로 선택해 주세요.</li>
            					<li style="list-style: none; margin-left: 5%;">해당 지역에 상담사가 연락을 드립니다.</li>
            					<li><label style="color: #585858; font-weight: bold; font-size: 20px;">차량번호 :</label> 반드시 보유한 차량의 차량 번호를 입력해 주세요.</li>
            					<li style="list-style: none; margin-left: 5%;">판매하려는 차량이 여러대일 경우 대표 차량번호만 입력해 주세요.</li>
            					<li><label style="color: #585858; font-weight: bold; font-size: 20px;">휴대전화 :</label> 연락받으실 휴대전화 번호를 입력해 주세요.</li>
            					<li style="list-style: none; margin-left: 5%;">번호가 잘못 되어있을 경우 상담 진행이 불가합니다.</li>
            					<li><label style="color: #585858; font-weight: bold; font-size: 20px;">방문 희망일시 :</label> 예시에 맞춰 정확한 날짜를 입력해 주세요.</li>
            					<li style="list-style: none; margin-left: 5%;">잘못 입력하실 경우 원하시는 날짜로 예약이 불가할 수 있습니다.</li>
            					<li><label style="color: #585858; font-weight: bold; font-size: 20px;">주행거리 :</label> 보유한 차량의 주행거리를 다시 한번 확인해 주세요.</li>
            					<li style="list-style: none; margin-left: 5%;">100,000km 초과 차량의 경우 출장비용이 발생할 수 있습니다.</li>
            					<li style="list-style: none; color: #ff4c4c; font-weight: bold; font-size: 23px; margin-top: 2%;">※ 허위 사실을 기재하여 매입 상담사가 방문했을 경우 출장 비용이 발생할 수 있습니다.</li>
            				</ul>
            			</div>
            			<div style="width: 100%;">
            				<button type="button" id="usedCarBtn" style="width: 100%; font-size: 30px;" class="btn btn-outline-success">상담 신청 하기</button>
            			</div>
            		</div>
            		</form>
            	</div>
            </div>
          </div>
        </div>
      </div>
    </div>
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
