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
			 		  $("#refund_btn_td"+i).append("<button type='button' class='btn btn-outline-danger' id='refund_btn"+i+"''>환불완료</button>");
			  		  $("#admin_reservation_rfImg"+i).append("<img src='https://image.flaticon.com/icons/svg/1828/1828748.svg' style='width: 13%; float: left;'>");
			 	  } else if(data == "N") {
			  		  $("#refund_btn_td"+i).append("<button type='button' class='btn btn-outline-default' id='refund_btn"+i+"' title='아임포트 관리자에서 환불승인 된 주문건에 한해 클릭하세요.'>환불처리</button>");
			  		  $("#admin_reservation_rfImg"+i).append("<img src='https://image.flaticon.com/icons/svg/1828/1828748.svg' style='width: 13%; float: left;'>");
			 	  } else {
			 	  }
			   },
			   error : function(xhr, status) {
			          swal(xhr + " : " + status);
			   }
			});
            
            // 페이지가 로딩 될 때 주문 상세내역들은 hide로 숨겨놓는다.
	 		$("#admin_reservation_empty"+i).hide();
	 		$("#admin_reservation_emptyy"+i).hide();
	 		$("#admin_reservation_emptyyy"+i).hide();
	 		$("#admin_reservation_emptyyyy"+i).hide();
	 		$("#admin_reservation_emptyyyyy"+i).hide();
	 		$("#admin_reservation_empty"+i).css("background-color", "#f6f9fc");
	 		$("#admin_reservation_emptyy"+i).css("background-color", "#f6f9fc");
	 		$("#admin_reservation_emptyyy"+i).css("background-color", "#f6f9fc");
	 		$("#admin_reservation_emptyyyy"+i).css("background-color", "#f6f9fc");
	 		$("#admin_reservation_emptyyyyy"+i).css("background-color", "#f6f9fc");
	 		
	 		// showHide 함수를 i 파라메터로 넘긴다.
	 		showHide(i);
	 		
	 		if($("#refund_btn"+i).text() == "환불완료") {
	 			$("#admin_reservation_empty"+i).css("background-color", "#ffdcd4");
		 		$("#admin_reservation_emptyy"+i).css("background-color", "#ffdcd4");
		 		$("#admin_reservation_emptyyy"+i).css("background-color", "#ffdcd4");
		 		$("#admin_reservation_emptyyyy"+i).css("background-color", "#ffdcd4");
		 		$("#admin_reservation_emptyyyyy"+i).css("background-color", "#ffdcd4");
		 		$("#admin_reservation_tbody"+i).css("background-color", "#ffdcd4");
		 		$("#admin_reservation_tbodyy"+i).css("background-color", "#ffdcd4");
		 		
	 		}
	 		
	 		var st = $("#startTime"+i).text().split("");
	 		$("#startTime"+i).text(st[0]+st[1]+"."+st[2]+st[3]+"."+st[4]+st[5]+" "+st[6]+st[7]+":"+st[8]+st[9]);
	 		var endTime = $("#endTime"+i).text();
	 		if(endTime != "환불") {
	 			var et = $("#endTime"+i).text().split("");
		 		$("#endTime"+i).text(et[0]+et[1]+"."+et[2]+et[3]+"."+et[4]+et[5]+" "+et[6]+et[7]+":"+et[8]+et[9]);	 			
	 		} else {
	 		}
	 		
	 		var cp = $("#admin_reservation_coupon"+i).text();
	 		if(cp == "- 쿠폰 선택 -") {
	 			$("#admin_reservation_coupon"+i).text("-");
	 		} else if(cp == "") {
	 			$("#admin_reservation_coupon"+i).text("-");
	 		}
	 		
        }
        
        
        function showHide(i){
        	$("#admin_reservation_detail"+i).click(function(){
        		if($("#clickCheck").val() == "0") {
        			$("#detail_b_tag"+i).text("주문정보 자세히");
        			$("#detail_img_tag"+i).attr("src", "https://image.flaticon.com/icons/svg/2026/2026638.svg");
        			$("#clickCheck").val("1");
        		} else {
        			$("#detail_b_tag"+i).text("주문정보 자세히");
        			$("#detail_img_tag"+i).attr("src", "https://image.flaticon.com/icons/svg/2026/2026641.svg");
        			$("#clickCheck").val("0");
        		}
        		
        		// 주문정보 자세히 버튼을 클릭하면 숨어져있던 tr들이 hide와 show를 반복적으로 toggle
        		$("#admin_reservation_empty"+i).toggle();
        		$("#admin_reservation_emptyy"+i).toggle();
        		$("#admin_reservation_emptyyy"+i).toggle();
        		$("#admin_reservation_emptyyyy"+i).toggle();
        		$("#admin_reservation_emptyyyyy"+i).toggle();
	        })
	        
	        
	        
	        $("#refund_btn"+i).click(function(){
	        	if($("#refund_btn"+i).text() == "환불처리"){
	        		var result = confirm("정말로 환불 처리를 하시겠습니까?");
	        		if(result == true){
	        			$.ajax({
	 	  	 			   url:"refundUpdate.do",
	 	  	 			   data : {
	 	  	 			 	  "impUid" : $("#impUid"+i).text()
	 	  	 			   },
	 	  	 			   // async: false, // for문 안에서 ajax 작동 순서를 정상적으로 돌아가게 해줌
	 	  	 			   success:function(data){
                               swal("환불처리가 완료되었습니다.")
                               .then((value) => {
                            	   location.reload();
                               });
                               
	 	  	 			   },
	 	  	 			   error : function(xhr, status) {
	 	  	 			          swal(xhr + " : " + status);
	 	  	 			   }
	 	  	 			});	
	        		}
	        			
	        	} else {
	        		swal("이미 환불이 완료 된 주문건입니다.")
	        	}
	        	
	 		})
		}
        
        
        $("#onlyRefund").click(function(){
        	if($("#btnCheck").val() == "0"){
        		for(var i = 0; i < index; i++) {
    	        	$.ajax({
    	 			   url:"refundSelectYN.do",
    	 			   data : {
    	 			 	  "impUid" : $("#impUid"+i).text()
    	 			   },
    	 			   async: false, // for문 안에서 ajax 작동 순서를 정상적으로 돌아가게 해줌
    	 			   success:function(data){
    	 			 	  if(data == "Y") {
    	 			 		  $("#admin_reservation_tbody"+i).remove();
	  				 		  $("#admin_reservation_tbodyy"+i).remove();
	  				 		  $("#admin_reservation_empty"+i).remove();
	  				 		  $("#admin_reservation_emptyy"+i).remove();
	  				 		  $("#admin_reservation_emptyyy"+i).remove();
	  				 		  $("#admin_reservation_emptyyyy"+i).remove();
    	 			 	  } else if(data == "N") {
    	 			 	  } else {
    	 			 		  $("#admin_reservation_tbody"+i).remove();
    				 		  $("#admin_reservation_tbodyy"+i).remove();
    				 		  $("#admin_reservation_empty"+i).remove();
    				 		  $("#admin_reservation_emptyy"+i).remove();
    				 		  $("#admin_reservation_emptyyy"+i).remove();
    				 		  $("#admin_reservation_emptyyyy"+i).remove();
    	 			 	  }
    	 			   },
    	 			   error : function(xhr, status) {
    	 			          swal(xhr + " : " + status);
    	 			   }
    	 			});
            	}
        		$("#onlyRefund").text("전체 목록으로 가기")
        		$("#btnCheck").val("1");
        	} else {
        		location.href="admin_reservation.do";
        	}
        		
        	
        })
        
        
        $("#admin_reservation_search_button").click(function(){
        	var data1 = $("#admin_reservation_select option:selected").val();
        	var data2 = $("#admin_reservation_input").val();
        	location.href="refund_search.do?select="+data1+"&text="+data2;
        })
        $("#admin_reservation_input").keydown(function(key) {
        	//키의 코드가 13번일 경우 (13번은 엔터키)
        	if (key.keyCode == 13) {
        		$("#admin_reservation_search_button").click();
        	}
        });
        $("#admin_reservation_select").val('${searchMethod}').prop('selected', true);
        $("#admin_reservation_input").val('${searchInputText}');
        
        
        $("#admin_reservation_titleLabel").click(function(){
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
	          				<select id="admin_reservation_select" style="width: 90%; height: 30px;">
			          			<option name="buy_impUid" value="buy_impUid" selected>ORDER NUMBER</option>	
			          			<option name="buy_id" value="buy_id">ID</option>	
			          			<option name="buy_name" value="buy_name">NAME</option>
			          			<option name="buy_carNum" value="buy_carNum">CAR NUMBER</option>
			          		</select>
	          			</td>
          				<td id="admin_reservation_search"><input type="text" style="width: 90%;" id="admin_reservation_input" placeholder="search.."></td>
          				<td id="admin_reservation_search_btn"><button type="button" class="btn btn-outline-secondary" style="color: white;" id="admin_reservation_search_button">SEARCH</button></td>
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
			   				<td id="impUid${status.index }"><div id="admin_reservation_rfImg${status.index }"></div><b>${pdto.buy_impUid }</b></td>
			   				<td>${pdto.buy_id }</td>
			   				<td>${pdto.buy_name }</td>
			   				<td>${pdto.buy_carNum }</td>
			   				<td>${pdto.buy_carModel }</td>
			   				<td><b><label id="totalAmount${status.index }">${pdto.buy_totalAmount }</label></b><label>원</label></td>
			   				<td id="refund_btn_td${status.index }"></td>
			   			</tr>
			   			<tr class="admin_reservation_tbody" id="admin_reservation_tbodyy${status.index }" style="height: 40px;">
			   				<td></td>
			   				<td></td>
			   				<td></td>
			   				<td></td>
			   				<td></td>
			   				<%-- <td><span style="cursor: pointer;" class="admin_reservation_detail" id="admin_reservation_detail1${status.index }" value="${status.index }"><b id="detail_b_tag1${status.index }">사고정보 자세히</b><img id='detail_img_tag1${status.index }' src='https://image.flaticon.com/icons/svg/2026/2026641.svg' style='width: 7%; margin-left: 2%;'></span></td> --%>
			   				<td></td>
			   				<td><span style="cursor: pointer;" class="admin_reservation_detail" id="admin_reservation_detail${status.index }" value="${status.index }"><b id="detail_b_tag${status.index }">주문정보 자세히</b><img id='detail_img_tag${status.index }' src='https://image.flaticon.com/icons/svg/2026/2026641.svg' style='width: 7%; margin-left: 2%;'></span></td>
			   			</tr>
			   			<tr id="admin_reservation_empty${status.index }" style="border-top: 4px dotted #0000001c; height: 50px;" value="0">
			   				<td><b>대여시간</b></td>
			   				<td id="startTime${status.index }">${pdto.buy_startTime }</td>
			   				<td><b>반납시간</b></td>
			   				<td><c:choose>
							    <c:when test="${not empty pdto.buy_real_endTime}">
							        <label id="endTime${status.index }">${pdto.buy_real_endTime }</label>
							    </c:when>
							    <c:when test="${empty pdto.buy_real_endTime}">
							    	<label id="endTime${status.index }">${pdto.buy_endTime }</label>
							    </c:when>
							</c:choose></td>
			   				<td><b>주행거리</b></td>
			   				<td>${pdto.buy_driveDistance }</td>
			   				<td></td>
			   			</tr>
			   			<tr id="admin_reservation_emptyy${status.index }" style="height: 50px;">
			   				<td><b>대여장소</b></td>
			   				<td colspan="5" style="text-align: left;">${pdto.buy_startLocation }</td>
			   				<td></td>
			   			</tr>
			   			<tr id="admin_reservation_emptyyy${status.index }" style="height: 50px;">
			   				<td><b>반납장소</b></td>
			   				<td colspan="5" style="text-align: left;"><c:choose>
							    <c:when test="${not empty pdto.buy_real_returnLocation}">
							        ${pdto.buy_real_returnLocation }
							    </c:when>
							    <c:when test="${empty pdto.buy_real_returnLocation}">
							    	${pdto.buy_returnLocation }
							    </c:when>
							</c:choose></td>
			   				<td></td>
			   			</tr>
			   			<tr id="admin_reservation_emptyyyy${status.index }" style="height: 50px;">
			   				<td><b>최초금액(추가금액)</b></td>
			   				<td>${pdto.buy_amount }(${pdto.buy_addAmount })</td>
			   				<td><b>적립된 포인트</b></td>
			   				<td>${pdto.buy_point }</td>
			   				<td><b>사용한 포인트</b></td>
			   				<td>${pdto.buy_usePoint }</td>
			   				<td></td>
			   			</tr>
			   			<tr id="admin_reservation_emptyyyyy${status.index }" style="height: 50px;">
			   				<td><b>사용한 쿠폰 이름</b></td>
			   				<td id="admin_reservation_coupon${status.index }">${pdto.buy_coupon }</td>
			   				<td><b>쿠폰 적용 금액</b></td>
			   				<td>${pdto.buy_useCoupon }</td>
			   				<td><b>부름서비스 여부</b></td>
			   				<td>
							    <c:if test="${pdto.buy_burum eq null}">
								    N
								</c:if>
							    <c:if test="${pdto.buy_burum eq 'y'}">
							    	Y
							    </c:if>
							</td>
							<td></td>
			   			</tr>
			   			<% num += 1; %>
			   			</c:forEach>
          			</table>
          			<input type="hidden" id="numCheck" value="<%= num %>">
          			<input type="hidden" id="clickCheck" value="0">
          			<input type="hidden" id="clickCheck1" value="0">
          			<input type="hidden" id="btnCheck" value="0">
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