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
	    	confirm_endTime = confirm_endTime.split(".");
	    	confirm_endTime[2] = confirm_endTime[2].split(" ");
	    	end = confirm_endTime[0] + confirm_endTime[1] + confirm_endTime[2];
	    	end = end.substring(0,6);
	    	end *= 1;
	    	confirm_endTime = Number(end);
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
	    		if(!$(this).hasClass("disabled")) {
	    			alert("환불 신청 db처리");
	    		}
	    	})
	    	
	    	if($("#db_discount"+i).val() == ""){
				
			} else {
				$("#amount_div"+i).append("  <label id=\"discount_label\" style=\"font-size: 15px; color: red;\">(할인적용)</label>");
			}
	    }
		
		
	    
	})
	    	
  </script>
</head>

<body class="">
          <div class="card shadow border-0">
          	<!-- checkReservation -->
          	<div class="c_content_title" style="margin-top: 3%; margin-left: 3%;">
          		<img src="https://image.flaticon.com/icons/svg/179/179372.svg" style="width: 2.777%; margin-left: 1%; margin-right: 1%;">나의 결제 내역 확인
          	</div>
          	<%
            	int i = 0;
           	%>
          	<c:forEach var="pdto" items="${plist}">
            	<c:if test="${pdto.buy_id eq sessionId}">
          			<div class="confirm_area">
          	  			<div class="confirm_content">
          					<table class="c_content">
                  				<tr><!-- ddddd -->
          	  						<td rowspan="6" style="width: 30%;"><img style="width: 100%;" src="http://www.top-rider.com/news/photo/201803/26912_85506_4812.jpg"></td>
          	  						<td class="c_content_1">차량번호 : </td>
          	  						<td class="c_content_2" style="width: 15%;" id="confirm_carNum">${pdto.buy_carNum }</td>
          	  						<td class="c_content_1">차종 : </td>
          	  						<td class="c_content_2" id="confirm_carModel">${pdto.buy_carIns }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">대여시간 : </td>
          	  						<td class="c_content_2" id="confirm_startTime<%=i%>">${pdto.buy_startTime }</td>
          	  						<td class="c_content_1">반납시간 : </td>
          	  						<td class="c_content_2" class="confirm_endTime" id="confirm_endTime<%= i %>">${pdto.buy_endTime }</td>
          	  						
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">보험종류 : </td>
          	  						<td class="c_content_2" id="confirm_carIns">${pdto.buy_carIns }</td>
          	  						<td class="c_content_1">예상적립포인트 : </td>
          	  						<td class="c_content_2" id="confirm_point">${pdto.buy_point }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">대여주소 : </td>
          	  						<td colspan="3" class="c_content_2" id="confirm_startLocation">${pdto.buy_startLocation }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">반납주소 : </td>
          	  						<td colspan="3" class="c_content_2" id="confirm_returnLocation">${pdto.buy_returnLocation }</td>
          	  					</tr>
          	  					<tr>
          	  						<td class="c_content_1">결제금액 : </td>
          	  						<td class="c_content_2" id="amount_div<%= i %>"><img style="width: 15%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_amount">${pdto.buy_amount }</div>원</td>
          	  						<td class="c_content_1">추가금액 : </td>
          	  						<td class="c_content_2"><img style="width: 9.3%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_addAmount">${pdto.buy_addAmount }</div>원</td>
          	  					</tr>
          	  					<tr>
          	  						<td></td>
          	  						<td class="c_content_1" style="font-size: 28px;">총 금액 : </td>
          	  						<td class="c_content_2"><img style="width: 15%; margin-right: 5%; margin-top: 2%; float: left;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_totalAmount">${pdto.buy_totalAmount }</div>원</td>
          	  						<td colspan="2">
          	  							<button type="button" class="btn btn-outline-danger c_content_payBtn" id="refund_btn<%= i %>">환불신청하기</button>
          	  						</td>
          	  					</tr>
              				 </table>
              				 <%
          	  					i += 1;
          	  				 %>
          				</div>
          			</div>
          			<input type="hidden" id="db_discount<%= i %>" value="${pdto.buy_discount }">
				</c:if>
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