package co.kr.khaki.zone.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.common.pagination;
import co.kr.khaki.zone.DAO.KhakiZoneDAO;
import co.kr.khaki.zone.DTO.KhakiZoneDTO;
import co.kr.khaki.zone.service.KhakiZoneCal;
import co.kr.khaki.zone.service.KhakiZoneServiceInterface;

@Controller
public class KhakiZoneController {

	@Autowired
	KhakiZoneServiceInterface KhakiZoneServiceImpl;
	
	@RequestMapping("khakizone_main.do")
	public String khakizone(Model model, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="5") int pageSize) {
		
		ArrayList arr = KhakiZoneServiceImpl.khakizone(curPage, pageSize);
		
		pagination pg = (pagination) arr.get(0);
		List<KhakiZoneDTO> select_list = (List<KhakiZoneDTO>) arr.get(1);
		KhakiZoneCal zonecal = (KhakiZoneCal) arr.get(2);
		
		//model객체를 통한 view단에 전달하는 곳
		model.addAttribute("pagination", pg);
		model.addAttribute("select_list", select_list);
		model.addAttribute("cal", zonecal);
		
		return "khakizone/khakizone_main";
	}
	
	@RequestMapping("khakizone_insert.do")
	public String khakizone_insert(Model model, KhakiZoneDTO khakiZoneDTO, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="5") int pageSize) {
		
		ArrayList arr = KhakiZoneServiceImpl.khakizone_insert(khakiZoneDTO, curPage, pageSize);
		
		pagination pg = (pagination) arr.get(0);
		List<KhakiZoneDTO> select_list = (List<KhakiZoneDTO>) arr.get(1);
		KhakiZoneCal zonecal = (KhakiZoneCal) arr.get(2);
		
		//model객체를 통한 view단에 전달하는 곳
		model.addAttribute("pagination", pg);
		model.addAttribute("select_list", select_list);
		model.addAttribute("cal", zonecal);
		
		return "khakizone/khakizone_main";
	}
	
	@RequestMapping("khakizone_update.do")
	public String khakizone_update(Model model, KhakiZoneDTO khakiZoneDTO, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="5") int pageSize) {
		
		ArrayList arr = KhakiZoneServiceImpl.khakizone_update(khakiZoneDTO, curPage, pageSize);
		
		pagination pg = (pagination) arr.get(0);
		List<KhakiZoneDTO> select_list = (List<KhakiZoneDTO>) arr.get(1);
		KhakiZoneCal zonecal = (KhakiZoneCal) arr.get(2);
		
		//model객체를 통한 view단에 전달하는 곳
		model.addAttribute("pagination", pg);
		model.addAttribute("select_list", select_list);
		model.addAttribute("cal", zonecal);
		
		return "khakizone/khakizone_main";
	}

	@RequestMapping("khakizone_delete.do")
	public String khakizone_delete(Model model, int zone_num, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="5") int pageSize) {
		
		ArrayList arr = KhakiZoneServiceImpl.khakizone_delete(zone_num, curPage, pageSize);

		pagination pg = (pagination) arr.get(0);
		List<KhakiZoneDTO> select_list = (List<KhakiZoneDTO>) arr.get(1);
		KhakiZoneCal zonecal = (KhakiZoneCal) arr.get(2);
		
		//model객체를 통한 view단에 전달하는 곳
		model.addAttribute("pagination", pg);
		model.addAttribute("select_list", select_list);
		model.addAttribute("cal", zonecal);
		
		return "khakizone/khakizone_main";
	}
}