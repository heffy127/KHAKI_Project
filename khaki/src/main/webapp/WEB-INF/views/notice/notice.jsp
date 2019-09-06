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
  <script type="text/javascript">
  	
  	function fn_paging(curPage){
  		location.href = "notice.do?curPage="+curPage;
  		//alert(curPage); //페이지 넘버 확인
  	};
  	// aaaaa
    $(function(){
    	
    	$(".btn_notice").click(function(){
    		alert("공지사항 버튼");
    		$("tbody").children("#board_add").hide();
    		
    		
    		
    	});		//공지사항 버튼 end
    	
    	$(".btn_add").click(function(){
    		alert("광고 버튼");
    	});		//광고 버튼 end
    	
    	$(".btn_event").click(function(){
    		alert("이벤트 버튼");
    	});		//이벤트 버튼 end
    	
    	
    	
    	
    });	//Jquery End
  </script>
  
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
          <div class="row">
          	<div class="col">
          	</div>
          </div>
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
    	List<NoticeDTO> list = (List<NoticeDTO>)request.getAttribute("nlist");
    	
    /* font-family: 'Black Han Sans', sans-serif;
    font-family: 'Nanum Pen Script', cursive; */
    	
    
    %>
    <!-- aaaabbcccddeeffee -->
    <!-- white 테마 사용 -->
    <div class="container-fluid mt--7">
      <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
            	<div class="row">
            		<div class="col-md-3" align="center">
	          		    총 게시물 수 : <%= list.size() %>
            		</div>
            		<div class="col-md-6" align="center">
            			<button type="button" class="btn btn-success btn_notice">공     지</button>
            			<button type="button" class="btn btn-warning btn_add">광     고</button>
            			<button type="button" class="btn btn-info btn_event">이 벤 트</button>
            		</div>
            		<div class="col-md-3">
            		</div>
            	</div>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr style="font-family: 'Black Han Sans', sans-serif;" align="center">
                  	<th scope="col" style="font-size: 20px;">글 분 류</th>
                    <th scope="col" style="font-size: 20px;">글 번 호</th>
                    <th scope="col" style="font-size: 20px;">글 쓴 이</th>	<!-- component에서 modal기능을 이용하여 보여줄 수 있게-->
                    <th scope="col" style="font-size: 20px;">글 제 목</th>
                    <th scope="col" style="font-size: 20px;">조 회 수</th>
                    <th scope="col" style="font-size: 20px;">작성일시</th>
                  </tr>
                </thead>
                <!-- 전체적인 정렬이 필요(css확인 후 강제 인라인 먹일 수 있는 방법 모색) or 그냥... 넣어보자 ㅋㅋㅋㅋ aaabbbcccdddeeeeefffff -->
                <%
                	pagination pg = (pagination)request.getAttribute("pagination");
         	   	%>
         	   	<!-- aaabbccc -->
                <tbody>
                <!-- 공지사항 위로 올리기 -->
                <c:if test="${noticelist.size() > 1}">
                	<c:forEach var="notice_dto" items="${noticelist}" begin="0" end="1">
	                	<tr id="board_notice" style="font-family: 'Nanum Pen Script', cursive;" align="center">
		                  	<!-- 공지 - 광고 - 이벤트 - 일반글 순서로 나열 -->
		                  	<!-- 글분류 -->
		                  	<td scope="row" style="font-size: 30px;">
			                  	<img  style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/공지.gif">
		                  	</td>
			                  	<!-- 글번호 -->
		                  	<td style="font-size: 30px;">	<!-- scope의 의미는? -->
		                  		${notice_dto.notice_num }
		                  	</td>
		                  	<!-- 글쓴이( 이미지 + 아이디 : 글쓴이 클릭하면 쪽지 보낼 수 있도록이나 이런 기능??) -->
		                    <td style="font-size: 30px;">
			                    ${notice_dto.writer }
		                    </td>
		                    <!-- 내용이 나오도록(내용 누르면 공지사항 상세페이지로 가도록 or 카드 열리는 형식으로 표시 되도록) -->
		                    <td style="font-size: 30px;">
		                      <a href="noticeSelect.do?notice_num=${notice_dto.notice_num }">${notice_dto.title }</a>
		                    </td>
		                    <!-- 조회수 -->
		                    <td style="font-size: 30px;">
		                    	${notice_dto.hit }
		                    </td>
		                    <!-- 작성일시 -->
		                    <td style="font-size: 30px;">
		                  		${notice_dto.write_date }
		                    </td>
	                	</tr>
                	</c:forEach>
                </c:if>
                <c:choose>
                	<c:when test="${noticelist.size() == 1}">
                		<c:forEach var="notice_dto" items="${noticelist}">
		                	<tr id="board_notice" style="font-family: 'Nanum Pen Script', cursive;" align="center">
			                  	<!-- 공지 - 광고 - 이벤트 - 일반글 순서로 나열 -->
			                  	<!-- 글분류 -->
			                  	<td scope="row" style="font-size: 30px;">
				                  	<img  style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/공지.gif">
			                  	</td>
				                  	<!-- 글번호 -->
			                  	<td style="font-size: 30px;">	<!-- scope의 의미는? -->
			                  		${notice_dto.notice_num }
			                  	</td>
			                  	<!-- 글쓴이( 이미지 + 아이디 : 글쓴이 클릭하면 쪽지 보낼 수 있도록이나 이런 기능??) -->
			                    <td style="font-size: 30px;">
				                    ${notice_dto.writer }
			                    </td>
			                    <!-- 내용이 나오도록(내용 누르면 공지사항 상세페이지로 가도록 or 카드 열리는 형식으로 표시 되도록) -->
			                    <td style="font-size: 30px;">
			                      <a href="noticeSelect.do?notice_num=${notice_dto.notice_num }">${notice_dto.title }</a>
			                    </td>
			                    <!-- 조회수 -->
			                    <td style="font-size: 30px;">
			                    	${notice_dto.hit }
			                    </td>
			                    <!-- 작성일시 -->
			                    <td style="font-size: 30px;">
			                  		${notice_dto.write_date }
			                    </td>
		                	</tr>
                		</c:forEach>
                	</c:when>
                	<c:otherwise>
                	</c:otherwise>
                </c:choose>
                
                <!-- 이벤트 위로 올리기 -->
                <c:if test="${eventlist.size() > 1}">
                	<c:forEach var="event_dto" items="${eventlist}" begin="0" end="1">
	                	<tr id="board_event" style="font-family: 'Nanum Pen Script', cursive;" align="center">
		                  	<!-- 공지 - 광고 - 이벤트 - 일반글 순서로 나열 -->
		                  	<!-- 글분류 -->
		                  	<td scope="row" style="font-size: 30px;">
			                  	<img style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/이벤트.gif">
		                  	</td>
			                  	<!-- 글번호 -->
		                  	<td style="font-size: 30px;">	<!-- scope의 의미는? -->
		                  		${event_dto.notice_num }
		                  	</td>
		                  	<!-- 글쓴이( 이미지 + 아이디 : 글쓴이 클릭하면 쪽지 보낼 수 있도록이나 이런 기능??) -->
		                    <td style="font-size: 30px;">
			                    ${event_dto.writer }
		                    </td>
		                    <!-- 내용이 나오도록(내용 누르면 공지사항 상세페이지로 가도록 or 카드 열리는 형식으로 표시 되도록) -->
		                    <td style="font-size: 30px;">
		                      <a href="noticeSelect.do?notice_num=${event_dto.notice_num }">${event_dto.title }</a>
		                    </td>
		                    <!-- 조회수 -->
		                    <td style="font-size: 30px;">
		                    	${event_dto.hit }
		                    </td>
		                    <!-- 작성일시 -->
		                    <td style="font-size: 30px;">
		                  		${event_dto.write_date }
		                    </td>
	                	</tr>
                	</c:forEach>
                </c:if>
                <c:choose>
                	<c:when test="${eventlist.size() == 1}">
                		<c:forEach var="event_dto" items="${eventlist}">
		                	<tr id="board_event" style="font-family: 'Nanum Pen Script', cursive;" align="center">
			                  	<!-- 공지 - 광고 - 이벤트 - 일반글 순서로 나열 -->
			                  	<!-- 글분류 -->
			                  	<td scope="row" style="font-size: 30px;">
				                  	<img style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/이벤트.gif">
			                  	</td>
				                  	<!-- 글번호 -->
			                  	<td style="font-size: 30px;">	<!-- scope의 의미는? -->
			                  		${event_dto.notice_num }
			                  	</td>
			                  	<!-- 글쓴이( 이미지 + 아이디 : 글쓴이 클릭하면 쪽지 보낼 수 있도록이나 이런 기능??) -->
			                    <td style="font-size: 30px;">
				                    ${event_dto.writer }
			                    </td>
			                    <!-- 내용이 나오도록(내용 누르면 공지사항 상세페이지로 가도록 or 카드 열리는 형식으로 표시 되도록) -->
			                    <td style="font-size: 30px;">
			                      <a href="noticeSelect.do?notice_num=${event_dto.notice_num }">${event_dto.title }</a>
			                    </td>
			                    <!-- 조회수 -->
			                    <td style="font-size: 30px;">
			                    	${event_dto.hit }
			                    </td>
			                    <!-- 작성일시 -->
			                    <td style="font-size: 30px;">
			                  		${event_dto.write_date }
			                    </td>
		                	</tr>
                		</c:forEach>
                	</c:when>
                	<c:otherwise>
                	</c:otherwise>
                </c:choose>
                <tr bordercolor="green" height="1px">
                	<td height="1px" colspan="6" bordercolor="green">
                </tr>
                <!-- for문을 돌릴 떄 현재 페이지를 보내서 aaaabcddee -->
                <c:forEach var="ndto" items="${nlist}" varStatus="status" begin="<%=pg.getStartIndex() %>" end="<%=pg.getEndIndex() %>">
	                <tr id="" style="font-family: 'Nanum Pen Script', cursive;" align="center">
	                  	<!-- 공지 - 광고 - 이벤트 - 일반글 순서로 나열 -->
	                  	<!-- 글분류 -->
	                  	<td scope="row" style="font-size: 30px;">
                  		<c:choose>
	                  		<c:when test="${ndto.notice_type eq 'P'}">
	                  			<img  style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/공지.gif">
	                  		</c:when>
	                  		<c:when test="${ndto.notice_type eq 'A'}">
	                  			<img style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/광고.gif">
	                  		</c:when>
	                  		<c:when test="${ndto.notice_type eq 'E'}">
	                  			<img style="width: auto; height: auto; max-width: 60px; max-height: 25px;" src="resources/assets/img/icons/noticeicon/이벤트.gif">
                  			</c:when>
                  		</c:choose>
	                  	</td>
		                  	<!-- 글번호 -->
	                  	<td style="font-size: 30px;">	<!-- scope의 의미는? -->
	                  		${ndto.notice_num }
	                  	</td>
	                  	<!-- 글쓴이( 이미지 + 아이디 : 글쓴이 클릭하면 쪽지 보낼 수 있도록이나 이런 기능??) -->
	                    <td style="font-size: 30px;">
		                    ${ndto.writer }
	                    </td>
	                    <!-- 내용이 나오도록(내용 누르면 공지사항 상세페이지로 가도록 or 카드 열리는 형식으로 표시 되도록) -->
	                    <td style="font-size: 30px;">
	                      <a href="noticeSelect.do?notice_num=${ndto.notice_num }">${ndto.title }</a>
	                    </td>
	                    <!-- 조회수 -->
	                    <td style="font-size: 30px;">
	                    	${ndto.hit }
	                    </td>
	                    <!-- 작성일시 -->
	                    <td style="font-size: 30px;">
	                  		${ndto.write_date }
	                    </td>
                	</tr>
           		</c:forEach>
                </tbody>
                <tfoot>
                	<tr>
                		<td colspan="6" align="right">
                			<form action="noticeInsert.do">
		                		<button type="submit" class="btn btn-outline-info">글쓰기</button>
		                		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                		<input type="button" class="btn btn-outline-info" onclick="history.back(-1);" value="뒤로가기">
		                		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                			</form>
                		</td>
                	</tr>
                </tfoot>
              </table>
            </div>
            <div class="card-footer py-4" align="center">
            	<!-- 페이지 네이션 구현 -->
            		<!-- pagenatin 블럭이 1이 아니면 처음 표시가 나오게끔 -->
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
              <!-- <nav aria-label="...">
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
              </nav> -->
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
