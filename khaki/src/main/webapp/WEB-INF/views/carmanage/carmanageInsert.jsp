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
			
			
			// 차량 수정
			$("#update").click(function(){
				
			});	// update end

			
			// 차량 등록
 			$("#insert").click(function(){
 				
 				// 차량 등록시 소모품들 교체는 다 된 것으로 하고 수치를 넣도록 구현
 				// jquery에서 text()는 그 안의 text값을 가져오는것, val()은 value값을 가져오는 것(구분 잘하기)
 				var distance1 = $("#total_distance").val()		//parseInt가 필요한지는 아직 모름
 				var num = 0;
 				
 				// 차량번호 입력한 것을 그대로 받아와서 넘겨줌
 				var carnum_data = $("#car_num").val(); 
 				$("#carnum1").val(carnum_data);
 				//alert(carnum_data)
 				
 				//배열 순서대로 타이밍벨트, 구동벨트, 엔진오일, 변속기오일, 브레이크 오일, 에어컨필터, 연료필터, 에어클리너, 냉각수, 배터리, 타이어 순서
				var arr = new Array(100000, 30000, 10000, 30000, 40000, 15000, 30000, 20000, 50000, 60000, 30000);
 				
				for(var i=0; i<arr.length;i++){
					var change_num = Math.floor(distance1 / arr[i]);		//distance에 따른 차량 소모품 교체 횟수(기준으로 나눈 것)
					$("#consumable"+(i+1)).val(change_num);
					//alert(change_num)
				};
				
 				$("#car_insert").submit();
 				alert("차량 등록 완료!");
 				
			});	// insert end

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
				// jstl의 for문으로 뿌려진 것을 this로 가져오는 것과 내부에서 append해서 만들어진 dropdown에서 가져오는 것의 차이??
				var data2 = $(this).children(".carname").text();
				//여기서 this는 dropdown-min-menu2를 의미함
				alert(data2);	
				var arr = new Array();
				arr = data2.split("/");
				// split 테스트
				alert(arr[0]);
				alert(arr[1]);
				
				//$("#car_dropDown").children().children("i").remove();
				
				$("#car_dropDown").text(data2);
		        $("#carname").val(arr[0]);		// DB에 차량 이름 저장하기 위해서 form양식에 넣어줌
		        $("#car_image").val("resources/assets/img/car/"+arr[0]+".png");	// DB에 저장하기 위해(.png를 붙여서 저장해줌)
		        $("#car_img_view").attr("src", "resources/assets/img/car/"+arr[0]+".png");	//차량 이미지 나오게 하는 곳
		        
		        //form 태그 내의 hidden에 val메소드를 통해 값을 넣어서 넘겨줌
		        $("#car_size").val(arr[1]);		//차량 크기 form에 넣어줌
		        $("#fuel").val(arr[2]);			//연료 form에 넣어줌
		        
		        if("소형" == arr[1].trim()){
			        $("#fee_km_dropDown").text(160+"원");
			        $("#fee_km").val(160)
			        $("#fee_hour_dropDown").text(6000+"원");
			        $("#fee_hour").val(6000)
		        }else if("준중형" == arr[1].trim()){
			        $("#fee_km_dropDown").text(170+"원");
			        $("#fee_km").val(170)
			        $("#fee_hour_dropDown").text(7000+"원");
			        $("#fee_hour").val(7000)
		        }else if("중형" == arr[1].trim()){
			        $("#fee_km_dropDown").text(180+"원");
			        $("#fee_km").val(180)
			        $("#fee_hour_dropDown").text(7500+"원");
			        $("#fee_hour").val(7500)
		        }else{
		        	$("#fee_km_dropDown").text(190+"원");
			        $("#fee_km").val(190)
			        $("#fee_hour_dropDown").text(8000+"원");
			        $("#fee_hour").val(8000)
		        }
		        
		        // fee_km : 드롭다운 메뉴 class : fee_km_dropDown id : fee_km_drop
		        
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
      <div class="row">
        <div class="col">
          <div class="card shadow border-0">
            <div class="card-body" align="center">
            	<!-- 관리 차량 리스트 업 -->
            	<form id="car_insert" action="carmanageInsertDB.do">
	            	<div class="row">
	            		<div class="col col-sm">
	            			<div class="row">
	            				<div class="col col-sm-6">
	            					<img id="car_img_view" src="http://placehold.it/500x400" />
	            				</div>
	            				<div class="col col-sm-6">
	            					<div class="form-group">
		            					<div class="row">
		            						<div class="col col-sm-10">
		            							<input type="text" class="form-control" id="car_num" name="car_num" placeholder="차량번호">
		            							<!-- 차량번호 keyup으로 제한사항 두기 -->
		            						</div>
		            					</div>
		            					<div class="row">
		            						<div class="col col-sm-10">
		            							<input type="text" class="form-control" id="total_distance" name="driven" placeholder="총 운행 Km">
		            						</div>
		            					</div>
		            					<div class="row" style="vertical-align: middle;">
		            						<div class="col col-sm-10" style="height: 50px; line-height: 50px; vertical-align: middle;">
		            							카키존 지정 : 
		            							<select name="zone_num">
		            								<c:forEach var="zonedto" items="${zonelist }">
		            									<option value="${zonedto.zone_num }">${zonedto.zone_name }</option>
		            								</c:forEach>
		            							</select>
		            						</div>
		            					</div>
		            					<!-- 순서 : 브랜드 -> 차량명 -> 연료, 사이즈 저절로 나오게 -->
		            					<div class="row">
		            						<div class="col col-sm-10">
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
		            						<div class="col col-sm-10">
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
		            						<div class="col col-sm-10">
		            							<div class="dropdown">
							                        <a class="btn btn-lg btn-icon-only text-light" id="fee_km_dropDown" style="width: 330px;" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												            		<b><i class="fas fa-car-side"></i></b>- km당 가격 -
							                        </a>
							                        <!--  dropdown-menu-arrow -->
							                        <div class="dropdown-menu dropdown-menu-right" style="overflow-y: scroll;height: 150px;">
						                        		<div class="dropdown-min-menu5">
						                        			<div class="dropdown-item fee_km_drop" id="fee_km_drop">km당 가격</div>
						                        		</div>
							                        </div>
						                     	</div>	<!-- dropdown End -->
		            						</div>
		            					</div>
		            					<div class="row">
		            						<div class="col col-sm-10">
		            							<div class="dropdown">
							                        <a class="btn btn-lg btn-icon-only text-light" id="fee_hour_dropDown" style="width: 330px;" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												            		<b><i class="fas fa-car-side"></i></b>- 시간당 가격 -
							                        </a>
							                        <!--  dropdown-menu-arrow -->
							                        <div class="dropdown-menu dropdown-menu-right" style="overflow-y: scroll;height: 150px;">
						                        		<div class="dropdown-min-menu6">
						                        			<div class="dropdown-item fee_hour_drop" id="fee_hour_drop">시간당 가격</div>
						                        		</div>
							                        </div>
						                     	</div>	<!-- dropdown End -->
		            						</div>
		            					</div>
		            					
		            					<!-- form에 넘어가는 값들 -->
	            						<input type="hidden" name="reg_date" value="20190821">	<!-- value값이 의미 없음 -->
	            						<input type="hidden" name="car_image" id="car_image">
		            					<input type="hidden" name="car_name" id="carname">
		            					
		            						<!-- DB 통합후 새로 Insert할 내용들 aaa -->
		            					<input type="hidden" name="fuel_gage" id="fuel_gage" value="90">
		            					<input type="hidden" name="fee_hour" id="fee_hour" value="">
		            					<input type="hidden" name="fee_km" id="fee_km" value="">
		            					<!-- <input type="hidden" name="zone_num" id="zone_num" value="1"> -->	<!-- 카키존 구현 후 연결 select박스 -->
		            					
		            					<input type="hidden" class="form-control" name="brand" id="brand">
		            					<input type="hidden" class="form-control" name="fuel_type" id="fuel">
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
          			<button id="delete" class="btn btn-outline-danger" onclick="history.back(-1)">뒤로가기</button>
	          	</div>
          	</div>
          </div>
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
</body>
</html>