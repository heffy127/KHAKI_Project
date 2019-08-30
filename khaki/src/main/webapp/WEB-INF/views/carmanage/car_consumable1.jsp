<%@page import="co.kr.khaki.carmanage.CarConsumableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- Jquery CDN -->
 	<script src="https://code.jquery.com/jquery-latest.js"></script>
 	
 	<% 
 		String distance = (String)request.getAttribute("distance"); 
 		CarConsumableDTO ccdto = (CarConsumableDTO)request.getAttribute("ccdto");
 	%>
	<script type="text/javascript">
		$(function(){
			
			var distance = <%=distance%>;
			//var distance1 = parseInt(distance);
			
			 
			//배열 순서대로 타이밍벨트, 구동벨트, 엔진오일, 변속기오일, 브레이크 오일, 에어컨필터, 연료필터, 에어클리너, 냉각수, 배터리, 타이어 순서
			var arr = new Array(100000, 30000, 10000, 30000, 40000, 15000, 30000, 20000, 50000, 60000, 30000);
			// DB에서 교체횟수를 꺼내오는 작업
			var consumableDB = new Array(
				<%= ccdto.getBelt_timing_num()%>, <%= ccdto.getBelt_operation_num()%>, 
				<%= ccdto.getOil_engine_num()%>,<%= ccdto.getOil_transmission_num()%>,<%= ccdto.getOil_break_num()%>,
				<%= ccdto.getFilter_aircon_num()%>,<%= ccdto.getFilter_fuel_num()%>,<%= ccdto.getFilter_aircleaner_num()%>,
				<%= ccdto.getEtc_coolant_num()%>,<%= ccdto.getEtc_battery_num()%>,<%= ccdto.getEtc_tire_num()%>
				);
			var num = 0;
			var percentage = 0;
			var expire_item = 0;
			
			// remainder 변수를 통해서 각 소모품주기 기준수로 나눠줌
			for(var i=0; i<arr.length;i++){
				var remainder = distance % arr[i];	//나머지 값이 들어 있음
				
				// 나눗셈 몫 = 교체해야할 시기
				// 각 소모품 별 교체횟수, 교체 시기 DB작성(교체횟수와 비교하여 교체횟수와 현재 교체되었어야할 횟수가 동일하면 %표기, 그 외에는 교체요망 표기)
				var change_num = Math.floor(distance / arr[i]);
				
				// consumableDB의 값은 DB에 저장된 값, change_num은 총 운행km로 계산하여 현재 교체 시기를 계산한 값
				// consumableDB >= change_num : 교체 하지 않아도 됨
				// consumableDB < change_num : 교체가 필요함(예 : oil_engine기준 DB에 저장된 수 3, change_num 4이면 교체를 했어야했는데 아직 안한 것으로 생각하면 됨)
				if(consumableDB[i] >= change_num){	// 교체 안해도 되는 경우
					expire_item = change_num;
					// % 표기를 위한 계산식(총 운행 / 기준)
					if(remainder == 0){
						remainder = 0;
					}else if(remainder < 1){
						remainder = distance;
					}
					else{};
					
				}else{	// 교체 해야하는 경우
					expire_item = cconsumableDB[i];	//expire_item은 만료된 시기로
					// % 표기를 위한 계산식(총 운행 / 기준)
					remainder = arr[i];	//100%를 만들어 주기 위해서
				}
				
				// Math.round() 함수는 반올림
				percentage = Math.round(remainder / arr[i] * 100);
				// alert((i+1)+"번째 : 총운행 "+distance+" / 나머지 " +remainder+" / 기준 "+ arr[i] + " / 퍼센트 "+percentage);
				// 100% 됐을 때와 넘었을 때 분기 처리
				
				num = percentage;
				// 배열 index는 0부터
				// 하위 CSS변경 작업
				$(".pctest1_"+(i+1)).children("span").text("교체 횟수 : "+expire_item + " / " + change_num+" | "+num+'%');
				
				if(num<=50 && num >= 0){
					$(".pctest2_"+(i+1)).attr({
						'class': 'progress-bar bg-success',
						'aria-valuenow': num,
						'style':'width:'+num+'%;',
					});
				}else if(num <=75){
					$(".pctest2_"+(i+1)).attr({
						'class': 'progress-bar bg-warning',
						'aria-valuenow': num,
						'style':'width:'+num+'%;',
					});
				}else if(num <= 100){
					$(".pctest2_"+(i+1)).attr({
						'class': 'progress-bar bg-danger',
						'aria-valuenow': num,
						'style':'width:'+num+'%;',
					});
				}else{
					//alert((i+1)+"번째 : not range!!" + arr[i]);
				}
				
			};	//for문 End
			
			// progress-bar bg-success 초록색
			// progress-bar bg-warning 주황색
			// progress-bar bg-danger 빨간색
			
		});	//Jquery End
	</script>
	<!-- aaaa -->

	<!-- Favicon -->
  	<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  	<!-- Fonts -->
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- Icons -->
  	<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
 	<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
	<!-- CSS Files -->
 	<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />

