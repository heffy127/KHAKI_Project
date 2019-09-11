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
		
	})
  </script>
  
</head>

<body class="">
          <div class="card shadow border-0" id="checkReservationArea">
          	<!-- checkReservation -->
          	<div class="admin_reservation_title">
          		<table style="width: 100%;">
          			<tr style="height: 80px;">
          				<td class="admin_reservation_titleLabel">CHECK RESERVATION</td>
          				<td id="member_inpo_select">
	          				<select style="width: 100%;">
			          			<option>ID</option>	
			          			<option>NAME</option>	
			          			<option>PHONE</option>	
			          			<option>ORDER NUMBER</option>	
			          		</select>
	          			</td>
          				<td id="admin_reservation_search"><input type="text" style="width: 100%;"></td>
          				<td id="admin_reservation_search_btn"><button type="button" class="btn btn-outline-secondary" style="color: white;">SEARCH</button></td>
          			</tr>
          		</table>
          		
          		
          	</div>
          	<c:forEach var="pdto" varStatus="status" items="${pdto}">
          			<div class="admin_reservation_area">
          	  			<div class="admin_reservation_content">
          	  				${pdto.buy_id }
          				</div>
          			</div>
			</c:forEach>
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