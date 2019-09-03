<%@page import="co.kr.khaki.notice.pagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>1등 카셰어링, khaki</title>
	<!-- Jquery CDN -->
 	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	
		function fn_paging(curPage){
	  		location.href = "carmanage.do?curPage="+curPage;
	  		//alert(curPage); 
	  		//페이지 넘버 확인
	  	};
	
		$(function(){
			
			// 차량 검색
			$("#search").click(function(){
				
			});	// search end
			
			// 차량 수정
			$("#update").click(function(){
				
			});	// update end

			// 차량 삭제
			$("#delete").click(function(){
				
			});	// delete end
			
			// 차량 등록
 			$("#insert").click(function(){
				location.href = "carmanageInsert.do";
				
			});	// insert end
			
			// 차량번호를 가지고 넘어가도록 설정
			$(".row_carlist").click(function(){
				var data = $(this).children(".car_num").text();
				alert(data);
				location.href = "carmanageSelect.do?carnum="+data;
				
			})	
			
			// 상위 차량 요약 내용
			var cmlist_size= "${fn:length(cmlist)}";
			var junggolist_size = "${fn:length(junggolist)}";
			var oldlist_size = "${fn:length(oldlist)}";
			
			var normal = cmlist_size - junggolist_size - oldlist_size;
			
			var normal_percentage = normal / cmlist_size * 100;
			
			var junggolist_percentage = junggolist_size / cmlist_size * 100;
			
			var oldlist_percentage = oldlist_size / cmlist_size * 100;
			
			alert(normal_percentage + " / "+junggolist_percentage + " / "+oldlist_percentage);
			alert(cmlist_size +"/"+junggolist_size +"/"+oldlist_size + "/" + normal);
			alert(junggolist_percentage.toFixed(2));
			
			//정상운행
			$(".normal").children(".row").children(".col").children("span").text(normal+"대");
			$(".normal").children("p").children(".mr-2").text(normal_percentage.toFixed(2)+"%");
			
			//노후차량
			$(".old").children("p").children(".mr-2").text(oldlist_percentage.toFixed(2)+"%");
			
			//중고차량(판매가능)
			$(".junggo").children("p").children(".mr-2").text(junggolist_percentage.toFixed(2)+"%");
			
			
			
		});	//Jquery End
	</script>
			<!-- aaaaa -->
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
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">총차량수</h5>
                      <span class="h2 font-weight-bold mb-0">${fn:length(cmlist)}대</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                        <i class="fas fa-car"></i>
                      </div>
                    </div>
                    <p></p>
                  </div>
                  <!-- <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
                    <span class="text-nowrap">Since last month</span>
                  </p> -->
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body normal">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">정상운행</h5>
                      <span class="h2 font-weight-bold mb-0">00대</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                        <i class="fas fa-percent"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fas fa-arrow-down"></i> 3.48%</span>
                    <span class="text-nowrap">Since last week</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body old">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">노후차량</h5>
                      <span class="h2 font-weight-bold mb-0">${fn:length(oldlist)}대</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                        <i class="fas fa-percent"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span>
                    <span class="text-nowrap">Since yesterday</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body junggo">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">중고차량(판매가능)</h5>
                      <span class="h2 font-weight-bold mb-0">${fn:length(junggolist)}대</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                        <i class="fas fa-percent"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-warning mr-2"><i class="fas fa-arrow-up"></i> 12%</span>
                    <span class="text-nowrap">Since last month</span>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col">
          <div class="card shadow border-0">
          	<div class="card-header">
          		탭 넣을 곳(임시)
          		<br><br>
          		<button id="search" class="btn btn-outline-success">검색</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       			<button id="insert" class="btn btn-outline-info">등록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       			<button id="update" class="btn btn-outline-primary">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       			<button id="delete" class="btn btn-outline-danger">삭제</button>
          	</div>
            <div class="card-body">
            	<!-- 관리 차량 리스트 업 -->
            	<div class="row">
            		<div class="col col-sm-12">
            		<!-- list up 메뉴 -->
            			<div class="row" style="border-bottom-style: solid; border-bottom-color: #158c68; border-bottom-width: 3px;
            			 border-top-style: solid; border-top-color: #158c68; border-top-width: 3px;
            			vertical-align: middle; height: 50px; line-height:50px; font-family: 'Black Han Sans', sans-serif;">
            				<div class="col" align="center">
            					카키차량번호
            				</div>
            				<div class="col" align="center">
            					차량번호
            				</div>
            				<div class="col" align="center">
            					이미지
            				</div>
            				<div class="col" align="center">
            					총 운행 거리
            				</div>
            				<div class="col" align="center">
            					연료
            				</div>
            				<div class="col" align="center">
            					브랜드
            				</div>
            				<div class="col" align="center">
            					차 크기
            				</div>
            				<div class="col" align="center">
            					차량명
            				</div>
            				<div class="col" align="center">
            					등록일시
            				</div>
            			</div>
            			<!-- list up 내용 -->
            			<!-- jstl로 조절할 수 없을까? 방법 찾아보기 -->
            			<!-- 현재는 전체 리스트를 다 뽑아오게끔 되어 있음 -->
            			<% pagination pg = (pagination)request.getAttribute("pagination"); %>
            			<c:forEach var="cmdto" items="${cmlist}" varStatus="status" begin="<%= pg.getStartIndex() %>" end="<%= pg.getEndIndex() %>">
            			<div class="row row_carlist" style="border-bottom-style: ridge; border-bottom-color: #158c68; border-bottom-width: 3px; vertical-align: middle;
            			font-family: 'Gugi', cursive;">
            				<%-- ${status.count }
            				${status.index } --%>
            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
            					${cmdto.khaki_num }
            				</div>
            				<div class="col car_num" style="text-align: center; height:100px; line-height:100px;">
            					${cmdto.carnum }
            				</div>
            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
            					<img style="position: absolute; top:0; left:0; width: 140px; height:100%;" src="resources/assets/img/car/${cmdto.img }" />
            				</div>
            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
            					${cmdto.distance }KM
            				</div>
            				<div class="col"  style="text-align: center; height:100px; line-height:100px;">
            					${cmdto.fuel }
            				</div>
            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
            					${cmdto.brand }
            				</div>
            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
            					${cmdto.car_size }
            				</div>
            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
            					${cmdto.carname }
            				</div>
            				<div class="col" style="text-align: center; height:50px; line-height:50px;">
            					<div>
            						${cmdto.reg_date }
            					</div>
            				</div>
            			</div>
            			</c:forEach>
            		</div>
            	</div>
            </div>	<!-- cardbody End -->
          </div>
          <div class="card-footer">
          	<div class="row">
	          	<div class="col col-sm-4">
	          	</div>
	          	<div class="col col-sm-4">
	          		<c:if test="${pagination.curRange ne 1 }">
                        <a href="#" onClick="fn_paging(1)">[처음]</a> 
                    </c:if>
                    <c:if test="${pagination.curPage ne 1}">
                        <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
                    </c:if>
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq pagination.curPage}">
                                <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
                    </c:if>
                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
                  	</c:if>
	          	</div>
	          	<div class="col col-sm-4">
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