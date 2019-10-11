<%@page import="co.kr.khaki.common.pagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	
		function fn_paging(curPage, pageSize){
	  		location.href = "carmanage.do?curPage="+curPage+"&pageSize="+pageSize;
	  		//swal(curPage); 
	  	};
	  	
		$(function(){
			
			// 차량 검색
			$("#search").click(function(){
				// 페이지 이동 식으로
				//swal("검색!!")
				var search_obj_check = $("#search_obj").val()
				swal("과연 : " + search_obj_check)
				// onsubmit="return false;"
				if(search_obj_check==''){
					$("#search_form").attr('onsubmit','return false;');	//submit 기능 하지 않도록 제어
					swal("검색어를 입력해주세요!")
				}else{
					$("#search_form").attr('onsubmit','return true;');	//submit 기능 활성화
					$("#search_form").submit();	//submit 시키면 넘어가도록
				}
				
			});	// search end
			
			
			// 차량 등록
 			$("#insert").click(function(){
				location.href = "carmanageInsert.do";
				
			});	// insert end
			
			// 차량번호를 가지고 넘어가도록 설정
			$(".row_carlist").click(function(){
				var data = $(this).children(".car_num").text();
				//swal(data);
				location.href = "carmanageSelect.do?car_num="+data;
				
			})	
			
			// 상위 차량 요약 내용
			var cmlist_size= "${fn:length(cmlist)}";
			var junggolist_size = "${fn:length(junggolist)}";
			var oldlist_size = "${fn:length(oldlist)}";
			
			var normal = 0;
			var normal_percentage = 0;
			var junggolist_percentage = 0;
			var oldlist_percentage = 0;
			
			if(cmlist_size == 0){
				junggolist_size = 0;
				oldlist_size = 0;
				
			}else{
				
				normal = cmlist_size - junggolist_size - oldlist_size;
				normal_percentage = normal / cmlist_size * 100;
				junggolist_percentage = junggolist_size / cmlist_size * 100;
				oldlist_percentage = oldlist_size / cmlist_size * 100;
			}
				//swal(junggolist_size + " / " + oldlist_size)
			//swal(normal_percentage + " / "+junggolist_percentage + " / "+oldlist_percentage);
			//swal(cmlist_size +"/"+junggolist_size +"/"+oldlist_size + "/" + normal);
			//swal(junggolist_percentage.toFixed(2));
			// .toFixed(x) : x자리만큼 소수점 반올림
			//정상운행
			$(".normal").children(".row").children(".col").children("span").text(normal+"대");
			$(".normal").children("p").children(".mr-2").text(normal_percentage.toFixed(2)+"%");
			//노후차량
			$(".old").children(".row").children(".col").children("span").text(oldlist_size+"대");
			$(".old").children("p").children(".mr-2").text(oldlist_percentage.toFixed(2)+"%");
			//중고차량(판매가능)
			$(".junggo").children(".row").children(".col").children("span").text(junggolist_size+"대");
			$(".junggo").children("p").children(".mr-2").text(junggolist_percentage.toFixed(2)+"%");
			
		});	//Jquery End
	</script>
			<!-- aaaaa -->
	<!-- Favicon -->
  	<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  	<!-- Fonts -->
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- Icons -->
  	<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
 	<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
	<!-- CSS Files -->
 	<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
 	<!-- CSS Font -->
 	<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi&display=swap&subset=korean" rel="stylesheet">
 	
