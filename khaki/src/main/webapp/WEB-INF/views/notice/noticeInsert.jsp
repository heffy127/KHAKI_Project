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
  <!-- Jquery CDN -->
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <!-- 네이버 스마트에디터 2.8.2.3버전 적용 -->
  <script type="text/javascript" src="./resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "ir1",	// textarea의 id 값과 맞춰줌
            sSkinURI: "resources/smarteditor2/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#writebtn").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            
            var title = $("#title").val();
            var content = $("#ir1").val();
            if(title == "" || content == "<p>&nbsp;</p>"){
            	if(title == ""){
                	alert("글 제목을 입력해주세요!")
                }
                if(content == "<p>&nbsp;</p>"){
                	alert("글 내용을 입력해주세요!")
                }
            }else{
            	$("#insertform").submit();
            }
        });
    });	//JQuery End
  </script>
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
		              swal(xhr + " : " + status); // 실패 내용 확인
		          }
			});
  		})

  	})
  </script>
  <!-- 네이버 스마트에디터 2.xx버전  -->
  <!-- root가 wepapp로 잡혀 있기 때문에 바로 폴더명으로 들어가도 상관없음! -->
  <script type="text/javascript" src="smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

  <!-- Favicon -->
  <link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
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
            <a class="nav-link active" href="notice.do">
              <i class="ni ni-air-baloon text-red"></i> 공지사항
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="coupon.do">
              <i class="ni ni-collection text-green"></i> 쿠폰
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " id="handler_a" style="cursor: pointer;">
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
         <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="notice.do">Notice</a>
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
    
    <!-- 
    	넣을 기능들
    	공지
	    	- 조회수, 추천, 공지기능(공지로 표시하면 맨 윗단에 표시 되도록 설정)
    		- 이미지 추가하면 표시 되도록
    		- 답글 기능(다음 카페 참조하여 답글을 달면 내용에서 조금 밀려서 표시 되도록, 즉 구분되도록!)
    		- 댓글 기능
    		- 포토업로더, editor 기능 구현
    		- 
    	aaaabbccdd
     -->
    <%  %>
    <!-- white 테마 사용 -->
    <div class="container-fluid mt--7">
      <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0">공지사항 등록</h3>
            </div>	<!-- card-header border End -->
            <div class="card-body">
            	<form action="noticeInsertProcess.do" id="insertform" method="post" enctype="multipart/form-data">
            		<div class="row">
	            		<div class="col-md-6">
					      <div class="form-group">
	            			<div class="row">
	            				&nbsp;&nbsp;&nbsp;&nbsp;
						      	<div class="custom-control custom-radio mb-3 col-md-3">
								  <input name="notice_type" class="custom-control-input" id="customRadio5" type="radio" value="P">
								  <label class="custom-control-label" for="customRadio5">공지</label>
								</div>
								<div class="custom-control custom-radio mb-3 col-md-3">
								  <input name="notice_type" class="custom-control-input" id="customRadio6" type="radio" value="A">
								  <label class="custom-control-label" for="customRadio6">광고</label>
								</div>
								<div class="custom-control custom-radio mb-3 col-md-3">
								  <input name="notice_type" class="custom-control-input" id="customRadio7" type="radio" value="E">
								  <label class="custom-control-label" for="customRadio7">이벤트</label>
								</div>
								<div class="custom-control custom-radio mb-3 col-md-2">
								  <input name="notice_type" class="custom-control-input" id="customRadio8" type="radio" value="G" checked="checked">
								  <label class="custom-control-label" for="customRadio8">일반</label>
								</div>
						      </div>
					      	</div>
					    </div>
            		</div>
            		<div class="row">	<!-- row는 한 행을 구분 짓는 것 -->
					    <div class="col-md-6">
					      <div class="form-group">
					        <input type="text" class="form-control" id="title" name="title" placeholder="제목">
					      </div>
					    </div>
				  	</div>
					<div class="row">
					    <div class="col-md-6">
					      <div class="form-group">
					      <!-- 일단은 session에서 id 받아오는 것 대신 test 아이디 넣음 -->
					        <input type="text" class="form-control" value="${sessionId}" name="writer" placeholder="글쓴이" readonly="readonly">
					      </div>
					    </div>
				  	</div>
					<div class="row">
						<div class="col-md-10">
							<div class="form-group">
								<textarea class="form-control" rows="10" cols="50" placeholder="글 내용" name="content" id="ir1"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<input type="button" class="btn btn-outline-success" id="writebtn" value="글등록">
							<button type="button" class="btn btn-outline-success" onclick="history.back(-1);">취소</button>
						</div>
					</div>
					<input type="hidden" name="notice_num" value="1">	<!-- 게시판 번호 1씩 더해서 들어갈 수 있도록(어떤방식으로? DB에서 가장 높은 수 가져와서 +1 or autoincrement처럼 되는 기능 확인 -->
					<!-- value값이 의미 없이 mapper에서 oracle 내부에서 시퀀스로 들어가게끔 만듦 -->
					<input type="hidden" name="image" value="empty">	<!-- 이미지 넣는 것은 포토 업로더 작업 시 같이 진행 -->
					<input type="hidden" name="hit" value="0">	<!-- 조회수(다른 아이디로 접속 시 플러스 되도록), 게시판 메인화면(notice.jsp)에서 확인 되고 나서 작성 -->
					<input type="hidden" name="write_date" value="sysdate">
					<input type="hidden" name="curPage" value="${curPage}">
					<input type="hidden" name="pageSize" value="${pageSize}">
					<!-- <input type="hidden" name="write_date" value="null"> -->
            	</form>
            </div>	<!-- card-body End -->
           	<div class="card-footer py-4">
            </div>	<!-- card-footer End -->
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
