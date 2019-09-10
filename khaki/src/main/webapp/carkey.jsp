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
</head>
<body>
	<h1>My KHAKI <img width="40px;" src="https://image.flaticon.com/icons/svg/1965/1965902.svg"></h1>
	<!-- carkey -->
	<div id="tabs-icons-text-6" role="tabpanel" aria-labelledby="tabs-icons-text-6-tab">
		<div style="width: 50%; float: left; border-right: 8px solid #f5f5f5; padding: 1%;">
			<div id="key-top" style="text-align: center;">
				<button id="openCar" style="width: 45%; height: 120px; margin-right: 25px; font-size: 30px;" type="button" class="btn btn-secondary btn-lg">
					<img width="40px;" src="https://image.flaticon.com/icons/svg/1967/1967887.svg"></button>
				<button id="closeCar" style="width: 45%; height: 120px;  font-size: 30px;" type="button" class="btn btn-secondary btn-lg">
					<img width="50px;" src="https://image.flaticon.com/icons/svg/1972/1972850.svg"></button>
			</div>                     	
			<div id="key-mid" style="text-align: center; margin-top: 5%; margin-bottom: 5%;">
				<button id="findCar" style="width: 30%; height: 150px; margin-right: 20px; font-size: 25px;" type="button" class="btn btn-secondary btn-lg">
					차량 찾기<br><img width="35px;" src="https://image.flaticon.com/icons/svg/709/709011.svg"></button>
				<button id="startCar" style="width: 30%; height: 150px; margin-right: 20px; font-size: 25px; background-image: url(https://image.flaticon.com/icons/svg/944/944563.svg)" type="button" class="btn btn-secondary btn-lg">
					시동 걸기<br></button>
				<button id="reportCar" style="width: 30%; height: 150px; font-size: 25px; color: red;" type="button" class="btn btn-secondary btn-lg">
						신고 하기<br><img width="35px;" src="https://image.flaticon.com/icons/svg/2039/2039772.svg"></button>
			</div>
			<div id="key-bottom">
				<button id="returnCar" type="button" style="height: 120px; font-size: 30px;" class="btn btn-secondary btn-lg btn-block">
							차량 반납하기</button>
			</div>
	</div>
	<!-- 실행창  -->
	<div id="window" style="width: 50%; float: left; padding: 1%;">
		<img width="50%;" src="">
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