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
  <script>
	$(function() {
		
		// jstl의 foreach 반복 횟수
        var index = $("#numCheck").val(); 
		
        for(var i = 0; i < index; i++) {
            // 페이지가 로딩 될 때 주문 상세내역들은 hide로 숨겨놓는다.
	 		$("#admin_reservation_empty"+i).hide();
	 		$("#admin_reservation_empty"+i).css("background-color", "#f6f9fc");
	 		$("#admin_reservation_emptyy"+i).hide();
	 		$("#admin_reservation_emptyy"+i).css("background-color", "#f6f9fc");
	 		
	 		// showHide 함수를 i 파라메터로 넘긴다.
	 		showHide(i);
        }
		
		
		function showHide(i){
        	$("#admin_reservation_detail"+i).click(function(){
        		if($("#clickCheck").val() == "0") {
        			$("#detail_b_tag"+i).text("카키 존 등록");
        			$("#detail_img_tag"+i).attr("src", "https://image.flaticon.com/icons/svg/2026/2026638.svg");
        			$("#clickCheck").val("1");
        		} else {
        			$("#detail_b_tag"+i).text("카키 존 등록");
        			$("#detail_img_tag"+i).attr("src", "https://image.flaticon.com/icons/svg/2026/2026641.svg");
        			$("#clickCheck").val("0");
        		}
        		// 주문정보 자세히 버튼을 클릭하면 숨어져있던 tr들이 hide와 show를 반복적으로 toggle
        		$("#admin_reservation_empty"+i).toggle();
	        })
	        
	        $("#admin_reservation_detaill"+i).click(function(){
        		if($("#clickCheck1").val() == "0") {
        			$("#detail_b_tagg"+i).text("차량 등록");
        			$("#detail_img_tagg"+i).attr("src", "https://image.flaticon.com/icons/svg/2026/2026638.svg");
        			$("#clickCheck1").val("1");
        		} else {
        			$("#detail_b_tagg"+i).text("차량등록");
        			$("#detail_img_tagg"+i).attr("src", "https://image.flaticon.com/icons/svg/2026/2026641.svg");
        			$("#clickCheck1").val("0");
        		}
        		// 주문정보 자세히 버튼을 클릭하면 숨어져있던 tr들이 hide와 show를 반복적으로 toggle
        		$("#admin_reservation_emptyy"+i).toggle();
	        })
	        
	        if($("#processingStatus"+i).text() == 'N') {
	        	
	        } else {
	        	$("#processingStatus"+i).text("");
	        	$("#processingStatus"+i).append('<button type="button" class="btn btn-outline-default" disabled>처리완료</button>')
	        	$("#admin_reservation_tbody"+i).css("background-color", "#ffdcd4");
	        	$("#admin_reservation_tbodyy"+i).remove();
	        }
        	
        	var phone = $("#phoneTd"+i).text();
        	phone = phone.split("");
        	
        	
        	
	        
		}
		
		$("#admin_reservation_search_button").click(function(){
        	var data1 = $("#admin_reservation_select option:selected").val();
        	var data2 = $("#admin_reservation_input").val();
        	location.href="usedCar_search.do?select="+data1+"&text="+data2;
        })
        $("#admin_reservation_input").keydown(function(key) {
        	//키의 코드가 13번일 경우 (13번은 엔터키)
        	if (key.keyCode == 13) {
        		$("#admin_reservation_search_button").click();
        	}
        });
		$("#admin_reservation_select").val('${searchMethod}').prop('selected', true);
        $("#admin_reservation_input").val('${searchInputText}');
		
		$("#UntreatedBtn").click(function(){
        	location.href="usedCarYN.do";
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
          				<td class="admin_reservation_titleLabel"><span style="cursor: pointer;">Used Car Management</span></td>
          				<td id="member_inpo_select">
	          				<select id="admin_reservation_select" style="width: 90%; height: 30px;">
			          			<option name="name" value="name">NAME</option>
			          			<option name="carNum" value="carNum">CAR NUMBER</option>
			          			<option name="phone" value="phone">PHONE</option>
			          		</select>
	          			</td>
          				<td id="admin_reservation_search"><input type="text" style="width: 90%;" id="admin_reservation_input" placeholder="search.."></td>
          				<td id="admin_reservation_search_btn"><button type="button" class="btn btn-outline-secondary" style="color: white;" id="admin_reservation_search_button">SEARCH</button></td>
          				<td id="admin_reservation_refund"><button type="button" class="btn btn-danger" id="UntreatedBtn">미처리건 확인하기</button></td>
          			</tr>
          		</table>
          		
          		
          	</div>
          	<div class="admin_reservation_area">
          		<div class="admin_reservation_content">
          			<table style="width: 100%; text-align: center;" id="admin_reservation_table">
          				<tr style="height: 55px;" class="admin_reservation_thead">
          					<td style="width: 15%;">NAME</td>
          					<td style="width: 10%;">LOCATION</td>
          					<td style="width: 10%;">CAR NUMBER</td>
          					<td style="width: 15%;">PHONE</td>
          					<td style="width: 15%;">VISIT DAY</td>
          					<td style="width: 15%;">DISTANCE</td>
          					<td style="width: 20%;">PROSSING STATUS</td>
          				</tr>
          				<% int num = 0; %>
          				<c:forEach var="usedCarDTO" varStatus="status" items="${usedCarDTO}">
			   			<tr class="admin_reservation_tbody" id="admin_reservation_tbody${status.index }" style="height: 55px; border-top: 1px solid #00000030;">
			   				<td>${usedCarDTO.name }</td>
			   				<td>${usedCarDTO.location1 } ${usedCarDTO.location2 }</td>
			   				<td id="carNumTd${status.index }">${usedCarDTO.carNum }</td>
			   				<td id="phoneTd${status.index }">${usedCarDTO.phone }</td>
			   				<td>${usedCarDTO.visitDay }</td>
			   				<td>${usedCarDTO.distance }</td>
			   				<td id="processingStatus${status.index }">${usedCarDTO.processingStatus }</td>
			   			</tr>
			   			<tr class="admin_reservation_tbody" id="admin_reservation_tbodyy${status.index }" style="height: 40px;">
			   				<td></td>
			   				<td></td>
			   				<td></td>
			   				<td></td>
			   				<td></td>
			   				<td><span style="cursor: pointer;" class="admin_reservation_detail" id="admin_reservation_detail${status.index }" value="${status.index }"><b id="detail_b_tag${status.index }">카키 존 등록</b><img id='detail_img_tag${status.index }' src='https://image.flaticon.com/icons/svg/2026/2026641.svg' style='width: 7%; margin-left: 2%;'></span></td>
			   				<td><span style="cursor: pointer;" class="admin_reservation_detail" id="admin_reservation_detaill${status.index }" value="${status.index }"><b id="detail_b_tagg${status.index }">차량 등록</b><img id='detail_img_tagg${status.index }' src='https://image.flaticon.com/icons/svg/2026/2026641.svg' style='width: 7%; margin-left: 2%;'></span></td>
			   			</tr>
			   			<tr id="admin_reservation_empty${status.index }" style="border-top: 4px dotted #0000001c; height: 200px;" value="0">
			   				<td colspan="7"><iframe id="usedCarZone${status.index }" src="khakizone_main.do" style="width: 100%; height: 800px;" frameborder="0"></iframe></td>
			   			</tr>
			   			<tr id="admin_reservation_emptyy${status.index }" style="border-top: 4px dotted #0000001c; height: 200px;" value="0">
			   				<td colspan="7"><iframe id="usedCarCarManage${status.index }" src="carmanageInsert.do" style="width: 100%; height: 800px;" frameborder="0"></iframe></td>
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