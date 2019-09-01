<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				
				
				var timer = 180;
				var minutes, seconds;
				var interval = setInterval(function () { // 인증시간 타이머
							//setInterval(function() { ... }, 지연시간);
					minutes = parseInt(timer / 60) // 소수점이 안나오게 정수로 변환
					seconds = timer % 60

					seconds = seconds < 10 ? "0" + seconds : seconds // 10초보다 작으면 0 + 숫자 표시
							
					$('#forTimelimit').text(minutes + ' : ' + seconds)
					if(--timer < 0){ // timer가 0보다 작아질때
						timer = 0;
						clearInterval(interval) // 타이머 초기화
						alert("인증시간이 지났습니다.\n인증번호를 다시 발급받아주세요.")
						window.parent.closeModal_normal()
					}
				}, 1000)
				
				$('#authConfirm').click(
					function() {
						var sessionAuth = ${sessionPhoneAuth} // 세션에 있는 실제 휴대폰 인증번호
						var userAuth = $('#authNum').val()
						if( sessionAuth == userAuth ) {
							$('#authTitle').text("인증이 완료되었습니다.")
							alert("휴대폰 인증이 완료되었습니다.\n절차를 계속 진행해주세요.")
							window.parent.closeModal('changed') // 부모창에서 모달 자동으로 닫기
						} else {
							alert("인증번호를 다시 확인해주세요.")
						}
					}		
				)
				
				$('#authNum').focus()
				
				// 엔터키 입력 시 실행
				$('#authNum').keyup(
						function(event) {
							if(event.keyCode == 13){
								$('#authConfirm').click()
							}
				})
			})
	</script>
</head>
<body>
	<div align="center">
		
		<h2 id="authTitle">인증번호를 입력해주세요.</h2>
		<hr style="margin-bottom: 12px; margin-top: 4px;">
		<table border="0">
			<tr>
				<td width="20"><input type="text"
					class="form-control form-control-alternative" maxlength=6
					style="width: 120px; text-align: center;" placeholder="인증번호 입력" id="authNum"></td>
				<td>&nbsp;&nbsp;</td>
				<td width="20">
					<button type="button" class="btn btn-outline-danger btn-sm"
						id="authConfirm">인증</button>
				</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td width="60">
					<div id="forTimelimit" style="color: red; font-size: '3px';"
						align="right"></div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>