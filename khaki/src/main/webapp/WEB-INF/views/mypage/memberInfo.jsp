<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!-- 네이버 아이디 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 카카오 아이디 로그인  -->
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--   Core   -->
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<!--   Argon JS   -->
<script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			
			// 자바스크립트 정규표현식
			var email_idType = /^(?=.*[A-Za-z0-9])[A-Za-z0-9+]*$/; // 영어, 숫자 필터링해줌 (무조건 1개 이상 입력)
			var email_siteType = /^[a-zA-Z0-9.]+\.[a-zA-Z]{2,5}$/; 
			//                        영어 숫자 .   .이후 영어 2~5자리로 끝내야함
			var phoneType = /^(?=.*[0-9])[0-9+]*$/; // 숫자만 필터링
			
			//
			if('${licenseDTO.num1}' != ''){
				$('#license').val('${licenseDTO.num1}'+'-'+'${licenseDTO.num2}'+'-'+'${licenseDTO.num3}')
			}
			
			// 소셜 로그인 여부에 맞춰 토글 체크
			if('${socialDTO_naver.id}' != ''){
				$('#naver_chk').attr('checked',true)
			}
			if('${socialDTO_kakao.id}' != ''){
				$('#kakao_chk').attr('checked',true)
			}
			
			// 비밀번호 변경 버튼 클릭
			$('#pwCheckBtn').click(
					function() {
						if($('#pw').val() != ''){
						var d = $('#mypageF').serialize()
							$.ajax({
								url: "mypage_pwCheck.do",
								data: d,
								type: 'POST',
								success: function(result) {
									var check = result.trim()
									var id = $('#id').val()
									if(check == 'yes'){ // DB에 저장된 비밀번호와 일치
										$('#modal-body-changePw').append('<iframe src="mypage_newPw.do?id=' + id + '" width="455px" height="275px" frameborder="0" '
												+ 'style="box-shadow: 0 15px 35px rgba(50, 50, 93, 0.2), 0 5px 15px rgba(0, 0, 0, 0.17);'
												+ 'border-top-left-radius: 0.4375rem; border-top-right-radius: 0.4375rem;'
												+ 'border-bottom-left-radius: 0.4375rem; border-bottom-right-radius: 0.4375rem;"></iframe>')
										$('#modal-changePw').modal({backdrop: 'static'}) // 모달 닫힘 방지 
									} else { // DB에 저장된 비밀번호와 불일치
										alert("입력하신 비밀번호를 다시 확인해주세요.")
									}
								}
							})
						}else{
							alert('비밀번호를 입력해주세요.')
						}
						$('#pw').val('')
						
			})

			var khakiAuth // KHAKI가 생성하는 인증번호
			var userAuth // 사용자로부터 받는 인증번호
			
			// 이메일 변경버튼 클릭
			$('#emailChangeBtn').click(
					function() {
						if($('#emailChangeBtn').text() == '변경'){ // 변경 버튼일때 클릭
							$('#emailChangeBtn').attr('class','btn btn-success')
							$('#emailChangeBtn').text('인증메일')
							$('#email_id').attr('readonly',false)
							$('#email_site').attr('readonly',false)
							$('#email_select').attr('disabled',false)
							$('#emailCancelDiv').show()
						} else if($('#emailChangeBtn').text() == '인증메일'){ // 인증메일 버튼일때 클릭
							if(email_idType.test($('#email_id').val()) && email_siteType.test($('#email_site').val())){
								// 이메일 형식에 맞게 입력한 경우
							
								$.ajax({ // 이메일 중복 체크
									url: "emailCheck.do?email_id="+$('#email_id').val() + "&" + "email_site=" + $('#email_site').val(),
									success: function(result){
										var check = result
										if(check.trim() != 'null'){
											alert('중복된 이메일입니다.')
										}else{
											// 중복 안된경우 메일 보내기
												$('#emailChangeBtn').attr('class', 'btn btn-warning')
												$('#emailChangeBtn').text('발송중')
												$('#emailChangeBtn').attr('disabled',true)
												$('#emailCancelDiv').hide()
												var d = $('#mypageF').serialize()
												$.ajax({
													url: "mypage_emailAuth.do",
													data: d,
													type: 'POST',
													success: function(result){
														khakiAuth = result.trim() 
														// 메일로 보낸 인증번호를 가져온 후
														// 인증완료 버튼 눌렀을때 사용자가 세션을 통해 보내온 인증번호와 비교하게 됨
														alert("입력하신 이메일 계정으로 인증메일를 발송했습니다.\n해당 이메일로 인증 후 인증완료 버튼을 눌러주세요")
														$('#emailChangeBtn').attr('class', 'btn btn-info')
														$('#emailChangeBtn').text('인증완료')
														$('#emailChangeBtn').attr('disabled',false)
														$('#emailCancelDiv').show()
														$('#email_id').attr('readonly', true)
														$('#email_site').attr('readonly', true)
														$('#email_site').attr('readonly', true)
														$('#email_select').attr('disabled', true)
														$('#emailPop').popover('toggle')
													}
												})
												
										}
									}
								})

								
							}else{
								alert("이메일 형식에 맞게  작성해주세요.")
							}
						} else { // 인증완료일때 클릭
							$('#emailPop').popover('hide')
							$.ajax({  // 세션을 통해 보내온 인증번호를 ajax를 통해 다른 jsp에서 받아옴
								url: "mypage_emailAuth_endBtn.do",
								success: function(result){
									userAuth = result.trim()
									// khaki 인증번호와 사용자가 세션을 통해 보내온 인증번호 비교
									if(khakiAuth != userAuth || khakiAuth == null){
										alert('이메일 인증 정보를 다시 확인해주세요.')
										return false
									}else{
										var d = $('#mypageF').serialize()
										$.ajax({  // 이메일 업데이트
											url: "mypage_emailAuth_fin.do",
											data: d,
											type: 'POST',
											success: function(result){
												alert("이메일 변경이 완료되었습니다.")
												sessionStorage.removeItem("sessionMypageAuthNum");
												location.reload(true);
											}
										})
										
									}
								}
							})
							
							
						}
					})
					
			// 이메일 변경 취소버튼 클릭	
			$('#emailCancelBtn').click(
					function() {// 변경 버튼일때 클릭

							$.ajax({
								url: "mypage_emailAuthDelete.do",
								success: function(result){
									// 인증번호 session 삭제
								}
							})
							
							$('#emailChangeBtn').attr('class','btn btn-outline-primary')
							$('#emailChangeBtn').text('변경')
							$('#email_id').val('${memberDTO.email_id}') // 기존 값 삽입
							$('#email_id').attr('readonly',true)
							$('#email_site').val('${memberDTO.email_site}') // 기존 값 삽입
							$('#email_site').attr('readonly',true)
							$("#email_select").val('').prop("selected", true); // '직접입력' option 선택
							$('#email_select').attr('disabled',true)
							$('#emailCancelDiv').hide()
					})
					
			// email_select박스
			$('#email_select').change(
					function() {
						if($('#email_select option:selected').val() == '' ){
							$('#email_site').val($('#email_select option:selected').val())
							$('#email_site').attr('readonly',false)
						} else {
							$('#email_site').val($('#email_select option:selected').val())
							$('#email_site').attr('readonly',true)
						}
					})
			
			// 휴대폰 번호 변경 버튼 클릭	
			$('#phoneChangeBtn').click(
					function() {
						if($('#phoneChangeBtn').text() == '변경'){ // 변경 버튼일때 클릭
							$('#phoneChangeBtn').attr('class','btn btn-success')
							$('#phoneChangeBtn').text('인증문자')
							$('#phone1').attr('readonly',false)
							$('#phone2').attr('readonly',false)
							$('#phone3').attr('readonly',false)
							$('#phoneCancelDiv').show()
						} else if($('#phoneChangeBtn').text() == '인증문자'){ // 인중문자 버튼일때 클릭
							if(phoneType.test($('#phone1').val()) && phoneType.test($('#phone2').val()) && phoneType.test($('#phone3').val())){
								
								$.ajax({ // 휴대폰 중복 체크
									url: "phoneCheck.do?phone1="+$('#phone1').val()+"&phone2="+$('#phone2').val()+"&phone3="+$('#phone3').val(),
									success: function(result) {
									var check = result
									if(check.trim() != 'null'){
										alert('휴대폰 번호가 중복됩니다.')
									} else { // 중복체크 통과
										
										var phone = $('#phone1').val() + "-" + $('#phone2').val() + "-" + $('#phone3').val()
										$('#modal-body-changePhone').append('<iframe src="#"  width="340" height="120" frameborder="0" id="iframe"'  
												+ 'style="box-shadow: 0 15px 35px rgba(50, 50, 93, 0.2), 0 5px 15px rgba(0, 0, 0, 0.17);'
												+ 'border-top-left-radius: 0.4375rem; border-top-right-radius: 0.4375rem;'
												+ 'border-bottom-left-radius: 0.4375rem; border-bottom-right-radius: 0.4375rem;"></iframe>') // 휴대폰 번호 인증 iframe 생성
										$('#iframe').attr("src", "smsPhoneAuth.do?phone=" + phone)
										$('#modal-changePhone').modal({backdrop: 'static'}); // 모달 닫힘 방지 
										
									}
								}		
							  })
								
							} else { // 정규식 만족 못할 때
								alert('휴대폰 번호 정보를 정확히 입력해주세요.')
							}
						} else { //인증완료 버튼일때 클릭
							$('#phonePop').popover('hide')
							var d = $('#mypageF').serialize()
							$.ajax({  // 휴대폰 번호 업데이트
								url: "mypage_phoneAuth_fin.do",
								data: d,
								type: 'POST',
								success: function(result){
									alert("휴대폰 번호 변경이 완료되었습니다.")
									location.reload(true);
								}
							})
						}
					})
		
			// 휴대폰 번호 변경 취소버튼 클릭	
			$('#phoneCancelBtn').click(
					function() { // 변경 버튼일때 클릭
							$('#phoneChangeBtn').attr('class','btn btn-outline-primary')
							$('#phoneChangeBtn').text('변경')
							$('#phone1').val('${memberDTO.phone1}')
							$('#phone1').attr('readonly',true)
							$('#phone2').val('${memberDTO.phone2}')
							$('#phone2').attr('readonly',true)
							$('#phone3').val('${memberDTO.phone3}')
							$('#phone3').attr('readonly',true)
							$('#phoneCancelDiv').hide()
					})
					
					
			// 문자, 이메일 수신 버튼
			$("#smsBtn").click(function() {
				$("#smsPush_chk").click()
			})
			$("#emailBtn").click(function() {
				$("#emailPush_chk").click()
			})
			
			$('.close').click(
				function () {
					window.closeModal_normal()
			})

			// 모달 닫기 펑션
			window.closeModal_normal = function(changed){ //변화된것이 있을경우 changed변수로 값 넘어옴
				$('.modal').modal('hide')
				$('.modal-body').empty() // iframe 제거
				if(changed == 'changed'){
					setTimeout(function() {
						location.reload(true);
						}, 600); // 0.6초뒤 페이지 새로고침
				}
				<%session.removeAttribute("sessionPhoneAuth");%> // 휴대폰 인증 세션 삭제
			}
			
			// 휴대폰 번호 인증 후 모달이 자동으로 닫힐 때 실행
			window.closeModal = function(changed){ 
				$('.modal').modal('hide')
				$('.modal-body').empty() // iframe 제거
				$('#phone1').attr('readonly',true)
				$('#phone2').attr('readonly',true)
				$('#phone3').attr('readonly',true)
				$('#phoneChangeBtn').attr('class', 'btn btn-info')
				$('#phoneChangeBtn').text('인증완료')
				$('#phoneChangeBtn').attr('disabled',false)
				$('#phonePop').popover('toggle')
				<%session.removeAttribute("sessionPhoneAuth");%>
			}
			
			// 주소 변경버튼 클릭
			$('#addressChangeBtn').click(
				function() {
					if($('#addressChangeBtn').val() == '변경'){
						execDaumPostcode()
					} else { // 완료 버튼일때 클릭
						$('#addressPop').popover('hide')
						var d = $('#mypageF').serialize()
						$.ajax({  // 이메일 업데이트
							url: "mypage_address_fin.do",
							data: d,
							type: 'POST',
							success: function(result){
								alert("주소 변경이 완료되었습니다.")
								location.reload(true);
							}
						})
					}
					
			})
			
			// 주소 변경 취소버튼 클릭	
			$('#addressCancelBtn').click(
					function() { // 변경 버튼일때 클릭
							$('#addressChangeBtn').attr('class','btn btn-outline-primary')
							$('#addressChangeBtn').val('변경')
							$('#postcode').val('${memberDTO.postcode}')
							$('#address').val('${memberDTO.address1}')
							$('#detailAddress').val('${memberDTO.address2}')
							$('#detailAddress').attr('readonly',true)
							$('#extraAddress').val('${memberDTO.address3}')
							$('#addressCancelDiv').hide()
					})
			
			// 운전면허 버튼 클릭
			$('#licenseBtn').click(
					function() {
						var id = $('#id').val()
						var name = $('#name').val()
						$('#modal-body-license').append(
								'<iframe src="mypage_license.do?id=' + id + '&name=' + name +'" width="730px" height="670px" frameborder="0" '
								+ 'style="box-shadow: 0 15px 35px rgba(50, 50, 93, 0.2), 0 5px 15px rgba(0, 0, 0, 0.17);'
								+ 'border-top-left-radius: 0.4375rem; border-top-right-radius: 0.4375rem;'
								+ 'border-bottom-left-radius: 0.4375rem; border-bottom-right-radius: 0.4375rem;"></iframe>')
						
						$('#modal-license').modal({backdrop: 'static'}); // 모달 닫힘 방지 
					})
			
			// 소셜로그인 연동
			$('#naver_chk').click( // 눌렀을때
					function() {
						if($('#naver_chk').is(':checked')){  // 체크가 될 상황인경우
							if(confirm('네이버 소셜 계정과 연동하시겠습니까?')){
								$('#naver_id_login_anchor').click() // 네이버 연동
							}else{
								location.reload(true);
							}
				        }else{ // 체크 해제될 상황인경우
				        	if(confirm('네이버 소셜 계정 연동을 해제하시겠습니까?')){
				        		$.ajax({
									url: "mypage_socialDelete.do?id=" + $('#id').val() + "&social_type=naver",
									success: function(result){
										alert("네이버 소셜 연동이 해제되었습니다.")
										location.reload(true);
									}
								})
				        	}else{
				        		location.reload(true);
				        	}
				        	
				        }
			})
			
			$('#kakao_chk').change( // 눌렀을때
					function() {
						if($('#kakao_chk').is(':checked')){ // 체크가 될 상황인경우
							if(confirm('네이버 소셜 계정과 연동하시겠습니까?')){
								$('#kakao-login-btn').click() // 카카오 연동
							}else{
								location.reload(true);
							}
				        }else{  // 체크 해제될 상황인경우
				        	if(confirm('카카오 소셜 계정 연동을 해제하시겠습니까?')){
				        		$.ajax({
									url: "mypage_socialDelete.do?id=" + $('#id').val() + "&social_type=kakao",
									success: function(result){
										alert("카카오 소셜 연동이 해제되었습니다.")
										location.reload(true);
									}
								})
				        	}else{
				        		location.reload(true);
				        	}
				        }
			})
			
		})
		
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if(data.userSelectedType === 'R'){
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if(data.buildingName !== '' && data.apartment === 'Y'){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if(extraAddr !== ''){
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("extraAddress").value = extraAddr;
					
					} else {
						document.getElementById("extraAddress").value = '';
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address").value = addr;
					
					// 상세주소 입력칸 개방
					$('#detailAddress').val('')
					$('#detailAddress').attr('readonly',false)
					$('#addressChangeBtn').val('완료')
					$('#addressChangeBtn').attr('class','btn btn-info')
					$('#addressCancelDiv').show()
					$('#addressPop').popover('toggle')
					
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress").focus();
				}
			}).open();
					
		}
