package co.kr.khaki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConfirmController {
	
	@RequestMapping("confirm.do")
	public String confirm() {
		return "confirm/confirm";
	}
	
	
}
