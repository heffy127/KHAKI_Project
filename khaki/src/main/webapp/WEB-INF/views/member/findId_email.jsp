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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			
			$('#forEmailBtn').click(function() {
				
				
				if($('#name').val().trim() == ""){
					swal("이름 입력 정보를 확인해주세요.")
					return false
				}
				
				if($('#email_id').val().trim() == "" || $('#email_site').val().trim() == null){
					swal("이메일 입력 정보를 확인해주세요.")
					return false
				}
				
				// 구글 리캡차 (자동입력 매크로 방지)
				var v = grecaptcha.getResponse()
				if(v.length == 0){ // 0일 경우 체크가 안된것
					swal("자동입력방지 버튼을 클릭해주세요.")
					return false
				}
				
				
				var d = $('#findId_email').serialize()
				$.ajax({
					url: "emailNameCheck.do",
					data: d,
					type: "POST",
					success: function(result){
						var check = result
						if(check.trim() != 'null'){
							$('#forEmailBtn').attr("class", "btn btn-warning")
							$('#forEmailBtn').attr("disabled", true)
							$('#forEmailBtn').text("전송중")
							$.ajax({
								url: "findId_email_go.do",
								data: d,
								type: "POST",
								success: function(result2){
									swal("등록된 이메일로 회원정보가 발송되었습니다.")
									.then((value) => {
										window.parent.closeModal()
									});
									
								}
							})
							
						}else{
							swal("등록된 이메일이 없습니다.")
											.then((value) => {
												location.reload(true);
											});
						}
					}
				})
				
				
			})		
	})
</script>
</head>
<body>
	<form action="" name="findId_email" id="findId_email">
		<div align="center">
		<br>
			<h4>회원가입 시 등록하신 정보를 입력해주세요.</h4><h4>해당 이메일로 아이디 정보를 보내드립니다.</h4>
			<hr style="margin-top : 5px;">
				<input type="text" class="form-control"
					placeholder="이름" id="name" name="name" style="margin: 15px; width: 340px;">
			<table>
				<tr>
					<td>
						<input type="text" class="form-control" 
						id="email_id" name="email_id" placeholder="email" style="width: 120px;">
					</td>
					<td>
						@
					</td>
					<td>
						<input type="text" class="form-control" 
						id="email_site" name="email_site" placeholder="example.com" style="width: 200px;">
					</td>
				</tr>
			
			</table>
			<div class="g-recaptcha" data-sitekey="6LejpLQUAAAAAD75JKoObErN4BsK2U4QzBg7L9Fs" style="margin-top: 25px;"></div>
			<button type="button" class="btn btn-success"
				id="forEmailBtn" style="height: 40px; margin-top: 25px;">메일발송</button>
		</div>
	</form>
</body>
</html>