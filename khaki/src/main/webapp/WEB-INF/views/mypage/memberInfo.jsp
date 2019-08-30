<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<!--   Core   -->
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script
   src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<!--   Argon JS   -->
<script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			
			// 자바스크립트 정규표현식
			var email_idType = /^(?=.*[A-Za-z0-9])[A-Za-z0-9+]*$/; // 영어, 숫자 필터링해줌 (무조건 1개 이상 입력)
			var email_siteType = /^[a-zA-Z0-9.]+\.[a-zA-Z]{2,5}$/; 
			//                        영어 숫자 .   .이후 영어 2~5자리로 끝내야함

			// 소셜 로그인 여부에 맞춰 토글 체크
			if('${socialDTO_naver.id}' != null){
				$('#naver_chk').attr('checked',true)
			}
			if('${socialDTO_kakao.id}' != ''){
				$('#kakao_chk').attr('checked',true)
			}
			
			// 비밀번호 변경 버튼 클릭
			$('#pwCheckBtn').click(
					function() {
						if($('#pw').val() != ''){
							alert("여기서 ajax로 비밀번호 체크할 예정")
							$('#pwModal').click()
						}else{
							alert('비밀번호 정보를 입력해주세요.')
						}
						
			})
			
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
						} else { // 인증메일 버튼일때 클릭
							if(email_idType.test($('#email_id').val()) && email_siteType.test($('#email_site').val())){
								// 이메일 양식에 맞게 입력한 경우
								alert("인증메일 ㄱㄱ")
							}else{
								alert("이메일 양식에 맞게  작성해주세요.")
							}
						}
					})
					
			// 이메일 변경 취소버튼 클릭	
			$('#emailCancelBtn').click(
					function() {// 변경 버튼일때 클릭
							$('#emailChangeBtn').attr('class','btn btn-outline-primary')
							$('#emailChangeBtn').text('변경')
							$('#email_id').attr('readonly',true)
							$('#email_site').attr('readonly',true)
							$('#email_select').attr('disabled',false)
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
						}
					})
		
			// 휴대폰 번호 변경 취소버튼 클릭	
			$('#phoneCancelBtn').click(
					function() { // 변경 버튼일때 클릭
							$('#phoneChangeBtn').attr('class','btn btn-outline-primary')
							$('#phoneChangeBtn').text('변경')
							$('#phone1').attr('readonly',true)
							$('#phone2').attr('readonly',true)
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
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress").focus();
				}
			}).open();
					
		}
</script>
</head>
<body>
   <div class="card-body">
      <div class="col-9" style="margin: 0 auto;">
            <h6 class="heading-small text-muted mb-4">USER INFORMATION</h6>
            <div class="pl-lg-4" style="padding-left: 14px; padding-right: 14px;">
               <div class="row">
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="name">이름</label>
                        <input type="text" id="name"
                           class="form-control form-control-alternative" readonly="readonly"
                           value="${memberDTO.name}">
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="id">아이디</label>
                        <input type="text" id="id"
                           class="form-control form-control-alternative" readonly="readonly"
                           value="${memberDTO.id}">
                     </div>
                  </div>
               </div>
            <form id="pwF" name="pwF" action="" method="post">   
               <div class="row">
                  <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="pw">비밀번호  변경</label> 
                        <input type="password" id="pw"
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
               
            </form>
            </div>
            <hr class="my-4" />
            <!-- Address -->
            <h6 class="heading-small text-muted mb-4">CONTACT INFORMATION</h6>
            <div class="pl-lg-4" style="padding-left: 14px; padding-right: 14px;">
               <div class="row">
                  <div class="col-md-12">
                     <div class="form-group">
                        <label class="form-control-label" for="input-address">이메일</label>

            <form id="emailF" name="emailF" action="" method="post">   
                        <table>
                           <tr>
                              <td><input type="text"
                                 class="form-control form-control-alternative" id="email_id"
                                 name="email_id" style="text-align: center; font-size: 18px; width: 192px"
                                 placeholder="이메일 주소 입력" readonly="readonly"
                                 value="${memberDTO.email_id}"></td>
                              <td>&nbsp;@&nbsp;</td>
                              <td><input type="text"
                                 class="form-control form-control-alternative" id="email_site"
                                 name="email_site" style="text-align: center; font-size: 18px; width: 192px"
                                 readonly="readonly"
                                 value="${memberDTO.email_site}"></td>
                              <td>&nbsp;</td>
                              <td><select id="email_select" size="1"
                                 style="height: 45px; border: 1 solid gray;" disabled="disabled">
                                    <option value="">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="gmail.com   ">gmail.com</option>
                                    <option value="outlook.com">outlook.com</option>
                              </select></td>
                              <td>&nbsp;&nbsp;</td>
                              <td>
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
            </form>
                     </div>
                     <div class="form-group">
                        <label class="form-control-label" for="input-address">휴대폰 번호</label>
            <form id=phoneF" name="phoneF" action="" method="post">   
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
            </form>
                     </div>
                     <div class="form-group">
                        <label class="form-control-label" for="input-address">주소</label>
            <form id="addressF" name="addressF" action="" method="post">   
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
                                    <input type="button" class="btn btn-outline-primary" value="변경" onclick="execDaumPostcode()"
                                    id="addressChangeBtn"><br>
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
            </form>
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
                     <td width="300px">
                        <input type="text" class="form-control form-control-alternative" 
                        id="license" placeholder="등록된 운전면허 정보가 없습니다." readonly="readonly" name="">
                     </td>
                     <td>
                        &nbsp;&nbsp;
                     </td>
                     <td>
                        <input type="button" class="btn btn-outline-warning" value="운전면허 정보  등록">
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
                           <form id="pushF" name="pushF" action="" method="post">   
                              <input type="checkbox" name="chk" id="smsPush_chk" value=""> <a href="#none" id="smsBtn">문자수신</a> &nbsp;&nbsp;&nbsp;&nbsp;
                              <input type="checkbox" name="chk" id="emailPush_chk" value=""> <a href="#none" id="emailBtn">이메일수신</a>&nbsp;&nbsp;&nbsp;&nbsp;
                              <button type="button" class="btn btn-outline-primary" style="font-size: 7px; height: 35px;" id="pushBtn">확인</button>
                           </form>
                        </td>
                     </tr>
                  </table>
               </div>
            </div>
      </div>
   </div>
   
   <!-- 비밀번호 찾기 modal -->
  	<div style="display: none !important;">
     <button type="button" class="btn btn-block btn-primary mb-3" 
     data-toggle="modal" data-target="#modal-default" id="pwModal">Default</button>
    </div>  
		<div class="modal fade" id="modal-default" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true"
		style="top: -300px;">
		   <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
		        <div class="modal-content">
		        	
		            <div class="modal-header">
		                <h6 class="modal-title" id="modal-title-default">Type your modal title</h6>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">×</span>
		                </button>
		            </div>
		            
		            <div class="modal-body">
		            	
		                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
		                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		                
		            </div>
		            
		            <div class="modal-footer">
		                <button type="button" class="btn btn-primary">Save changes</button>
		                <button type="button" class="btn btn-link  ml-auto" data-dismiss="modal">Close</button> 
		            </div>
		            
		        </div>
		      </div>
        </div>
        
</body>
</html>