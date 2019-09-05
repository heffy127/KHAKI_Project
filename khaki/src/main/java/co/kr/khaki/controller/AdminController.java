package co.kr.khaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.member.MemberDAO;

@Controller
public class AdminController {

	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping("admin.do")
	public String admin() {	
	
		return "admin/admin";
	}

}
