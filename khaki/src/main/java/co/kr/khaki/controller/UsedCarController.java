package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.reservation.DTO.PayDTO;
import co.kr.khaki.usedCar.UsedCarDAO;
import co.kr.khaki.usedCar.UsedCarDTO;

@Controller
public class UsedCarController {
	
	@Autowired
	UsedCarDAO usedCarDAO;

	@RequestMapping("nanumCar.do")
	public String nanumCar(Model model) {
		model.addAttribute("searchMethod", "name");
		model.addAttribute("searchInputText", "");
		return "usedCarSales/usedCarSales";
	}
	
	@RequestMapping("usedCarSales.do")
	public String usedCarSales(UsedCarDTO usedCarDTO, Model model) {
		usedCarDAO.insert(usedCarDTO);
		return "usedCarSales/usedCarSales";
	}

	@RequestMapping("admin_usedCar.do")
	public String admin_usedCar(Model model) {
		model.addAttribute("searchMethod", "name");
		model.addAttribute("searchInputText", "");
		
		List<UsedCarDTO> usedCarDTO = usedCarDAO.selectAll();
		model.addAttribute("usedCarDTO", usedCarDTO);
		
		
		return "usedCarSales/admin_usedCar";
	}
	
	@RequestMapping("usedCarYN.do")
	public String usedCarYN(Model model) {
		
		List<UsedCarDTO> usedCarDTO = usedCarDAO.select();
		model.addAttribute("searchMethod", "name");
		model.addAttribute("searchInputText", "");
		model.addAttribute("usedCarDTO", usedCarDTO);
		
		
		return "usedCarSales/usedCarYN";
	}
	
	
	@RequestMapping("usedCar_search.do")
	public String refund_search(String select, String text, Model model) {
		System.out.println(select + "넘어온 데이터 확인");
		System.out.println(text + "넘어온 데이터 확인");

		if (select.equals("name")) {
			List<UsedCarDTO> usedCarDTO = usedCarDAO.selectName(text);
			model.addAttribute("usedCarDTO", usedCarDTO);
			model.addAttribute("searchMethod", "name");
		} else if (select.equals("carNum")){
			List<UsedCarDTO> usedCarDTO = usedCarDAO.selectCarNum(text);
			model.addAttribute("usedCarDTO", usedCarDTO);
			model.addAttribute("searchMethod", "carNum");
		} else if (select.equals("phone")){
			List<UsedCarDTO> usedCarDTO = usedCarDAO.selectPhone(text);
			model.addAttribute("usedCarDTO", usedCarDTO);
			model.addAttribute("searchMethod", "phone");
		}
		
		return "usedCarSales/admin_usedCar";
	}

}