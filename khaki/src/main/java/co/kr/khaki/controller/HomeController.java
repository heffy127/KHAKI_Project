package co.kr.khaki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.khaki.member.AuthNumber;
import co.kr.khaki.member.MemberDTO;
import co.kr.khaki.member.SocialDTO;

@Controller
public class HomeController {
	
	@RequestMapping("home.do")
	public String home() {
		
		return "home/home";
	}
	
	
}
