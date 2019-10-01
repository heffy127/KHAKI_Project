package co.kr.khaki.member.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import co.kr.khaki.board.BoardDAO;
import co.kr.khaki.common.AuthNumber;
import co.kr.khaki.common.CalculateMemberLevel;
import co.kr.khaki.common.HashingPw;
import co.kr.khaki.common.Mail_auth;
import co.kr.khaki.common.Mail_findId;
import co.kr.khaki.common.Mail_findPw;
import co.kr.khaki.common.Mail_mypageAuth;
import co.kr.khaki.common.TempPw;
import co.kr.khaki.member.DAO.LicenseDAOInter;
import co.kr.khaki.member.DAO.MemberDAOInter;
import co.kr.khaki.member.DAO.MemberLevelDAOInter;
import co.kr.khaki.member.DAO.SocialDAOInter;
import co.kr.khaki.member.DTO.InsertPointDTO;
import co.kr.khaki.member.DTO.LicenseDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.member.DTO.MemberLevelDTO;
import co.kr.khaki.member.DTO.SocialDTO;
import co.kr.khaki.reservation.DAO.PayDAOImpl;

@Service
public class MemberServiceImpl implements MemberServiceInter {
   @Autowired
   MemberDAOInter memberDAO;
   @Autowired
   MemberLevelDAOInter memberLevelDAO;
   @Autowired
   LicenseDAOInter licenseDAO;
   @Autowired
   SocialDAOInter socialDAO;
   @Autowired
   BoardDAO boardDAO;
   @Autowired
   PayDAOImpl payDAO;
   
   // ID로 회원 검색
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#selectFromId(java.lang.String)
 */
@Override
public MemberDTO selectFromId(String id) {
      return memberDAO.selectId(id);
   }

   // email로 회원 검색
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#selectFromEmail(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public MemberDTO selectFromEmail(MemberDTO memberDTO) {
      
      return memberDAO.selectEmail(memberDTO);
   }
   
   // phone번호로 회원 검색
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#selectFromPhone(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public MemberDTO selectFromPhone(MemberDTO memberDTO) {
      
      return memberDAO.selectPhone(memberDTO);
   }
   
   // ID로 licenseDTO 찾기
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#selectLicenseFromId(java.lang.String)
 */
@Override
public LicenseDTO selectLicenseFromId(String id) {
	   
	   return licenseDAO.selectId(id);
   }
   
   // id로 해당 회원 MemberLevelDTO 찾기
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#selectLevelFromId(java.lang.String)
 */
@Override
public MemberLevelDTO selectLevelFromId(String id) {
	   
	   return memberLevelDAO.selectId(id);
   }
   
   // id로 해당 회원 Naver 로그인 ID 찾기
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#selectSocialFromId_naver(java.lang.String)
 */
@Override
public SocialDTO selectSocialFromId_naver(String id) {
	   
	   return socialDAO.selectId_naver(id);
   }
   
   // id로 해당 회원 Kakao 로그인 ID 찾기
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#selectSocialFromId_kakao(java.lang.String)
 */
@Override
public SocialDTO selectSocialFromId_kakao(String id) {
	   
	   return socialDAO.selectId_kakao(id);
   }
   
   // 내가 쓴 글 count
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#countMyWrite(java.lang.String)
 */
@Override
public int countMyWrite(String writer) {
	   
	   return boardDAO.countWrite(writer);
   }
   
   // 나의 예약 count
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#countMyReservation(java.lang.String)
 */
