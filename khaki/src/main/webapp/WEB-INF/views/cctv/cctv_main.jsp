<%@page import="co.kr.khaki.notice.pagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>1등 카셰어링, khaki</title>
	<!-- Jquery CDN -->
 	<!-- <script src="https://code.jquery.com/jquery-latest.js"></script> -->
	<!-- Favicon -->
  	<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  	<!-- Fonts -->
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- Icons -->
  	<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
 	<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
	<!-- CSS Files -->
 	<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
 	<!-- CSS Font -->
 	<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi&display=swap&subset=korean" rel="stylesheet">
 	
</head>
<body>
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
    <!-- 관리 차량에 대한 개략적인 정보 -->
    <!-- 총차량수 : selectAll해온 size, 운행차량 = 총차량수 - 노후차량 - 중고차량,   -->
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
          	<div class="card-header" id="cctv_title">
          		<img src="https://image.flaticon.com/icons/svg/2035/2035524.svg" style="width: 3%; margin-right: 2%;">교통상황 CCTV
          	</div>	<!-- card-header end -->
            <div class="card-body">	<!-- id에 map을 주어 위의 script 실행되도록 함 -->
            	<div class="row">
	            	<!-- map 표시되는 div -->
	            	<div class="col-md-9" id="map" style="width: 1000px;height: 1000px; background-image: url('https://thumbs.gfycat.com/DeficientBareDalmatian-size_restricted.gif'); background-size: 100%; background-repeat: no-repeat; background-position: center top;"></div>
            		<!-- 메뉴 놓을 div -->
            		<div class="col-md-3" align="center">
            			<div class="row">
            				<div class="col">
            				지도 확대 / 축소
            				</div>
            			</div>
            			<div class="row">
            				<div class="col">
	            				<button class="btn btn-info" onclick="zoomOut()">지도레벨 + 1(축소)</button>
	            				<button class="btn btn-danger" onclick="zoomIn()">지도레벨 - 1(확대)</button>
            				</div>
            			</div>
            			<div class="row">
            				<div class="col">
	            				지역별(광역시)
            				</div>
            			</div>
            			<div class="row">
	            				<button class="btn btn-outline-secondary" onclick="panTo(37.563928, 126.997477)">서울특별시</button>
	            				<button class="btn btn-outline-secondary" onclick="panTo(35.176476, 129.079631)">부산광역시</button>
	            				<button class="btn btn-outline-secondary" onclick="panTo(35.869516, 128.606184)">대구광역시</button>
            			</div>
            			<div class="row">
	            				<button class="btn btn-outline-secondary" onclick="panTo(37.449180, 126.731477)">인천광역시</button>
	            				<button class="btn btn-outline-secondary" onclick="panTo(35.154573, 126.889890)">광주광역시</button>
	            				<button class="btn btn-outline-secondary" onclick="panTo(36.356850, 127.384213)">대전광역시</button>
            			</div>
            			<div class="row">
		           				<button class="btn btn-outline-secondary" onclick="panTo(35.547520, 129.330644)">울산광역시</button>
		           				<button class="btn btn-outline-secondary" onclick="panTo(36.480262, 127.289035)">세종특별자치시</button>
            			</div>
            			
            			<div class="row">
            				<div class="col">
	            				지역별(도별)
            				</div>
            			</div>
            				<!-- 광역시
							서울특별시 - 중구청(37.563928, 126.997477)
							부산광역시 - 연제구청(35.176476, 129.079631)
							대구광역시 - 대구중구청(35.869516, 128.606184)
							인천광역시 - 남동구청(37.449180, 126.731477)
							광주광역시 - 서구청(35.154573, 126.889890)
							대전광역시 - 서구청(36.356850, 127.384213)
							울산광역시 - 남구청(35.547520, 129.330644)
							세종특별자치시 - 시청(36.480262, 127.289035)
							도
							경기도 - 수원시청(37.264685, 127.031270)
							강원도 - 춘천시청(37.881437, 127.730108)
							충청북도 - 청주시청(36.642323, 127.488833)
							충청남도 - 홍성군청(36.601518, 126.660837)
							전라북도 - 전주시청(35.824437, 127.148022)
							전라남도 - 무안군청(34.990623, 126.481728)
							경상북도 - 안동시청(36.586488, 128.727215)
							경상남도 - 창원시청(35.228223, 128.681825)
							 -->
 						<div class="row">
 							<div class="col">
	            				<button class="btn btn-outline-primary" onclick="panTo(37.264685, 127.031270)">경기도</button>
	            				<button class="btn btn-outline-primary" onclick="panTo(37.881437, 127.730108)">강원도</button>
 							</div>
            			</div>
            			<div class="row">
 							<div class="col">
	            				<button class="btn btn-outline-success" onclick="panTo(36.642323, 127.488833)">충청북도</button>
	            				<button class="btn btn-outline-success" onclick="panTo(36.601518, 126.660837)">충청남도</button>
            				</div>
            			</div>
            			<div class="row">
 							<div class="col">
	            				<button class="btn btn-outline-info" onclick="panTo(36.586488, 128.727215)">경상북도</button>
	            				<button class="btn btn-outline-info" onclick="panTo(35.228223, 128.681825)">경상남도</button>
            				</div>
            			</div>
            			<div class="row">
 							<div class="col">
	            				<button class="btn btn-outline-warning" onclick="panTo(35.824437, 127.148022)">전라북도</button>
	            				<button class="btn btn-outline-warning" onclick="panTo(34.990623, 126.481728)">전라남도</button>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>	<!-- cardbody End -->
          </div>
          <div class="card-footer">
          
          </div>	<!-- card-footer end -->
        </div>
      </div>
    </div>
  </div>
  	<!-- aaaa -->
 	<!-- Jquery, cctv api javascript -->
 	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="http://openapi.its.go.kr/javascript/jquery.xml2json.js"></script>
 	<script type="text/javascript" src="http://openapi.its.go.kr/javascript/openapi.cctv.js"></script>
 	
	<!-- kakao map api javascript -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84cf7aa5c76b385f7270d308f67a145b&libraries=clusterer"></script>
	<!-- 맵과 cctv script -->
	<script>
	    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
	        level : 12 // 지도의 확대 레벨
	    });
	
	    // 마커 클러스터러를 생성합니다
	    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
	    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
	    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
	    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
	        minLevel: 10, // 클러스터 할 최소 지도 레벨
	        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
	    });
	
	    jQuery.noConflict();
	    
	    jQuery( document ).ready(function( $ ) {
	        // You can use the locally-scoped $ in here as an alias to jQuery.
	   		// 출처: https://yubylab.tistory.com/entry/다른-라이브러리로부터-jQuery-보호하기 [Yuby's Lab.]
	    var key = '1566268087863';
		var url = 'http://openapi.its.go.kr:8081/api/NCCTVInfo?key='+key+'&ReqType=2&MinX=125.900000&MaxX=129.500000&MinY=33.100000 &MaxY=39.100000&type=ex&CctvType=1';
	    
	    // 데이터를 가져오기 위해 jQuery를 사용합니다
	    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	    $.get(url, function(result) {
	        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
	        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	        var json = $.xml2json(result);
	        console.log(json.data);
	        var markers = $(json.data).map(function(i, data) {
	            var marker = new kakao.maps.Marker({
	                position : new kakao.maps.LatLng(data.coordy, data.coordx),
	                title : data.cctvname
	            });
	        	
	            
	            var iwContent =
					'<div style="width: 350px;height:300px;">'
					+'<div>'
			        +data.cctvname
			        +'<br>'
			        +'<iframe id="cctv_frame" src='+data.cctvurl +' frameborder="0" style="width:350px; height:250px;"></iframe>'
			        +'</div>'
			        +'</div>',
			        iwRemoveable = true;
			    
			    // 마커에 표시할 인포윈도우를 생성합니다 
	            var infowindow = new kakao.maps.InfoWindow({
			    	// 인포윈도우에 표시할 내용
			    	content: iwContent,
			    	removable: iwRemoveable
			    });
	            
	        	 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    (function(marker, infowindow) {
			        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			        kakao.maps.event.addListener(marker, 'click', function() {
			            infowindow.open(map, marker);
			        });
			    })(marker, infowindow);
			    
	            return marker;
	            
	        });
	
	        // 클러스터러에 마커들을 추가합니다
	        clusterer.addMarkers(markers);
	    });
	
	    // 마커 클러스터러에 클릭이벤트를 등록합니다
	    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
	    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
	    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
	
	        // 현재 지도 레벨에서 1레벨 확대한 레벨
	        var level = map.getLevel()-1;
	
	        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	        map.setLevel(level, {anchor: cluster.getCenter()});
	    });
	    
	    }); // jquery conflict prevent
	    
	    // 지도 중심좌표 이동 시키기
	    // 파라미터를 받아서 좌표 값이 들어가도록 구현
	    function panTo(x, y) {
	        // 이동할 위도 경도 위치를 생성합니다 
	        var moveLatLon = new kakao.maps.LatLng(x, y);
	        //	33.450580, 126.574942
	        // 지도 중심을 부드럽게 이동시킵니다
	        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	        map.panTo(moveLatLon);            
	    }
	    
	    // zoom in / out 기능 구현?
	    // 지도 레벨은 지도의 확대 수준을 의미합니다
		// 지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다
		function zoomIn() {        
		    // 현재 지도의 레벨을 얻어옵니다
		    var level = map.getLevel();
		    
		    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
		    map.setLevel(level - 1);
		}
	    
		function zoomOut() {    
		    // 현재 지도의 레벨을 얻어옵니다
		    var level = map.getLevel(); 
		    
		    // 지도를 1레벨 올립니다 (지도가 축소됩니다)
		    map.setLevel(level + 1);
		}    
		
		
	    
	</script>
  <!--   Core   -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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