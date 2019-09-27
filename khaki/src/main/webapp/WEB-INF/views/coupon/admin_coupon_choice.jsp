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
   		
   	})
   </script>
</head>
<body>
   <div id="tabs-icons-text-6" role="tabpanel" aria-labelledby="tabs-icons-text-6-tab" >
   <jsp:useBean id="now" class="java.util.Date"/>
      <div style="width: 100%; text-align: center; border-right: 8px solid #f5f5f5; padding: 1%;">
      	<label style="font-size: 70px;">쿠폰 조건 선택</label><br><br><br><br><br><br>
      	<button type="button" class="btn btn-outline-default" style="width: 15%; font-size: 30px; margin: 0 5% 0 5%;" onclick="location.href='admin_coupon1.do'">~이상 결제시</button>
      	<button type="button" class="btn btn-outline-default" style="width: 15%; font-size: 30px; margin: 0 5% 0 5%;" onclick="location.href='admin_coupon2.do'">~시간 이용시</button>
      	<button type="button" class="btn btn-outline-default" style="width: 15%; font-size: 30px; margin: 0 5% 0 5%;" onclick="location.href='admin_coupon3.do'">~시에 예약시</button>
      </div>
      
   </div>
</body>
</html>