@Override
public int countMyReservation(String id) {
	   
	   return payDAO.countReservation(id);
   }
   
   // 해당 정보가 존재하는 id가 있는지 검색
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#check(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String check(MemberDTO memberDTO) {
      if(memberDTO == null) {
         return "null";
      } else {
         return memberDTO.getId();
      }
   }

   // 이메일로 아이디 찾기 전 해당 이메일과 이름이 존재하는지 검사 
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#emailNameCheck(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String emailNameCheck(MemberDTO memberDTO) {
	   
	   return memberDAO.emailNameCheck(memberDTO);
   }
   
   // 휴대폰 번호로 아이디 찾기 전 해당 이메일과 이름이 존재하는지 검사 
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#phoneNameCheck(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String phoneNameCheck(MemberDTO memberDTO) {
	   
	   return memberDAO.phoneNameCheck(memberDTO);
   }
   
   // 이메일로 임시 비밀번호 발급 전 해당 이메일과 이름과 아이디가 존재하는지 검사 
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#emailIdNameCheck(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String emailIdNameCheck(MemberDTO memberDTO) {
	   
	   return memberDAO.emailIdNameCheck(memberDTO);
   }
   
   // 문자로 임시 비밀번호 발급 전 해당 번호와 이름과 아이디가 존재하는지 검사 
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#phoneIdNameCheck(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String phoneIdNameCheck(MemberDTO memberDTO) {
	   
	   return memberDAO.phoneIdNameCheck(memberDTO);
   }
   
   // 회원 이메일로 가입 인증번호 전송
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#sendEmailAuth(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String sendEmailAuth(MemberDTO memberDTO) {
      AuthNumber ean = new AuthNumber();
      Mail_auth mail = new Mail_auth();
      String authNum = ean.makeAuthNum();
      mail.mailSender(memberDTO, authNum);
      
      return authNum;
   }
   
   // 회원 이메일로 마이페이지 이메일 인증번호 전송
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#sendEmailAuth_mypage(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public String sendEmailAuth_mypage(MemberDTO memberDTO) {
	   AuthNumber ean = new AuthNumber();
	   Mail_mypageAuth mail = new Mail_mypageAuth();
	   String authNum = ean.makeAuthNum();
	   mail.mailSender(memberDTO, authNum);
	   
	   return authNum;
   }
   
   // 회원 이메일로 이메일 찾기 메일 전송
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#sendEmail_findId(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void sendEmail_findId(MemberDTO memberDTO) {
	   memberDTO = memberDAO.selectEmail(memberDTO);
	   Mail_findId mail = new Mail_findId();
	   mail.mailSender(memberDTO);
   }
   
   // 회원 이메일로 임시 비밀번호를 담은 이메일 전송
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#sendEmail_findPw(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void sendEmail_findPw(MemberDTO memberDTO) {
	    TempPw tp = new TempPw(); // 임시비밀번호 생성 객체
	    HashingPw hp = new HashingPw(); // 비밀번호 해시화 객체
	   	memberDTO = memberDAO.selectEmail(memberDTO);
		memberDTO.setPw(tp.setTempPw()); // 임시 비밀번호 생성
		Mail_findPw mail = new Mail_findPw();
		mail.mailSender(memberDTO);
		memberDAO.updatePw(hp.hash(memberDTO)); // 임시 비밀번호 암호화 후 업데이트
   }
   
   // 회원 휴대폰 번호로 임시 비밀번호 전송 전 DB에 저장
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#sendSms_findPw(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void sendSms_findPw(MemberDTO memberDTO) {
	   TempPw tp = new TempPw(); // 임시비밀번호 생성 객체
	   HashingPw hp = new HashingPw(); // 비밀번호 해시화 객체
		memberDTO = memberDAO.selectPhone(memberDTO);
		memberDTO.setPw(tp.setTempPw()); // 임시 비밀번호 생성
		String temp = memberDTO.getPw(); // 임시 비밀번호 변수에 저장
		memberDAO.updatePw(hp.hash(memberDTO)); // 암호화 시켜서 DB에 저장 후
		memberDTO.setPw(temp); // 암호화 되기 전 비밀번호를 다시 DTO에 넣어 문자 발송
   }
   
   // DB에 저장된 레벨, 경험치 정보를 통해 프로필에 출력시킬 수 있도록 퍼센트화
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#showStat(co.kr.khaki.member.DTO.MemberLevelDTO)
 */
@Override
public int[] showStat(MemberLevelDTO memberLevelDTO) {
	   CalculateMemberLevel cal = new CalculateMemberLevel();
	   
	   return cal.showStat(memberLevelDTO);
   }
   
   // 회원 레벨 생성
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#insertLevel(java.lang.String)
 */
@Override
public void insertLevel(String id) {
      
      memberLevelDAO.insert(id);
   }
   
   
   // 비밀번호 해시화 후 DB에 저장
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#insertHashPw(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void insertHashPw(MemberDTO memberDTO) {
      HashingPw hp = new HashingPw();
      memberDTO = hp.hash(memberDTO);  // 비밀번호 암호화
      memberDAO.insertMember(memberDTO);  // Member 테이블에 회원정보 저장
   }
   
   // 소셜 가입의 경우 social 테이블에 저장 (회원가입 시)
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#insertSocial(co.kr.khaki.member.DTO.SocialDTO, co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void insertSocial(SocialDTO socialDTO, MemberDTO memberDTO) {
      if(!(socialDTO.getSocial_id().equals("null"))) {
         socialDTO.setId(memberDTO.getId()); // Member 테이블 아이디 정보 가져오기 (외래키) 
         socialDAO.insertSocial(socialDTO); // Social 테이블에 저장
      }
   }
   
   // social 테이블에 저장
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#insertSocial(co.kr.khaki.member.DTO.SocialDTO)
 */
