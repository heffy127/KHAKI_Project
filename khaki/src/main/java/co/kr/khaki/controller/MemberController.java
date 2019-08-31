package co.kr.khaki.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.member.AuthNumber;
import co.kr.khaki.member.HashingPw;
import co.kr.khaki.member.LicenseDTO;
import co.kr.khaki.member.Mail_auth;
import co.kr.khaki.member.Mail_findId;
import co.kr.khaki.member.Mail_findPw;
import co.kr.khaki.member.Mail_mypageAuth;
import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.member.MemberDTO;
import co.kr.khaki.member.SocialDTO;
import co.kr.khaki.member.TempPw;

@Controller
public class MemberController {

	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping("profile.do")
	public String member() {
		
		return "member/profile";
	}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request, Model model) {
		// 아이디 저장된 쿠키 가져오기
		Cookie[] getCookie = request.getCookies();
		if(getCookie != null) {
			for(int i=0; i<getCookie.length; i++) {
				Cookie c = getCookie[i];
				String name = c.getName();
				String value = c.getValue();
				if(name.equals("userid"))
					model.addAttribute("userid", value);
			}
		}
		return "member/login";
	}
		
	@RequestMapping("loginCheck.do")
	public String loginCheck(HttpServletResponse response, HttpServletRequest request, 
			MemberDTO memberDTO, HashingPw hp ,String id, String pw, String forCookie, Model model) {
		memberDTO = memberDAO.selectId(id);
		if(memberDTO == null) {	// 아이디가 없을때
			model.addAttribute("loginCheck", "no");
		}else if(hp.pwCheck(pw, memberDTO.getPw()).equals("yes")) { // 아이디와 비밀번호 일치
			if(forCookie.equals("yes")) { // 아이디 저장 허용시 쿠키 생성
				Cookie cookie = new Cookie("userid", memberDTO.getId());
				cookie.setPath("/"); // 쿠키를 찾을 경로
				cookie.setMaxAge(60*60*24*7); // 쿠키 유효기간 7일
				response.addCookie(cookie);
			}else {
				Cookie cookie = new Cookie("userid", null); // 아이디 저장 미체크시 삭제
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
				}
			model.addAttribute("loginCheck", "yes");
		}else { // 아이디는 있지만 비밀번호와 불일치
			model.addAttribute("loginCheck", "no");
		}
		return "member/loginCheck";
	}
	
	@RequestMapping("findId.do")
	public String findId() {
		
		return "member/findId";
	}
	
	@RequestMapping("findId_email.do")
	public String findId_email() {
		
		return "member/findId_email";
	}
	
	// 이메일로 아이디 찾기 전 해당 이메일과 이름이 존재하는지 검사 
	@RequestMapping("emailNameCheck.do")
	public String emailNameCheck(MemberDTO memberDTO, Model model) {
		model.addAttribute("emailCheck", memberDAO.emailNameCheck(memberDTO));
		return "register/emailCheck";
	}
	
	// 아이디 찾기 위한 이메일 보내기
	@RequestMapping("findId_email_go.do")
	public String findId_email_go(MemberDTO memberDTO, Model model) {
		memberDTO = memberDAO.selectEmail(memberDTO);
		Mail_findId mail = new Mail_findId();
		mail.mailSender(memberDTO);
			
		return "member/find_modalCloser"; // ajax를 통해 회원정보 찾기 진행 후 모달을 닫기 위한 페이지
	}	
	
	@RequestMapping("findId_phone.do")
	public String findId_phone() {
		
		return "member/findId_phone";
	}
	
	// 휴대폰 번호로 아이디 찾기 전 해당 이메일과 이름이 존재하는지 검사 
	@RequestMapping("phoneNameCheck.do")
	public String phoneNameCheck(MemberDTO memberDTO, Model model) {
		model.addAttribute("phoneCheck", memberDAO.phoneNameCheck(memberDTO));
		return "register/phoneCheck";
	}
	
	// 아이디 찾기 위한 문자 보내기
	@RequestMapping("findId_phone_go.do")
	public String findId_phone_go(MemberDTO memberDTO, Model model) {
		memberDTO = memberDAO.selectPhone(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		return "sms/smsFindId"; 
	}	

	@RequestMapping("find_modalCloser.do")
	public String find_modalCloser() {
		
		return "member/find_modalCloser"; // 아이디 정보를 문자 보낸 후 모달을 닫기 위한 페이지
	}	
	
	@RequestMapping("findPw.do")
	public String findPw() {
		
		return "member/findPw";
	}
	
	@RequestMapping("findPw_email.do")
	public String findPw_email() {
		
		return "member/findPw_email";
	}
	
	// 이메일로 임시 비밀번호 발급 전 해당 이메일과 이름과 아이디가 존재하는지 검사 
	@RequestMapping("emailIdNameCheck.do")
	public String emailIdNameCheck(MemberDTO memberDTO, Model model) {
		model.addAttribute("emailCheck", memberDAO.emailIdNameCheck(memberDTO));
		
		return "register/emailCheck";
	}
	
	// 임시 비밀번호를 담은 이메일 보내기
		@RequestMapping("findPw_email_go.do")
		public String findPw_email_go(MemberDTO memberDTO, TempPw tp, HashingPw hp, Model model) {
			memberDTO = memberDAO.selectEmail(memberDTO);
			memberDTO.setPw(tp.setTempPw()); // 임시 비밀번호 생성
			Mail_findPw mail = new Mail_findPw();
			mail.mailSender(memberDTO);
			memberDAO.updatePw(hp.hash(memberDTO)); // 임시 비밀번호 암호화 후 업데이트
				
			return "member/find_modalCloser"; // ajax를 통해 회원정보 찾기 진행 후 모달을 닫기 위한 페이지
		}	
	
	@RequestMapping("findPw_phone.do")
	public String findPw_phone() {
			
		return "member/findPw_phone";
	}
		
	// 문자로 임시 비밀번호 발급 전 해당 번호와 이름과 아이디가 존재하는지 검사 
	@RequestMapping("phoneIdNameCheck.do")
	public String phoneIdNameCheck(MemberDTO memberDTO, Model model) {
		model.addAttribute("phoneCheck", memberDAO.phoneIdNameCheck(memberDTO));
		
		return "register/phoneCheck";
	}
	
	// 아이디 찾기 위한 문자 보내기
	@RequestMapping("findPw_phone_go.do")
	public String findPw_phone_go(MemberDTO memberDTO,  TempPw tp, HashingPw hp, Model model) {
		memberDTO = memberDAO.selectPhone(memberDTO);
		memberDTO.setPw(tp.setTempPw()); // 임시 비밀번호 생성
		String temp = memberDTO.getPw(); // 임시 비밀번호 변수에 저장
		memberDAO.updatePw(hp.hash(memberDTO)); // 암호화 시켜서 DB에 저장 후
		memberDTO.setPw(temp); // 암호화 되기 전 비밀번호를 다시 DTO에 넣어 문자 발송
			
		model.addAttribute("memberDTO", memberDTO);
		return "sms/smsFindPw"; 
		}	
	
	// 마이페이지 탭 회원정보 수정 iframe
	@RequestMapping("mypage_memberInfo.do")
	public String memberInfo(MemberDTO memberDTO, LicenseDTO licenseDTO, SocialDTO socialDTO_naver, SocialDTO socialDTO_kakao, Model model, HttpSession session) {
		String id = (String)session.getAttribute("sessionId");
		memberDTO = memberDAO.selectId(id);
		licenseDTO = memberDAO.selectId_license(id);
		socialDTO_naver = memberDAO.selectId_naver(id);
		socialDTO_kakao = memberDAO.selectId_kakao(id);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("licenseDTO", licenseDTO);
		model.addAttribute("socialDTO_naver", socialDTO_naver);
		model.addAttribute("socialDTO_kakao", socialDTO_kakao);
		return "mypage/memberInfo"; 
		}	
	
	// 마이페이지 비밀번호 변경 버튼 클릭 시 현재 비밀번호 확인 위해 이쪽으로 넘어옴
	@RequestMapping("mypage_pwCheck.do")
	public String pwCheck(HttpServletResponse response, HttpServletRequest request, 
			MemberDTO memberDTO, HashingPw hp ,String pw,Model model) {
			System.out.println(memberDTO.getId());
			System.out.println(pw);
			memberDTO = memberDAO.selectId(memberDTO.getId());
			if(hp.pwCheck(pw, memberDTO.getPw()).equals("yes")) { // 아이디와 비밀번호 일치
				model.addAttribute("check", "yes");
			}else { // 아이디는 있지만 비밀번호와 불일치
				model.addAttribute("check", "no");
			}
			return "mypage/allCheck";
	}
	
	// 마이페이지 비밀번호 변경 창
	@RequestMapping("mypage_newPw.do")
	public String newPw(String id, Model model) { // 비밀번호를 변경할 id값을 챙겨옴 (쿼리 스트링)
		System.out.println(id);
		model.addAttribute("id",id);
		return "mypage/newPw";
	}
	
	// 비밀번호 DB와 새로운 비밀번호 입력 체크
	@RequestMapping("mypage_newPw_check.do")
	public String newPw_check(MemberDTO memberDTO, String pw, HashingPw hp ,Model model) {
		System.out.println(pw);
		memberDTO = memberDAO.selectId(memberDTO.getId());
		if(hp.pwCheck(pw, memberDTO.getPw()).equals("yes")) { // 아이디와 비밀번호 일치
			model.addAttribute("check", "yes");
		}else { // 아이디는 있지만 비밀번호와 불일치
			model.addAttribute("check", "no");
		}
		return "mypage/allCheck";
	}
	
	// 마이페이지 비밀번호 변경 완료
	@RequestMapping("mypage_newPw_fin.do")
	public String newPw_fin(MemberDTO memberDTO, HashingPw hp) {
		System.out.println("바뀔 아이디" + memberDTO.getId());
		System.out.println("바뀔 비번" + memberDTO.getPw());
		memberDAO.updatePw(hp.hash(memberDTO)); // 비밀번호 암호화 후 변경
		return "mypage/allCheck"; // ajax용
	}
	
	// 이메일 인증코드 전송
	@RequestMapping("mypage_emailAuth.do")
	public String mypage_emailAuth(MemberDTO memberDTO, Model model) {
		AuthNumber ean = new AuthNumber();
		Mail_mypageAuth mail = new Mail_mypageAuth();
		String authNum = ean.makeAuthNum();
		mail.mailSender(memberDTO, authNum);
		
		model.addAttribute("authNum", authNum);
		return "mypage/emailAuthNum"; // 이메일 인증번호를 memberInfo로 가져오는 jsp
	}
	
	// 사용자가 마이페이지 이메일 인증 링크를 눌렀을 때
	@RequestMapping("mypage_emailAuth_ok.do")
	public String mypage_emailAuth_ok(MemberDTO memberDTO, String emailAuthNum, Model model,  HttpSession session) {
		
		model.addAttribute("emailAuthNum", emailAuthNum);
		return "mypage/emailAuthMypage";
	}
	
	// 마이페이지 이메일 인증완료 버튼 클릭
	@RequestMapping("mypage_emailAuth_endBtn.do")
	public String emailAuthMypage_endBtn() {
		
		return "mypage/emailAuth_end";
	}
	
	// 이메일 인증완료 후 업데이트
	@RequestMapping("mypage_emailAuth_fin.do")
	public String emailAuthMypage_fin(MemberDTO memberDTO) {
		memberDAO.updateEmail(memberDTO);
		
		return "mypage/allCheck"; // ajax용
	}
	
	// 휴대폰 번호 인증완료 후 업데이트
	@RequestMapping("mypage_phoneAuth_fin.do")
	public String mypage_phoneAuth_fin(MemberDTO memberDTO) {
		memberDAO.updatePhone(memberDTO);
		
		return "mypage/allCheck"; // ajax용
	}
	
	// 사용자가 마이페이지 이메일 인증 취소 버튼을 눌렀을 때
	@RequestMapping("mypage_emailAuthDelete.do")
	public String mypage_emailAuthDelete(HttpSession session) {
		session.removeAttribute("sessionMypageAuthNum");
		//세션을 삭제함으로써 인증번호 정보를 지움
		
		return "mypage/allCheck"; // ajax용

	}

}
