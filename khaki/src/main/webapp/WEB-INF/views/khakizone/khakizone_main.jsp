<%@page import="co.kr.khaki.zone.service.KhakiZoneCal"%>
<%@page import="java.util.List"%>
<%@page import="co.kr.khaki.common.pagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>khakizone_main</title>
	<!-- Jquery CDN -->
 	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<!-- Favicon -->
  	<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Icons -->
  	<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
 	<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
	<!-- CSS Files -->
 	<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		// 페이지네이션 함수
		function fn_paging(curPage){
	  		location.href = "khakizone_main.do?curPage="+curPage;
	  		//swal(curPage); 
	  		//페이지 넘버 확인
	  	};
		
	</script>

</head>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84cf7aa5c76b385f7270d308f67a145b"></script>

	<!-- aaabbbccc -->
	<div class="row">
	
		<div class="col-md-6" id="map">map 이용 표현</div>
		
		<div class="col-md-6">
			<form id="zone_form" action="khakizone_insert.do">
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col-md-3">
								<input type="text" id="zone_name" name="zone_name" placeholder="카키존 이름">
								<input type="hidden" id="zone_num" name="zone_num" placeholder="카키존 넘버" value="1">
							</div>
							<div class="col-md-9">카키존 위치 : <input name="zone_location_x" id="location_x" type="text" placeholder="경도"> / <input name="zone_location_y" id="location_y" type="text" placeholder="위도"></div>
						</div>
						<div class="row">
							<div class="col-md-10">
								<textarea id="zone_comment" name="zone_comment" rows="7" cols="90" placeholder="내용을 입력해주세요"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input type="submit" id="zone_form_submit" value="카키존 등록" style="display: none;">
								<button type="button" id="zone_btn_delete" style="display: none;">카키존 삭제</button>
							</div>
						</div>
					</div>	<!-- col end -->
				</div>	<!-- row end -->
			</form>
			<br><br>
			
			<!-- table -->
			<div class="row">
				<div class="table-responsive">
				    <div>
				    <table class="table align-items-center table-dark">
				        <thead class="thead-dark">
				            <tr>
				                <th scope="col">
				                   	 카키존 넘버
				                </th>
				                
				                <th scope="col">
				                 	   카키존 이름
				                </th>
				                
				                <th scope="col">
			                    	카키존 경도	
				                </th>
				                
				                <th scope="col">
				                	카키존 위도
				                </th>
				                
				                <th scope="col">
				                 	   카키존 세부설명
				                </th>
				            </tr>
				        </thead>
				        <!-- aaabbcc  list - tbody / list_menu(index) - tr / list_menu_zone_num - th -->
				        <tbody class="list">
				            <c:forEach var="seldto" items="${select_list}" varStatus="status">
					            <tr id="list_menu${status.index}" class="list_menu">
					                <th scope="row" id="list_menu_zone_num${status.index}" class="list_menu_zone_num">
					                	${seldto.zone_num }
					                </th>
					                <td id="list_menu_zone_name" class="">
					                	${seldto.zone_name }
					                </td>
					                <td id="list_menu_zone_location_x" class="">
					                	${seldto.zone_location_x }
					                </td>
					                <td id="list_menu_zone_location_y">
					                	${seldto.zone_location_y }
					                </td>
					                <td id="list_menu_zone_comment" class="">
					                	${seldto.zone_comment }
					                </td>
					            </tr>
				            </c:forEach>
				        </tbody>
				    </table>
				</div>
			  </div>	<!-- table-responsive end -->
			</div>	<!-- table row end -->
			<div class="row">
				<div class="col" align="center">
					<nav aria-label="Page navigation example">
					  <ul class="pagination pagination-lg justify-content-center">
					 	<c:if test="${pagination.curRange ne 1 }">
					 	  <li class="page-item">
		                       <a href="#" onClick="fn_paging(1)">[처음]</a> 
		                     </li>
		                   </c:if>
		                   <c:if test="${pagination.curPage ne 1}">
		                     <li class="page-item">
		                       <a class="page-link" href="#" onClick="fn_paging('${pagination.prevPage }')" aria-label="Previous">
		                       	<i class="fa fa-angle-left"></i>
						        <span class="sr-only">Previous</span>
					        </a> 
				          </li>
		                   </c:if>
		                   <!-- 페이지 숫자 표시 부분 -->
		                   <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
		                       <c:choose>
		                           <c:when test="${pageNum eq pagination.curPage}">
		                           	<li class="page-item active">
		                           		<a href="#" class="page-link" onClick="fn_paging('${pageNum }')">${pageNum }<span class="sr-only">(current)</span></a>
	                          		</li>
		                           </c:when>
		                           <c:otherwise>
		                           	<li class="page-item">
		                           		<a class="page-link" href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
	                          		</li>
		                           </c:otherwise>
		                       </c:choose>
		                   </c:forEach>
		                   <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
		                   	<li class="page-item">
		                      		<a class="page-link" href="#" onClick="fn_paging('${pagination.nextPage }')" aria-label="Next">
							        <i class="fa fa-angle-right"></i>
							        <span class="sr-only">Next</span>
								</a> 
							</li>
		                   </c:if>
		                   <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
		                       <li class="page-item">
						      <a class="page-link" href="#" onClick="fn_paging('${pagination.pageCnt }')" aria-label="Next">
						        <i class="fa fa-angle-right"></i>
						        <span class="sr-only">Next</span>
						      </a>
						    </li>
		                	   </c:if>
	                	</ul>
					</nav>
				</div>
			</div>
		  </div>
	</div>
	
