<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link href="resources/assets/img/brand/favicon.png" rel="icon"
	type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="resources/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />
<link
	href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0"
	rel="stylesheet" />
<!-- jquery -->
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<style type="text/css">
ul 
{
	list-style: none;
}

li 
{
	float: left;
	width: 150px;
}

hr 
{
	margin-top: 10px;
	margin-bottom: 20px;
}

.badge 
{
	font-size: 15px;
}

.divQuestion 
{
	font-weight: bold;
}

.divTable 
{
	margin-top: 20px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$('#textarea').keyup(function(event) {
			if ($('#textarea').val().length > 50) { // 50byte 넘겼을때 실행
				$('#opinionPop').popover('show')
				setTimeout(function() {
					$('#opinionPop').popover('hide')
				}, 1800); // 1.8초뒤 popover닫기
				$(this).val($('#textarea').val().substring(0, 50)); // 50byte까지 자르기
			}
		})

		$('#surveyOkBtn').click(function() { //radio 버튼 체크 됐는지 확인 후 submit
			if ($('input:radio[name="q1"]').is(':checked') == false) {
				$('#q1_1').focus()
				$('#q1Pop').popover('show')
				setTimeout(function() {
					$('#q1Pop').popover('hide')
				}, 1800); // 1.8초뒤 popover닫기
				return false
			}
			if ($('input:radio[name="q2"]').is(':checked') == false) {
				$('#q2_1').focus()
				$('#q2Pop').popover('show')
				setTimeout(function() {
					$('#q2Pop').popover('hide')
				}, 1800); // 1.8초뒤 popover닫기
				return false
			}
			if ($('input:radio[name="q3"]').is(':checked') == false) {
				$('#q3_1').focus()
				$('#q3Pop').popover('show')
				setTimeout(function() {
					$('#q3Pop').popover('hide')
				}, 1800); // 1.8초뒤 popover닫기
				return false
			}
			if ($('input:radio[name="q4"]').is(':checked') == false) {
				$('#q4_1').focus()
				$('#q4Pop').popover('show')
				setTimeout(function() {
					$('#q4Pop').popover('hide')
				}, 1800); // 1.8초뒤 popover닫기
				return false
			}
			if ($('input:radio[name="q5"]').is(':checked') == false) {
				$('#q5_1').focus()
				$('#q5Pop').popover('show')
				setTimeout(function() {
					$('#q5Pop').popover('hide')
				}, 1800); // 1.5초뒤 popover닫기
				return false
			}
			
			$('#surveyF').submit()
		})
	})
