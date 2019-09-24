package co.kr.khaki.common;

import org.mindrot.jbcrypt.BCrypt;

import co.kr.khaki.member.DTO.MemberDTO;

public class HashingPw { //bcrypt를 이용한 비밀번호 해싱

	public MemberDTO hash(MemberDTO memberDTO) { // 비밀번호를 암호화
		String hashPw = BCrypt.hashpw(memberDTO.getPw(), BCrypt.gensalt());
		memberDTO.setPw(hashPw);
		return memberDTO;
	}

	public String pwCheck(String userPw, String dbPw) {
		if (userPw != null) {
			
			// 파라미터로 받은 패스워드와 DB에 저장된 암호화값 비교
			if (BCrypt.checkpw(userPw, dbPw)) {
				return "yes";
			}
			return "no";
		}
		return "no";
	}
}
