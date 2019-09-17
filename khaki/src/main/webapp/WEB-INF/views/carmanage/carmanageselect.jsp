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
			// 목록 으로
			$("#list").click(function(){
				location.href = "carmanage.do";
			});	// list end
			
			// 소모품 목록으로
			$("#consumable").click(function(){
				alert("소모품 목록으로");
			});	// comsumable end

			// 차량 삭제
			$("#delete").click(function(){
				var td_car_num = $("#td_car_num").text().trim();
				
				//alert(td_car_num+"차량 삭제!")
				
				location.href = "carmanageDelete.do?car_num="+td_car_num;
			});	// delete end
			
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
 	<!-- CSS Font -->
 	<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi&display=swap&subset=korean" rel="stylesheet">
 	
</head>
<body>
      <div class="row">
        <div class="col">
          <div class="card shadow border-0">
            <div class="card-body">
            	<!-- 관리 차량 리스트 업 -->
            	<div class="row">
            		<div class="col col-sm">
            			<div class="row">
            				<div class="col col-sm-6" style="text-align: center;">
            					<img style="position: absolute; top:0; left:0; width: 400px; height:100%;" id="car_img" src="${cmdto.car_image}" />
            				</div>
            				<div class="col col-sm-6" style="font-family: 'Gugi', cursive;">
	            					<div class="row">	<!-- row - col - row - 또 분할한 것 -->
	            						<div class="col col-sm-12">
	            							<table>
	            								<tr height="40">
	            									<td width="150">
	            										차량번호 : 
	            									</td>
	            									<td>
	            										${cmdto.car_num}
	            									</td>
	            								</tr>
	            								<tr height="40">
	            									<td>
	            										총 운행 :
	            									</td>
	            									<td>
	            										${cmdto.driven}Km
	            									</td>
	            								</tr>
	            								<tr height="40">
	            									<td>
	            										제조사 :
	            									</td>
	            									<td>
	            										${cmdto.brand}
	            									</td>
	            								</tr>
	            								<tr height="40">
	            									<td>
	            										차량명 :
	            									</td>
	            									<td>
	            										${cmdto.car_name}
	            									</td>
	            								</tr>
	            								<tr height="40">
	            									<td>
	            										차량크기 :
	            									</td>
	            									<td>
	            										${cmdto.car_size}
	            									</td>
	            								</tr>
	            								<tr height="40">
	            									<td>
	            										연료 :
	            									</td>
	            									<td>
	            										${cmdto.fuel_type}
	            									</td>
	            								</tr>
	            								<tr height="40">
	            									<td>
	            										khaki 등록일시 :
	            									</td>
	            									<td>
	            										${cmdto.reg_date}
	            									</td>
	            								</tr>
	            							</table>
	            						</div>
	            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>	<!-- cardbody End -->
          </div>
          <div class="card-footer">
          	<!-- 버튼들 -->
          	<div class="row">
	          	<div class="col col-sm-6">
          			<button id="list" class="btn btn-outline-default">목록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			<button type="button" id="consumable" class="btn btn-outline-info" data-toggle="modal" data-target="#modal-consumable">소모품 확인</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          			<div class="modal fade" id="modal-consumable" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
						    <div class="modal-dialog modal-lg-min modal- modal-dialog-centered modal-" role="document">
						        <div class="modal-content">						        	
						            <div class="modal-header">
						                <h6 class="modal-title" id="modal-title-default">차량번호 : ${cmdto.car_num} / ${cmdto.car_name}</h6>
						                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                    <span aria-hidden="true">×</span>
						                </button>
						            </div>
						            
						            <div class="modal-body">
						            	<iframe src="car_consumable1.do?distance=${cmdto.driven }&carnum1=${cmdto.car_num}" width="900" height="750"></iframe>
						            </div>
						            
						            <div class="modal-footer">
						                
						                <button type="button" class="btn btn-link ml-auto" data-dismiss="modal">Close</button> 
						            </div>
						            
						        </div>	<!-- modal content End -->
						    </div>	
						</div>	<!-- modal fade End -->
          			
          			<!-- <button id="update">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
          			<button id="delete" class="btn btn-outline-danger">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			<button id="cancel" class="btn btn-outline-warning" onclick="history.back(-1);">뒤로</button>
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