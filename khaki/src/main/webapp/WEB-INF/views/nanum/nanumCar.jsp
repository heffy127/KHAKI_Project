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
		}, 40);
		
		function colorCount(){
			x += 1;
		}
		function colorCountReset(){
			x = 0;
		}
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
            					기본정보 입력만으로 신청 끝!<br>전화기
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
            				<img src="https://image.flaticon.com/icons/svg/130/130258.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 35px; color: red;">신청서 작성</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126490.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/149/149384.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 35px; color: red;">유선 상담</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126490.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1581/1581978.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 35px; color: red;">현장 방문</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126490.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1721/1721936.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 35px; color: red;">차량 점검/평가</div>
            			</div>
            			
            			<div style="width: 100%; text-align: right; padding-right: 4%; line-height: 250px;">
            				<img src="https://image.flaticon.com/icons/svg/118/118738.svg" style="width: 5%;">
            			</div>
            				
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/130/130258.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 35px; color: red;">명의 이전 완료 안내</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126492.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/149/149384.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 35px; color: red;">대금 송금</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126492.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1581/1581978.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 35px; color: red;">서류 및 차량 인도</div>
            			</div>
            			<div style="width: 20%; height: 250px; text-align: center; line-height: 250px; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/126/126492.svg" style="width: 20%;">
            			</div>
            			<div style="width: 10%; float: left;">
            				<img src="https://image.flaticon.com/icons/svg/1721/1721936.svg" style="width: 100%;">
            				<div style="text-align: center; width: 100%; font-size: 35px; color: red;">가격산정/협의</div>
            			</div>
            		</div>
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
