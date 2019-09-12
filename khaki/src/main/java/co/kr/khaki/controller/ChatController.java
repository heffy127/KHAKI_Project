package co.kr.khaki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("counselingChat.do")
	public String chat() {	
	
		return "chat/counselingChat";
	}

}
