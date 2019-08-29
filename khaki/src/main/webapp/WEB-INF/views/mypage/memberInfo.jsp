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
</head>
<body>
	<div class="card-body">
		<div class="col-9" style="margin: 0 auto;">
			<form>
				<h6 class="heading-small text-muted mb-4">USER INFORMATION</h6>
				<div class="pl-lg-4" style="padding-left: 14px; padding-right: 14px;">
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label class="form-control-label" for="input-username">이름</label>
								<input type="text" id="input-username"
									class="form-control form-control-alternative">
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label class="form-control-label" for="input-username">아이디</label>
								<input type="text" id="input-username"
									class="form-control form-control-alternative">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label class="form-control-label" for="input-first-name">비밀번호
									변경</label> <input type="text" id="input-first-name"
									class="form-control form-control-alternative"
									placeholder="현재 비밀번호를 입력 후 인증">
							</div>
						</div>
						<div class="col-lg-6" style="transform: translate(0%, 30%);">
							<div>
								<input type="button" class="btn btn-outline-warning"
									value="비밀번호 인증">
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
											name="email_id" style="text-align: center; font-size: 18px; width: 192px"
											placeholder="등록된 이메일이"></td>
										<td>&nbsp;@&nbsp;</td>
										<td><input type="text"
											class="form-control form-control-alternative" id="email_site"
											name="email_site" style="text-align: center; font-size: 18px; width: 192px"
											placeholder="없습니다."></td>
										<td>&nbsp;</td>
										<td><select id="email_select" size="1"
											style="height: 45px; border: 1 solid gray;">
												<option value="">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="gmail.com	">gmail.com</option>
												<option value="outlook.com">outlook.com</option>
										</select></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<button type="button" class="btn btn-outline-primary">변경</button>
										</td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<div>
													<a href="#none">취소</a> 
												</div>
										</td>
									</tr>
								</table>

							</div>
							<div class="form-group">
								<label class="form-control-label" for="input-address">휴대폰
									번호</label>

								<table>
									<tr>
										<td><input type="text"
											class="form-control form-control-alternative" maxlength="3"
											style="text-align: center; font-size: 18px; width: 165px" id="phone1"
											name="phone1"></td>
										<td>&nbsp;-&nbsp;</td>
										<td><input type="text"
											class="form-control form-control-alternative" maxlength="4"
											style="text-align: center; font-size: 18px; width: 165px" id="phone2"
											name="phone2"></td>
										<td>&nbsp;-&nbsp;</td>
										<td><input type="text"
											class="form-control form-control-alternative" maxlength="4"
											style="text-align: center; font-size: 18px; width: 165px" id="phone3"
											name="phone3"></td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<button type="button" class="btn btn-outline-primary">변경</button>
										</td>
										<td>&nbsp;&nbsp;</td>
										<td>
											<div>
													<a href="#none">취소</a> 
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
												style="width: 400px;">
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												<input type="button" class="btn btn-outline-primary" value="변경" onclick="execDaumPostcode()"><br>
											</td>
											<td>&nbsp;</td>
											<td>
												<div>
													<a href="#none">취소</a> 
												</div>
										</td>
										</tr>
									</table>

								
									<input type="text" class="form-control form-control-alternative" 
												id="address" placeholder="주소" readonly="readonly" name="address1">
										

									<table>
										<tr height='65px'>
											<td width="60%">
												<input type="text" class="form-control form-control-alternative" 
												id="detailAddress" placeholder="상세주소" name="address2">
											</td>
											<td>
												&nbsp;
											</td>
											<td width="40%">
												<input type="text" class="form-control form-control-alternative" 
												id="extraAddress" placeholder="참고항목" readonly="readonly" name="address3">
											</td>
										</tr>
									</table>
							</div>
						</div>
					</div>
					

				</div>
				<hr class="my-4" />
				<!-- Description -->
				<h6 class="heading-small text-muted mb-4">DRIVER LICENSE</h6>
				<div class="pl-lg-4" style="padding-left: 14px; padding-right: 14px;">
					<div class="form-group">
						<label>About Me</label>
						<textarea rows="4" class="form-control form-control-alternative"
							placeholder="A few words about you ...">A beautiful Dashboard for Bootstrap 4. It is Free and Open Source.</textarea>
					</div>
				</div>
				
				<hr class="my-4" />
				<!-- Description -->
				<h6 class="heading-small text-muted mb-4">SOCIAL LOGIN&nbsp;&&nbsp;PUSH </h6>
				<div class="pl-lg-4" style="padding-left: 14px; padding-right: 14px;">
					<div class="form-group">
						<label>About Me</label>
						<textarea rows="4" class="form-control form-control-alternative"
							placeholder="A few words about you ...">A beautiful Dashboard for Bootstrap 4. It is Free and Open Source.</textarea>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>