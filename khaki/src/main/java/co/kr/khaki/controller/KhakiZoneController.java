package co.kr.khaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.zone.KhakiZoneDAO;
import co.kr.khaki.zone.KhakiZoneDTO;

@Controller
public class KhakiZoneController {

	
	@Autowired
	KhakiZoneDAO zonedao;
	
	@RequestMapping("khakizone_main.do")
	public String khakizone() {
		System.out.println("khakizone_main 소환!");
		
		return "khakizone/khakizone_main";
	}
	
	@RequestMapping("khakizone_insert.do")
	public String khakizone_insert(KhakiZoneDTO khakiZoneDTO) {
		System.out.println("khakizone_insert!");
		
		System.out.println(khakiZoneDTO);
		zonedao.insert(khakiZoneDTO);
		
		return "khakizone/khakizone_main";
	}
	
}