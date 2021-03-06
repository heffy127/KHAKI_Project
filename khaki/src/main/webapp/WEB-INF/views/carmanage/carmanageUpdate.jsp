<%@page import="co.kr.khaki.carmanage.DTO.CarManageDTO"%>
<%@page import="co.kr.khaki.zone.DTO.KhakiZone_CarmanageDTO"%>
<%@page import="java.util.List"%>
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
 	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		function isEmpty(str){
			if(str == "" || str ==null || str == undefined || str == "null" || str == "undefined"){
				return true
			}else{
				return false
			}
		}
	
	
		$(function(){
			
			var car_numType = /\d{2,3}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g;
			var car_drivenType =  /^[0-9]+$/;
			
			// 총 운행Km 유효성 검사
			$("#total_distance").keyup(function(){
				var check_total_distance = $("#total_distance").val();
				if(car_drivenType.test(check_total_distance)){
					$("#total_distanceCheck").text("")
				}else{
					$("#total_distanceCheck").text("총 운행 Km는 숫자만 입력해주세요")
				}
				
			})	// 총운행 킬로수
			
			// 차량번호 유효성 검사 및 중복검사
			/* $("#car_num").keyup(function(){
				//alert("keyup 동작!");
				var check_carnum = $("#car_num").val();
				//alert(check_carnum);
				if(car_numType.test(check_carnum)){
					//alert("정규식 통과!");
					$("#car_numCheck").text("")
					$.ajax({
						url:"car_numCheck.do?car_num="+check_carnum,
						success: function(result){
							// 차량 등록 버튼 비활성화 및 활성화로 중복검사 시 통과하면 활성화, 그 외에 비활성화
							var select_carnum = result.trim();
							if(select_carnum == check_carnum){
								$("#car_numCheck").text("중복된 차량번호입니다")
							}else{
								$("#car_numCheck").text("사용가능한 차량번호입니다")
							}
						}
					})
				}else{
					//alert("정규식 실패!");
					$("#car_numCheck").text("차량번호는 00가0000 또는 000가0000 형식입니다.")
				}
				
			})	//차량번호 key up */
			
			// 차량 등록(등록 버튼 click시 )
 			$("#update").click(function(){
 				//id값들 : car_num,total_distance, carname, brand, fuel_type, car_size, fee_km, fee_hour
				//isEmpty()는 true, false를 반환 - 값이 있는지 없는지 여부를 판단
				
				// input값의 value값을 가져오는 곳(유효성 검사를 위해서)
				var c_car_num = isEmpty($("#car_num").val());
				var c_total_distance = isEmpty($("#total_distance").val());
				var c_carname = isEmpty($("#carname").val());
				var c_brand = isEmpty($("#brand").val());
				var c_fuel_type = isEmpty($("#fuel").val());
				var c_car_size = isEmpty($("#car_size").val());
				var c_fee_km = isEmpty($("#fee_km").val());
				var c_fee_hour = isEmpty($("#fee_hour").val());
				
				console.log("car_num : "+c_car_num);
				console.log("total_distance : "+c_total_distance);
				console.log("car_name : "+c_carname);
				console.log("brand : "+c_brand);
				console.log("fuel_type : "+c_fuel_type);
				console.log("car_size : "+c_car_size);
				console.log("fee_km : "+c_fee_km);
				console.log("fee_hour : "+c_fee_hour);
 				
 				// 차량 등록시 소모품들 교체는 다 된 것으로 하고 수치를 넣도록 구현
 				// jquery에서 text()는 그 안의 text값을 가져오는것, val()은 value값을 가져오는 것(구분 잘하기)
 				var distance1 = $("#total_distance").val()		//parseInt가 필요한지는 아직 모름
 				var num = 0;
 				
				//c_total_distance c_carname c_brand c_fuel_type c_car_size c_fee_km c_fee_hour
				// 비어있으면 true를 값이 있으면 false를 반환
				/*
					논리연산자
					true && true = true / true && false = false / false && false = false
					true || false = true
				*/
				if(c_car_num || c_total_distance || c_carname || c_brand || c_fuel_type || c_car_size || c_fee_km || c_fee_hour){
					swal("입력 정보를 전부 입력해주세요")
				}else{
	 				swal("차량 등록 완료!");
					$("#car_update").submit();
				}
				
 				//$("#car_insert").submit();
 				
			});	// insert end

      		// 제조사드롭다운 클릭시 이벤트
			$(".dropdown-min-menu1").click(function(){
				var data1 = $(this).children(".carbrand").text();	// data1은 사용자가 선택된 제조사이름을 가져옴
				swal(data1);
				$("#brand_dropDown").text(data1);	// 제조사선택 화면에 선택된 값을 나오게끔
				$("#brand").val(data1);
				
				$(".min-menu2").children().remove();	// dorpdown-menu2번째를 초기화하고
				
				var jsontest = '/khaki/resources/assets/json/test1.json';
				
				var sum = 0;
				$.getJSON(jsontest, function(data){	//data안에 JSON값을 가져옴(success된 것)
					$.each(data, function(I,item){	// I는 JSON안의 인덱스,item은 각 객체들을 가져오는 것으로 생각
						if(data1 == item.made){	//제조사가 일치하면
							//swal(I + ":" + item.name + " / "+ item.fuel)	//여기까지 완료
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
				swal(data2);	
				var arr = new Array();
				arr = data2.split("/");
				// split 테스트
				swal(arr[0]);
				swal(arr[1]);
				
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
		carmanageUpdate
      <div class="row">
        <div class="col">
          <div class="card shadow border-0">
            <div class="card-body" align="center">
            	<!-- 관리 차량 리스트 업 -->
            	<form id="car_update" action="carmanageUpdateDB.do">
	            	<div class="row">
	            		<div class="col col-sm">
	            			<div class="row">
	            				<div class="col col-sm-6">
	            					<img id="car_img_view" style="width: 500px; height:100%;" src="${cmDTO.car_image}" />
	            				</div> 
	            				<div class="col col-sm-6">
	            					<div class="form-group">
		            					<div class="row">
		            						<div class="col col-sm-10">
		            							<input type="text" class="form-control" id="car_num" name="car_num" placeholder="차량번호" maxlength="7" value="${cmDTO.car_num}" readonly="readonly">
		            							<!-- 차량번호 keyup으로 제한사항 두기 -->
		            							<div id="car_numCheck"></div>
		            						</div>
		            					</div>
		            					<div class="row">
		            						<div class="col col-sm-10">
		            							<input type="text" class="form-control" id="total_distance" name="driven" placeholder="총 운행 Km" maxlength="8" value="${cmDTO.driven}" readonly="readonly">
		            							<div id="total_distanceCheck"></div>
		            						</div>
		            					</div>
		            					<div class="row" style="vertical-align: middle;">
		            						<div class="col col-sm-10" style="height: 50px; line-height: 50px; vertical-align: middle;">
		            							카키존 :
		            							<select name="zone_num">
		            								<c:forEach var="zonedto" items="${zonelist}">
		            									<c:choose>
		            										<c:when test="${zonedto.zone_num eq cmDTO.zone_num}">
				            									<option value="${zonedto.zone_num }" selected="selected">${zonedto.zone_name }</option>
		            										</c:when>
		            										<c:otherwise>
				            									<option value="${zonedto.zone_num }">${zonedto.zone_name }</option>
		            										</c:otherwise>
		            									</c:choose>
		            								</c:forEach>
		            							</select>
		            						</div>
		            					</div>
		            					<!-- 순서 : 브랜드 -> 차량명 -> 연료, 사이즈 저절로 나오게 -->
		            					<div class="row">
		            						<div class="col col-sm-10">
		            							<div class="dropdown">
							                        <a class="btn btn-lg btn-icon-only text-light" id="brand_dropDown" style="width: 330px;" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												            		${cmDTO.brand}
							                          <!-- <i class="ni ni-bus-front-12"></i> -->
							                        </a>
							                        <!--  dropdown-menu-arrow -->
							                        <div class="dropdown-menu dropdown-menu-right" style="overflow-y: scroll;height: 150px;">
							                        	<c:forEach var="brand" items="${brands}">
							                        		<div class="dropdown-min-menu1">
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
												            		${cmDTO.car_name}/${cmDTO.car_size}/${cmDTO.fuel_type}
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
												            		${cmDTO.fee_km }원
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
												            		${cmDTO.fee_hour }원
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
	            						<input type="hidden" name="reg_date" value="${cmDTO.reg_date}">	<!-- value값이 의미 없음 -->
	            						<input type="hidden" name="car_image" id="car_image" value="${cmDTO.car_image}">
		            					<input type="hidden" name="car_name" id="carname" value="${cmDTO.car_name}">
		            					
	            						<!-- DB 통합후 새로 Insert할 내용들 aaa -->
		            					<input type="hidden" name="fuel_gage" id="fuel_gage" value="90">
		            					<input type="hidden" name="fee_hour" id="fee_hour" value="${cmDTO.fee_hour}">
		            					<input type="hidden" name="fee_km" id="fee_km" value="${cmDTO.fee_km}">
		            					<!-- <input type="hidden" name="zone_num" id="zone_num" value="1"> -->	<!-- 카키존 구현 후 연결 select박스 -->
		            					
		            					<input type="hidden" class="form-control" name="brand" id="brand" value="${cmDTO.brand}">
		            					<input type="hidden" class="form-control" name="fuel_type" id="fuel" value="${cmDTO.fuel_type}">
		            					<input type="hidden" class="form-control" name="car_size" id="car_size" value="${cmDTO.car_size}">
		            					
		            					
		            					<!-- 소모품DB에 들어가는 값들 -->
		            					<!-- 
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
		            					-->
		            					
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
          			<button id="update" class="btn btn-outline-info">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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