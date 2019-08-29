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
	
	// 소셜 가입여부 파악
	@RequestMapping("checkSocialJoin")
	public String checkSocialMember(SocialDTO socialDTO, Model model) {
		System.out.println(socialDTO.getSocial_id());
		String result = memberDAO.snsJoinCheck(socialDTO);
		model.addAttribute("checkSocialJoin", result);
		
		return "social/checkSocialJoin";
	}
	
	// 소셜 가입 진행
	@RequestMapping("socialJoin")
	public String socialMember(SocialDTO socialDTO, Model model) {
		System.out.println(socialDTO.getSocial_id());
		String result = memberDAO.snsJoinCheck(socialDTO);
		model.addAttribute("socialJoin", result);
		
		return "social/checkSocialJoin";
	}
}