</head>
<body>
     <div class="row">
       <div class="col">
         <div class="card shadow border-0">
         	<div class="card-header">
          	<div class="row" align="center">
				<div class="col-md-4" style="height: 50px; line-height: 50px;">
	       			<button id="insert" class="btn btn-outline-info">등록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>          
				<!-- aaa -->
				<div class="col-md-4" style="height: 40px; line-height: 40px;">
					<form id="search_form" action="carmanage.do" onsubmit="return false;">	<!-- onsubmit은 자동 submit되는 기능으로 false를 보내면 자동으로 submit되지 않음 -->
						<div class="row" align="center">
								<select id="search_list" name="search_list">
									<option value="전체검색">전체검색</option>
									<option value="차량번호">차량번호</option>
									<option value="차량명">차량명</option>
									<option value="브랜드">브랜드</option>
									<option value="연료종류">연료종류</option>
								</select>
								<input type="text" placeholder="검색어 입력" id="search_obj" name="search_obj">&nbsp;&nbsp;
								<input type="hidden" name="curPage" value="${pagination.curPage }">
								<input type="hidden" name="pageSize" value="${pagination.pageSize }">
								<button class="btn btn-outline-success" id="search">검색</button>
						</div>	<!-- row end -->
					</form>	
				</div>	
				<div class="col-md-4">
					<div class="dropdown">
                        <a class="btn btn-lg btn-icon-only text-light" id="pagesize_dropDown" style="width: 100px;" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					            		<b><i class="ni ni-bullet-list-67"></i></b> - 페이지 수 -
                          <!-- <i class="ni ni-bus-front-12"></i> -->
                        </a>
                        <!--  dropdown-menu-arrow -->
                        <div class="dropdown-menu dropdown-menu-right" style="overflow-y: scroll;height: 150px;">
                       			<%-- <input type="dropdown-item carname" name="carname" value="${car }" readonly="readonly"> --%>
                       			<div class="dropdown-item">
                       				<a href="#" onclick="fn_paging('${pagination.curPage}',10)">10개</a>
                       			</div>
                       			<div class="dropdown-item">
                       				<a href="#" onclick="fn_paging('${pagination.curPage}',20)">20개</a>
                       			</div>
                       			<div class="dropdown-item">
                       				<a href="#" onclick="fn_paging('${pagination.curPage}',30)">30개</a>
                       			</div>
                        </div>
                    	</div>	<!-- dropdown End -->
				</div>	
          	</div>	<!-- row end -->
         	</div>	<!-- card-header end -->
           <div class="card-body">
           	<!-- 관리 차량 리스트 업 -->
           	<div class="row">
           		<div class="col col-sm-12">
           		<!-- list up 메뉴 -->
           			<div class="row" style="border-bottom-style: solid; border-bottom-color: #158c68; border-bottom-width: 3px;
           			 border-top-style: solid; border-top-color: #158c68; border-top-width: 3px;
           			vertical-align: middle; height: 50px; line-height:50px; font-family: 'Black Han Sans', sans-serif;">
           				<div class="col" align="center">
           					카키존번호
           				</div>
           				<div class="col" align="center">
           					차량번호
           				</div>
           				<div class="col" align="center">
           					이미지
           				</div>
           				<div class="col" align="center">
           					총 운행 거리
           				</div>
           				<div class="col" align="center">
           					연료
           				</div>
           				<div class="col" align="center">
           					브랜드
           				</div>
           				<div class="col" align="center">
           					차 크기
           				</div>
           				<div class="col" align="center">
           					차량명
           				</div>
           				<div class="col" align="center">
           					등록일시
           				</div>
           			</div>
           			<!-- list up 내용 -->
           			<!-- jstl로 조절할 수 없을까? 방법 찾아보기 -->
           			<!-- 현재는 전체 리스트를 다 뽑아오게끔 되어 있음 -->
           			<% pagination pg = (pagination)request.getAttribute("pagination"); %>
           			<c:choose>
           				<c:when test="${listCnt eq 0 }">
           					<div class="row row_carlist" align="center">검색결과가 없습니다.</div>
           				</c:when>
           				<c:otherwise>
	            			<c:forEach var="cmdto" items="${cmlist}" varStatus="status" begin="<%= pg.getStartIndex() %>" end="<%= pg.getEndIndex() %>">
	            				<c:choose>
		            				<c:when test="${cmdto.driven >= 250000 }">
			            			<div class="row row_carlist" style="border-bottom-style: ridge; border-bottom-color: #158c68; border-bottom-width: 3px; vertical-align: middle;
			            			font-family: 'Gugi', cursive; background-color: #ffd4d4">
			            				<%-- ${status.count }
			            				${status.index } --%>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.zone_num }
			            				</div>
			            				<div class="col car_num" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.car_num }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					<img style="position: absolute; top:0; left:0; width: 140px; height:100%;" src="${cmdto.car_image }" />
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.driven }KM
			            				</div>
			            				<div class="col"  style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.fuel_type }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.brand }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.car_size }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.car_name }
			            				</div>
			            				<div class="col" style="text-align: center; height:50px; line-height:50px;">
			            					<div>
			            						${cmdto.reg_date }
			            					</div>
			            				</div>
			            			</div>
			            			</c:when>
		            				<c:when test="${cmdto.driven >= 100000 and cmdto.driven < 250000 }">
		            				<div class="row row_carlist" style="border-bottom-style: ridge; border-bottom-color: #158c68; border-bottom-width: 3px; vertical-align: middle;
			            			font-family: 'Gugi', cursive; background-color: #fae7e1">
		            					<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.zone_num }
			            				</div>
			            				<div class="col car_num" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.car_num }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					<img style="position: absolute; top:0; left:0; width: 140px; height:100%;" src="${cmdto.car_image }" />
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.driven }KM
			            				</div>
			            				<div class="col"  style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.fuel_type }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.brand }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.car_size }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.car_name }
			            				</div>
			            				<div class="col" style="text-align: center; height:50px; line-height:50px;">
			            					<div>
			            						${cmdto.reg_date }
			            					</div>
			            				</div>
			            			</div>
		            				</c:when>
		            				<c:otherwise>
		            				<div class="row row_carlist" style="border-bottom-style: ridge; border-bottom-color: #158c68; border-bottom-width: 3px; vertical-align: middle;
			            			font-family: 'Gugi', cursive;">
		            					<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.zone_num }
			            				</div>
			            				<div class="col car_num" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.car_num }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					<img style="position: absolute; top:0; left:0; width: 140px; height:100%;" src="${cmdto.car_image }" />
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.driven }KM
			            				</div>
			            				<div class="col"  style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.fuel_type }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.brand }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.car_size }
			            				</div>
			            				<div class="col" style="text-align: center; height:100px; line-height:100px;">
			            					${cmdto.car_name }
			            				</div>
			            				<div class="col" style="text-align: center; height:50px; line-height:50px;">
			            					<div>
			            						${cmdto.reg_date }
			            					</div>
			            				</div>
			            			</div>
		            				</c:otherwise>
		            			</c:choose>
	            			</c:forEach>
           				</c:otherwise>
           			</c:choose>
           		</div>
           	</div>
           </div>	<!-- cardbody End -->
          <div class="card-footer py-4" align="center">
          	<nav aria-label="Page navigation example">
			  <ul class="pagination pagination-lg justify-content-center">
			 	<c:if test="${pagination.curRange ne 1 }">
			 	  <li class="page-item">
                       <a class="page-link" href="#" onClick="fn_paging(1)" aria-label="Previous">
							<i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i>
							<span class="sr-only">Previous</span>
						</a> 
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
                           			<a href="#" class="page-link" onClick="fn_paging('${pageNum }','${pagination.pageSize }')">${pageNum }<span class="sr-only">(current)</span></a>
                          		</li>
                           </c:when>
                           <c:otherwise>
                           		<li class="page-item">
                           			<a class="page-link" href="#" onClick="fn_paging('${pageNum }','${pagination.pageSize }')">${pageNum }</a>
                          		</li>
                           </c:otherwise>
                       </c:choose>
                   </c:forEach>
                   <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                   	<li class="page-item">
                      		<a class="page-link" href="#" onClick="fn_paging('${pagination.nextPage }','${pagination.pageSize }')" aria-label="Next">
					        <i class="fa fa-angle-right"></i>
					        <span class="sr-only">Next</span>
						</a> 
					</li>
                   </c:if>
                   <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                       <li class="page-item">
				      <a class="page-link" href="#" onClick="fn_paging('${pagination.pageCnt }','${pagination.pageSize }')" aria-label="Next">
				        <i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
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