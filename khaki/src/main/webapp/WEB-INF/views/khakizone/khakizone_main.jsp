<%@page import="java.util.List"%>
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

	<script type="text/javascript">
		// 페이지네이션 함수
		function fn_paging(curPage){
	  		location.href = "khakizone_main.do?curPage="+curPage;
	  		//alert(curPage); 
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
			<form action="khakizone_insert.do">
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col-md-3">
								<input type="text" name="zone_name" placeholder="카키존 이름">
								<input type="hidden" name="zone_num" placeholder="카키존 넘버" value="1">
							</div>
							<div class="col-md-9">카키존 위치 : <input name="zone_location_x" id="location_x" type="text" placeholder="경도"> / <input name="zone_location_y" id="location_y" type="text" placeholder="위도"></div>
						</div>
						<div class="row">
							<div class="col-md-10">
								<textarea name="zone_comment" rows="7" cols="90" placeholder="내용을 입력해주세요"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input type="submit" value="카키존 등록">
							</div>
						</div>
					</div>	<!-- col end -->
				</div>	<!-- row end -->
				<input type="hidden" name="khakizone_seq" value="">
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
				        <!-- aaabbcc -->
				        <tbody class="list">
				            <c:forEach var="seldto" items="${select_list}">
					            <tr>
					                <th scope="row" class="">
					                	${seldto.zone_num }
					                </th>
					                <td class="">
					                	${seldto.zone_name }
					                </td>
					                <td class="">
					                	${seldto.zone_location_x }
					                </td>
					                <td>
					                	${seldto.zone_location_y }
					                </td>
					                <td class="">
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
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.312699, 126.830516), // 지도의 중심좌표
	        level: 6 // 지도의 확대 레벨
	    };
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//-----------------------------------------
	// select 해온 값을 배열에 넣고 마커에 추가하는 작업
	// marksers 배열에 select해온 값을 넣어야함
	var markers=[];
	
	// select_list의 좌표값을 foreach문을 통해 지도에 마커 표시 및 markers배열에 push
	<c:forEach var="seldto" items="${select_list}">
		var x = ${seldto.zone_location_x};
		var y = ${seldto.zone_location_y};
		addMarker(new kakao.maps.LatLng(x, y));
		addRectangleBounds(x, y);
	</c:forEach>
	
	// 마커를 생성, 지도위에 표시하는 함수
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
	
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: new kakao.maps.LatLng(31.97220, 122.63106)
	});
	
	
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		// 클릭한 위치에 마커를 표시합니다 
		// mouseEvent.latLng는 지도 좌표를 가지고 온다.
		
		// 클릭한 위도, 경도 정보를 가져옵니다 
    	var latlng = mouseEvent.latLng; 
		
    	// 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);
		
	    //---------------------------------------
	    
	    // 내가 코딩한 곳
	    var lastpoint = marker.getPosition();	
	    
	    //toString은 String으로 형변환, parseInt는 int로 형변환
	    // parseInt는 말그대로 int형으로 반환(소수점이 없음...), parseFloat를 사용하여 실수형 파싱
	    var x = parseFloat(lastpoint.toString().split(',')[0].split('(')[1].trim());
	    var y = parseFloat(lastpoint.toString().split(',')[1].split(')')[0].trim());
	    
	   	alert(x + " / "+ y);
	    
	    // toFixed(소수점자리) : 소수점자리까지만 남기고 반올림해서 반환
	    $("#location_x").val(x.toFixed(5));
	    $("#location_y").val(y.toFixed(5));
	    
	  	//---------------------------------------
	});
	
</script>
	
  <!--   Core   -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Argon JS   -->
  <script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>	
	
</body>
</html>