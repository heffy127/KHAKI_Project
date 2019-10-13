package co.kr.khaki.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.kr.khaki.common.CalculateMemberLevel;
import co.kr.khaki.common.HashingPw;
import co.kr.khaki.common.TempPw;
import co.kr.khaki.member.DTO.LicenseDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.member.DTO.MemberLevelDTO;
import co.kr.khaki.member.DTO.SocialDTO;
import co.kr.khaki.member.service.MemberServiceInter;

@Controller
public class MemberController {

	@Autowired
	MemberServiceInter memberServiceInter;
	
	@RequestMapping("profile.do")
	public String member(MemberDTO memberDTO, MemberLevelDTO memberLevelDTO, 
			Model model, HttpSession session, CalculateMemberLevel cal, @RequestParam(defaultValue="1") String tab) {
		System.out.println("profile 가기");
		
		memberDTO = memberServiceInter.selectFromId((String)session.getAttribute("sessionId"));

		if(memberDTO == null) {
			return "register/register";
		}
		
		model.addAttribute("memberDTO", memberDTO);

		// Level 정보 가져오기
		memberLevelDTO = memberServiceInter.selectLevelFromId(memberDTO.getId())	;	
		int[] arr = memberServiceInter.showStat(memberLevelDTO);
		model.addAttribute("memberLevelDTO",memberLevelDTO);
		model.addAttribute("expLimit", arr[0]); // 요구 경험치
		model.addAttribute("expPer", arr[1]); // 레벨업까지의 퍼센트
		//
		model.addAttribute("countWrite", memberServiceInter.countMyWrite(memberDTO.getId())); // 내가 쓴 글 count
		model.addAttribute("countCoupon", memberServiceInter.countMyCoupon(memberDTO.getId())); // 내 보유 쿠폰 count
		
		model.addAttribute("tab", tab); // 마이페이지 탭 선택
		return "member/profile";
	}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request, Model model, String license_go) {
		// 아이디 저장된 쿠키 가져오기
		Cookie[] getCookie = request.getCookies();
		if(getCookie != null) {
			for(int i=0; i<getCookie.length; i++) {
				Cookie c = getCookie[i];
				String name = c.getName();
				String value = c.getValue();
				if(name.equals("userid")) // userid 저장위한 쿠키 찾을경우
					model.addAttribute("userid", value); // 넘겨줌
			}
		}
		
		if(license_go != null) { // 사용자가 가입 후 면허증 등록하러 가기 눌렀을경우 
			System.out.println("면허증 등록하러 갈꺼야");
			model.addAttribute("license_go", "ok"); // 로그인하면 바로 면허증 페이지 간다는 표시
		}
		
		return "member/login";
	}
		
	@RequestMapping("loginCheck.do")
	public String loginCheck(HttpServletResponse response, HttpServletRequest request, 
			MemberDTO memberDTO, HashingPw hp ,String id, String pw, String forCookie, Model model) {
		memberDTO = memberServiceInter.selectFromId(id);
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
		model.addAttribute("check", memberServiceInter.emailNameCheck(memberDTO));
		return "register/check";
	}
	
	// 아이디 찾기 위한 이메일 보내기
	@RequestMapping("findId_email_go.do")
	public String findId_email_go(MemberDTO memberDTO, Model model) {
		memberServiceInter.sendEmail_findId(memberDTO);
			
		return "member/find_modalCloser"; // ajax를 통해 회원정보 찾기 진행 후 모달을 닫기 위한 페이지
	}	
	
	@RequestMapping("findId_phone.do")
	public String findId_phone() {
		
		return "member/findId_phone";
	}
	
	// 휴대폰 번호로 아이디 찾기 전 해당 이메일과 이름이 존재하는지 검사 
	@RequestMapping("phoneNameCheck.do")
	public String phoneNameCheck(MemberDTO memberDTO, Model model) {
		model.addAttribute("check", memberServiceInter.phoneNameCheck(memberDTO));
		return "register/check";
	}
	
	// 아이디 찾기 위한 문자 보내기
	@RequestMapping("findId_phone_go.do")
	public String findId_phone_go(MemberDTO memberDTO, Model model) {
		memberDTO = memberServiceInter.selectFromPhone(memberDTO);
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
		model.addAttribute("check", memberServiceInter.emailIdNameCheck(memberDTO));
		
		return "register/check";
	}
	
	// 임시 비밀번호를 담은 이메일 보내기
	@RequestMapping("findPw_email_go.do")
	public String findPw_email_go(MemberDTO memberDTO, TempPw tp, HashingPw hp, Model model) {
		memberServiceInter.sendEmail_findPw(memberDTO);
			
		return "member/find_modalCloser"; // ajax를 통해 회원정보 찾기 진행 후 모달을 닫기 위한 페이지
	}	
	
	@RequestMapping("findPw_phone.do")
	public String findPw_phone() {
			
		return "member/findPw_phone";
	}
		
	// 문자로 임시 비밀번호 발급 전 해당 번호와 이름과 아이디가 존재하는지 검사 
	@RequestMapping("phoneIdNameCheck.do")
	public String phoneIdNameCheck(MemberDTO memberDTO, Model model) {
		model.addAttribute("check", memberServiceInter.phoneIdNameCheck(memberDTO));
		
		return "register/check";
	}
	
	// 비밀번호 찾기 위한 문자 보내기
	@RequestMapping("findPw_phone_go.do")
	public String findPw_phone_go(MemberDTO memberDTO,  TempPw tp, HashingPw hp, Model model) {
		memberDTO = memberServiceInter.sendSms_findPw(memberDTO);
			
		model.addAttribute("memberDTO", memberDTO);
		return "sms/smsFindPw"; 
		}	
	
	// 마이페이지 탭 회원정보 수정 iframe
	@RequestMapping("mypage_memberInfo.do")
	public String memberInfo(MemberDTO memberDTO, LicenseDTO licenseDTO, SocialDTO socialDTO_naver, SocialDTO socialDTO_kakao, Model model, HttpSession session) {
		String id = (String)session.getAttribute("sessionId");
		memberDTO = memberServiceInter.selectFromId(id);
		licenseDTO = memberServiceInter.selectLicenseFromId(id);
		socialDTO_naver = memberServiceInter.selectSocialFromId_naver(id);
		socialDTO_kakao = memberServiceInter.selectSocialFromId_kakao(id);
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
			memberDTO = memberServiceInter.selectFromId(memberDTO.getId());
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
		memberDTO = memberServiceInter.selectFromId(memberDTO.getId());
		if(hp.pwCheck(pw, memberDTO.getPw()).equals("yes")) { // 아이디와 비밀번호 일치
			model.addAttribute("check", "yes");
		}else { // 아이디는 있지만 비밀번호와 불일치
			model.addAttribute("check", "no");
		}
		return "mypage/allCheck";
	}
	
	// 마이페이지 비밀번호 변경 완료
	@RequestMapping("mypage_newPw_fin.do")
	public String newPw_fin(MemberDTO memberDTO) {
		System.out.println("바뀔 아이디" + memberDTO.getId());
		System.out.println("바뀔 비번" + memberDTO.getPw());
		memberServiceInter.updatePw(memberDTO);
		return "mypage/allCheck"; // ajax용
	}
	
	// 이메일 인증코드 전송
	@RequestMapping("mypage_emailAuth.do")
	public String mypage_emailAuth(MemberDTO memberDTO, Model model) {
		
		model.addAttribute("authNum", memberServiceInter.sendEmailAuth_mypage(memberDTO));
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
		memberServiceInter.updateEmail(memberDTO);
		
		return "mypage/allCheck"; // ajax용
	}
	
	
	// 사용자가 마이페이지 이메일 인증 취소 버튼을 눌렀을 때
	@RequestMapping("mypage_emailAuthDelete.do")
	public String mypage_emailAuthDelete(HttpSession session) {
		session.removeAttribute("sessionMypageAuthNum");
		//세션을 삭제함으로써 인증번호 정보를 지움
		
		return "mypage/allCheck"; // ajax용

	}

	// 휴대폰 번호 인증완료 후 업데이트
	@RequestMapping("mypage_phoneAuth_fin.do")
	public String mypage_phoneAuth_fin(MemberDTO memberDTO) {
		memberServiceInter.updatePhone(memberDTO);
		
		return "mypage/allCheck"; // ajax용
	}
	
	// 주소 업데이트
	@RequestMapping("mypage_address_fin.do")
	public String mypage_address_fin(MemberDTO memberDTO) {
		memberServiceInter.updateAddress(memberDTO);
		
		return "mypage/allCheck"; // ajax용
	}
	
	// 마이페이지 운전면허정보 등록 창
	@RequestMapping("mypage_license.do")
	public String license(MemberDTO memberDTO, LicenseDTO licenseDTO, Model model) {
		licenseDTO = memberServiceInter.selectLicenseFromId(memberDTO.getId());
		model.addAttribute("licenseDTO", licenseDTO);
		model.addAttribute("memberDTO",memberDTO);
		return "mypage/license";
	}
		
	// 운전면허 정보 등록 완료
	@RequestMapping("mypage_license_fin.do")
	public String license_fin(LicenseDTO licenseDTO) {
		memberServiceInter.deleteLicense(licenseDTO.getId());
		memberServiceInter.insertLicense(licenseDTO);
		return "mypage/allCheck"; // ajax용
	}
	
	// 마케팅 정보 수신 변경 완료
	@RequestMapping("mypage_push_fin.do")
	public String push_fin(MemberDTO memberDTO) {
		memberServiceInter.updatePush(memberDTO);
		
		return "mypage/allCheck"; // ajax용
	}
	
	// 회원삭제
	@RequestMapping("mypage_deleteMember.do")
	public String mypage_deleteMember(MemberDTO memberDTO) {
		System.out.println("회원삭제 id " + memberDTO.getId());
		memberServiceInter.deleteMember(memberDTO.getId()); // 회원정보 삭제
		
		return "mypage/deleteMember_ok"; // ajax용
	}
	
	// MultiPartFile을 통한 프로필 사진 업로드
	@RequestMapping("photoUpload.do")
	public String photoUpload(MemberDTO memberDTO,MultipartHttpServletRequest mpRequest, Model model, HttpSession session) {
		System.out.println(memberDTO.getId());
		
		MultipartFile mf = mpRequest.getFile("file"); // 이미지 파일 가져오기
		String path = mpRequest.getRealPath("resources/profilePhoto");
		
		memberDTO = memberServiceInter.photoUpload(memberDTO, mf, path); // 이미지 변경 후 다시 memberDTO 가져오기
		
		model.addAttribute("memberDTO", memberDTO);
		session.setAttribute("sessionPhoto", memberDTO.getPhoto()); // 프로필 사진 세션 교체
		
		// Level 정보 가져오기
		MemberLevelDTO memberLevelDTO = memberServiceInter.selectLevelFromId(memberDTO.getId())	;	
		int[] arr = memberServiceInter.showStat(memberLevelDTO);
		model.addAttribute("memberLevelDTO",memberLevelDTO);
		model.addAttribute("expLimit", arr[0]); // 요구 경험치
		model.addAttribute("expPer", arr[1]); // 레벨업까지의 퍼센트
		//
		model.addAttribute("countWrite", memberServiceInter.countMyWrite(memberDTO.getId())); // 내가 쓴 글 count
		model.addAttribute("countCoupon", memberServiceInter.countMyCoupon(memberDTO.getId())); // 내 보유 쿠폰 count
		
		return "member/profile"; // ajax용
	}
	
	// 회원 채팅창
	@RequestMapping("counselingChat.do")
	public String chat() {	
	
		return "chat/counselingChat";
	}


}
