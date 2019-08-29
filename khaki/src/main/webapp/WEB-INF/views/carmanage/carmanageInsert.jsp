<%@page import="java.io.Console"%>
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
 	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
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
 				
 				
 				// 차량 등록시 소모품들 교체는 다 된 것으로 하고 수치를 넣도록 구현
 				// jquery에서 text()는 그 안의 text값을 가져오는것, val()은 value값을 가져오는 것(구분 잘하기)
 				var distance1 = $("#total_distance").val();		//parseInt가 필요한지는 아직 모름
 				var num = 0;
 				
 				// 차량번호 입력한 것을 그대로 받아와서 넘겨줌
 				var carnum_data = $("#carnum").val(); 
 				$("#carnum1").val(carnum_data);
 				
 				//배열 순서대로 타이밍벨트, 구동벨트, 엔진오일, 변속기오일, 브레이크 오일, 에어컨필터, 연료필터, 에어클리너, 냉각수, 배터리, 타이어 순서
				var arr = new Array(100000, 30000, 10000, 30000, 40000, 15000, 30000, 20000, 50000, 60000, 30000);
 				
				for(var i=0; i<arr.length;i++){
					var change_num = Math.floor(distance1 / arr[i]);		//distance에 따른 차량 소모품 교체 횟수(기준으로 나눈 것)
					$("#consumable"+(i+1)).val(change_num);
					
				};
				
 				$("#car_insert").submit();
 				alert("차량 등록 완료!");
 				
			});	// insert end
      
		// 차량 정보가 들어간 json을 가져와서 돌림
		// json 테스트
		/* var jsontest = '/khaki/resources/assets/json/test1.json';
		$.getJSON(jsontest, function(data){   //$.getJSON(url, success) - 여기서는 function을 넣어서 그 다음 동작하도록
		                                        // $.each(배열 등의 데이터, function(index, 데이터)) : 좀더 공부해보고 사용
		  $.each(data, function(I, item){
			  if("Kia" == item.made){
				  alert(I+":"+item.name);
			  }
		  })
		}) */


     /*  var result = new Array();
      result = "${carlist}";
      var sum;
      for (let i = 0; i < result.length; i++) {
        $("#test").append(result[i]);
        sum += result[i];
      }
      alert(sum); */

      		// 제조사드롭다운 클릭시 이벤트
			$(".dropdown-min-menu1").click(function(){
				var data1 = $(this).children(".carbrand").text();	// data1은 사용자가 선택된 제조사이름을 가져옴
				alert(data1);
				$("#brand_dropDown").text(data1);	// 제조사선택 화면에 선택된 값을 나오게끔
				$("#brand").val(data1);
				
				$(".min-menu2").children().remove();	// dorpdown-menu2번째를 초기화하고
				
				var jsontest = '/khaki/resources/assets/json/test1.json';
				
				var sum = 0;
				$.getJSON(jsontest, function(data){	//data안에 JSON값을 가져옴(success된 것)
					$.each(data, function(I,item){	// I는 JSON안의 인덱스,item은 각 객체들을 가져오는 것으로 생각
						if(data1 == item.made){	//제조사가 일치하면
							//alert(I + ":" + item.name + " / "+ item.fuel)	//여기까지 완료
							$(".min-menu2").append('<div class=\"dropdown-min-menu2\"><div class=\"dropdown-item carname\">'+item.name+'/'+item.size+'/'+item.fuel+'</div></div>');
							// append되는 대상을 잘 생각하고, remove는 대상을 지우는 것으로 children을 지워야 그 대상이 아닌 하위가 지워지는 것!
						}
					});	//each End
				});	//JOSN load
				
				
			});	// 브랜드 dropdown End
			
			// 차량명 드롭다운에서 요소 가져오기
			/*
				동적태그 이벤트
			$(document).on("click","#btn",function(){
			}
			*/
			$(document).on("click",".dropdown-min-menu2",function(){
				// 하나로 특정지어야함(모두 carname의 class를 가짐, 여기서 쓰는 메소드 this인데..)
				// jstl의 for문으로 뿌려진 것을 this로 가져오는 것과 내부에서 append해서 만들어진 dorpdown에서 가져오는 것의 차이??
				var data2 = $(this).children(".carname").text();
				//여기서 this는 dropdown-min-menu2를 의미함
				alert(data2);	
				var arr = new Array();
				arr = data2.split("/");
				// split 테스트
				//alert(arr[0]);
				//alert(arr[1]);
				
				//$("#car_dropDown").children().children("i").remove();
				
				$("#car_dropDown").text(data2);
		        $("#carname").val(arr[0]);		// DB에 차량 이름 저장
		        $("#img").val(arr[0]+".png");	// DB에 저장하기 위해(.png를 붙여서 저장해줌)
		        $("#car_img").attr("src", "resources/assets/img/car/"+arr[0]+".png");	//차량 이미지 나오게 하는 곳
		        
		        //form 태그 내의 hidden에 val메소드를 통해 값을 넣어서 넘겨줌
		        $("#car_size").val(arr[1]);
		        $("#size_dropDown").text(arr[1]);
		        $("#fuel").val(arr[2]);
		        $("#fuel_dropDown").text(arr[2]);
		        
			});	//차량명 dropdown End
			
			
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
        <img src="resources/assets/img/brand/khaki_logo.png" class="navbar-brand-img" alt="...">
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
              <div class="dropdown-header noti-title">
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
                      <span class="h2 font-weight-bold mb-0">100대</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                        <i class="fas fa-chart-bar"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
                    <span class="text-nowrap">Since last month</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">운행차량</h5>
                      <span class="h2 font-weight-bold mb-0">80대</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                        <i class="fas fa-chart-pie"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 3.48%</span>
                    <span class="text-nowrap">Since last week</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">노후차량</h5>
                      <span class="h2 font-weight-bold mb-0">5대</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                        <i class="fas fa-users"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-warning mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span>
                    <span class="text-nowrap">Since yesterday</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">중고차량(판매가능)</h5>
                      <span class="h2 font-weight-bold mb-0">15대</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                        <i class="fas fa-percent"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>
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
          	</div>
            <div class="card-body">
            	<!-- 관리 차량 리스트 업 -->
            	<form id="car_insert" action="carmanageInsertDB.do">
	            	<div class="row">
	            		<div class="col col-sm">
	            			<div class="row">
	            				<div class="col col-sm-5">
	            					<img id="car_img" src="http://placehold.it/400x300" />
	            				</div>
	            				<div class="col col-sm-5">
	            					<div class="form-group">
		            					<div class="row">
		            						<div class="col col-sm-9">
		            							<input type="text" class="form-control" id="carnum" name="carnum" placeholder="차량번호">
		            						</div>
		            					</div>
		            					<div class="row">
		            						<div class="col col-sm-9">
		            							<input type="text" class="form-control" id="total_distance" name="distance" placeholder="총 운행 Km">
		            						</div>
		            					</div>
		            					<!-- 순서 : 브랜드 -> 차량명 -> 연료, 사이즈 저절로 나오게 -->
		            					<div class="row">
		            						<div class="col col-sm-9">
		            							<div class="dropdown">
							                        <a class="btn btn-lg btn-icon-only text-light" id="brand_dropDown" style="width: 330px;" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												            		<b><i class="fas fa-car-side"></i></b>-제조사 선택-
							                          <!-- <i class="ni ni-bus-front-12"></i> -->
							                        </a>
							                        <!--  dropdown-menu-arrow -->
							                        <div class="dropdown-menu dropdown-menu-right" style="overflow-y: scroll;height: 150px;">
							                        	<c:forEach var="brand" items="${brands}">
							                        		<div class="dropdown-min-menu1">
							                        			<%-- <input type="dropdown-item carname" name="carname" value="${car }" readonly="readonly"> --%>
							                        			<div class="dropdown-item carbrand">${brand }</div>
							                        		</div>
							                        	</c:forEach>
							                        </div>
						                     	</div>	<!-- dropdown End -->
		            						</div>
		            					</div>
		            					<!-- 차량 배열을 받아온다, 에러 났었음 -->
		            					<div class="row">
		            						<!-- <div class="col col-sm-9">
		            							<input type="text" class="form-control" name="carname" value="차량명">
		            						</div> -->
		            						<div class="col col-sm-9">
	            								<div class="dropdown">
							                        <a class="btn btn-lg btn-icon-only text-light" id="car_dropDown" style="width: 330px;" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												            		<b><i class="fas fa-car-side"></i></b>-차량 선택-
							                          <!-- <i class="ni ni-bus-front-12"></i> -->
							                        </a>
							                        <!--  dropdown-menu-arrow -->
							                        <div class="dropdown-menu dropdown-menu-right min-menu2" style="overflow-y: scroll;height: 150px;">
							                        		<div class="dropdown-min-menu2">
							                        			<%-- <input type="dropdown-item carname" name="carname" value="${car }" readonly="readonly"> --%>
							                        			<!-- <div class="dropdown-item carname"></div> -->
							                        		</div>
							                        </div>
						                     	</div>	<!-- dropdown End -->
									        </div>
		            					</div>
		            					<div class="row">
		            						<div class="col col-sm-9">
		            							<div class="dropdown">
							                        <a class="btn btn-lg btn-icon-only text-light" id="fuel_dropDown" style="width: 330px;" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												            		<b><i class="fas fa-car-side"></i></b> -연료 선택-
							                          <!-- <i class="ni ni-bus-front-12"></i> -->
							                        </a>
							                        <!--  dropdown-menu-arrow -->
							                        <div class="dropdown-menu dropdown-menu-right" style="overflow-y: scroll;height: 150px;">
						                        		<div class="dropdown-min-menu3">
						                        			<%-- <input type="dropdown-item carname" name="carname" value="${car }" readonly="readonly"> --%>
						                        			<div class="dropdown-item carfuel">의미없어~</div>
						                        		</div>
							                        </div>
						                     	</div>	<!-- dropdown End -->
		            						</div>
		            					</div>
		            					<div class="row">
		            						<div class="col col-sm-9">
		            							<div class="dropdown">
							                        <a class="btn btn-lg btn-icon-only text-light" id="size_dropDown" style="width: 330px;" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												            		<b><i class="fas fa-car-side"></i></b>-연료 선택-
							                          <!-- <i class="ni ni-bus-front-12"></i> -->
							                        </a>
							                        <!--  dropdown-menu-arrow -->
							                        <div class="dropdown-menu dropdown-menu-right" style="overflow-y: scroll;height: 150px;">
						                        		<div class="dropdown-min-menu4">
						                        			<%-- <input type="dropdown-item carname" name="carname" value="${car }" readonly="readonly"> --%>
						                        			<div class="dropdown-item carsize" id="carsize">의미없다~</div>
						                        		</div>
							                        </div>
						                     	</div>	<!-- dropdown End -->
		            						</div>
		            					</div>
		            					
		            					<!-- form에 넘어가는 값들 -->
		            					<input type="hidden" name="khaki_num" value="3">	<!-- value값이 의미 없음 -->
	            						<input type="hidden" name="reg_date" value="20190821">	<!-- value값이 의미 없음 -->
	            						<input type="hidden" name="img" id="img">
		            					<input type="hidden" name="carname" id="carname">
		            					<input type="hidden" class="form-control" name="brand" id="brand">
		            					<input type="hidden" class="form-control" name="fuel" id="fuel">
		            					<input type="hidden" class="form-control" name="car_size" id="car_size">
		            					
		            					<!-- 소모품DB에 들어가는 값들 -->
		            					<input type="hidden" name="carnum1" id="carnum1">
		            					<input type="hidden" name="belt_timing_num" id="consumable1">
		            					<input type="hidden" name="belt_operation_num" id="consumable2">
		            					<input type="hidden" name="oil_engine_num" id="consumable3">
		            					<input type="hidden" name="oil_transmission_num" id="consumable4">
		            					<input type="hidden" name="oil_break_num" id="consumable5">
		            					<input type="hidden" name="filter_aircon_num" id="consumable6">
		            					<input type="hidden" name="filter_fuel_num" id="consumable7">
		            					<input type="hidden" name="filter_aircleaner_num" id="consumable8">
		            					<input type="hidden" name="etc_coolant_num" id="consumable9">
		            					<input type="hidden" name="etc_battery_num" id="consumable10">
		            					<input type="hidden" name="etc_tire_num" id="consumable11">
		            					
	            					</div>	<!-- form-group End -->
	            				</div>
	            			</div>
	            		</div>
	            	</div>
            	</form>	<!-- form End -->
            </div>	<!-- cardbody End -->
          </div>
          <div class="card-footer">
          	<div class="row">
	          	<div class="col col-sm-6">
          			<button id="insert" class="btn btn-outline-info">등록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			<!-- <button id="update">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
          			<button id="delete" class="btn btn-outline-danger">삭제</button>
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