package co.kr.khaki.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.khaki.common.AuthNumber;
import co.kr.khaki.common.HashingPw;
import co.kr.khaki.common.Mail_auth;
import co.kr.khaki.member.DAO.LicenseDAO;
import co.kr.khaki.member.DAO.MemberDAO;
import co.kr.khaki.member.DAO.MemberLevelDAO;
import co.kr.khaki.member.DAO.SocialDAO;
import co.kr.khaki.member.DTO.InsertPointDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.member.DTO.SocialDTO;

@Service
public class MemberServiceImpl {
   @Autowired
   MemberDAO memberDAO;
   @Autowired
   MemberLevelDAO memberLevelDAO;
   @Autowired
   LicenseDAO licenseDAO;
   @Autowired
   SocialDAO socialDAO;
   
   // ID로 회원 검색
   public MemberDTO selectFromId(String id) {
      return memberDAO.selectId(id);
   }
   
   
   // email로 회원 검색
   public MemberDTO selectFromEmail(MemberDTO memberDTO) {
      
      return memberDAO.selectEmail(memberDTO);
   }
   
   // phone번호로 회원 검색
   public MemberDTO selectFromPhone(MemberDTO memberDTO) {
      
      return memberDAO.selectPhone(memberDTO);
   }
   
   // 해당 정보가 존재하는 id가 있는지 검색
   public String check(MemberDTO memberDTO) {
      if(memberDTO == null) {
         return "null";
      } else {
         return memberDTO.getId();
      }
   }
   
   // 회원 이메일로 가입 인증번호 전송
   public String sendEmailAuth(MemberDTO memberDTO) {
      AuthNumber ean = new AuthNumber();
      Mail_auth mail = new Mail_auth();
      String authNum = ean.makeAuthNum();
      mail.mailSender(memberDTO, authNum);
      
      return authNum;
   }
   
   // 비밀번호 해시화 후 DB에 저장
   public void insertHashPw(MemberDTO memberDTO) {
      HashingPw hp = new HashingPw();
      memberDTO = hp.hash(memberDTO);  // 비밀번호 암호화
      memberDAO.insertMember(memberDTO);  // Member 테이블에 회원정보 저장
   }
   
   // 소셜 가입의 경우 social 테이블에 저장
   public void insertSocial(SocialDTO socialDTO, MemberDTO memberDTO) {
      if(!(socialDTO.getSocial_id().equals("null"))) {
         socialDTO.setId(memberDTO.getId()); // Member 테이블 아이디 정보 가져오기 (외래키) 
         socialDAO.insertSocial(socialDTO); // Social 테이블에 저장
         return;
      } else {
         return;
      }
   }
   
   // 회원 포인트 변경
   public void updatePoint(String id, int point) {
      InsertPointDTO insertPointDTO = new InsertPointDTO();
      insertPointDTO.setId(id);
      insertPointDTO.setPoint(point);
      memberDAO.updatePoint(insertPointDTO);
   }
   
   // 추천인 포인트 변경
   public void updatePointReco(String reco, String id, int point) {
      if(reco != null && !(reco.trim().equals(""))) {
         InsertPointDTO insertPointDTO = new InsertPointDTO();
         insertPointDTO.setId(id);
         insertPointDTO.setPoint(point);
         memberDAO.updatePoint(insertPointDTO);
         return;
      } else {
         return;
      }
   }
   
   // 회원 레벨 생성
   public void insertLevel(String id) {
      
      memberLevelDAO.insert(id);
   }
}