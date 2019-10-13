<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
  <!-- JQuery CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
  <!-- 스마트 에디터  -->
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript">
  	$(function(){
  		
  		//page처리
  		function fn_paging(curPage){
  	  		location.href = "viewPage.do?curPage="+curPage;
  	  		//alert(curPage); //페이지 넘버 확인
  	  	};
  		
  		// 댓글 버튼
  		$("#replyBtn").click(function(){
  			$("#insertReFrm").submit();
  		});
  		
        //목록버튼
        $("#boardBtn").click(function(){
            location.href = 'board.do';
        });
        
        //수정버튼
        $("#updateBtn").click(function(){
        	var retVal = confirm("게시글을 수정하시겠습니까?");
        	var num = ${dto.bNum}
        	var sId = "<%= session.getAttribute("sessionId") %>"
        	var writer = $("#contentWriter").text();
        	
        	if(retVal == true){
        		alert(writer);
        		if(sId == writer){
        			$.ajax({
        			  type : 'POST',
  			    	  url : "updatePage.do",
  			    	  data : {
  			    		 "bNum" :  num
  			    	  },
  			    	  success : function(data){
  			    		  location.href = "updatePage.do?bNum="+num;
  			    	  }
  			       });   
        		}else {
        			alert("접근할 수 없는 페이지 입니다.");
        		}
        	}
        });
        
      //게시글 삭제버튼
        $("#deleteBtn").click(function(){
        	var retVal = confirm("게시글을 삭제하시겠습니까?");
        	var num = ${dto.bNum};
        	var sId = "<%= session.getAttribute("sessionId") %>"
        	var writer = $("#contentWriter").text();
        	
        	if( retVal == true ){
        		if(sId == "admin1" || sId == writer){
	        	   alert("삭제되었습니다.");
			       $.ajax({
			    	  type : 'POST',
			    	  url : "delete.do",
			    	  data : {
			    		 "bNum" :  num
			    	  },
			    	  success : function(data){
			    		  location.href = "board.do";
			    	  }
			       });   
        		}else{
        			alert("※ 게시글을 삭제하실 수 없습니다. ※");
        		}
        	}
        });
        
        //추천버튼
        
		$("#goodBtn").click(function() {
				var retVal = confirm("게시글을 추천하시겠습니까?");
				var num = ${dto.bNum};
				var hit = ${dto.hit};
				if (retVal == true) {
					$.ajax({
						url : "updateHit.do",
						data : {
							"bNum" : num
						},
						success : function(data) {
							$.ajax({
								url : "updateHitSelect.do",
								data : {
									"bNum" : num
								},
								success : function(data) {
									$("#goodPlace").text(data);
								},
								error : function(xhr, status) {
									alert(xhr + " : " + status);
								}
							});
						},
						error : function(xhr, status) {
							alert(xhr + " : " + status);
						}
					});
				}
			});
        
		  	// 댓글 삭제버튼
			$("#reDelBtn").click(function(){
				var retVal = confirm("댓글을 삭제하시겠습니까?");
				var num = ${dto.bNum};
				var num2 = $("#reNum").val();
				var writer = $("#reId").text();
				
				if( retVal == true ){
					alert("댓글이 삭제되었습니다.");
					$.ajax({
						type : 'POST',
						url : "deleteRe.do",
						data : {
							"reNum" : num2
						},
						success : function(data){
							location.href = "select.do?bNum=" + num;
						}
					})
					
				}
			});
		
  	}); // script end
  	
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
          		<i class="ni ni-shop text-black"></i> Home
            </a>
          </li>
           <li class="nav-item">
          <% 
          if (session.getAttribute("sessionId")==null){ %>
            <a class="nav-link">
              <i class="ni ni-square-pin text-orange"></i> 카셰어링&nbsp;&nbsp;(로그인 필요)
            </a>
          <%
          } else {
          %>
            <a class="nav-link" href="map.do">
              <i class="ni ni-square-pin text-orange"></i> 카셰어링
            </a>
          <%}%>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="board.do">
              <i class="ni ni-bullet-list-67 text-blue"></i> 자유게시판
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="notice.do">
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
         <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="board.do">Board</a>
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
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 400px; background-image: url(resources/assets/img/theme/admin-cover.png); background-size: cover; background-position: center top;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Header container -->
      <div class="container-fluid d-flex align-items-center">
        <div class="row">
          <div class="col-lg-12 col-md-12">
            <h3 class="display-2 text-white">게시글 보기 </h3>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 게시글 보기  --> 
    <div class="container-fluid mt--7">
	      <div class="row">
	        <div class="col">
	          <div class="card shadow border-0" style="padding: 5% 10% 5% 10%;">
			    <div id="board" style="width: 100%; padding: 5% 10% 5% 10%;">
		    		<div style=" width:100%; height: 30px; ">
						<table>
						<tr>
							<td width="74%"><font size="6"><b>${dto.title}</b></font>&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- 공지글일때 공지글 표시  -->
								<c:set var="category" value="category" />
			                    	<c:if test="${dto.category eq 'notice'}">
			                    		<span class="badge badge-danger">공지</span>
			                    	</c:if>
							<br>
							</td>
							<td align="center"><font size="5" color="gray"><b id="contentWriter">${dto.writer}</b></font>
								<img alt="Image placeholder" src="${memPhoto}" 
								style="width:40px; border-radius: 40px;">
								
							<br>
							</td>
						</tr>
						<tr>
							<td><font size="2"><b>글번호</b>&nbsp;&nbsp;&nbsp;&nbsp;</font>
							<font size="2" color="gray">${dto.bNum}
								&nbsp;&nbsp;| <b>작성 시간</b> &nbsp;&nbsp;${fn:substring(dto.write_date,0,14)}</font></td>
							<td align="center">추천 &nbsp; <font size="2"
								color="gray"><b id="goodPlace">${dto.hit}</b></font>
								&nbsp;&nbsp;&nbsp; 조회 &nbsp; <font size="2" color="gray">
								<b>${dto.views}</b>
							</font>
							</td>
						</tr>
						<tr>
							<td colspan="2"><br>
								<div style="background-color: #f9f9fb; font-size: 14px; margin-top: 10px;" 
									align="center">
									<table border="0">
										<tr>
											<td width="850" height="200" valign="top"><font size="5px;">${dto.content}</font></td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td class="card-footer">
								<button type="button" class="btn btn-secondary btn-sm" id="goodBtn">추천
									 <i class="far fa-thumbs-up" style="color: red;"></i></button>
					   			<button type="button" id="boardBtn" class="btn btn-outline-default btn-sm" >글목록</button>
					   			
					   			<!-- session ID를 이용하여  수정/삭제 버튼 보이기(관리자는 삭제버튼 무조건 보이기)  -->
					   			<button type="button" id="updateBtn" class="btn btn-outline-info btn-sm" >수정</button>
					   			<button type="button" id="deleteBtn" class="btn btn-outline-danger btn-sm" >삭제</button>
					   			
					   		</td> <!-- card-footer End -->
						</tr>
						</table>
						<!-- 댓글  -->
						<h3>댓글</h3>
						<hr>
						<div id="replybox">
							<c:forEach var="reDTO" items="${listRe}">
								<b id="reId">${reDTO.writer}</b><br>
								${reDTO.content}&nbsp; <div style="float: right;">${fn:substring(reDTO.write_date,0,14)}
								<input type="hidden" id="reNum" value="${reDTO.reNum}">
								<!-- 댓글 작성자만 삭제버튼 활성화 -->
								<c:if test="${reDTO.writer eq sessionId}">
									<button type="submit" id="reDelBtn" class="btn btn-danger btn-sm">삭제</button>
								</c:if>
								
								</div><br>
								<hr>
							</c:forEach>
							
							
							<div id="reWrite">
								<form action="insertRe.do" method="POST" id="insertReFrm">
									<input type="hidden" value="${dto.bNum}" name="bNum" id="bNum">
									<input type="hidden" value="${sessionId}" name="writer" id="writer">
	 								<textarea class="form-control" id="content" name="content" rows="3" 
	 									placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. &#13;&#10;
	 									댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
	 								<button type="submit" class="btn btn-outline-success btn-sm"
	 									id="replyBtn" style="float: right; margin-top: 10px;">댓글 등록</button>
								</form>
							</div>
						</div>
			   		</div>
	        	</div> <!-- card End -->
	        </div> <!-- col End -->
	      </div> <!-- row End  -->
	   	</div> <!-- container End -->
	  	</div><!-- main-content End -->
  </div>
    <!--   Core   -->
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<!--   Argon JS   -->
<script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script>
   window.TrackJS && TrackJS.install({
      token : "ee6fab19c5a04ac1a32a645abde4613a",
      application : "argon-dashboard-free"
   });
</script>
  
</body>

</html>
