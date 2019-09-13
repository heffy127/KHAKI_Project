<%@page import="co.kr.khaki.key.ClaimDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="co.kr.khaki.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <!-- 글씨체 -->
  <link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
  <!-- JQuery CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- 글쓰기 버튼 실행 -->
  <script type="text/javascript">
  	$(function(){
  		$("#writeButton").click(function(){
  			location.href= 'insertPage.do';
  		});
  	});
  	function claimModal(content,id,num) {
  		
		$('#claim_answer').empty();
		$('#claim_num').text(num);
		$('#claim_answer').append(content);
		$('#claim_answer').append("처리내용 : <input class='form-control' id='claim_result' name='claim_result'>");
		
	}
  	function claimInput() {
		var num = $('#claim_num').text();
		var result = $('#claim_result').val();
		
		location.href="claimResult.do?claim_num="+num+"&claim_result="+result;
	}
  	function resultView(content,result) {
  		$('#claim_answer').empty();
		$('#claim_num').text(num);
		$('#claim_answer').append(content);
		$('#claim_answer').append("처리내용 : <input class='form-control' id='claim_result' name='claim_result' value="+result+">");
	}
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">Board <i class="fas fa-pencil-alt"></i></a>
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
            <h3 class="display-2 text-white">신고내역</h3>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid mt--7">
    
      <!-- 게시판 리스트 -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0" style="font-family: 'Hi Melody', cursive; font-size: 20px;">신고내역</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th class="bodyList" scope="col" width="10%">번호</th>
                    <th class="bodyList" scope="col" width="10%">신고유형</th>
                    <th class="bodyList" scope="col" width="30%">내용</th>
                    <th class="bodyList" scope="col" width="10%">작성자</th>
                    <th class="bodyList" scope="col" width="10%">진행상황</th>
                    <th class="bodyList" scope="col" width="10%">작성시간</th>
                    <th class="bodyList" scope="col" width="20%">답변시간</th>
                  </tr>
                </thead>
                
               
                <c:forEach var="claimDTO" items="${list}">
                <tbody class="listBody">
                
                  <tr>
                  <!-- num -->
                    <td scope="row">
                      <div id="num">
                      	${claimDTO.claim_num}
                      </div>
                  	</td>
                    <!-- category -->
                    <td >
                    	<c:set var="category" value="category" />
                    	<c:choose>
							<c:when test="${claimDTO.claim_category eq 'disorder'}">
								<font style="color: navy; font-weight: bold;">불편신고</font>
							</c:when>  
							                  	
							<c:when test="${claimDTO.claim_category eq 'accident'}">
								<font style="color: red; font-weight: bold;">사고신고</font>
							</c:when>                    	
							
							<c:when test="${claimDTO.claim_category eq 'etc'}">
								<font style="color: red; font-weight: bold;">기타</font>
							</c:when>                    	
                    	</c:choose>
                    </td>
                    <!-- subject -->
                    <td >
                    	<b>${claimDTO.claim_content}</b>
                    </td>
                  	<!-- writer -->
                    <td>
						${claimDTO.claim_id}
                    </td>
                    <!-- views -->
                    <td>
                      <div>
                      <c:set var="category" value="category" />
                      <c:choose>
                      
	                      <c:when test="${claimDTO.claim_result eq null}">
	                        <button class="btn btn-outline-danger" data-toggle="modal" data-target="#exampleModal" onclick="claimModal('${claimDTO.claim_content}','${claimDTO.claim_id}','${claimDTO.claim_num}')">확인중</button>
					      </c:when>    
					      
	                      <c:when test="${claimDTO.claim_result ne null}">
	                        <button class="btn btn-success" data-toggle="modal" data-target="#exampleModal" onclick="resultView('${claimDTO.claim_content}','${claimDTO.claim_result}')">완료</button>
					      </c:when>    
					      
				      </c:choose>
                      </div>
                    </td>
                    
                    <!-- result -->
                   	<td>
						${fn:substring(claimDTO.claim_subTime,0,14)}
                   	</td>
                   
                    <!-- time -->
                    <td>
                    	<!-- timestamp로 등록한 값을 분까지만 자름 -->
						${fn:substring(claimDTO.claim_ansTime,0,14)}
                    </td>
             	 </c:forEach>
             	 
                	<tr>
                	</tr>
              </table>
            </div>
            <!-- Modal -->
			<!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
			<div>
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 id="claim_num" hidden=""></h5>
			        <h5 class="modal-title" id="exampleModalLabel">신고처리</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" id="claim_answer">
			       
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" onclick="claimInput()">저장</button>
			      </div>
			    </div>
			  </div>
			</div>
			
            <div class="card-footer py-4">
             <nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">
			        <i class="fa fa-angle-left"></i>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			    <li class="page-item active"><a class="page-link" href="#">1</a></li>
			    <li class="page-item "><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">
			        <i class="fa fa-angle-right"></i>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
			    
			  </ul>
			</nav>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
</body>

</html>
