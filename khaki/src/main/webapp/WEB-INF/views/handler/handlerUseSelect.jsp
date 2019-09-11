<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		var id = '<%=(String)session.getAttribute("sessionId")%>';
  		$.ajax({ // ajax 실행
		      url:"handlerIdCheck.do", 
	 	      data : {
	 	    	  "id" : id
	 	      },
	 	      success:function(data){ // ajax가 성공했을 때
	 	    	  if(data == "Y") {
	 	    		 $("#craDiv").click(function(){
		 				  window.parent.location.href = "handlerBoard.do";
		 			  })
	 	    	  } else {
	 	    		  $("#handlerBody").children().remove();
	 	    		  $("#handlerBody").append(""
	 	 					+ "<div style='width: 100%; height: 1000px; text-align: center;'>"
	 						+ "<img src='https://image.flaticon.com/icons/svg/1464/1464727.svg' style='width: 15%; text-align: center; margin-top: 5%; margin-bottom: 3%;'><br>"
	 						+ "<label id='craLabel1'>핸들러 유저가 아닙니다.</label><br>"
	 						+ "<label id='craLabel2'>아래 링크를 클릭하여 핸들러 신청 후 이용 해주세요.</label><br>"
	 						+ "<div id='craDiv' style='width: 100%; text-align: center; margin-top: 15%; margin-bottom: 3%;'>핸들러 조건 확인하기</div>"
	 						+ "</div>");
	 	    		 $("#craDiv").click(function(){
		 				  window.parent.location.href = "handler.do";
		 			  })
	 	    	  }
	 	      },
	 	      error : function(xhr, status) { // ajax가 실패했을 때
	               alert(xhr + " : " + status); // 실패 내용 확인
	           }
		}) // ajax end
		
		
		var a = $("#handlerUseCheck1").text();
  		var b = $("#handlerUseCheck2").text();
  		
  		if(a == "" && b == "") { // a와 b가 모두 비었을 경우
  			$("#handlerBody").append(""
 					+ "<div style='width: 100%; height: 1000px; text-align: center;'>"
					+ "<img src='https://image.flaticon.com/icons/svg/1464/1464727.svg' style='width: 15%; text-align: center; margin-top: 5%; margin-bottom: 3%;'><br>"
					+ "<label id='craLabel1'>핸들러 신청 내역이 없습니다.</label><br>"
					+ "<label id=\"handlerUseLabel2\" style=\"padding-left: 5%;\">더 많은 핸들러 미션을 통하여 포인트를 <b class=\"blueFont\">적립</b>해 보세요!<br>적립 된 포인트는 KHAKI 서비스 이용 시 각종 <b class=\"redFont\">할인</b>혜택을 받을 수 있습니다.</label>"
					+ "<label id='craLabel2'>아래 링크를 클릭하여 핸들러 신청 후 이용 해주세요.</label><br>"
					+ "<div id='craDiv' style='width: 100%; text-align: center; margin-top: 15%; margin-bottom: 3%;'>핸들러 신청하러 가기</div>"
					+ "</div>");
  			$("#handlerUseArea").remove();
  			$("#handlerUseLabel").remove();
  			$("#handlerUseTable1").remove();
  			$("#handlerUseArea2").remove();
  			$("#handlerUseLabel2").remove();
  			$("#handlerUseTable2").remove();
  		} else if(a == "" && b != "") { // a는 비었는데 b는 내용이 있을 경우
  			$("#handlerUseArea").remove();
  			$("#handlerUseLabel").remove();
  			$("#handlerUseTable1").remove();
  			
  		} else if(a != "" && b == "") { // a는 내용이 있는데 b는 비었을 경우
  			$("#handlerUseArea2").remove();
  			$("#handlerUseLabel2").remove();
  			$("#handlerUseTable2").remove();
  		} else { // a, b모두 내용이 있을 경우
  			
  		}
		
  		  		
  		
  		$(".handlerUseBtn").click(function(){
  			var a = $(this).children("#hiddenNum").val()
  			var result = confirm("운송완료 처리 하시겠습니까?"); 
  			if(result) { 
  				$.ajax({ // ajax 실행
	      		      url:"handlerUseUpdate.do", 
	      	 	      data : {
	      	 	    	  "h_id" : $("#h_id"+a).val(),
	      	 	    	  "h_carNum" : $("#h_carNum"+a).val(),
	      	 	    	  "h_carModel" : $("#h_carModel"+a).val(),
	      	 	    	  "h_startLocation" : $("#h_startLocation"+a).val(),
	      	 	    	  "h_returnLocation" : $("#h_returnLocation"+a).val(),
	      	 	    	  "h_complete" : $("#h_complete"+a).val(),
	      	 	    	  "h_point" : $("#h_point"+a).val(),
	      	 	    	  "h_using" : $("#h_using"+a).val()
	      	 	      },
	      	 	      success:function(data){ // ajax가 성공했을 때
	      	 	    	  location.href="handlerUseSelect.do?h_id="+id;
	      	 	      },
	      	 	      error : function(xhr, status) { // ajax가 실패했을 때
	      	               alert(xhr + " : " + status); // 실패 내용 확인
	      	           }
	      		}) // ajax end
  			}
  			
  		})
		
  	}) // ajax function end
  </script>
