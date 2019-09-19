<%@page import="co.kr.khaki.notice.pagination"%>
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
 	<!-- <script src="https://code.jquery.com/jquery-latest.js"></script> -->
	<!-- Favicon -->
  	<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Icons -->
  	<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
 	<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
	<!-- CSS Files -->
 	<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
</head>
<body>

<p>
    <button onclick="hideMarkers()">마커 감추기</button>
    <button onclick="showMarkers()">마커 보이기</button>
</p> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84cf7aa5c76b385f7270d308f67a145b"></script>


	<div class="row">
	
		<div class="col-md-6" id="map">map 이용 표현</div>
		
		<div class="col-md-6">
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col-md-3">
							<input type="text" placeholder="카키존 이름">
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<input type="text" placeholder="카키존 넘버">
						</div>
						<div class="col-md-9">카키존 위치 : <input id="location_x" type="text" placeholder="경도"> / <input id="location_y" type="text" placeholder="위도"></div>
					</div>
					<div class="row">
						<div class="col-md-10">
							<textarea rows="7" cols="90" placeholder="내용을 입력해주세요"></textarea>
						</div>
					</div>
				</div>	<!-- col end -->
			</div>	<!-- row end -->
			
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
				        
				        <tbody class="list">
				            
				            <tr>
				                <th scope="row" class="">
				                	카키존 넘버
				                </th>
				                
				                <td class="">
				                	카키존 이름
				                </td>
				                
				                <td class="">
				                	카키존 경도
				                </td>
				                
				                <td>
				                	카키존 위도
				                </td>
				                
				                <td class="">
				                	카키존 세부설명
				                </td>
				            </tr>
				        </tbody>
				    </table>
				</div>
			  </div>	<!-- table-responsive end -->
			</div>	<!-- table row end -->
			<div class="row">페이지네이션 부분</div>
		  </div>
	</div>
	
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    // 클릭한 위치에 마커를 표시합니다 
	    addMarker(mouseEvent.latLng);
	    var lastpoint = markers[markers.length-1].getPosition();	//index이므로 -1
		alert("가장 최근지점 : "+lastpoint);
	    
	    // typeof는 현재 그 변수의 형태를 알려줌
	    alert(typeof lastpoint);
	    alert(typeof lastpoint.toString());
	    
	    //toString은 String으로 형변환, parseInt는 int로 형변환
	    var x = lastpoint.toString().split(',')[0].split('(')[1].trim();
	    var y = lastpoint.toString().split(',')[1].split(')')[0].trim();
	    
	   	alert(parseInt(x) + " / "+ parseInt(y));
	    
	    // toFixed(소수점자리) : 소수점자리까지만 남기고 반올림해서 반환
	    $("#location_x").val(x.toFixed(5));
	    $("#location_y").val(y.toFixed(5));
	
	});
	
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [];
	
	// 마커 하나를 지도위에 표시합니다 
	addMarker(new kakao.maps.LatLng(33.450701, 126.570667));
	
	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position) {
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        position: position
	    });
	
	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	}
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}
	
	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
	    setMarkers(map)    
	}
	
	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
	    setMarkers(null);    
	}
</script>
	
  <!--   Core   -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Argon JS   -->
  <script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>	
	
</body>
</html>