package co.kr.khaki.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.handler.HandlerStatusDTO;
import co.kr.khaki.pay.PayDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public MemberDTO selectId(String id) {
		MemberDTO memberDTO = my.selectOne("memberDAO.selectId", id);
		System.out.println("selectId member 성공");
		return memberDTO;
	}
	
	public MemberDTO selectName(String name) {
		MemberDTO memberDTO = my.selectOne("memberDAO.selectName", name);
		System.out.println("selectName member 성공");
		return memberDTO;
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
	
	public void insertMember(MemberDTO memberDTO) {
		my.insert("memberDAO.insertMember", memberDTO);
		System.out.println("insert 성공");
	}
	
	public void updatePoint(InsertPointDTO insertPointDTO) {
		my.update("memberDAO.updatePoint", insertPointDTO);
		System.out.println("point증가 성공");
	}
	
	public void updatePointCount(PayDTO payDTO) {
		my.update("memberDAO.updatePointCount", payDTO);
		System.out.println("point, 카운트 증가 성공");
	}
	
	public void minusPointCount(PayDTO payDTO) {
		my.update("memberDAO.minusPointCount", payDTO);
		System.out.println("point 차감 성공");
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
	
	public void updatePush(MemberDTO memberDTO) {
		my.update("memberDAO.updatePush", memberDTO);
		System.out.println("마케팅 변경 성공");
	}
	
	public void updatePhoto(MemberDTO memberDTO) {
		my.update("memberDAO.updatePhoto", memberDTO);
		System.out.println("프사 변경 성공");
	}

	public void updateHandler(HandlerStatusDTO hsDTO) {
		my.update("memberDAO.updateHandler", hsDTO);
		System.out.println("핸들러 여부 설정");
	}
	
	public void deleteMember(String id) {
		my.delete("memberDAO.deleteMember", id);
		System.out.println("회원정보 삭제");
	}
	
	public List<MemberAllDTO> selectAll_admin() {
		List<MemberAllDTO> list = my.selectList("memberDAO.selectAll_admin");
		System.out.println("selectAll_admin 성공");
		return list;
	}
	
	public List<MemberAllDTO> selectId_admin(String id) {
		List<MemberAllDTO> list = my.selectList("memberDAO.selectId_admin",id);
		System.out.println("selectId_admin 성공");
		return list;
	}
	
	public List<MemberAllDTO> selectName_admin(String name) {
		List<MemberAllDTO> list = my.selectList("memberDAO.selectName_admin",name);
		System.out.println("selectName_admin 성공");
		return list;
	}

}
