package co.kr.khaki.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import co.kr.khaki.member.AuthNumber;
import co.kr.khaki.member.HashingPw;
import co.kr.khaki.member.InsertPointDTO;
import co.kr.khaki.member.Mail_auth;
import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.member.MemberDTO;
import co.kr.khaki.member.SocialDTO;


@Controller
public class RegisterController {
	
	@Autowired
	MemberDAO memberDAO;
	
	
	@RequestMapping("idCheck.do")
	public String idCheck(String idCheck, MemberDTO memberDTO, Model model) {
		memberDTO = memberDAO.selectId(idCheck);
		if(memberDTO == null) {
			model.addAttribute("idCheck", "null");
		} else {
			model.addAttribute("idCheck", memberDTO.getId());
		}
		return "register/idCheck";
	}
	
	@RequestMapping("emailCheck.do")
	public String emailCheck(MemberDTO memberDTO, Model model) {
		memberDTO = memberDAO.selectEmail(memberDTO);
		if(memberDTO == null) {
			model.addAttribute("emailCheck", "null");
		} else {
			model.addAttribute("emailCheck", memberDTO.getEmail_id());
		}
		return "register/emailCheck";
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
	@RequestMapping("emailAuth.do")
	public String emailAuth(MemberDTO memberDTO, Model model) {
		AuthNumber ean = new AuthNumber();
		Mail_auth mail = new Mail_auth();
		String authNum = ean.makeAuthNum();
		mail.mailSender(memberDTO, authNum);
		
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
		memberDTO = memberDAO.selectPhone(memberDTO);
		if(memberDTO == null) {
			model.addAttribute("phoneCheck", "null");
		} else {
			model.addAttribute("phoneCheck", memberDTO.getPhone3());
		}
		return "register/phoneCheck";
	}
	
	// 휴대폰 인증번호 
	@RequestMapping("phoneAuth.do")
	public String phoneAuth2() {
		
		return "register/phoneAuth";
	}
	
	// 회원가입 후 분기
	@RequestMapping("registerEnd.do")
	public String registerEnd(SessionStatus sessionStatus, HttpSession httpSession, MemberDTO memberDTO, 
			SocialDTO socialDTO, HashingPw hp, InsertPointDTO insertPointDTO, String reco, String go) {
		memberDTO = (MemberDTO)httpSession.getAttribute("memberDTO"); 
		go = (String)httpSession.getAttribute("go"); 
		reco = (String)httpSession.getAttribute("reco"); 
		socialDTO = (SocialDTO)httpSession.getAttribute("socialDTO"); 
		System.out.println("여긴 registerEnd " + socialDTO.getSocial_id());
		sessionStatus.setComplete(); // 가입 문자를 위해 생성했던 세션 삭제
		
		memberDTO = hp.hash(memberDTO); // 비밀번호 암호화
		memberDAO.insert(memberDTO); // Member 테이블에 회원정보 저장
		if(!(socialDTO.getSocial_id().equals("null"))) {
			socialDTO.setId(memberDTO.getId()); // Member 테이블 아이디 정보 가져오기 (외래키) 
			memberDAO.insertSocial(socialDTO); // Social 테이블에 저장
		}
		// 가입시 100point 지급
		insertPointDTO.setId(memberDTO.getId());
		insertPointDTO.setPoint(100);
		memberDAO.updatePoint(insertPointDTO);
		if(reco != null && !(reco.trim().equals(""))) {
			// 추천인이 존재할때 20point 지급
			insertPointDTO.setId(reco);
			insertPointDTO.setPoint(20);
			memberDAO.updatePoint(insertPointDTO);			
		}
		if(go.trim().equals("home")) {
			return "home/index";
		}else {
			return "member/login_license";
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