@Override
public void insertSocial(SocialDTO socialDTO) {
		
	   socialDAO.insertSocial(socialDTO); // Social 테이블에 저장
   }
   
   // license 테이블에 저장
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#insertLicense(co.kr.khaki.member.DTO.LicenseDTO)
 */
@Override
public void insertLicense(LicenseDTO licenseDTO) {
	   
	   licenseDAO.insertLicense(licenseDTO); // License 테이블에 저장
   }
   
   // 소셜 로그인 가입여부 파악
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#snsJoinCheck(co.kr.khaki.member.DTO.SocialDTO)
 */
@Override
public String snsJoinCheck(SocialDTO socialDTO) {
	   
	   return socialDAO.snsJoinCheck(socialDTO);
   }
   
   // 비밀번호 변경
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#updatePw(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updatePw(MemberDTO memberDTO) {
	   HashingPw hp = new HashingPw();
	   memberDAO.updatePw(hp.hash(memberDTO));  // 비밀번호 암호화 후 변경
   }
   
   // 이메일 변경
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#updateEmail(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updateEmail(MemberDTO memberDTO) {
	   
	   memberDAO.updateEmail(memberDTO);
   }
   
   // 휴대폰 번호 변경
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#updatePhone(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updatePhone(MemberDTO memberDTO) {
	   
	   memberDAO.updatePhone(memberDTO);
   }
   
   // 주소 변경
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#updateAddress(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updateAddress(MemberDTO memberDTO) {
	   
	   memberDAO.updateAddress(memberDTO);
   }
   
   // 푸시 설정 변경
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#updatePush(co.kr.khaki.member.DTO.MemberDTO)
 */
@Override
public void updatePush(MemberDTO memberDTO) {
	   
	   memberDAO.updatePush(memberDTO);
   }
   
   // 회원 포인트 변경
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#updatePoint(java.lang.String, int)
 */
@Override
public void updatePoint(String id, int point) {
      InsertPointDTO insertPointDTO = new InsertPointDTO();
      insertPointDTO.setId(id);
      insertPointDTO.setPoint(point);
      memberDAO.updatePoint(insertPointDTO);
   }
   
   // 추천인 포인트 변경
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#updatePointReco(java.lang.String, java.lang.String, int)
 */
@Override
public void updatePointReco(String reco, String id, int point) {
      if(reco != null && !(reco.trim().equals(""))) {
         InsertPointDTO insertPointDTO = new InsertPointDTO();
         insertPointDTO.setId(id);
         insertPointDTO.setPoint(point);
         memberDAO.updatePoint(insertPointDTO);
      }
   }

   // 회원 정보 삭제
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#deleteMember(java.lang.String)
 */
@Override
public void deleteMember(String id) {
	   
	   memberDAO.deleteMember(id);
   }
   
   // 소셜 계정 삭제
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#deleteSocial(co.kr.khaki.member.DTO.SocialDTO)
 */
@Override
public void deleteSocial(SocialDTO socialDTO) {
	   
	   socialDAO.deleteSocial(socialDTO);
   }
   
   // 운전면허 정보 삭제
   /* (non-Javadoc)
	* @see co.kr.khaki.member.service.MemberService#deleteLicense(java.lang.String)
	*/
@Override
public void deleteLicense(String id) {
	   
	   licenseDAO.deleteLicense(id);
   }
   
   // MultiPartFile을 통한 프로필 사진 업로드
   /* (non-Javadoc)
 * @see co.kr.khaki.member.service.MemberService#photoUpload(co.kr.khaki.member.DTO.MemberDTO, org.springframework.web.multipart.MultipartFile, java.lang.String)
 */
@Override
public MemberDTO photoUpload(MemberDTO memberDTO, MultipartFile mf ,String path) {
	    Calendar today = Calendar.getInstance();
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		String convert = sd.format(today.getTime());
		// 이미지 중복처리 방지용 날짜 String 
		
		String fileName = mf.getOriginalFilename() + "_" + convert;
		System.out.println("path : " + path);
		System.out.println("fileName : " + fileName);
		File uploadFile = new File(path+"//"+fileName); // WAS가 바라보는 폴더에 이미지 저장
		try {
			mf.transferTo(uploadFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		memberDTO.setPhoto("/khaki/resources/profilePhoto/" + fileName);
		memberDAO.updatePhoto(memberDTO);
		
		return memberDAO.selectId(memberDTO.getId());
   }

   
}