</script>
<style type="text/css">
input[type="text"] 
{
	font-size: 18px;
}
</style>
</head>
<body>
   <div class="card-body">
     <form id="mypageF" name="mypageF" action="" method="post">   
      <div class="col-9" style="margin: 0 auto;">
            <h6 class="heading-small text-muted mb-4">USER INFORMATION</h6>
            <div class="pl-lg-4" style="padding-left: 14px; padding-right: 14px;">
               <div class="row">
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="name">이름</label>
                        <input type="text" id="name" name="name"
                           class="form-control form-control-alternative" readonly="readonly"
                           value="${memberDTO.name}">
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="id">아이디</label>
                        <input type="text" id="id" name="id"
                           class="form-control form-control-alternative" readonly="readonly"
                           value="${memberDTO.id}">
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="pw">비밀번호  변경</label> 
                        <input type="password" id="pw" name="pw"
                           class="form-control form-control-alternative"
                           placeholder="현재 비밀번호를 입력 후 인증">
                     </div>
                  </div>
                  <div class="col-lg-6" style="transform: translate(0%, 30%);">
                     <div>
                        <input type="button" class="btn btn-outline-warning"
                           value="비밀번호 인증" id="pwCheckBtn">
                     </div>
                     
                     
                     
                  </div>
               </div>
               
            </div>
            <hr class="my-4" />
            <!-- Address -->
            <h6 class="heading-small text-muted mb-4">CONTACT INFORMATION</h6>
            <div class="pl-lg-4" style="padding-left: 14px; padding-right: 14px;">
               <div class="row">
                  <div class="col-md-12">
                     <div class="form-group">
                        <label class="form-control-label" for="input-address">이메일</label>

                        <table>
                           <tr>
                              <td><input type="text"
                                 class="form-control form-control-alternative" id="email_id"
                                 name="email_id" style="text-align: center; width: 192px"
                                 placeholder="이메일 주소 입력" readonly="readonly"
                                 value="${memberDTO.email_id}"></td>
                              <td>&nbsp;@&nbsp;</td>
                              <td><input type="text"
                                 class="form-control form-control-alternative" id="email_site"
                                 name="email_site" style="text-align: center;width: 192px"
                                 readonly="readonly"
                                 value="${memberDTO.email_site}"></td>
                              <td>&nbsp;</td>
                              <td><select id="email_select" size="1"
                                 style="height: 45px; border: 1 solid gray;" disabled="disabled">
                                    <option value="">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="outlook.com">outlook.com</option>
                              </select></td>
                              <td>&nbsp;&nbsp;</td>
                              <td>
                              	<div id="emailPop" data-toggle="popover" data-color="secondary" data-placement="top" data-content="이메일 인증 완료 시 클릭!"></div>
                                 <button type="button" class="btn btn-outline-primary" id="emailChangeBtn">변경</button>
                              </td>
                              <td>&nbsp;&nbsp;</td>
                              <td>
                                 <div id="emailCancelDiv" style="display: none !important;">
                                       <a href="#none" id="emailCancelBtn">취소</a> 
                                    </div>
                              </td>
                           </tr>
                        </table>
                     </div>
                     <div class="form-group">
                        <label class="form-control-label" for="input-address">휴대폰 번호</label>
                        <table>
                           <tr>
                              <td><input type="text"
                                 class="form-control form-control-alternative" maxlength="3"
                                 style="text-align: center; font-size: 18px; width: 165px" id="phone1"
                                 name="phone1" readonly="readonly" value="${memberDTO.phone1}"></td>
                              <td>&nbsp;-&nbsp;</td>
                              <td><input type="text"
                                 class="form-control form-control-alternative" maxlength="4"
                                 style="text-align: center; font-size: 18px; width: 165px" id="phone2"
                                 name="phone2" readonly="readonly" value="${memberDTO.phone2}"></td>
                              <td>&nbsp;-&nbsp;</td>
                              <td><input type="text"
                                 class="form-control form-control-alternative" maxlength="4"
                                 style="text-align: center; font-size: 18px; width: 165px" id="phone3"
                                 name="phone3" readonly="readonly" value="${memberDTO.phone3}"></td>
                              <td>&nbsp;&nbsp;</td>
                              <td>
                              	<div id="phonePop" data-toggle="popover" data-color="secondary" data-placement="top" data-content="휴대폰 번호 인증 완료 시 클릭!"></div>
                                 <button type="button" class="btn btn-outline-primary" id="phoneChangeBtn">변경</button>
                              </td>
                              <td>&nbsp;&nbsp;</td>
                              <td>
                                 <div id="phoneCancelDiv" style="display: none !important;">
                                       <a href="#none" id="phoneCancelBtn">취소</a> 
                                    </div>
                              </td>
                           </tr>
                        </table>
                     </div>
                     <div class="form-group">
                        <label class="form-control-label" for="input-address">주소</label>
                        <table>
                              <tr height='65px'>
                                 <td>
                                    <input type="text" class="form-control form-control-alternative" 
                                    id="postcode" placeholder="우편번호" readonly="readonly" name="postcode"
                                    style="width: 400px;" value="${memberDTO.postcode}">
                                 </td>
                                 <td>
                                    &nbsp;
                                 </td>
                                 <td>
                                 	<div id="addressPop" data-toggle="popover" data-color="secondary" data-placement="top" data-content="주소 변경 완료 시 클릭!"></div>
                                    <input type="button" class="btn btn-outline-primary" value="변경"  id="addressChangeBtn"><br>
                                 </td>
                                 <td>&nbsp;</td>
                                 <td>
                                    <div id="addressCancelDiv" style="display: none !important;">
                                       	<a href="#none" id="addressCancelBtn">취소</a> 
                                    </div>
                             	 </td>
                              </tr>
                           </table>
            
                        
                           <input type="text" class="form-control form-control-alternative" 
                                    id="address" placeholder="주소" readonly="readonly" name="address1"
                                    value="${memberDTO.address1}">
                              

                           <table>
                              <tr height='65px'>
                                 <td width="60%">
                                    <input type="text" class="form-control form-control-alternative" 
                                    id="detailAddress" placeholder="상세주소" name="address2" readonly="readonly"
                                    value="${memberDTO.address2}">
                                 </td>
                                 <td>
                                    &nbsp;
                                 </td>
                                 <td width="40%">
                                    <input type="text" class="form-control form-control-alternative" 
                                    id="extraAddress" placeholder="참고항목" readonly="readonly" name="address3"
                                    value="${memberDTO.address3}">
                                 </td>
                              </tr>
                           </table>
                     </div>
                  </div>
               </div>

            </div>
            <hr class="my-4" />
            <!-- Description -->
            <h6 class="heading-small text-muted mb-4" style="padding: 0px; margin: 0px;">DRIVER LICENSE</h6>
            <div class="pl-lg-4" style="padding-left: 14px; padding-right: 14px;">
               <div class="form-group">
               <table>
                  <tr>
                     <td width="280px">
                        <input type="text" class="form-control form-control-alternative" 
                        id="license" placeholder="운전면허 정보가 없습니다." readonly="readonly" name="license"
                        style="text-align: center;">
                     </td>
                     <td>
                        &nbsp;&nbsp;
                     </td>
                     <td>
                        <input type="button" class="btn btn-outline-warning" value="운전면허 정보  등록" id="licenseBtn">
                     </td>
                     <td>
                       <c:set var = "permission" value="${licenseDTO.permission}"/>
                       <c:choose>
                       		<c:when test="${permission == 'x'}">
                       			 &nbsp;&nbsp;<span class="badge badge-warning"><font size="4">심사중</font></span>
                       		</c:when>
                       		<c:when test="${permission == 'o'}">
                       			 &nbsp;&nbsp;<span class="badge badge-success"><font size="4">심사완료</font></span>
                       		</c:when>
                       </c:choose>
                     </td>
                  </tr>
               </table>   
               </div>
            </div>
            
            <hr class="my-4" />
            <!-- Description -->
            <h6 class="heading-small text-muted mb-4">SOCIAL LOGIN&nbsp;&&nbsp;PUSH </h6>
            <div class="pl-lg-4" style="padding-left: 14px; padding-right: 14px;">
               <div class="form-group">
                  <label class="form-control-label" for="input-address"  style="margin: 0px; padding-bottom: 10px;">소셜 로그인</label>

		              	<!-- 네이버 아이디 버튼 (숨김처리) -->
		                <div id="naver_id_login" style="display: none !important;">
		                </div>
		                
		                <!-- 카카오 아이디 버튼 (숨김처리) -->
		                <a id="kakao-login-btn" style="display: none !important;">
		                </a>
		     
                  <table>
                     <tr>
                        <td>
                           <img src="resources/assets/img/icons/common/naver_burned.png" width="140px">
                        </td>
                        <td>
                           &nbsp;&nbsp;
                        </td>
                        <td>
                           <label class="custom-toggle" style="padding: 0px; margin: 0px;">
                                <input type="checkbox" id="naver_chk">
                               <span class="custom-toggle-slider rounded-circle"></span>
                           </label>
                        </td>
                        <td>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                           <img src="resources/assets/img/icons/common/kakao_burned.png" width="140px">
                        </td>
                        <td>
                           &nbsp;&nbsp;
                        </td>
                        <td>
                           <label class="custom-toggle" style="padding: 0px; margin: 0px;">
                                <input type="checkbox" id="kakao_chk">
                               <span class="custom-toggle-slider rounded-circle"></span>
                           </label>
                        </td>
                        <td>
                           &nbsp;&nbsp;
                        </td>

                     </tr>
                     <tr>
                     	<td colspan="5">
                     		&nbsp;
                     	</td>
                     </tr>
                     <tr>
                        <td colspan="5">
                           <label class="form-control-label" for="input-address">마케팅 정보 수신</label>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="5">
                              <input type="checkbox" name="chk" id="smsPush_chk" value=""> <a href="#none" id="smsBtn">문자수신</a> &nbsp;&nbsp;&nbsp;&nbsp;
                              <input type="checkbox" name="chk" id="emailPush_chk" value=""> <a href="#none" id="emailBtn">이메일수신</a>&nbsp;&nbsp;&nbsp;&nbsp;
                              <button type="button" class="btn btn-outline-primary" style="font-size: 7px; height: 35px;" id="pushBtn">확인</button>
                        </td>
                     </tr>
                  </table>
               </div>
            </div>
      </div>
     </form>
   </div>
   
   <!-- 비밀번호 변경 modal -->
  	 
		<div class="modal fade" id="modal-changePw" tabindex="-1" role="dialog" aria-labelledby="modal-changePw" aria-hidden="true" style="top: -500px;">
		   <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
		        <div class="modal-content" style="background: #ffe099;">
		        	
		            <div class="modal-header">
		                <h2 class="modal-title" id="modal-title-default" style="color: #5c5c5c;">새로운 비밀번호 설정</h2>
		                <button type="button" class="close" id="modal-close">
		                    <span>×</span>
		                </button>
		            </div>
		            
		            <div class="modal-body" id="modal-body-changePw">
		                
		                
		            </div>
		            
		            
		        </div>
		      </div>
        </div>
        
    <!-- 휴대폰 번호 변경 modal -->
        
         <div class="modal fade" id="modal-changePhone" tabindex="-1" role="dialog" aria-labelledby="modal-changePhone" aria-hidden="true" style="top: -500px;">
		    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
		        <div class="modal-content bg-gradient-success">
		        	
		             <div class="modal-header">
		                <h5 class="modal-title" id="modal-title-default" style="color: #f5f5f5;">휴대폰 번호 인증</h5>
		             </div>
		            
		            <div class="modal-body" align="center" id="modal-body-changePhone" style="padding: 0.5rem;">
		            	
		            	
		                
		            </div>
		            
		            <div class="modal-footer" style="padding: 0.5rem;">
		                <button type="button" class="close btn btn-link  ml-auto" id="modal-close" style="color: #f5f5f5; font-size: 20px">닫기</button> 
		            </div>
		            
		        </div>
		    </div>	
	    </div>
	    
    <!-- 운전면허 정보 modal -->
        
         <div class="modal fade" id="modal-license" tabindex="-1" role="dialog" aria-labelledby="modal-license" aria-hidden="true">
		    <div class="modal-dialog modal-lg modal-dialog-centered modal-" role="document" style="width: 1000;">
		        <div class="modal-content bg-gradient-primary">
		        	
		             <div class="modal-header">
		                <h2 class="modal-title" id="modal-title-default" style="color: #f5f5f5;">운전면허등록</h2>
		                <button type="button" class="close" id="modal-close">
		                    <span><font color="white">x</font></span>
		                </button>
		             </div>
		            
		            <div class="modal-body" align="center" id="modal-body-license" style="padding: 0.5rem;">
		            	
		            	
		                
		            </div>
		           <div class="modal-footer" style="padding: 0.5rem;">
		                &nbsp;
		            </div>
		            
		        </div>
		    </div>	
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
  <script type="text/javascript">
    /* 네이버 아이디 로그인 */
  	var naver_id_login = new naver_id_login("FeRQ2NAEFDfGZe9uWQc8", "http://localhost:9999/khaki/callback_mypage.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,49);
  	naver_id_login.setDomain("http://localhost:9999/");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
    <script type='text/javascript'>
  /* 카카오 아이디 로그인 */
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('3193e740ee4757b5fed476c12b4b677e');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
  	success: function(authObj) {
   	 Kakao.API.request({
     url: '/v1/user/me',
     success: function(res) {
        var kakao_id = res.id //<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
        $.ajax({ // 소셜 로그인에 id가 저장되어 있는지 조회
		url: "checkSocialMypage.do?social_id=" + kakao_id + "&social_type=kakao",
		success: function(result){
			var check = result // already가 아닌경우 sessionId값을 가져옴
			if(check.trim() == 'already'){ // 해당 카카오 계정으로 다른 아이디 소셜 계정 연결
				alert("이미 다른 KHAKI 계정에서 사용중입니다.")
				location.reload(true);
				
			}else{
				$.ajax({
					url: "mypage_socialInsert.do?id=" + check + "&social_id=" + kakao_id + "&social_type=kakao",
					success: function(result){
						alert("카카오 소셜 연동이 완료되었습니다.")
						location.reload(true);
					}
				})
			}
		}
	})
        }
       })
      },
    fail: function(err) {
         alert(JSON.stringify(err));
        }
      });
</script>
</body>
</html>