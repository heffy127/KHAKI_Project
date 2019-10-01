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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--   Core   -->
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
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
				var pwType = /^(?=.*[0-9])(?=.*[!?@#$%^&*])(?=.*[a-zA-Z])[a-zA-Z0-9!?@#$%^&*]{8,18}$/; 
				//			최소 하나 이상의 숫자           문자                         영어              영어 숫자 문자만 입력   8~18자리
				
				// 비밀번호 유효성 검사
				$('#pw').keyup(
						function(event) {
							
							// 입력할때마다 비밀번호 확인과 비교
							if ($('#pw').val() == $('#pwChk').val()) {
								$('#pwChk').attr('class',"form-control is-valid")
								$('#pwChk_span').attr('style',"color: green; font-size: '1';").text("비밀번호와 일치합니다.")
							} else {
								$('#pwChk').attr('class',"form-control is-invalid")
								$('#pwChk_span').attr('style',"color: red; font-size: '1';").text("비밀번호와 불일치합니다.")
							}
							
							if (pwType.test($('#pw').val())) { // 정규식 조건 통과
								// 기존 비밀번호와 같을 경우 변경 불가
								var d = $('#f').serialize()
								$.ajax({
									url: "mypage_newPw_check.do",
									data: d,
									type: 'POST',
									success: function(result){
										var check = result.trim()
										if(check == 'yes'){ // 입력한 새 비밀번호가 해당 id에 등록된 비밀번호와 일치
											$('#pw').attr('class',"form-control is-invalid")
											$('#pw_span').attr('style',"color: red; font-size: '1';").text("기존 비밀번호는 사용하실 수 없습니다.")
										}else{
											$('#pw').attr('class',"form-control is-valid")
											$('#pw_span').attr('style',"color: green; font-size: '1';").text("사용 가능한 비밀번호입니다.")
										}
									}
								})
							} else {
								$('#pw').attr('class',"form-control is-invalid")
								$('#pw_span').attr('style',"color: red; font-size: '1';").text("영문, 숫자, 특수문자 혼합 8~18글자")
							}
						})
				
				// 비밀번호 확인 검사
				$('#pwChk').keyup(
						function(event) {
							if ($('#pw').val() == $('#pwChk').val()) {
								$('#pwChk').attr('class',"form-control is-valid")
								$('#pwChk_span').attr('style',"color: green; font-size: '1';").text("비밀번호와 일치합니다.")
							} else {
								$('#pwChk').attr('class',"form-control is-invalid")
								$('#pwChk_span').attr('style',"color: red; font-size: '1';").text("비밀번호와 불일치합니다.")
							}
						})
				
				// 비밀번호 변경 버튼 클릭
				$('#pwChangeBtn').click(
						function() {
							if($('#pw_span').text() != '사용 가능한 비밀번호입니다.'){
								swal('비밀번호 입력 정보를 다시 확인해주세요.')
								$('#pw').focus()
								return false
							}

							if($('#pwChk_span').text() != '비밀번호와 일치합니다.'){
								swal('비밀번호 확인 입력 정보를 다시 확인해주세요.')
								$('#pwChk').focus()
								return false
							}
							
							var d = $('#f').serialize()
							$.ajax({
								url: "mypage_newPw_fin.do",
								data: d,
								type: 'POST',
								success: function(result){
									swal("비밀번호 변경이 완료되었습니다.")
									window.parent.closeModal_normal('changed')
								}
							})
						})
						

	})
</script>

<body>
	<div align="center" style="padding: 10px;">
		<form id="f" name="f" action="">
			<input type="hidden" value="${id}" id="id" name="id">
			<input type="password" class="form-control form-control-alternative" placeholder="새로운 비밀번호" 
			id="pw" name="pw">
				<div align="left" style="padding-top: 5px;">
					&nbsp;&nbsp; <span id="pw_span"
						style="color: gray; font-size: '1';">영문, 숫자, 특수문자 혼합
						8~16글자</span>
				</div>
				<br> <input type="password"
					class="form-control form-control-alternative"
					placeholder="비밀번호 확인" id="pwChk">
				<div align="left" style="padding-top: 5px;">
					&nbsp;&nbsp; <span id="pwChk_span"
						style="color: gray; font-size: '1';">비밀번호를 한번 더 입력</span>
				</div>
				<br>
				<button type="button" class="btn btn-success" id="pwChangeBtn">비밀번호 변경</button>
		</form>		
	</div>
</body>
</html>