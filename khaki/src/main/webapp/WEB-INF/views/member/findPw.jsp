<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
 <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
 <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script type="text/javascript">
	$(document).ready(
		function() {
			$('#email').click(
				function() {
					location.href="findPw_email.do"
			})
				
			$('#phone').click(
				function() {
					location.href="findPw_phone.do"
			})
	})
			
 </script>
</head>
<body>
	<div align="center">
	<br>
	<h1>등록한 정보로 비밀번호 찾기</h1>
	<hr>
		<table>
			<tr>
				<td>
		<button type="button" class="btn btn-icon btn-3 btn-success" 
		style="width: 360px; height: 120px;" id="email">
			<div style="display: flex;">
				<div style="flex: 2;">
					<span class="btn-inner--icon">
					<i class="ni ni-email-83 ni-3x"></i>
					</span>
				</div>
				<div style="flex: 8; align-items: center;">
					<div style="height: 50px; line-height: 50px; font-size: 22px;">
					이메일로 비밀번호 찾기
					</div>
				</div>
			</div>
		</button>
				</td>
			</tr>
			<tr>
				<td>
		<button type="button" class="btn btn-icon btn-3 btn-warning" 
		style="width: 360px; height: 120px; margin-top: 23px;" id="phone">
				
				<div style="display: flex;">
				<div style="flex: 2;">
					<span class="btn-inner--icon">
					<i class="ni ni-mobile-button ni-3x"></i>
					</span>
				</div>
				<div style="flex: 8; align-items: center;">
					<div style="height: 50px; line-height: 50px; font-size: 22px;">
					휴대폰으로 비밀번호 찾기
					</div>
				</div>
			</div>
		</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>