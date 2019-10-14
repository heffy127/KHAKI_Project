<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("FeRQ2NAEFDfGZe9uWQc8", "http://localhost:9999/khaki/callback_login.do");
  // 접근 토큰 값 출력
 /*  alert(naver_id_login.oauthParams.access_token); */
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    var naver_email = naver_id_login.getProfileData('email');
    var naver_id = naver_id_login.getProfileData('id');
    $.ajax({ // 소셜 로그인에 id가 저장되어 있는지 조회
		url: "checkSocialMypage.do",
		type: 'POST',
		data: {	
				"social_id" : naver_id,
				"social_type" : "naver"
				},
		success: function(result){
			var check = result.trim() // already가 아닌경우 sessionId값을 가져옴
			if(check == 'already'){ // 해당 네이버 계정으로 다른 아이디 소셜 계정 연결
				alert("이미 다른 KHAKI 계정에서 사용중입니다.")
				opener.parent.location.reload();
				window.close()
				
			}else{ // social 테이블에 data 생성
				$.ajax({
					url: "mypage_socialInsert.do",
					type: 'POST',
					data: {	
							"id" : check,
							"social_id" : naver_id,
							"social_type" : "naver"
							},
					success: function(result){
						alert("네이버 소셜 연동이 완료되었습니다.")
						opener.parent.location.reload();
						window.close()
					}
				})
			}
		}
	})
  }
  
</script>
</body>
</html>