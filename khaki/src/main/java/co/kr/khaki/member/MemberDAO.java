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
		System.out.println("selectId member 성공");
		return memberDTO;
	}
	
	public LicenseDTO selectId_license(String id) {
		LicenseDTO licenseDTO = my.selectOne("memberDAO.selectId_license", id);
		System.out.println("selectId license 성공");
		return licenseDTO;
	}
	
	public SocialDTO selectId_naver(String id) {
		SocialDTO socialDTO = my.selectOne("memberDAO.selectId_naver", id);
		System.out.println("selectId naver 성공");
		return socialDTO;
	}
	
	public SocialDTO selectId_kakao(String id) {
		SocialDTO socialDTO = my.selectOne("memberDAO.selectId_kakao", id);
		System.out.println("selectId kakao 성공");
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
	
	public void insertLicense(LicenseDTO licenseDTO) {
		my.insert("memberDAO.insertLicense", licenseDTO);
		System.out.println("insertLicense 성공");
	}
	
	public void updatePoint(InsertPointDTO insertPointDTO) {
		my.update("memberDAO.updatePoint", insertPointDTO);
		System.out.println("point증가 성공");
	}
	
	public void updatePw(MemberDTO memberDTO) {
		my.update("memberDAO.updatePw", memberDTO);
		System.out.println("비밀번호 변경 성공");
	}
	
	public void updateEmail(MemberDTO memberDTO) {
		my.update("memberDAO.updateEmail", memberDTO);
		System.out.println("이메일 변경 성공");
	}
	
	public void updatePhone(MemberDTO memberDTO) {
		my.update("memberDAO.updatePhone", memberDTO);
		System.out.println("휴대폰 번호 변경 성공");
	}
	
	public void updateAddress(MemberDTO memberDTO) {
		my.update("memberDAO.updateAddress", memberDTO);
		System.out.println("주소 변경 성공");
	}

	public void updateHandler(HandlerStatusDTO hsDTO) {
		my.update("memberDAO.updateHandler", hsDTO);
		System.out.println("핸들러 여부 설정");
	}
	
	public void deleteLicense(String id) {
		my.delete("memberDAO.deleteLicense", id);
		System.out.println("면허정보 삭제");
	}
	
	public void deleteSocial(SocialDTO socialDTO) {
		my.delete("memberDAO.deleteSocial", socialDTO);
		System.out.println("소셜정보 삭제");
	}
	
	public List<MemberDTO> selectAll() {
		List<MemberDTO> list = my.selectList("memberDAO.selectAll");
		System.out.println("selectAll 성공");
		return list;
	}

}
