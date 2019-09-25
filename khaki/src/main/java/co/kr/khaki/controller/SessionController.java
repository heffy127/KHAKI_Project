package co.kr.khaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import co.kr.khaki.member.DAO.MemberDAOInter;
import co.kr.khaki.member.DTO.MemberDTO;

@Controller
@SessionAttributes({"sessionId","sessionName","sessionPhoto"}) // 세션 생성
public class SessionController {

	@Autowired
	MemberDAOInter memberDAO;
	
	@RequestMapping("sessionLogin.do")
	public String sessionLogin(MemberDTO memberDTO, Model model) {	
		memberDTO = memberDAO.selectId(memberDTO.getId());
		model.addAttribute("sessionId", memberDTO.getId());
		model.addAttribute("sessionName", memberDTO.getName());
		model.addAttribute("sessionPhoto", memberDTO.getPhoto());
		
		return "home/index";
	}
	
	@RequestMapping("sessionLoginLicense.do")
	public String sessionLoginLicense(MemberDTO memberDTO, Model model) {	
		memberDTO = memberDAO.selectId(memberDTO.getId());
		model.addAttribute("sessionId", memberDTO.getId());
		model.addAttribute("sessionName", memberDTO.getName());
		model.addAttribute("sessionPhoto", memberDTO.getPhoto());
		return "member/profile";
	}
	
	@RequestMapping("sessionLogout.do")
	public String sessionLogout(SessionStatus sessionStatus) {	
		sessionStatus.setComplete(); // 세션 삭제
		
		return "home/index";
	}
}
