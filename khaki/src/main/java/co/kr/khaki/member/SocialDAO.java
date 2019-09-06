package co.kr.khaki.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SocialDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public SocialDTO selectId_naver(String id) {
		SocialDTO socialDTO = my.selectOne("socialDAO.selectId_naver", id);
		System.out.println("selectId naver 성공");
		return socialDTO;
	}
	
	public SocialDTO selectId_kakao(String id) {
		SocialDTO socialDTO = my.selectOne("socialDAO.selectId_kakao", id);
		System.out.println("selectId kakao 성공");
		return socialDTO;
	}
	
	// 소셜 가입 여부 확인
	public String snsJoinCheck(SocialDTO socialDTO) {
		String result = my.selectOne("socialDAO.snsJoinCheck", socialDTO);
		if(result == null || result.trim().equals(""))
			result = "null";
		return result;
	}
	
	public void insertSocial(SocialDTO socialDTO) {
		my.insert("socialDAO.insertSocial", socialDTO);
		System.out.println("insertSocial 성공");
	}
	
	public void deleteSocial(SocialDTO socialDTO) {
		my.delete("socialDAO.deleteSocial", socialDTO);
		System.out.println("소셜정보 삭제");
	}
}