</script>
</head>
<body>
<br>
<form name="surveyF" id="surveyF" method="post" action="surveyFin.do">
	<div align="center">
		<div style="width: 600px;" align="left">
			<div class="divQuestion">
				<span class="badge badge-warning"> Q1 </span> <span id="q1Pop"
					data-toggle="popover" data-color="danger" data-placement="right"
					data-content="체크!"> 어떤 목적으로 카셰어링 서비스를 이용하셨나요? </span>
			</div>
			<div class="divTable">
				<table>
					<tr>
						<td style="width: 200px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q1" class="custom-control-input" id="q1_1"
									type="radio" value="5"> <label
									class="custom-control-label" for="q1_1">혼자 드라이브</label>
							</div>
						</td>
						<td style="width: 200px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q1" class="custom-control-input" id="q1_2"
									type="radio" value="4"> <label
									class="custom-control-label" for="q1_2">친구와 드라이브</label>
							</div>
						</td>
						<td style="width: 200px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q1" class="custom-control-input" id="q1_3"
									type="radio" value="3"> <label
									class="custom-control-label" for="q1_3">가족과 드라이브</label>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q1" class="custom-control-input" id="q1_4"
									type="radio" value="2"> <label
									class="custom-control-label" for="q1_4">출퇴근</label>
							</div>
						</td>
						<td style="width: 200px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q1" class="custom-control-input" id="q1_5"
									type="radio" value="1"> <label
									class="custom-control-label" for="q1_5">짐 나르기</label>
							</div>
						</td>
						<td style="width: 200px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q1" class="custom-control-input" id="q1_6"
									type="radio" value="0"> <label
									class="custom-control-label" for="q1_6">기타</label>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<hr>

			<div class="divQuestion">
				<span class="badge badge-warning">Q2</span> <span id="q2Pop"
					data-toggle="popover" data-color="danger" data-placement="right"
					data-content="체크!"> 차량의 관리 상태에 만족하십니까? (청결도, 부품상태) </span>
			</div>
			<div class="divTable">
				<table>
					<tr>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q2" class="custom-control-input" id="q2_1"
									type="radio" value="5"> <label
									class="custom-control-label" for="q2_1">매우 그렇다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q2" class="custom-control-input" id="q2_2"
									type="radio" value="4"> <label
									class="custom-control-label" for="q2_2">조금 그렇다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q2" class="custom-control-input" id="q2_3"
									type="radio" value="3"> <label
									class="custom-control-label" for="q2_3">보통이다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q2" class="custom-control-input" id="q2_4"
									type="radio" value="2"> <label
									class="custom-control-label" for="q2_4">조금 아니다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q2" class="custom-control-input" id="q2_5"
									type="radio" value="1"> <label
									class="custom-control-label" for="q2_5">매우 아니다</label>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<hr>

			<div class="divQuestion">
				<span class="badge badge-warning">Q3</span> <span id="q3Pop"
					data-toggle="popover" data-color="danger" data-placement="right"
					data-content="체크!"> KHAKI존 접근성에 만족하십니까? </span>
			</div>
			<div class="divTable">
				<table>
					<tr>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q3" class="custom-control-input" id="q3_1"
									type="radio" value="5"> <label
									class="custom-control-label" for="q3_1">매우 그렇다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q3" class="custom-control-input" id="q3_2"
									type="radio" value="4"> <label
									class="custom-control-label" for="q3_2">조금 그렇다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q3" class="custom-control-input" id="q3_3"
									type="radio" value="3"> <label
									class="custom-control-label" for="q3_3">보통이다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q3" class="custom-control-input" id="q3_4"
									type="radio" value="2"> <label
									class="custom-control-label" for="q3_4">조금 아니다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q3" class="custom-control-input" id="q3_5"
									type="radio" value="1"> <label
									class="custom-control-label" for="q3_5">매우 아니다</label>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<hr>

			<div class="divQuestion">
				<span class="badge badge-warning">Q4</span> <span id="q4Pop"
					data-toggle="popover" data-color="danger" data-placement="right"
					data-content="체크!"> 서비스 이용 요금에 만족하십니까? (예약비용, 주행거리, 보험료) </span>
			</div>
			<div class="divTable">
				<table>
					<tr>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q4" class="custom-control-input" id="q4_1"
									type="radio" value="5"> <label
									class="custom-control-label" for="q4_1">매우 그렇다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q4" class="custom-control-input" id="q4_2"
									type="radio" value="4"> <label
									class="custom-control-label" for="q4_2">조금 그렇다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q4" class="custom-control-input" id="q4_3"
									type="radio" value="3"> <label
									class="custom-control-label" for="q4_3">보통이다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q4" class="custom-control-input" id="q4_4"
									type="radio" value="2"> <label
									class="custom-control-label" for="q4_4">조금 아니다</label>
							</div>
						</td>
						<td style="width: 120px;">
							<div class="custom-control custom-radio mb-3">
								<input name="q4" class="custom-control-input" id="q4_5"
									type="radio" value="1"> <label
									class="custom-control-label" for="q4_5">매우 아니다</label>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<hr>

			<div class="divQuestion">
				<span class="badge badge-warning">Q5</span> <span id="q5Pop"
					data-toggle="popover" data-color="danger" data-placement="right"
					data-content="체크!"> KHAKI 카셰어링 서비스를 다른 사람에게 추천해주고 싶은가요? </span>
			</div>
			<div class="divTable" align="center">
				<table>
					<tr>
						<td style="width: 150px; text-align: center;">
							<div class="custom-control custom-radio mb-3">
								<input name="q5" class="custom-control-input" id="q5_1"
									type="radio" value="1"> <label
									class="custom-control-label" for="q5_1">그렇다</label>
							</div>
						</td>
						<td style="width: 150px; text-align: center;">
							<div class="custom-control custom-radio mb-3">
								<input name="q5" class="custom-control-input" id="q5_2"
									type="radio" value="0"> <label
									class="custom-control-label" for="q5_2">아니다</label>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<hr>

			<div class="divQuestion">
				<span class="badge badge-info">기타 의견</span> 
				<span id="opinionPop"
					data-toggle="popover" data-color="danger" data-placement="right"
					data-content="글자수 초과!">
				KHAKI에게 하고싶은 말을 남겨주세요. (50자 이내)
				</span>
			</div>
			<textarea class="form-control" name="opinion" id="textarea" rows="3"
				placeholder="소중한 의견 부탁드립니다."></textarea>
		</div>
		<div style="margin-top: 30px;">
			<button type="button" class="btn btn-success"
				style="font-size: 25px;" id="surveyOkBtn">설문완료</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-outline-danger"
				style="font-size: 25px;" id="surveyNoBtn">종료하기</button>
		</div>
	</div>
</form>
	<script
		src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Argon JS   -->
	<script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>
</html>