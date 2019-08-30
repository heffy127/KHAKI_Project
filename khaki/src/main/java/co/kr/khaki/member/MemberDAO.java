package co.kr.khaki.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.handler.HandlerStatusDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public MemberDTO selectId(String id) {
		MemberDTO memberDTO = my.selectOne("memberDAO.selectId", id);
		System.out.println("selectId 성공");
		return memberDTO;
	}
	
	public LicenseDTO selectId_license(String id) {
		LicenseDTO licenseDTO = my.selectOne("memberDAO.selectId_license", id);
		System.out.println("selectId_license 성공");
		return licenseDTO;
	}
	
	public SocialDTO selectId_social(String id) {
		SocialDTO socialDTO = my.selectOne("memberDAO.selectId_social", id);
		System.out.println("selectId_social 성공");
		return socialDTO;
	}
	
	public MemberDTO selectEmail(MemberDTO memberDTO) {
		MemberDTO result = my.selectOne("memberDAO.selectEmail", memberDTO);
		return result;
	}
	
	public String emailNameCheck(MemberDTO memberDTO) {
		String result = my.selectOne("memberDAO.emailNameCheck", memberDTO);
		if(result == null || result.trim().equals(""))
			result = "null";
		return result;
	}
	
	public String emailIdNameCheck(MemberDTO memberDTO) {
		String result = my.selectOne("memberDAO.emailIdNameCheck", memberDTO);
		if(result == null || result.trim().equals(""))
			result = "null";
		return result;
	}
	
	public MemberDTO selectPhone(MemberDTO memberDTO) {
		MemberDTO result = my.selectOne("memberDAO.selectPhone", memberDTO);
		return result;
	}
	
	public String phoneNameCheck(MemberDTO memberDTO) {
		String result = my.selectOne("memberDAO.phoneNameCheck", memberDTO);
		if(result == null || result.trim().equals(""))
			result = "null";
		return result;
	}
	
	public String phoneIdNameCheck(MemberDTO memberDTO) {
		String result = my.selectOne("memberDAO.phoneIdNameCheck", memberDTO);
		if(result == null || result.trim().equals(""))
			result = "null";
		return result;
	}
	
	// 소셜 가입 여부 확인
	public String snsJoinCheck(SocialDTO socialDTO) {
		String result = my.selectOne("memberDAO.snsJoinCheck", socialDTO);
		if(result == null || result.trim().equals(""))
			result = "null";
		return result;
	}
	
	public void insert(MemberDTO memberDTO) {
		my.insert("memberDAO.insert", memberDTO);
		System.out.println("insert 성공");
	}
	
	public void insertSocial(SocialDTO socialDTO) {
		my.insert("memberDAO.insertSocial", socialDTO);
		System.out.println("insertSocial 성공");
	}
	
	public void updatePoint(InsertPointDTO insertPointDTO) {
		my.update("memberDAO.updatePoint", insertPointDTO);
		System.out.println("point증가 성공");
	}
	
	public void updatePw(MemberDTO memberDTO) {
		my.update("memberDAO.updatePw", memberDTO);
		System.out.println("임시비밀번호 주입 성공");
	}

	public void updateHandler(HandlerStatusDTO hsDTO) {
		my.update("memberDAO.updateHandler", hsDTO);
		System.out.println("핸들러 여부 설정");
	}
	
	public List<MemberDTO> selectAll() {
		List<MemberDTO> list = my.selectList("memberDAO.selectAll");
		System.out.println("selectAll 성공");
		return list;
	}

}
