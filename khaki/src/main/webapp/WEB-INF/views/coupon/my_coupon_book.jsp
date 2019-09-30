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
   		$(".useLabel").mouseover(function(){
   			$(this).css("background-color", "#0000002b");
   		})
   		$(".useLabel").mouseleave(function(){
   			$(this).css("background-color", "");
   		})
   		$(".useLabel").click(function(){
   			window.parent.location.href = "map.do";
   		})
   		
   	})
   </script>
</head>
<body style="background-color: white;">
   <div id="tabs-icons-text-6" role="tabpanel" aria-labelledby="tabs-icons-text-6-tab" >
   <jsp:useBean id="now" class="java.util.Date"/>
      <div style="width: 100%; text-align: center; border-right: 8px solid #f5f5f5; padding: 1%;">
      	<c:forEach var="cpuDTO" items="${cpuDTO}">
      		<div style="width: 25%; height: 600px; float: left; margin: 0 4% 0 4%; background-image: url('resources/assets/img/icons/coupon/coupon2.png'); background-size: 100% 600px;">
      			<label style="width: 83%; padding: 94% 5% 0 5%; color: white; font-weight: bold; font-size: 17px;">${cpuDTO.cp_title }</label><br>
      			<label style="width: 73%; position:relative; top: -3%; color: #ffcd4a; font-size: 50px; font-weight: bold;">${cpuDTO.cp_num }</label><br>
      			<label style="width: 73%; position:relative; top: -5%; color: white; font-size: 30px; font-weight: bold;">${cpuDTO.cp_end } 까지</label><br>
      			<label class="useLabel" style="width: 73%; position:relative; top: -5%; color: white; font-size: 27px; font-weight: bold; border: 1px solid white; cursor: pointer;">사용하러가기</label>
      		</div>
		</c:forEach>
      </div>
      
   </div>
</body>
</html>