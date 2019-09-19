package co.kr.khaki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KhakiZoneController {

	@RequestMapping("khakizone_main.do")
	public String khakizone() {
		System.out.println("khakizone_main 소환!");
		
		return "khakizone/khakizone_main";
	}
	
}
