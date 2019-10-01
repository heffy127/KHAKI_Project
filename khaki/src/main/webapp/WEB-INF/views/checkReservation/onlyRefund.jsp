<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <!-- Favicon -->
  <link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script>
	$(function() {
		// Go to IAMPORT 클릭시 실제 환불 처리 할 수 있는 버튼 새창으로 띄움
		$("#iamport_location").click(function(){
			var url = "https://admin.iamport.kr/payments";  
	        window.open(url, "_blank");  
		})
		
		// jstl의 foreach 반복 횟수
        var index = $("#numCheck").val(); 
		
        for(var i = 0; i < index; i++) {
        	// 결제 금액 세번째마다 콤마를 넣음
        	str = $("#totalAmount"+i).text();
        	str = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
            $("#totalAmount"+i).text(str);
            
            // 환불신청 DB를 ajax로 조회하여 현재 신청 되어있을 경우, 환불 완료까지되었을 경우, 환불신청이 없을 경우 3가지의 경우마다 버튼 모양을 다르게 출력
	        $.ajax({
			   url:"refundSelectYN.do",
			   data : {
			 	  "impUid" : $("#impUid"+i).text()
			   },
			   async: false, // for문 안에서 ajax 작동 순서를 정상적으로 돌아가게 해줌
			   success:function(data){
			 	  if(data == "Y") {
			 		  $("#refund_btn_td"+i).append("<button type='button' class='btn btn-outline-danger' id='refund_btn'"+i+">환불완료</button>");
			 	  } else if(data == "N") {
			  		  $("#refund_btn_td"+i).append("<button type='button' class='btn btn-outline-default' id='refund_btn'"+i+" title='아임포트 관리자에서 환불승인 된 주문건에 한해 클릭하세요.'>환불처리</button>");
			 	  } else {
			 		  $("#admin_reservation_tbody"+i).remove();
			 		  $("#admin_reservation_tbodyy"+i).remove();
			 		  $("#admin_reservation_empty"+i).remove();
			 	  }
			   },
			   error : function(xhr, status) {
			          swal(xhr + " : " + status);
			   }
			});
        }
        
        
        $("#onlyRefund").click(function(){
        	location.href="onlyRefund.do";
        })

		$(".admin_reservation_titleLabel").click(function(){
			location.href="admin_reservation.do";
		})
	})
  </script>
  
</head>

<body class="">
          <div class="card shadow border-0" id="checkReservationArea">
          	<!-- checkReservation -->
          	<div class="admin_reservation_title">
          		<table style="width: 100%;">
          			<tr style="height: 80px;">
          				<td class="admin_reservation_titleLabel"><span style="cursor: pointer;">CHECK RESERVATION</span></td>
          				<td id="member_inpo_select">
	          				<select style="width: 90%; height: 30px;">
			          			<option>ID</option>	
			          			<option>NAME</option>	
			          			<option>PHONE</option>	
			          			<option>ORDER NUMBER</option>	
			          		</select>
	          			</td>
          				<td id="admin_reservation_search"><input type="text" style="width: 90%;"></td>
          				<td id="admin_reservation_search_btn"><button type="button" class="btn btn-outline-secondary" style="color: white;">SEARCH</button></td>
          				<td id="admin_reservation_refund"><button type="button" class="btn btn-danger" id="onlyRefund">환불신청 확인하기</button></td>
          			</tr>
          		</table>
          		
          		
          	</div>
          	<div class="admin_reservation_area">
          		<div class="admin_reservation_content">
          			<table style="width: 100%; text-align: center;" id="admin_reservation_table">
          				<tr style="height: 55px;" class="admin_reservation_thead">
          					<td style="width: 15%;">ORDER NUMBER</td>
          					<td style="width: 10%;">ID</td>
          					<td style="width: 10%;">NAME</td>
          					<td style="width: 15%;">CAR NUMBER</td>
          					<td style="width: 15%;">CAR MODEL</td>
          					<td style="width: 15%;">AMOUNT</td>
          					<td id="iamport_location" title="아임포트 관리자 페이지로 이동하기"><span style="width: 20%; font-size: 23px; color: #5e72e4; cursor: pointer;">Go to IAMPORT<img src="https://image.flaticon.com/icons/svg/25/25628.svg" style="width: 7.5%; margin-bottom: 2%; margin-left: 2%;"></span></td>
          				</tr>
          				<% int num = 0; %>
          				<c:forEach var="pdto" varStatus="status" items="${pdto}">
			   			<tr class="admin_reservation_tbody" id="admin_reservation_tbody${status.index }" style="height: 55px; border-top: 1px solid #00000030;">
			   				<td id="impUid${status.index }"><b>${pdto.buy_impUid }</b></td>
			   				<td>${pdto.buy_id }</td>
			   				<td>${pdto.buy_name }</td>
			   				<td>${pdto.buy_carNum }</td>
			   				<td>${pdto.buy_carModel }</td>
			   				<td><b><label id="totalAmount${status.index }">${pdto.buy_totalAmount }</label></b><label>원</label></td>
			   				<td id="refund_btn_td${status.index }"></td>
			   			</tr>
			   			<tr id="admin_reservation_tbodyy${status.index }" style="height: 40px;">
			   				<td></td>
			   				<td></td>
			   				<td></td>
			   				<td></td>
			   				<td></td>
			   				<td>사고정보 자세히</td>
			   				<td><span style="cursor: pointer;" class="admin_reservation_detail" id="admin_reservation_detail${status.index }">주문정보 자세히</span></td>
			   			</tr>
			   			<tr id="admin_reservation_empty${status.index }" style="border-top:">
			   				<td><b>대여시간</b></td>
			   				<td>${pdto.buy_startTime }</td>
			   				<td><b>반납시간</b></td>
			   				<td>${pdto.buy_endTime }</td>
			   				<td>
			   				<c:choose>
							    <c:when test="${pdto.buy_real_endTime eq ''}">
							         ${pdto.buy_endTime }
							    </c:when>
							    <c:otherwise>
							         ${pdto.buy_real_endTime }
							    </c:otherwise>
							</c:choose>
			   				</td>
			   				<td></td>
			   				<td></td>
			   			</tr>
			   			<% num += 1; %>
			   			</c:forEach>
          			</table>
          			<input type="hidden" id="numCheck" value="<%= num %>">
          		</div>
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