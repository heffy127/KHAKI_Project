package co.kr.khaki.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.member.MemberDTO;

@Controller
@SessionAttributes({"sessionId","sessionName"}) // 세션 생성
public class SessionController {

	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping("sessionLogin.do")
	public String sessionLogin(MemberDTO memberDTO, Model model) {	
		memberDTO = memberDAO.selectId_Member(memberDTO.getId());
		model.addAttribute("sessionId", memberDTO.getId());
		model.addAttribute("sessionName", memberDTO.getName());
		
		return "home/index";
	}
	
	@RequestMapping("sessionLoginLicense.do")
	public String sessionLoginLicense(MemberDTO memberDTO, Model model, HttpSession session) {	
		memberDTO = memberDAO.selectId_Member(memberDTO.getId());
		model.addAttribute("sessionId", memberDTO.getId());
		model.addAttribute("sessionName", memberDTO.getName());
		
		return "member/profile";
	}
	
	@RequestMapping("sessionLogout.do")
	public String sessionLogout(SessionStatus sessionStatus) {	
		sessionStatus.setComplete(); // 세션 삭제
		
		return "home/index";
	}
}