<script>
	var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
	MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
	OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
	OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
	OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
	OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
	OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
	OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
	SPRITE_MARKER_URL = 'resources/assets/img/brand/markers.png', // 스프라이트 마커 이미지 URL
	SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
	SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
	SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격
	
	var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
	markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
	overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
	overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
	spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기
	// ---------------------------------------------------------

	// 100m : 4, 250m : 5, 500m : 6, 1000 : 7, 2000 : 8, 
	// 4000 : 9, 8000 : 10, 16000 : 11, 32000 : 12, 64000 : 13(전도 다 보이는 것)
	
	
	var center_x = '${cal.center_x }';
	var center_y = '${cal.center_y }';	
	var between_max = '${cal.between_max}';
	
	//swal(typeof center_x);
	//swal(typeof center_y);
	//지도 중심좌표 설정(select해온 값을기준으로 평균값이 있으면 평균좌표로 아니면그냥 안산시청으로)
	var map_center = null;
	if(center_x == ""){
		map_center = new kakao.maps.LatLng(37.321854, 126.830676);
	}else{
		map_center = new kakao.maps.LatLng(parseFloat(center_x), parseFloat(center_y));
	}
	
	// 각 좌표의 최대 차이값을 이용하여 지도 레벨 설정
	var map_level = 13
	if(between_max >2){
		map_level = 12
	}else if(between_max > 1.5){
		map_level = 11
	}else if(between_max > 1){
		map_level = 10
	}else{
		map_level = 9
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: map_center, // 지도의 중심좌표
	        level: map_level // 지도의 확대 레벨
	    };
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//-----------------------------------------
	// select 해온 값을 배열에 넣고 마커에 추가하는 작업
	// marksers 배열에 select해온 값을 넣어야함
	var markers=[], selectedMarker = null;
	var listdata = [];
	
	// select_list의 좌표값을 foreach문을 통해 지도에 마커 표시 및 markers배열에 push
	<c:forEach var="seldto" items="${select_list}" varStatus="status">
		var x = ${seldto.zone_location_x};
		var y = ${seldto.zone_location_y};
		
		// 마커에 사용되는 변수들
		var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
        originY = 0, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
        overOriginY = 0, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
        normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
        clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
        overOrigin = new kakao.maps.Point(gapX * 2, overOriginY), // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
		zone_name = '${seldto.zone_name}',
		zone_comment = '${seldto.zone_comment}',
		zone_num = '${seldto.zone_num}';
        
		addMarker(new kakao.maps.LatLng(x, y), normalOrigin, overOrigin, clickOrigin, zone_name, zone_comment, x, y, zone_num);
		addRectangleBounds(x, y);
	</c:forEach>
	
	// 마커를 생성, 지도위에 표시하는 함수
	function addMarker(position, normalOrigin, overOrigin, clickOrigin, zone_name, zone_comment, x, y, zone_num) {
	    
		// 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
	    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
	        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
	        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
		
		// 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	    	map: map,
	        position: position,
	        image: normalImage
	    });
		
		// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
	    marker.normalImage = normalImage;
		
		// 마커에 mouseover 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseover', function() {
	    	
	        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 오버 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(overImage);
	        }
	    });
		
	 	// 마커에 mouseout 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseout', function() {
	    	
	        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
	        // 마커의 이미지를 기본 이미지로 변경합니다
	        if (!selectedMarker || selectedMarker !== marker) {
	            marker.setImage(normalImage);
	        }
	    });

	    // 마커에 click 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	    		
	    		// 새로운 카키존 등록 시 찍은 마커를 없앰
	    		first_marker.setMap(null);
	    	
	    		//zone_name, location_x, location_y, zone_comment(input쪽에 id)	aaaabbb
	    		$("#zone_name").val(zone_name);
	    		$("#zone_comment").text(zone_comment);
	    		$("#location_x").val(x);
	    		$("#location_y").val(y);
	    		$("#zone_num").val(zone_num);
	    		
	    		swal($("#list_menu1").children("#list_menu_zone_num1").text().trim().toString())
	    		var list_zone_num = null;
	    		for (var i = 0; i < '${select_list.size()}'; i++) {	// 5를 유동적으로 쓸 수 있는 방법 : (list의 사이즈를 활용하자)
	    			list_zone_num = $("#list_menu"+i).children("#list_menu_zone_num"+i).text().trim().toString();
					if(zone_num == list_zone_num){
						swal("성공!");
						$("#list_menu"+i).css("background-color","#ff5e00");
					}else{
							$("#list_menu"+i).css("background-color","");
						}
					}
				
	    		// 클릭 시 존 버튼 수정할 수 있는 버튼 표출
	    		$("#zone_form").attr("action","khakizone_update.do");
	    		$("#zone_form_submit").val("카키존 수정");
	    		$("#zone_form_submit").css("display","");	// 버튼 보이도록 표출
	    		
	    		// 클릭 시 존 삭제 버튼 표출
	    		//<button type="button" id="zone_btn_delete" style="display: none;">카키존 삭제</button>
	    		$("#zone_btn_delete").css("display","");	// 버튼 보이도록 표출
	    		$("#zone_btn_delete").click(function(){
	    			location.href="khakizone_delete.do?zone_num="+zone_num;
	    		});
	    		
		        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
		        // 마커의 이미지를 클릭 이미지로 변경합니다
		        if (!selectedMarker || selectedMarker !== marker) {
					
		            // 클릭된 마커 객체가 null이 아니면
		            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
		            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
					
		            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
		            marker.setImage(clickImage);
		        }
				
		        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
		        selectedMarker = marker;
	    	});
		
	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	}

	// MakrerImage 객체를 생성하여 반환하는 함수입니다
	function createMarkerImage(markerSize, offset, spriteOrigin) {
	    var markerImage = new kakao.maps.MarkerImage(
	        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
	        markerSize, // 마커의 크기
	        {
	            offset: offset, // 마커 이미지에서의 기준 좌표
	            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
	            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
	        }
	    );
	    
	    return markerImage;
	}
    
    
	// ----------------------------------------------------------
	// 지역별로 구분할 수 있게 
	// 사각형 만들어주는 함수
	function addRectangleBounds(x, y){
		var sw = new kakao.maps.LatLng(x-0.00200, y-0.0020), // 사각형 영역의 남서쪽 좌표
	    ne = new kakao.maps.LatLng(x+0.00200, y+0.00200); // 사각형 영역의 북동쪽 좌표
	    
		// 사각형을 구성하는 영역정보를 생성합니다
		// 사각형을 생성할 때 영역정보는 LatLngBounds 객체로 넘겨줘야 합니다
		var rectangleBounds = new kakao.maps.LatLngBounds(sw, ne);
	    
		// 지도에 표시할 사각형을 생성합니다
		var rectangle = new kakao.maps.Rectangle({
		    bounds: rectangleBounds, // 그려질 사각형의 영역정보입니다
		    strokeWeight: 4, // 선의 두께입니다
		    strokeColor: '#FF3DE5', // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'shortdashdot', // 선의 스타일입니다
		    fillColor: '#FF8AEF', // 채우기 색깔입니다
		    fillOpacity: 0.8 // 채우기 불투명도 입니다
		});
		// 지도에 사각형을 표시합니다
		rectangle.setMap(map);
	}
	
	
	
	// ----------------------------------------------------------
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }
	}
	
	//-----------------------------------------
	
	var first_marker = new kakao.maps.Marker({ 
	    // 지도 좌측 가장 아래에
	    position: new kakao.maps.LatLng(29.400446, 114.698731)
	});
	
	// 지도에 마커를 표시합니다
	first_marker.setMap(map);
	
	// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		// 클릭한 위치에 마커를 표시합니다 
		// mouseEvent.latLng는 지도 좌표를 가지고 온다.
		
		$("#zone_name").val(null);
		$("#zone_comment").text("");
		
		// 클릭한 위도, 경도 정보를 가져옵니다 
    	var latlng = mouseEvent.latLng; 
		
    	// 마커 위치를 클릭한 위치로 옮깁니다
        first_marker.setPosition(latlng);
        first_marker.setMap(map);
	    //---------------------------------------
	    
	    // 내가 코딩한 곳
	    var lastpoint = first_marker.getPosition();	
	    
	    //toString은 String으로 형변환, parseInt는 int로 형변환
	    // parseInt는 말그대로 int형으로 반환(소수점이 없음...), parseFloat를 사용하여 실수형 파싱
	    var x = parseFloat(lastpoint.toString().split(',')[0].split('(')[1].trim());
	    var y = parseFloat(lastpoint.toString().split(',')[1].split(')')[0].trim());
	    
	   	swal(x + " / "+ y);
	    
	    // toFixed(소수점자리) : 소수점자리까지만 남기고 반올림해서 반환
	    $("#location_x").val(x.toFixed(5));
	    $("#location_y").val(y.toFixed(5));
	    
	  	//---------------------------------------
	    $("#zone_form").attr("action","khakizone_insert.do");
	    $("#zone_form_submit").css("display","");
	    $("#zone_form_submit").val("카키존 등록");
	    
	});
	
	// JQuery문 Start
	$(function(){
		
		$(".list_menu").click(function(){
			var z_name = $(this).children("#list_menu_zone_name").text().trim();
			$("#zone_name").val(z_name);
			var z_location_x = $(this).children("#list_menu_zone_location_x").text().trim();
			$("#location_x").val(z_location_x);
			var z_location_y = $(this).children("#list_menu_zone_location_y").text().trim();
			$("#location_y").val(z_location_y);
			var z_comment = $(this).children("#list_menu_zone_comment").text().trim();
			$("#zone_comment").text(z_comment);
			
			var z_num = $(this).children(".list_menu_zone_num").text().trim();
			$("#zone_num").val(z_num);
			//swal("zone_num : "+zone_num);
			//swal("select_list.size : "+${select_list.size()});
			
			for (var i = 0; i < ${select_list.size()}; i++) {	// 5를 유동적으로 쓸 수 있는 방법(list의 사이즈를 활용하자)
    			list_zone_num = $("#list_menu"+i).children("#list_menu_zone_num"+i).text().trim().toString();
    			//swal("list_zone_num : "+list_zone_num);
			
				if(z_num == list_zone_num){
				swal("성공!");
				//$("#list_menu"+i).children("#list_menu_zone_num"+i).text(zone_num+"<-- 선택 " );
				//$("#list_menu"+i).children("#list_menu_zone_num"+i).append('<img alt="" src="resources/assets/img/etc/star.jpg" style="widows: 30px;height: 30px;">');
				$("#list_menu"+i).css("background-color","#ff5e00");
				}else{
				//$("#list_menu"+i).children("#list_menu_zone_num"+i).text(list_zone_num.split("<")[0]);
				$("#list_menu"+i).css("background-color","");
				}
			}
			
			// 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
		    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
		        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
		        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
			
		 	/* console.log(z_location_x);
		 	console.log(z_location_y);
		 	swal(typeof z_location_x);
		 	swal(typeof z_location_y); */
		 	
		 	// 선택된 div의 경도값
		 	var z_x = parseFloat(z_location_x);
		 	//선택된 div의 위도값
		 	var z_y = parseFloat(z_location_y);
		 	//swal(typeof z_x);
		 	//swal(typeof z_y);
		 	
		 	// markers배열에 담긴 marker들을 가져와 좌표값을 비교해서 선택된 마커면 기본이미지로 돌리고, 현재 선택된 마커를 selectedMarker로 설정
		 	for (var i = 0; i < markers.length; i++) {
		 		var m_z_x = parseFloat(markers[i].getPosition().getLat().toFixed(5));
				var m_z_y = parseFloat(markers[i].getPosition().getLng().toFixed(5));
				
				if(z_x == m_z_x && z_y == m_z_y){
					
					if (!selectedMarker || selectedMarker !== markers[i]) {
			            // 클릭된 마커 객체가 null이 아니면
			            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
			            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
						
			            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
			            markers[i].setImage(clickImage);
			        }
			        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
			        selectedMarker = markers[i];
				}
			}
		 	
		 	// 버튼 
		 	$("#zone_form").attr("action","khakizone_update.do");
    		$("#zone_form_submit").val("카키존 수정");
    		$("#zone_form_submit").css("display","");
    		
    		// 클릭 시 존 삭제 버튼 표출
    		//<button type="button" id="zone_btn_delete" style="display: none;">카키존 삭제</button>
    		$("#zone_btn_delete").css("display","");	// 버튼 보이도록 표출
    		$("#zone_btn_delete").click(function(){
    			location.href="khakizone_delete.do?zone_num="+z_num;
    		});
    		
		})	//list_menu class click
	})	//JQuery end
	
	
</script>
	
  <!--   Core   -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Argon JS   -->
  <script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>	
	
</body>
</html>