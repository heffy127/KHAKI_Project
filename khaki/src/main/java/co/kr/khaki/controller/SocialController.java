package co.kr.khaki.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.member.SocialDTO;

@Controller
public class SocialController {

	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping("callback_login.do")
	public String callback_login(HttpSession session) {

		return "social/callback_login";
	}
	
	@RequestMapping("callback_register.do")
	public String callback_register(HttpSession session) {
		
		return "social/callback_register";
	}
	
	@RequestMapping("callback_mypage.do")
	public String callback_mypage(HttpSession session) {
		
		return "social/callback_mypage";
	}
	
	// 소셜 가입여부 파악
	@RequestMapping("checkSocialJoin.do")
	public String checkSocialMember(SocialDTO socialDTO, Model model) {
		System.out.println("소셜 가입여부 파악" + socialDTO.getSocial_id());
		String result = memberDAO.snsJoinCheck(socialDTO);
		model.addAttribute("checkSocialJoin", result);
		
		return "social/checkSocialJoin";
	}
	
	// 마이페이지 소셜 가입 체크 
	@RequestMapping("checkSocialMypage.do")
	public String checkSocialMypage(SocialDTO socialDTO, Model model, HttpSession session) {
		String id = (String)session.getAttribute("sessionId"); // 세션에 저장된 id값
		System.out.println("소셜id "+socialDTO.getSocial_id());
		System.out.println("세션id "+id);
		String dbId = memberDAO.snsJoinCheck(socialDTO);
		System.out.println(dbId);
		if(!(dbId.equals("null"))) { // null이 아닌경우 해당 네이버 계정으로 다른 아이디 소셜 계정 연결
			System.out.println("이미 존재하는 소셜");
			model.addAttribute("checkSocialJoin", "already");
		} else { // 소셜 연동 가능
			System.out.println("소셜 가입 가능");
			model.addAttribute("checkSocialJoin", id); // 세션에 저장된 아이디 값을 넘겨줌 (소셜 가입을 위함)
		}
		
		return "social/checkSocialJoin";
	}
	
	// 마이페이지 소셜 연동
	@RequestMapping("mypage_socialInsert.do")
	public String mypage_socialInsert(SocialDTO socialDTO, Model model) {
		System.out.println(socialDTO.getId());
		System.out.println(socialDTO.getSocial_id());
		memberDAO.insertSocial(socialDTO);
		
		return "social/checkSocialJoin";
	}
	
	// 마이페이지 소셜 연동 해제
	@RequestMapping("mypage_socialDelete.do")
	public String mypage_socialDelete(SocialDTO socialDTO, Model model) {
		System.out.println("삭제될 id " + socialDTO.getId() + " 삭제될 사이트 " + socialDTO.getSocial_type());
		memberDAO.deleteSocial(socialDTO);
		
		return "social/checkSocialJoin";
	}
}
