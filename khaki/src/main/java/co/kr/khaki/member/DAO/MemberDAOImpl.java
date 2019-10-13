package co.kr.khaki.member.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.handler.DTO.HandlerStatusDTO;
import co.kr.khaki.member.DTO.InsertPointDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.reservation.DTO.PayDTO;

@Repository
public class MemberDAOImpl implements MemberDAOInter {

   @Autowired
   SqlSessionTemplate my;
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#selectId(java.lang.String)
 */
@Override
public MemberDTO selectId(String id) {
      MemberDTO memberDTO = my.selectOne("memberDAO.selectId", id);
      System.out.println("selectId member 성공");
      return memberDTO;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#selectName(java.lang.String)
 */
@Override
public MemberDTO selectName(String name) {
      MemberDTO memberDTO = my.selectOne("memberDAO.selectName", name);
      System.out.println("selectName member 성공");
      return memberDTO;
   }

   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#selectEmail(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public MemberDTO selectEmail(MemberDTO memberDTO) {
      MemberDTO result = my.selectOne("memberDAO.selectEmail", memberDTO);
      return result;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#emailNameCheck(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String emailNameCheck(MemberDTO memberDTO) {
      String result = my.selectOne("memberDAO.emailNameCheck", memberDTO);
      if(result == null || result.trim().equals(""))
         result = "null";
      return result;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#emailIdNameCheck(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String emailIdNameCheck(MemberDTO memberDTO) {
      String result = my.selectOne("memberDAO.emailIdNameCheck", memberDTO);
      if(result == null || result.trim().equals(""))
         result = "null";
      return result;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#selectPhone(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public MemberDTO selectPhone(MemberDTO memberDTO) {
      MemberDTO result = my.selectOne("memberDAO.selectPhone", memberDTO);
      return result;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#phoneNameCheck(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String phoneNameCheck(MemberDTO memberDTO) {
      String result = my.selectOne("memberDAO.phoneNameCheck", memberDTO);
      if(result == null || result.trim().equals(""))
         result = "null";
      return result;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#phoneIdNameCheck(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String phoneIdNameCheck(MemberDTO memberDTO) {
      String result = my.selectOne("memberDAO.phoneIdNameCheck", memberDTO);
      if(result == null || result.trim().equals(""))
         result = "null";
      return result;
   }
   
@Override
	public String selectPhoto(String memPhoto) {
		String photo = my.selectOne("memberDAO.selectPhoto", memPhoto);
		System.out.println("selectPhoto 완료");
		return photo;
	}


   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#insertMember(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void insertMember(MemberDTO memberDTO) {
      my.insert("memberDAO.insertMember", memberDTO);
      System.out.println("insert 성공");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#updatePoint(co.kr.khaki.member.DTO.InsertPointDTO)
 */
@Override
public void updatePoint(InsertPointDTO insertPointDTO) {
      my.update("memberDAO.updatePoint", insertPointDTO);
      System.out.println("point증가 성공");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#updatePointCount(co.kr.khaki.pay.PayDTO)
 */
@Override
public void updatePointCount(PayDTO payDTO) {
      my.update("memberDAO.updatePointCount", payDTO);
      System.out.println("point, 카운트 증가 성공");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#minusPointCount(co.kr.khaki.pay.PayDTO)
 */
@Override
public void minusPointCount(PayDTO payDTO) {
      my.update("memberDAO.minusPointCount", payDTO);
      System.out.println("point 차감 성공");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#updatePw(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updatePw(MemberDTO memberDTO) {
      my.update("memberDAO.updatePw", memberDTO);
      System.out.println("비밀번호 변경 성공");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#updateEmail(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updateEmail(MemberDTO memberDTO) {
      my.update("memberDAO.updateEmail", memberDTO);
      System.out.println("이메일 변경 성공");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#updatePhone(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updatePhone(MemberDTO memberDTO) {
      my.update("memberDAO.updatePhone", memberDTO);
      System.out.println("휴대폰 번호 변경 성공");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#updateAddress(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updateAddress(MemberDTO memberDTO) {
      my.update("memberDAO.updateAddress", memberDTO);
      System.out.println("주소 변경 성공");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#updatePush(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updatePush(MemberDTO memberDTO) {
      my.update("memberDAO.updatePush", memberDTO);
      System.out.println("마케팅 변경 성공");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#updatePhoto(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updatePhoto(MemberDTO memberDTO) {
      my.update("memberDAO.updatePhoto", memberDTO);
      System.out.println("프사 변경 성공");
   }

   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#updateHandler(co.kr.khaki.handler.DTO.HandlerStatusDTO)
 */
@Override
public void updateHandler(HandlerStatusDTO hsDTO) {
      my.update("memberDAO.updateHandler", hsDTO);
      System.out.println("핸들러 여부 설정");
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberDAO#deleteMember(java.lang.String)
 */
@Override
public void deleteMember(String id) {
      my.delete("memberDAO.deleteMember", id);
      System.out.println("회원정보 삭제");
   }
   
}