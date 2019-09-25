package co.kr.khaki.member.DAO;

import co.kr.khaki.handler.DTO.HandlerStatusDTO;
import co.kr.khaki.member.DTO.InsertPointDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.pay.PayDTO;

public interface MemberDAOInter {

	MemberDTO selectId(String id);

	MemberDTO selectName(String name);

	MemberDTO selectEmail(MemberDTO memberDTO);

	String emailNameCheck(MemberDTO memberDTO);

	String emailIdNameCheck(MemberDTO memberDTO);

	MemberDTO selectPhone(MemberDTO memberDTO);

	String phoneNameCheck(MemberDTO memberDTO);

	String phoneIdNameCheck(MemberDTO memberDTO);

	void insertMember(MemberDTO memberDTO);

	void updatePoint(InsertPointDTO insertPointDTO);

	void updatePointCount(PayDTO payDTO);

	void minusPointCount(PayDTO payDTO);

	void updatePw(MemberDTO memberDTO);

	void updateEmail(MemberDTO memberDTO);

	void updatePhone(MemberDTO memberDTO);

	void updateAddress(MemberDTO memberDTO);

	void updatePush(MemberDTO memberDTO);

	void updatePhoto(MemberDTO memberDTO);

	void updateHandler(HandlerStatusDTO hsDTO);

	void deleteMember(String id);

}