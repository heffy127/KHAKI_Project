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
		// 현재날짜와 반납한날짜를 비교하여 5일 이상 지나지 않은 주문건만 환불 가능.
		// 5일이 지난 주문건은 환불 불가하며 고객센터로 문의해야 관리자(상담사)가 확인 후 처리 가능.
		var date = new Date();
		var year= String(date.getFullYear());
	    var mon = (date.getMonth()+1)>9 ? ''+(date.getMonth()+1) : '0'+(date.getMonth()+1);
	    var day = date.getDate()>9 ? ''+date.getDate() : '0'+date.getDate();
	    var yr = year.substring(2,4);
	    var now = yr+mon+day;
	    now *= 1;
	    var index = $("#i_storage").val();
	    index *= 1;
	    for (var i = 0; i < index; i++) {
	    	var confirm_endTime = $("#confirm_endTime"+i).text();
	    	confirm_endTime *= 1;
	    	if(String(now).substring(2,4) == String(confirm_endTime).substring(2,4)) { // 현재 월과 결제한 월이 같을 경우 (ex. 현재=9월 결제=9월)
	    		if((now - confirm_endTime) > 4) {
		    	    $("#refund_btn"+i).attr("disabled", "disabled");
		    	    $("#refund_btn"+i).text("환불 불가 - 고객센터에 문의 하세요.");
			    }
	    	} else if (Number(String(now).substring(2,4)) == 1) { // 현재 월이 1월일 경우
	    		if(Number(String(now).substring(4,6)) > 4) { // 5일 이전 결제건은 환불 불가
	    			$("#refund_btn"+i).attr("disabled", "disabled");
		    	    $("#refund_btn"+i).text("환불 불가 - 고객센터에 문의 하세요.");
	    		}
	    	} else if (Number(String(now).substring(2,4)) > Number(String(confirm_endTime).substring(2,4))) { // 현재 월이 결제한 월보다 클 경우(ex. 현재=10월 결제=9월)
	    		if(Number(String(now).substring(4,6)) > 3) { // 5일 이전 결제건은 환불 불가
	    			$("#refund_btn"+i).attr("disabled", "disabled");
		    	    $("#refund_btn"+i).text("환불 불가 - 고객센터에 문의 하세요.");
	    		}
	    	}
	    	
        }
		for (var i = 0; i < parseInt(index); i++) {
	    	$("#refund_btn"+i).click(function(){
	    		var num = $(this).val();
				var buy_impUid = $("#impNum" + num).val(); 
				alert("db처리");
	    	})
			$("#amount_div"+i).append("  <label id=\"discount_label\" style=\"font-size: 15px; color: red;\">(할인적용)</label>");
	    	if($("#db_discount"+i).val() == ""){
	    		$("#amount_div"+i).remove();
			}
	    	
	    	if($("#confirm_addAmount"+i).text() == "") {
	    		$("#confirm_totalAmount"+i).text($("#confirm_amount"+i).text());
	    	} 
	    	
	    	var startTime = $("#confirm_startTime"+i).text();
	  		var endTime = $("#confirm_endTime"+i).text();
	  		startTime = startTime.split("");
	  		endTime = endTime.split("");
	  		startTime = startTime[0]+startTime[1]+"."+startTime[2]+startTime[3]+"."+startTime[4]+startTime[5]+" "+startTime[6]+startTime[7]+":"+startTime[8]+startTime[9];
	  		endTime = endTime[0]+endTime[1]+"."+endTime[2]+endTime[3]+"."+endTime[4]+endTime[5]+" "+endTime[6]+endTime[7]+":"+endTime[8]+endTime[9];
	  		$("#confirm_startTime"+i).text(startTime);  		
	  		$("#confirm_endTime"+i).text(endTime);
	  		
	  		
	    }
		
		if($("#confirm_carNum").text() == "") {
			$(".c_content_title").remove();
			$("#checkReservationArea").append(""
					+ "<div style='width: 100%; height: 1000px; text-align: center;'>"
					+ "<img src='https://image.flaticon.com/icons/svg/705/705926.svg' style='width: 25%; text-align: center; margin-top: 5%; margin-bottom: 3%;'><br>"
					+ "<label id='craLabel1'>주문 결제 내역이 없습니다.</label><br>"
					+ "<label id='craLabel2'><img src='resources/assets/img/brand/khaki2.png' style='width: 20%;'> 이용을 통해 더 많은 <b style='color: #ff5353; font-size: 30px; text-shadow: 1px 1px 1px #978989;'>혜택</b>을 누려보세요! </label><br>"
					+ "<div id='craDiv' style='width: 100%; text-align: center; margin-top: 15%; margin-bottom: 3%;'>차량 예약하러 가기</div>"
					+ "</div>");	
		}
		
		$("#craDiv").click(function(){
			window.parent.location.href = "map.do";
		})
		
		
	})
	    	
	
	
  </script>
  
