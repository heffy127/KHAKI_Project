<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
<style>
.divExplain
{
	margin-top: 20px;
	font-size: 19px;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	$(document).ready(
		function() {
			
			$('#surveyOkBtn').click( // 설문하러가기
				function() {
					location.href = "survey2.do"
			})
	})
</script>
<body>
<br>
<div align="center">
	<div style="width: 600px;">
		<div style="background-color: #32a852">
			<h1 style="color: white;">KHAKI 차량 이용 만족도 조사</h1>
		</div>
		<br>
		<div>
			<img alt="설문 커버" src="resources/assets/img/theme/survey-cover.JPG" width="600px;">
		</div>	
		<div class="divExplain">
			대한민국 1등 카셰어링, KHAKI를 이용해주셔서 감사합니다.<br>
			본 설문은 KHAKI 카셰어링 서비스 이용자를 대상으로<br>
			서비스 만족도를 평가하고 다양한 의견을 수렴하여<br>
			서비스 개선방안을 모색하는데 그 목적을 두고 있습니다.
		</div>
		<div class="divExplain">
			각 항목은 <font color="red">카셰어링 차량 이용</font>과 관련된 내용으로 구성되어 있으며<br>
			선택형 5문항, 추가의견 작성 1문항으로 총 6문항입니다.<br>
			귀한 시간을 내어 설문에 참여해주신분께 감사의 의미로 <br>
			KHAKI에서 사용하실 수 있는 <font color="#32a852">50포인트</font>를 적립해 드리고 있습니다.<br>
			보다 더 나은 서비스를 제공해드리고자 진행되는 만큼<br>
			설문에 참여해주시는 고객님들의 솔직한 답변 부탁드립니다. 
		</div>
		<div style="margin-top: 25px;">
			<button type="button" class="btn btn-success"
				style="font-size: 30px;" id="surveyOkBtn">설문하러가기</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-outline-danger"
				style="font-size: 30px;" id="surveyNoBtn">다음에 할게요</button>
		</div>
	</div>
</div>
</body>
</html>