</head>
<div id="handlerBody" style="background-color: white; width: 100%; height: 1000px;">
	<div style="background-color: white; padding-bottom: 5%;">
		<div id="handlerUseArea">Handler</div>
		<label id="handlerUseLabel" style="padding-left: 5%;">핸들러 미션을 통하여 포인트를 <b class="blueFont">적립</b>해 보세요!<br>도착 완료시간내에 완료하지 못할 경우 <b class="redFont">패널티</b>가 부과 될 수 있습니다.<br>완료한 차량이 경우 <b class="greenFont">운송완료</b> 버튼을 눌러주세요!</label>
		<table id="handlerUseTable1" border="1px solid #d9d9d9" style="width: 100%; text-align: center; margin-top: 5%;">
			<tr style="height: 50px; font-size: 20px; font-weight: bold; background-color: #c0f0dc;">
				<td style="width: 10%;">차량번호</td>
				<td style="width: 10%;">차종</td>
				<td style="width: 25%;">출발장소</td>
				<td style="width: 25%;">도착장소</td>
				<td style="width: 10%;">도착완료시간</td>
				<td style="width: 10%;">예상적립포인트</td>
				<td style="width: 10%;">완료여부</td>
			</tr>
			<% int num = 0; %>
			<c:forEach var="hudto" varStatus="status" items="${hulist}">
				<c:if test="${hudto.h_using eq 'N'}">
				<tr style="height: 50px;" id="handlerUseTr" class="hubB">
					<td id="handlerUseCheck1">${hudto.h_carNum }</td>
					<td>${hudto.h_carModel }</td>
					<td>${hudto.h_startLocation }</td>
					<td>${hudto.h_returnLocation }</td>
					<td>${hudto.h_complete }</td>
					<td>${hudto.h_point }
					<input type="image" id="handlerUseTdBtn" class="hubB" data-container="body" data-toggle="popover" data-color="default" data-placement="top" data-content="미션 완료 시 해당 포인트만큼 적립됩니다!" src="https://image.flaticon.com/icons/svg/857/857433.svg">
					</td>
					<td><button type="button" id="handlerUseBtn<%=num %>" class="btn btn-outline-success handlerUseBtn" style="width: 100%; margin: 0;">운송완료<input type="hidden" id="hiddenNum" value="<%=num%>"></button><input type="hidden" value="${hudto.h_using }"></td>
				</tr>
					<input type="hidden" name="h_id" id="h_id<%=num %>" value="${hudto.h_id }" />
					<input type="hidden" name="h_carNum" id="h_carNum<%=num %>" value="${hudto.h_carNum }" />
					<input type="hidden" name="h_carModel" id="h_carModel<%=num %>" value="${hudto.h_carModel }" />
					<input type="hidden" name="h_startLocation" id="h_startLocation<%=num %>" value="${hudto.h_startLocation }" />
					<input type="hidden" name="h_returnLocation" id="h_returnLocation<%=num %>" value="${hudto.h_returnLocation }" />
					<input type="hidden" name="h_complete" id="h_complete<%=num %>" value="${hudto.h_complete }" />
					<input type="hidden" name="h_point" id="h_point<%=num %>" value="${hudto.h_point }" />
					<input type="hidden" name="h_using" id="h_using<%=num %>" value="Y" />
				<% num+=1;%>
				</c:if>
			</c:forEach>
		</table>
	</div>
	<div style="background-color: white; padding-bottom: 5%;">
		<div id="handlerUseArea2">Handler</div>
		<label id="handlerUseLabel2" style="padding-left: 5%;">더 많은 핸들러 미션을 통하여 포인트를 <b class="blueFont">적립</b>해 보세요!<br>적립 된 포인트는 KHAKI 서비스 이용 시 각종 <b class="redFont">할인</b>혜택을 받을 수 있습니다.</label>
		<table id="handlerUseTable2" border="1px solid #d9d9d9" style="width: 100%; text-align: center; margin-top: 5%;">
				<tr style="height: 50px; font-size: 20px; font-weight: bold; background-color: #c0f0dc;">
					<td style="width: 10%;">차량번호</td>
					<td style="width: 10%;">차종</td>
					<td style="width: 25%;">출발장소</td>
					<td style="width: 25%;">도착장소</td>
					<td style="width: 10%;">도착완료시간</td>
					<td style="width: 10%;">적립포인트</td>
					<td style="width: 10%;">완료여부</td>
				</tr>
				
				<c:forEach var="hudto" varStatus="status" items="${hulist}">
					<c:if test="${hudto.h_using eq 'Y'}">
					<tr style="height: 50px;" id="handlerUseTr" class="hubB">
						<td id="handlerUseCheck2">${hudto.h_carNum }</td>
						<td>${hudto.h_carModel }</td>
						<td>${hudto.h_startLocation }</td>
						<td>${hudto.h_returnLocation }</td>
						<td>${hudto.h_complete }</td>
						<td>${hudto.h_point }
						</td>
						<td><button type="button" class="btn btn-outline-success" style="width: 100%; margin: 0;" disabled>처리완료</button><input type="hidden" value="${hudto.h_using }"></td>
					</tr>
					</c:if>
				</c:forEach>
		</table>
		
	</div>
</div>

<div>
	
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