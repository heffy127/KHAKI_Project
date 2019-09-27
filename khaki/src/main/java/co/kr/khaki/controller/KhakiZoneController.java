package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.notice.pagination;
import co.kr.khaki.zone.KhakiZoneCal;
import co.kr.khaki.zone.KhakiZoneDAO;
import co.kr.khaki.zone.KhakiZoneDTO;

@Controller
public class KhakiZoneController {

	
	@Autowired
	KhakiZoneDAO zonedao;
	
	@RequestMapping("khakizone_main.do")
	public String khakizone(Model model, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="5") int pageSize) {
		//System.out.println("khakizone_main 소환!");
		
		System.out.println("curPage : "+curPage+"/ pageSize : "+pageSize);
		
		// 페이지 네이션 부분
		int total = zonedao.cntAll();
		pagination pg = new pagination(total, curPage, pageSize);
		
		System.out.println("index 숫자 : " + pg.getStartIndex());
		List<KhakiZoneDTO> select_list = zonedao.select_page(pg.getStartIndex());
		
		KhakiZoneCal zonecal = new KhakiZoneCal(select_list);
		
		System.out.println(zonecal);
		
		//model객체를 통한 view단에 전달하는 곳
		model.addAttribute("pagination", pg);
		model.addAttribute("select_list", select_list);
		model.addAttribute("cal", zonecal);
		
		return "khakizone/khakizone_main";
	}
	
	@RequestMapping("khakizone_insert.do")
	public String khakizone_insert(Model model, KhakiZoneDTO khakiZoneDTO, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="5") int pageSize) {
		System.out.println("khakizone_insert!");
		zonedao.insert(khakiZoneDTO);
		
		// 페이지 네이션 부분
		int total = zonedao.cntAll();
		pagination pg = new pagination(total, curPage, pageSize);
		
		System.out.println("curRange : " + pg.getCurRange());
		
		System.out.println("index 숫자 : " + pg.getStartIndex());
		List<KhakiZoneDTO> select_list = zonedao.select_page(pg.getStartIndex());
		
		KhakiZoneCal zonecal = new KhakiZoneCal(select_list);
		
		//model객체를 통한 view단에 전달하는 곳
		model.addAttribute("pagination", pg);
		model.addAttribute("select_list", select_list);
		model.addAttribute("cal", zonecal);
		
		return "khakizone/khakizone_main";
	}
	
	@RequestMapping("khakizone_update.do")
	public String khakizone_update(Model model, KhakiZoneDTO khakiZoneDTO, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="5") int pageSize) {
		System.out.println("khakizone_update!");
		System.out.println(khakiZoneDTO);
		zonedao.update(khakiZoneDTO);
		
		// 페이지 네이션 부분
		int total = zonedao.cntAll();
		pagination pg = new pagination(total, curPage, pageSize);
		
		System.out.println("index 숫자 : " + pg.getStartIndex());
		List<KhakiZoneDTO> select_list = zonedao.select_page(pg.getStartIndex());
		
		KhakiZoneCal zonecal = new KhakiZoneCal(select_list);
		
		//model객체를 통한 view단에 전달하는 곳
		model.addAttribute("pagination", pg);
		model.addAttribute("select_list", select_list);
		model.addAttribute("cal", zonecal);
		
		return "khakizone/khakizone_main";
	}
}