</head>
<body>
	<div class="main-content">
		<div class="container-fluid">
			<div id="test">총 운행km : <%=distance %></div>
			<div>
			벨트류<br>
			타이밍벨트 : 80000~1000000km
			구동벨트 : 10000~30000km
			
			<br>오일류<br>
			엔진오일 : 5000~10000km
			변속기오일 : 30000km
			브레이크 오일 : 40000km
			
			<br>필터류<br>
			에어컨필터 : 15000km
			연료 필터 : 30000km
			에어클리너 : 20000km
			
			<br>기타<br>
			냉각수 : 1~2년
			배터리 : 30000~60000km
			타이어 : 30000km
			</div>
			
			벨트류
			<div class="row">
				<div class="col col-sm-6">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>타이밍 벨트</span>
					    </div>
					    <div class="progress-percentage pctest1 pctest1_1">
					      <span>30%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-success pctest2_1" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%;"></div>
					  </div>
					</div>
				</div>	<!-- col-sm-6 50%  -->
				
				<div class="col col-sm-6">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>구동벨트</span>
					    </div>
					    <div class="progress-percentage pctest1_2">
					      <span>40%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-danger pctest2_2" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
					  </div>
					</div>
				</div>
			</div>	<!-- row -->
			<br>
			오일류
			<div class="row">
				<div class="col col-sm-4">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>엔진 오일</span>
					    </div>
					    <div class="progress-percentage pctest1_3">
					      <span>60%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-success pctest2_3" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
					  </div>
					</div>
				</div>	<!-- col-sm-4 33%  -->
				
				<div class="col col-sm-4">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>변속기 오일</span>
					    </div>
					    <div class="progress-percentage pctest1_4">
					      <span>90%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-danger pctest2_4" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%;"></div>
					  </div>
					</div>
				</div>
				
				<div class="col col-sm-4">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>브레이크 오일</span>
					    </div>
					    <div class="progress-percentage pctest1_5">
					      <span>60%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-danger pctest2_5" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
					  </div>
					</div>
				</div>
			</div>	<!-- row -->
			<br>
			필터류
			<div class="row">
				<div class="col col-sm-4">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>에어컨 필터</span>
					    </div>
					    <div class="progress-percentage pctest1_6">
					      <span>60%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-success pctest2_6" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
					  </div>
					</div>
				</div>	<!-- col-sm-4  -->
				
				<div class="col col-sm-4">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>연료 필터</span>
					    </div>
					    <div class="progress-percentage pctest1_7">
					      <span>60%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-danger pctest2_7" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
					  </div>
					</div>
				</div>
				
				<div class="col col-sm-4">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>에어클리너</span>
					    </div>
					    <div class="progress-percentage pctest1_8">
					      <span>60%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-danger pctest2_8" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
					  </div>
					</div>
				</div>
			</div>	<!-- row -->
			<br>
			기타
			<div class="row">
				<div class="col col-sm-4">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>냉각수</span>
					    </div>
					    <div class="progress-percentage pctest1_9">
					      <span>60%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-warning pctest2_9" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
					  </div>
					</div>
				</div>	<!-- col-sm-6  -->
				
				<div class="col col-sm-4">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>배터리</span>
					    </div>
					    <div class="progress-percentage pctest1_10">
					      <span>60%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-danger pctest2_10" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
					  </div>
					</div>
				</div>
				
				<div class="col col-sm-4">
					<div class="progress-wrapper">
					  <div class="progress-info">
					    <div class="progress-label">
					      <span>타이어</span>
					    </div>
					    <div class="progress-percentage pctest1_11">
					      <span>60%</span>
					    </div>
					  </div>
					  <div class="progress">
					    <div class="progress-bar bg-danger pctest2_11" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
					  </div>
					</div>
				</div>
			</div>	<!-- row -->
		</div>	<!-- container-fluid end -->
	</div>	<!-- main-content end -->
	
	
	
	<!--   Core   -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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