<%@page import="co.kr.khaki.notice.NoticeDTO"%>
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
              <a href="home.do">
                <img src="resources/assets/img/brand/khaki_logo.png">
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
        </div>
      </div>
    </div>
    
    <!-- 
    	넣을 기능들
    	공지
	    	- 조회수, 추천, 공지기능(공지로 표시하면 맨 윗단에 표시 되도록 설정)
    		- 이미지 추가하면 표시 되도록
    		- 답글 기능(다음 카페 참조하여 답글을 달면 내용에서 조금 밀려서 표시 되도록, 즉 구분되도록!)
    		- 댓글 기능
    		- 포토업로더, editor 기능 구현
    		- 
    
     -->
    <%
    	NoticeDTO ndto = (NoticeDTO)request.getAttribute("ndto");
    %>
    
	<script type="text/javascript">
	
  	$(function(){
  		$("#deletebtn").click(function(){
  			location.href = "noticeDelete.do?notice_num="+<%= ndto.getNotice_num()%>+"&curPage="+${curPage}+"&pageSize="+${pageSize};
  		});	//delete button click end
  		
  		$("#updatebtn").click(function(){
  			location.href = "noticeUpdate1.do?notice_num="+<%= ndto.getNotice_num()%>+"&curPage="+${curPage}+"&pageSize="+${pageSize};
  		});	//update button click end
  		
  	});	//Jquery End
  
  	</script>
    <!-- white 테마 사용 -->
    <div class="container-fluid mt--7">
      <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0">공지사항</h3>
            </div>	<!-- card-header border End -->
            <div class="card-body">
            	<form action="noticeInsertProcess.do">
            		<div class="row">
	            		<div class="col-md-6">
					      <div class="form-group">
					      	<%
					      	if(ndto.getNotice_type().equals("P")){
				      		%>
					      	<div class="custom-control custom-radio mb-3">
							  <input name="notice_type" class="custom-control-input" id="customRadio5" type="radio" value="P" checked="checked">
							  <label class="custom-control-label" for="customRadio5">공지</label>
							</div>
					      	<%
					      	}else if(ndto.getNotice_type().equals("A")){
					      		
			      		 	%>
							<div class="custom-control custom-radio mb-3">
							  <input name="notice_type" class="custom-control-input" id="customRadio6" type="radio" value="A" checked="checked">
							  <label class="custom-control-label" for="customRadio6">광고</label>
							</div>
					      	<%
					      	}else if(ndto.getNotice_type().equals("E")){
					      		
			      		 	%>
							<div class="custom-control custom-radio mb-3">
							  <input name="notice_type" class="custom-control-input" id="customRadio6" type="radio" value="E" checked="checked">
							  <label class="custom-control-label" for="customRadio7">이벤트</label>
							</div>
							<%
					      	}else{
			      		 	%>
							<div class="custom-control custom-radio mb-3">
							  <input name="notice_type" class="custom-control-input" id="customRadio8" type="radio" value="G" checked="checked">
							  <label class="custom-control-label" for="customRadio7">일반</label>
							</div>
							<%
					      	}
					      	%>
					      </div>
					    </div>
            		</div>
            		<div class="row" style="font-family: 'Black Han Sans', sans-serif;">
            			<div class="col-md-9">
            				<div class="row">
		            			<div class="col-md-6" align="left">
		            				글번호 : <%=ndto.getNotice_num() %>
		            			</div>
		            			<div class="col-md-6" align="right">
		            				조회수 : <%=ndto.getHit() %> | 작성일시 : <%=ndto.getWrite_date() %>
		            			</div>
            				</div>
            			</div>
            		</div>
            		<div class="row" style="font-family: 'Nanum Pen Script', cursive;"> 	<!-- row는 한 행을 구분 짓는 것 -->
					    <div class="col-md-9">
					      <div class="form-group">	
					        <input style="font-size: 20px;" type="text" class="form-control" name="title" placeholder="" readonly="readonly" value="<%=ndto.getTitle() %>">
					      </div>
					    </div>
				  	</div>
					<div class="row" style="font-family: 'Nanum Pen Script', cursive;">
					    <div class="col-md-9">
					      <div class="form-group">
					      <!-- 일단은 session에서 id 받아오는 것 대신 test 아이디 넣음 -->
					        <input style="font-size: 20px;" type="text" class="form-control" value="<%=ndto.getWriter() %>" readonly="readonly" name="writer">
					      </div>
					    </div>
				  	</div>
					<div class="row" style="font-family: 'Nanum Pen Script', cursive;">
						<div class="col-md-9">
							<div class="form-group">
								<div class="card" style="width: 100%; background-color: #fafafa;">
									<div style="font-size: 25px;"  class="card-body">
										<%=ndto.getContent() %>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<button type="button" class="btn btn-outline-success" id="updatebtn">수정</button>
							<button type="button" class="btn btn-outline-success" id="deletebtn">삭제</button>
							<input type="button" class="btn btn-outline-success" onclick="history.back(-1);" value="뒤로가기">
						</div>
					</div>
					<input type="hidden" name="notice_num" value="1">	<!-- 게시판 번호 1씩 더해서 들어갈 수 있도록(어떤방식으로? DB에서 가장 높은 수 가져와서 +1 or autoincrement처럼 되는 기능 확인 -->
					<!-- value값이 의미 없이 mapper에서 oracle 내부에서 시퀀스로 들어가게끔 만듦 -->
					<input type="hidden" name="image" value="empty">	<!-- 이미지 넣는 것은 포토 업로더 작업 시 같이 진행 -->
					<input type="hidden" name="hit" value="1">	<!-- 조회수(다른 아이디로 접속 시 플러스 되도록), 게시판 메인화면(notice.jsp)에서 확인 되고 나서 작성 -->
					<input type="hidden" name="write_date" value="sysdate">	
					
					<!-- <input type="hidden" name="write_date" value="null"> -->
            	</form>
            </div>	<!-- card-body End -->
           	<!-- <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                      <span class="sr-only">Previous</span>
                    </a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">
                      <i class="fas fa-angle-right"></i>
                      <span class="sr-only">Next</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>	card-footer End -->
          </div>	<!-- card End -->
        </div>	<!-- col End -->
      </div>	<!-- row End -->
    </div>	<!-- container-fluid mt--7 End -->
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
    </div>	<!-- main-content End -->
   <!-- </div> -->
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
