<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<!--   Core   -->
<script
   src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<!--   Argon JS   -->
<script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
	
				var num13Type = /^(?=.*[0-9])[0-9+]{2}$/; // 숫자만 필터링 (무조건 2자리)
				var num2Type = /^(?=.*[0-9])[0-9+]{6}$/; // 숫자만 필터링 (무조건 6자리)
				
				$("#licenseType option[value='${licenseDTO.licenseType}']").attr("selected",true)				
				$("#area option[value='${licenseDTO.area}']").attr("selected",true)				
				$("#issueYear option[value='${licenseDTO.issueYear}']").attr("selected",true)				
				$("#issueMonth option[value='${licenseDTO.issueMonth}']").attr("selected",true)				
				$("#issueDay option[value='${licenseDTO.issueDay}']").attr("selected",true)				
				$("#expireYear option[value='${licenseDTO.expireYear}']").attr("selected",true)				
				$("#expireMonth option[value='${licenseDTO.expireMonth}']").attr("selected",true)				
				$("#expireDay option[value='${licenseDTO.expireDay}']").attr("selected",true)				
				
				// select 선택시 popover 닫기
				$('.select').change(
						function() {
							$('.warn').popover('hide')
						})
				
				$('#licenseBtn').click(
					function() {
						
						if($('#licenseType').val() == ''){
							$('#warn1').popover('show')
							return false
						}
						
						if($('#area').val() == ''){
							$('#warn2').popover('show')
							return false
						}
						
						
						if($('#num1').val() == ''){
							alert("면허 번호를 입력해주세요.")
							$('#num1').focus()
							return false
						}
						
						if(!(num13Type.test($('#num1').val()))){
							alert('입력하신 면허 번호를 다시 확인해주세요.')
							$('#num1').val('')
							$('#num1').focus()
							return false
						}
						
						if($('#num2').val() == ''){
							alert("면허 번호를 입력해주세요.")
							$('#num2').focus()
							return false
						}

						if(!(num2Type.test($('#num2').val()))){
							alert('입력하신 면허 번호를 다시 확인해주세요.')
							$('#num2').val('')
							$('#num2').focus()
							return false
						}
						
						if($('#num3').val() == ''){
							alert("면허 번호를 입력해주세요.")
							$('#num3').focus()
							return false
						}

						if(!(num13Type.test($('#num3').val()))){
							alert('입력하신 면허 번호를 다시 확인해주세요.')
							$('#num3').val('')
							$('#num3').focus()
							return false
						}
						
						if($('#issueYear').val() == ''){
							$('#warn3').popover('show')
							return false
						}
						
						if($('#issueMonth').val() == ''){
							$('#warn4').popover('show')
							return false
						}
						
						if($('#issueDay').val() == ''){
							$('#warn5').popover('show')
							return false
						}
						
						if($('#expireYear').val() == ''){
							$('#warn6').popover('show')
							return false
						}
						
						if($('#expireMonth').val() == ''){
							$('#warn7').popover('show')
							return false
						}
						
						if($('#expireDay').val() == ''){
							$('#warn8').popover('show')
							return false
						}
						
						var d = $('#f').serialize()
						$.ajax({
							url: "mypage_license_fin.do",
							data: d,
							type: 'POST',
							success: function(result){
								alert("운전면호 정보 등록이 완료되었습니다.\n관리자 심사이후 카셰어링 서비스를 이용하실 수 있습니다.")
								window.parent.closeModal_normal('changed')
							}
						})
					})

	})
</script>
<style type="text/css">
.div_container
{
	width: 550px;
	height: 48px;
	margin-bottom: 10px;
}

.div_name 
{ 	
	font-size: 19px;
	font-weight: bold;
	width: 170px; 
	height: 48px;
	line-height: 46px;
	float: left;
	text-align: left;
}

