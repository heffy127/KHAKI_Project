<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("FeRQ2NAEFDfGZe9uWQc8", "http://localhost:9999/khaki/callback_register.do");
  // 접근 토큰 값 출력
 /*  alert(naver_id_login.oauthParams.access_token); */
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    var naver_email = naver_id_login.getProfileData('email');
    var naver_id = naver_id_login.getProfileData('id');
    $.ajax({ // 소셜 로그인에 id가 저장되어 있는지 조회
		url: "checkSocialJoin.do?social_id=" + naver_id + "&social_type=naver",
		success: function(result){
			var check = result
			if(check.trim() != 'null'){ // Social 테이블에 저장된 값 있으면 이미 가입된 회원
				alert("이미 가입된 회원이십니다.")
				opener.parent.location.replace("sessionLogin.do?id="+check);
				window.close()
				
			}else{ // 가입 안된 상태이므로 가입창으로 넘어감  
				opener.parent.location.replace("register2.do?social_id=" + naver_id + "&social_type=naver");
				window.close()
			}
		}
	})
  }
  
</script>
</body>
</html>