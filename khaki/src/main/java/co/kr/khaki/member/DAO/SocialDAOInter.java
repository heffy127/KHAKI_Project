package co.kr.khaki.member.DAO;

import co.kr.khaki.member.DTO.SocialDTO;

public interface SocialDAOInter {

	SocialDTO selectId_naver(String id);

	SocialDTO selectId_kakao(String id);

	// 소셜 가입 여부 확인
	String snsJoinCheck(SocialDTO socialDTO);

	void insertSocial(SocialDTO socialDTO);

	void deleteSocial(SocialDTO socialDTO);

}