</head>

<body class="">
          <div class="card shadow border-0" id="checkReservationArea">
          	<!-- checkReservation -->
          	<div class="c_content_title" style="margin-top: 3%; margin-left: 3%;">
          		<img src="https://image.flaticon.com/icons/svg/179/179372.svg" style="width: 2.777%; margin-left: 1%; margin-right: 1%;">나의 결제 내역 확인
          	</div>
          	<%
            	int i = 0;
           	%>
          	<c:forEach var="pdto" varStatus="status" items="${plist}">
          			<div class="confirm_area">
          	  			<div class="confirm_content">
          	  			
          	  				<table class="c_content" id="checkREservationTable">
          	  					<tr>
          	  						<td rowspan="4" colspan="2" style="width: 50%;"><img style="width: 100%;" src="${carImage.get(status.index)}"></td>
          	  						<td class="checkREservationTd" style="width: 25%; font-size: 28px;">차량번호</td>
          	  						<td style="width: 25%; font-size: 28px;" id="confirm_carNum">${pdto.buy_carNum }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="checkREservationTd" style="width: 25%; font-size: 28px;">차종</td>
          	  						<td style="width: 25%; font-size: 28px;" id="confirm_carModel">${pdto.buy_carModel }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="checkREservationTd" style="width: 25%; font-size: 28px;">대여시간</td>
          	  						<td style="width: 25%; font-size: 28px;" id="confirm_startTime<%=i%>">${pdto.buy_startTime }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="checkREservationTd" style="width: 25%; font-size: 28px;">반납시간</td>
          	  						<td style="width: 25%; font-size: 28px;" class="confirm_endTime" id="confirm_endTime<%= i %>">${pdto.buy_endTime }</td>
          	  					</tr>
          	  					<tr style="padding: 1%">
          	  						<td class="checkREservationTd" style="width: 25%;">보험종류</td>
          	  						<td style="width: 25%;" id="confirm_carIns">${pdto.buy_carIns }</td>
          	  						<td class="checkREservationTd" style="width: 25%;">예상적립포인트</td>
          	  						<td style="width: 25%;" id="confirm_point">${pdto.buy_point }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="checkREservationTd">대여주소</td>
          	  						<td style="width: 25%;" colspan="3" id="confirm_startLocation">${pdto.buy_startLocation }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="checkREservationTd">반납주소</td>
          	  						<td style="width: 25%;" colspan="3"  id="confirm_returnLocation">${pdto.buy_returnLocation }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="checkREservationTd">결제금액</td>
          	  						<td><img style="width: 15%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_amount<%= i %>" style="float: left;">${pdto.buy_amount }</div><div style="float: left; margin-right: 2%;">원</div><div id="amount_div<%= i %>"></div></td>
          	  						<td class="checkREservationTd">추가금액</td>
          	  						<td><img style="width: 9.3%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_addAmount<%= i %>" style="float: left;">${pdto.buy_addAmount }</div>원</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="checkREservationTd" style="font-size: 28px;">총 금액</td>
          	  						<td style="font-size: 28px;"><img style="width: 15%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_totalAmount<%= i %>" style="float: left;">${pdto.buy_totalAmount }</div>원</td>
          	  						<td colspan="2"><button type="button" class="btn btn-outline-danger c_content_payBtn" value="<%= i %>" id="refund_btn<%= i %>">환불신청하기</button></td>
          	  					</tr>
          	  				</table>
          					 <input type="hidden" id="db_discount<%= i %>" value="${pdto.buy_discount }">
          					 <input type="hidden" id="impNum<%= i %>" value="${pdto.buy_impUid }">
              				 <%
          	  					i += 1;
          	  				 %>
          				</div>
          			</div>
			</c:forEach>
			<input type="hidden" id="i_storage" value="<%= i %>">
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