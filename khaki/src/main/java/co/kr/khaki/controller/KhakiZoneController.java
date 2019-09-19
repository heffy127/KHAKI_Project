package co.kr.khaki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KhakiZoneController {

	@RequestMapping("khakizone.do")
	public String khakizone() {
		
		
		return "khakizone/khakizone_main";
	}
	
}
