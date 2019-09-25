package co.kr.khaki.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import co.kr.khaki.member.DTO.InsertPointDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.member.DTO.SocialDTO;
import co.kr.khaki.member.service.MemberServiceInter;


@Controller
public class RegisterController {

   @Autowired
   MemberServiceInter memberServiceInter;
   
   @RequestMapping("idCheck.do")
   public String idCheck(String idCheck, MemberDTO memberDTO, Model model) {
      memberDTO = memberServiceInter.selectFromId(idCheck);
      model.addAttribute("check", memberServiceInter.check(memberDTO));
      return "register/check";
   }
   
   @RequestMapping("emailCheck.do")
   public String emailCheck(MemberDTO memberDTO, Model model) {
      memberDTO = memberServiceInter.selectFromEmail(memberDTO);
      model.addAttribute("check", memberServiceInter.check(memberDTO));
      return "register/check";
   }
   
   @RequestMapping("register.do") // 가입유형 선택
   public String register() {
      
      return "register/register";
   }
   
   @RequestMapping("register2.do") // 회원약관
   public String register2(SocialDTO socialDTO, Model model) { 
      System.out.println("타입" + socialDTO.getSocial_type());
      System.out.println("id" + socialDTO.getSocial_id());
      model.addAttribute("socialDTO", socialDTO);
      return "register/register2";
   }
   
   @RequestMapping("register3.do") // 이름 비밀번호 이메일 
   public String register3(SocialDTO socialDTO, MemberDTO memberDTO, Model model) {
      System.out.println("여긴 register3 " + socialDTO.getSocial_id());
      model.addAttribute("memberDTO", memberDTO);
      model.addAttribute("socialDTO", socialDTO);
      return "register/register3";
   }
   
   // 이메일 인증코드 전송
   @RequestMapping("emailAuth.do") // ajax용
   public String emailAuth(MemberDTO memberDTO, Model model) {
      String authNum = memberServiceInter.sendEmailAuth(memberDTO);
      model.addAttribute("authNum", authNum);
      return "register/emailAuthNum"; // 이메일 인증번호를 register3로 가져오는 jsp
   }
   
   // 사용자가 이메일 인증 링크를 눌렀을 때
   @RequestMapping("emailAuth_ok.do")
   public String emailAuth_ok(MemberDTO memberDTO, String emailAuthNum, Model model) {
      
      model.addAttribute("emailAuthNum", emailAuthNum);
      return "register/emailAuthUser"; // 인증메일 링크를 통해 인증번호 세션 생성
   }
   
   // 다음버튼 누를때 이메일 인증 여부
   @RequestMapping("emailAuth_next.do")
   public String emailAuth_next() {
   
      return "register/emailAuthNext";
   }
   
   @RequestMapping("register4.do") // 휴대폰 주소 추천인
   public String register4(SocialDTO socialDTO, MemberDTO memberDTO, Model model) {   
      System.out.println("여긴 register4 " + socialDTO.getSocial_id());
      model.addAttribute("memberDTO", memberDTO);
      model.addAttribute("socialDTO", socialDTO);
      
      return "register/register4";
   }
   
   // 휴대폰 중복체크
   @RequestMapping("phoneCheck.do")
   public String phoneCheck(MemberDTO memberDTO, Model model) {
      memberDTO = memberServiceInter.selectFromPhone(memberDTO);
      model.addAttribute("check", memberServiceInter.check(memberDTO));
      return "register/check";
   }
   
   // 휴대폰 인증번호 
   @RequestMapping("phoneAuth.do")
   public String phoneAuth2() {
      
      return "register/phoneAuth";
   }
   
   // 회원가입 후 분기
   @RequestMapping("registerEnd.do")
   public String registerEnd(SessionStatus sessionStatus, HttpSession httpSession, MemberDTO memberDTO, 
         SocialDTO socialDTO, InsertPointDTO insertPointDTO, String reco, String go) {
      memberDTO = (MemberDTO)httpSession.getAttribute("memberDTO"); 
      go = (String)httpSession.getAttribute("go"); 
      reco = (String)httpSession.getAttribute("reco"); 
      socialDTO = (SocialDTO)httpSession.getAttribute("socialDTO"); 
      System.out.println("여긴 registerEnd " + socialDTO.getSocial_id());
      sessionStatus.setComplete(); // 가입 문자를 위해 생성했던 세션 삭제
      
      memberServiceInter.insertHashPw(memberDTO); // 비밀번호 해시화 후 저장
      memberServiceInter.insertSocial(socialDTO, memberDTO); // 소셜 가입의 경우 social 테이블에 저장

      // 가입시 100point 지급
      memberServiceInter.updatePoint(memberDTO.getId(), 100); // 포인트 업데이트
      memberServiceInter.updatePointReco(reco, memberDTO.getId(), 100); // 추천인 포인트 업데이트
      memberServiceInter.insertLevel(memberDTO.getId()); // 회원 레벨 생성
      if(go.trim().equals("home")) {
         return "home/index";
         // 바로 홈으로
      }else {
         return "member/login_index";
         // 면허등록 하기위한 로그인 화면으로
      }
   }
   
   // 회원가입 약관
   @RequestMapping("provision1.do")
   public String provision1() {
      
      return "register/provision1";
   }
   
   @RequestMapping("provision2.do")
   public String provision2() {
      
      return "register/provision2";
   }
   
   @RequestMapping("provision3.do")
   public String provision3() {
      
      return "register/provision3";
   }
   
   @RequestMapping("provision4.do")
   public String provision4() {
      
      return "register/provision4";
   }
}