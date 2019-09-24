package co.kr.khaki.member.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.member.DTO.SocialDTO;

@Repository
public class SocialDAOImpl implements SocialDAO {

	@Autowired
	SqlSessionTemplate my;
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.SocialDAO#selectId_naver(java.lang.String)
	 */
	@Override
	public SocialDTO selectId_naver(String id) {
		SocialDTO socialDTO = my.selectOne("socialDAO.selectId_naver", id);
		System.out.println("selectId naver 성공");
		return socialDTO;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.SocialDAO#selectId_kakao(java.lang.String)
	 */
	@Override
	public SocialDTO selectId_kakao(String id) {
		SocialDTO socialDTO = my.selectOne("socialDAO.selectId_kakao", id);
		System.out.println("selectId kakao 성공");
		return socialDTO;
	}
	
	// 소셜 가입 여부 확인
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.SocialDAO#snsJoinCheck(co.kr.khaki.member.DTO.SocialDTO)
	 */
	@Override
	public String snsJoinCheck(SocialDTO socialDTO) {
		String result = my.selectOne("socialDAO.snsJoinCheck", socialDTO);
		if(result == null || result.trim().equals(""))
			result = "null";
		return result;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.SocialDAO#insertSocial(co.kr.khaki.member.DTO.SocialDTO)
	 */
	@Override
	public void insertSocial(SocialDTO socialDTO) {
		my.insert("socialDAO.insertSocial", socialDTO);
		System.out.println("insertSocial 성공");
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.SocialDAO#deleteSocial(co.kr.khaki.member.DTO.SocialDTO)
	 */
	@Override
	public void deleteSocial(SocialDTO socialDTO) {
		my.delete("socialDAO.deleteSocial", socialDTO);
		System.out.println("소셜정보 삭제");
	}
}
