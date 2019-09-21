<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<!-- jquery -->
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<style type="text/css">
.topDiv
{
	float: left; 
	width: 33%; 
	font-weight: bold;
}

.otherDiv
{
	float: left; 
	width: 50%;
}
</style>
<script type="text/javascript">
	$(document).ready(
		function() {
			
			/* tab1Btn 클릭 함수 */
			tab1Click = function() { 
				$('#tab1Btn').click()
			}
			
			/* tab1Btn 클릭 후 3.5초뒤 tab2Btn 클릭 */
			$('#tab1Btn').click(function() {
				setTimeout(function(){
					$('#tab2Btn').click()		
				}, 3500);
			})
			$('#tab2Btn').click(function() {
				setTimeout(function(){
					$('#tab3Btn').click()		
				}, 3500);
			})
			$('#tab3Btn').click(function() {
				setTimeout(function(){
					$('#tab1Btn').click()		
				}, 3500);
			})
			//
			
			tab1Click()
	})
</script>
</head>
<body>
<div>
<div class="nav-wrapper" style="display: none;">
    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
        <li class="nav-item">
            <a class="nav-link mb-sm-3 mb-md-0 active" id="tab1Btn" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"><i class="ni ni-cloud-upload-96 mr-2"></i>Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link mb-sm-3 mb-md-0" id="tab2Btn" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="ni ni-bell-55 mr-2"></i>Profile</a>
        </li>
        <li class="nav-item">
            <a class="nav-link mb-sm-3 mb-md-0" id="tab3Btn" data-toggle="tab" href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false"><i class="ni ni-calendar-grid-58 mr-2"></i>Messages</a>
        </li>
    </ul>
</div>
<div class="card shadow">
    <div class="card-body">
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
                
                <div>
                   <div class="topDiv" align="left" >
                  ${list[0].zone_name }                   
                   </div>
                   <div class="topDiv" align="center">
                      ${list[0].car_name }        
                   </div>
                   <div class="topDiv" align="right">
                      ${fn:split(list[0].reg_date,' ')[0]}
                   </div>
                </div>
                <div align="center">
                   <img src=${list[0].car_image} width="382px" height="282px"/> 
                </div>
                <div>
                   <div class="otherDiv" align="center">
                      <span class="badge badge-primary"><font size="4">주행거리</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[0].driven }km</b></font>
                   </div>
                   <div class="otherDiv" align="center">
                      <span class="badge badge-primary"><font size="4">연료</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[0].fuel_type }</b></font> 
                   </div>
                </div>
                <div style="margin-top: 40px;">
                   <div class="otherDiv" align="center">
                      <span class="badge badge-warning"><font size="4">시간당 요금(1h)</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[0].fee_hour }원</b></font>
                   </div>
                   <div class="otherDiv" align="center">
                      <span class="badge badge-warning"><font size="4">거리당 요금(1km)</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[0].fee_km }원</b></font> 
                   </div>
                </div>
                
            </div>
            <div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
				
                <div>
                   <div class="topDiv" align="left" >
                  ${list[1].zone_name }                   
                   </div>
                   <div class="topDiv" align="center">
                      ${list[1].car_name }        
                   </div>
                   <div class="topDiv" align="right">
                      ${fn:split(list[1].reg_date,' ')[0]}
                   </div>
                </div>
                <div align="center">
                   <img src=${list[1].car_image} width="382px" height="282px"/> 
                </div>
                <div>
                   <div class="otherDiv" align="center">
                      <span class="badge badge-primary"><font size="4">주행거리</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[1].driven }km</b></font>
                   </div>
                   <div class="otherDiv" align="center">
                      <span class="badge badge-primary"><font size="4">연료</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[1].fuel_type }</b></font> 
                   </div>
                </div>
                <div style="margin-top: 40px;">
                   <div class="otherDiv" align="center">
                      <span class="badge badge-warning"><font size="4">시간당 요금(1h)</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[1].fee_hour }원</b></font>
                   </div>
                   <div class="otherDiv" align="center">
                      <span class="badge badge-warning"><font size="4">거리당 요금(1km)</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[1].fee_km }원</b></font> 
                   </div>
                </div>
                
            </div>
            <div class="tab-pane fade" id="tabs-icons-text-3" role="tabpanel" aria-labelledby="tabs-icons-text-3-tab">
				
                <div>
                   <div class="topDiv" align="left" >
                  ${list[2].zone_name }                   
                   </div>
                   <div class="topDiv" align="center">
                      ${list[2].car_name }        
                   </div>
                   <div class="topDiv" align="right">
                      ${fn:split(list[2].reg_date,' ')[0]}
                   </div>
                </div>
                <div align="center">
                   <img src=${list[2].car_image} width="382px" height="282px"/> 
                </div>
                <div>
                   <div class="otherDiv" align="center">
                      <span class="badge badge-primary"><font size="4">주행거리</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[2].driven }km</b></font>
                   </div>
                   <div class="otherDiv" align="center">
                      <span class="badge badge-primary"><font size="4">연료</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[2].fuel_type }</b></font> 
                   </div>
                </div>
                <div style="margin-top: 40px;">
                   <div class="otherDiv" align="center">
                      <span class="badge badge-warning"><font size="4">시간당 요금(1h)</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[2].fee_hour }원</b></font>
                   </div>
                   <div class="otherDiv" align="center">
                      <span class="badge badge-warning"><font size="4">거리당 요금(1km)</font></span>&nbsp;&nbsp;&nbsp;<font size="4"><b>${list[2].fee_km }원</b></font> 
                   </div>
                </div>
                
            </div>
        </div>
    </div>
</div>
</div>

<script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<script src="resources/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
<script src="resources/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
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