.div_content 
{
	width: 380px; 
	height: 48px;
	float: Right;
}
select
{
	font-size: 23px;
}
</style>
<body>
	<div align="center" style="padding: 15xp;">
		<form id="f" name="f" action="">
			<img alt="운전면허 가이드" src="resources/assets/img/icons/register/license_guide3.JPG" width="710px">
			<hr style="margin: 15px;">
			<div class="div_container">
				<div class="div_name">
					이름
				</div>
				<div class="div_content">
					<input class="form-control" type="text" 
					id="name" name="name" readonly="readonly" value="${memberDTO.name}" style="font-size: 18px;">
					<input type="hidden" value="${memberDTO.id}" name="id">
				</div>
			</div>
			<div class="div_container">
				<div class="div_name">
					면허 종류
				</div>
				
				<div class="warn" id="warn1" data-container="body" data-toggle="popover" data-color="warning" data-placement="top" data-content="면허 종류를 선택"></div>
				
				<div class="div_content" align="left">
					<select class="select" style="width: 200px;" name="licenseType" id="licenseType">
						<option value="">선택</option>
						<option value="1종보통">1종보통</option>
						<option value="1종오토">1종오토</option>
						<option value="1종대형">1종대형</option>
						<option value="2종보통">2종보통</option>
						<option value="2종오토">2종오토</option>
					</select>
				</div>
			</div>
			<div class="div_container">
				<div class="div_name">
					숫자코드
				</div>
				
				<div class="warn" id="warn2" data-container="body" data-toggle="popover" data-color="warning" data-placement="top" data-content="숫자 코드를 선택"></div>
				
				<div class="div_content" align="left">
					<select class="select" style="width: 200px;" name="area" id="area">
						<option value="">선택</option>
						<option value="11(서울)">11(서울)</option>
						<option value="12(부산)">12(부산)</option>
						<option value="13(경기)">13(경기)</option>
						<option value="14(강원)">14(강원)</option>
						<option value="15(충북)">15(충북)</option>
						<option value="16(충남)">16(충남)</option>
						<option value="17(전북)">17(전북)</option>
						<option value="18(전남)">18(전남)</option>
						<option value="19(경북)">19(경북)</option>
						<option value="20(경남)">20(경남)</option>
						<option value="21(제주)">21(제주)</option>
						<option value="22(대구)">22(대구)</option>
						<option value="23(인천)">23(인천)</option>
						<option value="24(광주)">24(광주)</option>
						<option value="25(대전)">25(대전)</option>
						<option value="26(울산)">26(울산)</option>
						<option value="28(경기북부)">28(경기북부)</option>
					</select>
				</div>
			</div>
			<div class="div_container">
				<div class="div_name">
					면허번호 10자리
				</div>
				<div class="div_content" align="left">
					<table>
						<tr>
							<td>
								<input class="form-control" type="text"id="num1" name="num1" 
								maxlength="2" style="text-align: center; font-size: 24px; width: 72px;"
								value="${licenseDTO.num1}">
							</td>
							<td>
								&nbsp;-&nbsp;
							</td>
							<td>
								<input class="form-control" type="text"id="num2" name="num2" 
								maxlength="6" style="text-align: center; font-size: 24px; width: 199px;"
								value="${licenseDTO.num2}">
							</td>
							<td>
								&nbsp;-&nbsp;
							</td>
							<td>
								<input class="form-control" type="text"id="num3" name="num3" 
								maxlength="2" style="text-align: center; font-size: 24px; width: 72px;"
								value="${licenseDTO.num3}">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="div_container">
				<div class="div_name">
					발급일
				</div>
				<div class="div_content" align="left">
					<table>
						<tr>
							<td>
								
								<div class="warn" id="warn3" data-container="body" data-toggle="popover" data-color="warning" data-placement="top" data-content="발급년을 선택"></div>
					
								<select class="select" style="width: 90px;" name="issueYear" id="issueYear">
									<option value="">선택</option>
									<option value="1999">1999</option>
									<option value="2000">2000</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
								</select>
							</td>
							<td>
								<h1>년&nbsp;&nbsp;&nbsp;</h1>
							</td>
							<td>
							
								<div class="warn" id="warn4" data-container="body" data-toggle="popover" data-color="warning" data-placement="top" data-content="발급월을 선택"></div>
							
								<select class="select" style="width: 75px;" id="issueMonth" name="issueMonth">
									<option value="">선택</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</td>
							<td>
								<h1>월&nbsp;&nbsp;&nbsp;</h1>
							</td>
							<td>
				
								<div class="warn" id="warn5" data-container="body" data-toggle="popover" data-color="warning" data-placement="top" data-content="발급일을 선택"></div>
				
								<select class="select" style="width: 75px;" id="issueDay" name="issueDay">
									<option value="">선택</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</td>
							<td>
								<h1>일</h1>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="div_container">
				<div class="div_name">
					갱신기간 만료일
				</div>
				<div class="div_content" align="left">
					<table>
						<tr>
							<td>
								
								<div class="warn" id="warn6" data-container="body" data-toggle="popover" data-color="warning" data-placement="top" data-content="갱신기간 만료년을 선택"></div>
												
								<select class="select" style="width: 90px;" id="expireYear" name="expireYear">
									<option value="">선택</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
									<option value="2023">2023</option>
									<option value="2024">2024</option>
									<option value="2025">2025</option>
									<option value="2026">2026</option>
									<option value="2027">2027</option>
									<option value="2028">2028</option>
									<option value="2029">2029</option>
									<option value="2039">2030</option>
									<option value="2031">2031</option>
									<option value="2032">2032</option>
									<option value="2033">2033</option>
									<option value="2034">2034</option>
									<option value="2035">2035</option>
									<option value="2036">2036</option>
									<option value="2037">2037</option>
									<option value="2038">2038</option>
									<option value="2039">2039</option>
								</select>
							</td>
							<td>
								<h1>년&nbsp;&nbsp;&nbsp;</h1>
							</td>
							<td>
							
								<div class="warn" id="warn7" data-container="body" data-toggle="popover" data-color="warning" data-placement="top" data-content="갱신기간 만료월을 선택"></div>
									
								<select class="select" style="width: 75px;" id="expireMonth" name="expireMonth">
									<option value="">선택</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</td>
							<td>
								<h1>월&nbsp;&nbsp;&nbsp;</h1>
							</td>
							<td>

								<div class="warn" id="warn8" data-container="body" data-toggle="popover" data-color="warning" data-placement="top" data-content="갱신기간 만료일을 선택"></div>
								
								<select class="select" style="width: 75px;" id="expireDay" name="expireDay">
									<option value="">선택</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</td>
							<td>
								<h1>일</h1>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<button id="licenseBtn" type="button" class="btn btn-success" style="margin-top: 10px;">면허등록</button>
		</form>		
	</div>
  <!--   Core   -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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