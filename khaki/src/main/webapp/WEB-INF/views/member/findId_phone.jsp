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
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			
			$('#forPhoneBtn').click(function() {
				
				
				if($('#name').val().trim() == ""){
					alert("이름 입력 정보를 확인해주세요.")
					return false
				}
				
				if($('#phone1').val().trim() == "" || $('#phone2').val().trim() == null || $('#phone3').val().trim() == null){
					alert("휴대폰 번호 입력 정보를 확인해주세요.")
					return false
				}
				
				// 구글 리캡차 (자동입력 매크로 방지)
				var v = grecaptcha.getResponse()
				if(v.length == 0){ // 0일 경우 체크가 안된것
					alert("자동입력방지 버튼을 클릭해주세요.")
					return false
				}
				
				var d = $('#findId_phone').serialize()
				$.ajax({
					url: "phoneNameCheck.do",
					data: d,
					type: "POST",
					success: function(result){
						var check = result
						if(check.trim() != 'null'){
							$('#findId_phone').submit()
							
							
						}else{
							alert("등록된 전화번호가 없습니다.")
							location.reload(true);
						}
					}
				})
				
				
			})		
	})
</script>
</head>
<body>
	<form action="findId_phone_go.do" name="findId_phone" id="findId_phone">
		<div align="center">
		<br>
			<h4>회원가입 시 등록하신 정보를 입력해주세요.</h4><h4>문자로 아이디 정보를 보내드립니다.</h4>
			<hr style="margin-top : 5px;">
				<input type="text" class="form-control"
					placeholder="이름" id="name" name="name" style="margin: 15px; width: 340px;">
			<table>
				<tr>
					<td>
						<input type="text" class="form-control" 
						id="phone1" name="phone1" maxlength="3" placeholder="전화번호" style="width: 105px;">
					</td>
					<td>
						-
					</td>
					<td>
						<input type="text" class="form-control" 
						id="phone2" name="phone2" maxlength="4" style="width: 105px;">
					</td>
					<td>
						-
					</td>
					<td>
						<input type="text" class="form-control" 
						id="phone3" name="phone3" maxlength="4" style="width: 105px;">
					</td>
				</tr>
			
			</table>
			<div class="g-recaptcha" data-sitekey="6LejpLQUAAAAAD75JKoObErN4BsK2U4QzBg7L9Fs" style="margin-top: 25px;"></div>
			<button type="button" class="btn btn-success"
				id="forPhoneBtn" style="height: 40px; margin-top: 25px;">문자발송</button>
		</div>
	</form>
</body>
</html>