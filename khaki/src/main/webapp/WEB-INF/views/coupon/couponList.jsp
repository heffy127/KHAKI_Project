<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	$(function(){
  		$(".deleteCp").click(function(){
  			var cId = $(this).children("input").val();
  			var retVal = confirm("쿠폰을 삭제하시겠습니까?");
  			if(retVal == true){
	  			alert("쿠폰이 삭제되었습니다.");
	  			location.href = "deleteCp.do";
  			}
  		});
	})
  	</script>
</head>
<body>
	<div id="tabs-icons-text-6" role="tabpanel" aria-labelledby="tabs-icons-text-6-tab" >
      <div style="width: 100%; float: left; border-right: 8px solid #f5f5f5; padding: 1%;">
        <div id="cpPage" style="width:100%; text-align:center; margin-bottom: 10px; position: relative;">
			
			<div id="cp1" style="width: 100%; overflow: auto;">
				<h1>이용 금액별</h1>
				<c:forEach var="list" items="${list}">
					<c:if test="${list.cpCondition eq '1'}">
						<div id="cpFrame" style="width: 28%; height: 650px; float: left; margin: 0 2% 1% 2%; background-image: url('resources/assets/img/icons/coupon/coupon2.png'); background-size: 100% 600px;">
							<label id="realCp1" style="word-wrap:break-word; margin-top:-6%; padding: 80% 5% 0 5%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle1 }</label>
							<label id="realCp2" style="word-wrap:break-word; margin-top:-3%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle2 }</label>
							<label id="realDiscount" style="word-wrap:break-word; margin-top:-5.5%; width: 100%; color: #ffcd4a; font-size: 40px; font-weight: bold; text-align: center;">
								${list.discount}
								<c:choose>
									<c:when test="${list.cOption eq 'M'}">원</c:when>
									<c:when test="${list.cOption eq 'P'}">%</c:when>
								</c:choose>
							</label>
							
							<label id="endTimeText" style="word-wrap:break-word; margin-top:-5%; width:100%; color: white; font-size: 25px; font-weight: bold; text-align: center;">
								${list.endDate} 까지 ${list.cpCondition}
							</label>
							<div id="deleteCp" class="deleteCp" style="word-wrap:break-word; margin-left:28%; width: 150px; color: red; font-size: 30px; font-weight: bold; text-align: center; border: 1px solid red; cursor: pointer;">
								<input type="hidden" value="${list.cId}" >
								<div style="border: 1px solid red;">삭제</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<hr color="#E1E1E1">
			<div id="cp2" style="width: 100%; overflow: auto;">
				<h1>이용 시간별</h1>
				<c:forEach var="list" items="${list}">
					<c:if test="${list.cpCondition eq '2'}">
						<div id="cpFrame" style="width: 28%; height: 650px; float: left; margin: 0 2% 1% 2%; background-image: url('resources/assets/img/icons/coupon/coupon2.png'); background-size: 100% 600px;">
							<label id="realCp1" style="word-wrap:break-word; margin-top:-6%; padding: 80% 5% 0 5%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle1 }</label>
							<label id="realCp2" style="word-wrap:break-word; margin-top:-3%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle2 }</label>
							<label id="realDiscount" style="word-wrap:break-word; margin-top:-5.5%; width: 100%; color: #ffcd4a; font-size: 40px; font-weight: bold; text-align: center;">
								${list.discount}
								<c:choose>
									<c:when test="${list.cOption eq 'M'}">원</c:when>
									<c:when test="${list.cOption eq 'P'}">%</c:when>
								</c:choose>
							</label>
							
							<label id="endTimeText" style="word-wrap:break-word; margin-top:-5%; width:100%; color: white; font-size: 25px; font-weight: bold; text-align: center;">
								${list.endDate} 까지 ${list.cpCondition}
							</label>
							<div id="deleteCp" class="deleteCp" style="word-wrap:break-word; margin-left:28%; width: 150px; color: red; font-size: 30px; font-weight: bold; text-align: center; border: 1px solid red; cursor: pointer;">
								<input type="hidden" value="${list.cId}" >
								<div style="border: 1px solid red;">삭제</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<hr color="#E1E1E1">
			<div id="cp3" style="width: 100%; overflow: auto;">
				<h1>이용 시간대별</h1>
				<c:forEach var="list" items="${list}">
					<c:if test="${list.cpCondition eq '3'}">
						<div id="cpFrame" style="width: 28%; height: 650px; float: left; margin: 0 2% 1% 2%; background-image: url('resources/assets/img/icons/coupon/coupon2.png'); background-size: 100% 600px;">
						<label id="realCp1" style="word-wrap:break-word; margin-top:-6%; padding: 80% 5% 0 5%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle1 }</label>
						<label id="realCp2" style="word-wrap:break-word; margin-top:-3%; width: 100%; color: white; font-size: 20px; font-weight: bold; text-align: center;">${list.cTitle2 }</label>
						<label id="realDiscount" style="word-wrap:break-word; margin-top:-5.5%; width: 100%; color: #ffcd4a; font-size: 40px; font-weight: bold; text-align: center;">
							${list.discount}
							<c:choose>
								<c:when test="${list.cOption eq 'M'}">원</c:when>
								<c:when test="${list.cOption eq 'P'}">%</c:when>
							</c:choose>
						</label>
						
						<label id="endTimeText" style="word-wrap:break-word; margin-top:-5%; width:100%; color: white; font-size: 25px; font-weight: bold; text-align: center;">
							${list.endDate} 까지 ${list.cpCondition}
						</label>
						<div id="deleteCp" class="deleteCp" style="word-wrap:break-word; margin-left:28%; width: 150px; color: red; font-size: 30px; font-weight: bold; text-align: center; border: 1px solid red; cursor: pointer;">
							<input type="hidden" value="${list.cId}" >
							<div style="border: 1px solid red;">삭제</div>
						   </div>
						</div>
					</c:if>
				</c:forEach>
			</div>
         </div>
      </div>
      
   </div>
</body>
</html>