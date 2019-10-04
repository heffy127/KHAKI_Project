package co.kr.khaki.cctv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CctvController {
	
	@RequestMapping("cctv.do")	//cctv_main
	public String cctv_main() {
		
		return "cctv/cctv_main";
	}
}
