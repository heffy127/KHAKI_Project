<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <script type="text/javascript">
  	$(function() {
  		// handler a태그 클릭시 sessionId의 핸들러 여부에 따라 호출 페이지가 달라짐.
  		$("#handler_a").click(function(){ // 핸들러 버튼을 클릭했을때
  			var id = '<%=(String)session.getAttribute("sessionId")%>'; // sessionId를 [id]라는 변수에 담아서
  			$.ajax({ // ajax 실행
			      url:"handlerIdCheck.do", // session id의 핸들러 여부를 파악하기 위해 handlerIdCheck.do 컨트롤러 호출
			      data : {
			    	  "id" : id // data는 위에서 변수로 저장한 sessionId
			      },
			      success:function(data){ // ajax가 성공했을 때
			    	  if(data == "") { // handler/handlerIdCheck에 데이터가 없다면
			    		  location.href="handler.do"; // 핸들러 신청할 수 있는 핸들러메인으로 이동
			    	  } else if(data == "N") { // handler/handlerIdCheck에 데이터가 N일때
			    		  location.href="handler.do"; // 핸들러 신청건들이 있는 핸들러 게시판으로 이동 
			    	  } else { // handler/handlerIdCheck에 데이터가 N일때
			    		  location.href="handlerBoard.do"; // 핸들러 신청건들이 있는 핸들러 게시판으로 이동 
			    	  }
			      },
			      error : function(xhr, status) { // ajax가 실패했을 때
		              alert(xhr + " : " + status); // 실패 내용 확인
		          }
			});
  		})
  		
  		$("#adminMode").click( // 관리자 모드로 전환
  				function() {
  					location.href = "admin.do"
		})
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
                <img alt="Image placeholder" src="${sessionPhoto}" style="width: 40px; height: 40px;">
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
              <a href="home.jsp">
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
          	<a class=" nav-link active" href="home.do"> 
          		<i class="ni ni-tv-2 text-black"></i> Home
            </a>
          </li>
          <li class="nav-item">
          <% 
          if (session.getAttribute("sessionId")==null){ %>
            <a class="nav-link">
              <i class="ni ni-square-pin text-orange"></i> Map (로그인 필요)
            </a>
          <%
          } else {
          %>
            <a class="nav-link" href="map.do">
              <i class="ni ni-square-pin text-orange"></i> Map
            </a>
          <%}%>
          </li>
          <li class="nav-item">
            <a class="nav-link a" href="board.do">
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
          <li class="nav-item">
            <a class="nav-link " id="handler_a" style="cursor: pointer;">
              <i class="ni ni-collection text-green"></i> Handler
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="confirm.do">
              <i class="ni ni-collection text-green"></i> Confirm
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="checkReservation.do">
              <i class="ni ni-collection text-green"></i> CheckReservation
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="cctv.do">
              <i class="ni ni-image text-black"></i> CCTV
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="key.do">
              <i class="ni ni-image text-black"></i> KEY
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="nanumCar.do">
              <i class="ni ni-delivery-fast text-blue"></i> 나눔카
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="calender.do">
              <i class="ni ni-delivery-fast text-blue"></i> My Calender
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="survey1.do">
              <i class="ni ni-image text-black"></i> 차량 이용 설문지 예비
            </a>
          </li>
         </ul>
        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
        <h6 class="navbar-heading text-muted">Home</h6>
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
        <!-- 관리자 분기점 -->
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="home.do">KHAKI</a>
        <c:if test="${sessionId == 'admin1' || sessionId == 'admin2'}">
	        <div align="center">
	        	<table>
	        		<tr>
	        			<td>
	        				<button type="button" class="btn btn-success" disabled="disabled" id="userMode">사용자 모드</button>
	        			</td>
	        			<td>
	        				&nbsp;&nbsp;&nbsp;&nbsp;
	        			</td>
	        			<td>
	        				<button type="button" class="btn btn-warning" id="adminMode">관리자 모드</button>
	        			</td>
	        		</tr>
	        	</table>
			</div>
		</c:if>
		
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
    <div class="header bg-gradient-default pb-8 pt-1 pt-lg-6 d-flex align-items-center">
  <!--   	 style="min-height: 400px; background-image: url(resources/assets/img/theme/home-cover.JPG); background-size: cover; background-position: center top;" -->
    	<!-- mask -->
    	<!-- <span class="mask bg-gradient-default opacity-7"></span> -->
    
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <div class="row">
           
          
         
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid mt--7">
      <div class="row">
      	
      	<!-- 유튜브 -->
        <div class="col-xl-7 mb-5 mb-xl-0">
        	<iframe width="100%" height="510px" src="https://www.youtube.com/embed/cqaLSuqzoIc?rel=1&version=2&autoplay=1&loop=1&mute=1&playlist=cqaLSuqzoIc;" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        
        <div class="col-xl-5">
          <div class="card shadow">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-uppercase text-muted ls-1 mb-1">Performance</h6>
                  <h2 class="mb-0">Total orders</h2>
                </div>
              </div>
            </div>
            <div class="card-body">
              <!-- Chart -->
              <div class="chart">
                <canvas id="chart-orders" class="chart-canvas"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-5">
		
		<!-- 최신 공지사항 5개 -->
        <div class="col-xl-4">
          <div class="card shadow">
            <div class="card-header border-0">
              <div class="row align-items-center">
                <div class="col">
                  <h3 class="mb-0">공지사항</h3>
                </div>
                <div class="col text-right">
                  <a href="notice.do" class="btn btn-sm btn-primary">더 보기</a>
                </div>
              </div>
            </div>
            <div class="table-responsive">
              <!-- Projects table -->
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">글분류</th>
                    <th scope="col">글제목</th>
                    <th scope="col">작성일시</th>
                  </tr>
                </thead>
                <tbody>

					<c:forEach var="noticeDTO" items="${noticeList }">
						<tr>
							<td height="60px;">
								<c:choose>
			                  		<c:when test="${noticeDTO.notice_type eq 'P'}">
			                  			<img  style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/공지.gif">
			                  		</c:when>
			                  		<c:when test="${noticeDTO.notice_type eq 'A'}">
			                  			<img style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/광고.gif">
			                  		</c:when>
			                  		<c:when test="${noticeDTO.notice_type eq 'E'}">
			                  			<img style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/이벤트.gif">
                  					</c:when>
                  				</c:choose>
							</td>
							<td>
								<a href="noticeSelect.do?notice_num=${noticeDTO.notice_num }">${noticeDTO.title }</a>
							</td>
							<td>
								${fn:substring(noticeDTO.write_date,2,16)}
							</td>
						</tr>
					</c:forEach>

                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- 자유게시판 추천글 5개 -->
        <div class="col-xl-8 mb-5 mb-xl-0">
          <div class="card shadow">
            <div class="card-header border-0">
              <div class="row align-items-center">
                <div class="col">
                  <h3 class="mb-0">자유게시판 추천글</h3>
                </div>
                <div class="col text-right">
                  <a href="board.do" class="btn btn-sm btn-primary">더 보기</a>
                </div>
              </div>
            </div>
            <div class="table-responsive">
              <!-- Projects table -->
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">글번호</th>
                    <th scope="col">글제목</th>
                    <th scope="col">글쓴이</th>
                    <th scope="col">추천수</th>
                    <th scope="col">작성일시</th>
                  </tr>
                </thead>
                <tbody>
                  <c:set var="rank" value="1"></c:set>
                  <c:forEach var="boardDTO" items="${boardList }">
                   	<c:choose>
                   		<c:when test="${rank == 1 }">
                   			<tr style="background-color: #fff9d4;">
		                		<td height="60px;">
		                			${boardDTO.bNum}
		                		</td>
		                		<th scope="row">
		                			<a href="select.do?bNum=${boardDTO.bNum}"><b>${boardDTO.title}</b></a>
		                		</th>
		                		<td>
		                			${boardDTO.writer}
		                		</td>
		                		<td>
		                			<font color="red">${boardDTO.hit}</font>
		                		</td>
		                		<td>
		                			${fn:substring(boardDTO.write_date,0,14)}
		                		</td>
                			</tr>	
                   		</c:when>
                   		<c:when test="${rank == 2 }">
                   			<tr style="background-color: #f5f5f5;">
		                		<td height="60px;">
		                			${boardDTO.bNum}
		                		</td>
		                		<th scope="row">
		                			<a href="select.do?bNum=${boardDTO.bNum}"><b>${boardDTO.title}</b></a>
		                		</th>
		                		<td>
		                			${boardDTO.writer}
		                		</td>
		                		<td>
		                			<font color="red">${boardDTO.hit}</font>
		                		</td>
		                		<td>
		                			${fn:substring(boardDTO.write_date,0,14)}
		                		</td>
                			</tr>	
                   		</c:when>
                   		<c:when test="${rank == 3 }">
                   			<tr style="background-color: #ffe4cf;">
		                		<td height="60px;">
		                			${boardDTO.bNum}
		                		</td>
		                		<th scope="row">
		                			<a href="select.do?bNum=${boardDTO.bNum}"><b>${boardDTO.title}</b></a>
		                		</th>
		                		<td>
		                			${boardDTO.writer}
		                		</td>
		                		<td>
		                			<font color="red">${boardDTO.hit}</font>
		                		</td>
		                		<td>
		                			${fn:substring(boardDTO.write_date,0,14)}
		                		</td>
                			</tr>	
                   		</c:when>
                   		<c:otherwise>
                   			<tr>
		                		<td height="60px;">
		                			${boardDTO.bNum}
		                		</td>
		                		<th scope="row">
		                			<a href="select.do?bNum=${boardDTO.bNum}"><b>${boardDTO.title}</b></a>
		                		</th>
		                		<td>
		                			${boardDTO.writer}
		                		</td>
		                		<td>
		                			<font color="red">${boardDTO.hit}</font>
		                		</td>
		                		<td>
		                			${fn:substring(boardDTO.write_date,0,14)}
		                		</td>
                			</tr>	
                   		</c:otherwise>
                   	</c:choose>
                   	<c:set var="rank" value="${rank + 1 }"></c:set>
                  </c:forEach>

                </tbody>
              </table>
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
  <script src="resources/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
  <script src="resources/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
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