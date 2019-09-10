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
  	$(function(){
  		$("#submit").hide();
  		$("#paper").hide();
  		$("#surveybtn").on("click",function(){
	  		$("#submit").show();
  			var btn = false;
  			btn = true;
  			if(btn == true){
  				$("#surveybtn").html("키 가져오기");
  				$("#windowImg").attr({"src":"resources/assets/img/icons/survey/jyp.jpg"});
  			}
	  		$("#submit").click(function(){
  				$("#surveybtn").html("키 가져오기").button("submit");
  				alert("설문완료 되었습니다.");
	  		});
  			
  		});
  	});
  </script>
</head>

<body class="">
	<div class="card shadow border-0" id="carkeyArea">
		<!-- carkey -->
		<div id="tabs-icons-text-6" role="tabpanel" aria-labelledby="tabs-icons-text-6-tab">
			<div id="survey" style="width: 50%; float: left; border-right: 8px solid #f5f5f5; padding: 1%;">
				<div id="survey-head" style="text-align: center;">
					<img width="800px" style="opacity: 0.7"
						src="https://www.midashri.com/hs-fs/hubfs/000%20Blog%20posting/Hrev%20blog%20img(posting)/shutterstock_752463637.jpg?width=1000&name=shutterstock_752463637.jpg">
					<h2 style="margin-top: 10px;">차량 운행 전 차량 상태에 대한 설문을 진행해주세요.</h2>
				</div>                     	
			<div id="survey-body">
				<button id="surveybtn" type="button" style="height: 120px; font-size: 30px; margin-top: 15px;" class="btn btn-secondary btn-lg btn-block">
					설문 하기</button>
			</div>
			</div>
			<!-- 실행창 -->
			<div id="window" style="width: 50%; float: left; padding: 1%; text-align: center;">
			<!-- 설문지 넣을 곳 -->
				<form>
					<img id="windowImg" style="width: 800px; height: 610px; opacity: 0.75" src="resources/assets/img/icons/survey/car.jpg">
					<!-- <img id="paper" style="width: 800px; height: 610px; opacity: 0.75" src="resources/assets/img/icons/survey/survey.png"> -->
					<button id="submit" type="submit" style="height: 120px; font-size: 30px; margin-top: 10px;" 
						class="btn btn-secondary btn-lg btn-block">
							설문 제출하기</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>