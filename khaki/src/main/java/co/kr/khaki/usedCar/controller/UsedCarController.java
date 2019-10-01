package co.kr.khaki.usedCar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.reservation.DTO.PayDTO;
import co.kr.khaki.usedCar.DAO.UsedCarDAO;
import co.kr.khaki.usedCar.DTO.UsedCarDTO;
import co.kr.khaki.usedCar.service.UsedCarServiceImpl;

@Controller
public class UsedCarController {
	
	@Autowired
	UsedCarServiceImpl usedCarServiceImpl;

	@RequestMapping("nanumCar.do")
	public String nanumCar(Model model) {
		model.addAttribute("searchMethod", "name");
		model.addAttribute("searchInputText", "");
		return "usedCarSales/usedCarSales";
	}
	
	@RequestMapping("usedCarSales.do")
	public String usedCarSales(UsedCarDTO usedCarDTO) {
		usedCarServiceImpl.usedCarSales(usedCarDTO);
		return "usedCarSales/usedCarSales";
	}

	@RequestMapping("admin_usedCar.do")
	public String admin_usedCar(Model model) {
		model.addAttribute("searchMethod", "name");
		model.addAttribute("searchInputText", "");
		
		List<UsedCarDTO> usedCarDTO = usedCarServiceImpl.admin_usedCar();
		model.addAttribute("usedCarDTO", usedCarDTO);
		
		
		return "usedCarSales/admin_usedCar";
	}
	
	@RequestMapping("usedCarYN.do")
	public String usedCarYN(Model model) {
		
		List<UsedCarDTO> usedCarDTO = usedCarServiceImpl.usedCarYN();
		model.addAttribute("searchMethod", "name");
		model.addAttribute("searchInputText", "");
		model.addAttribute("usedCarDTO", usedCarDTO);
		
		
		return "usedCarSales/usedCarYN";
	}
	
	
	@RequestMapping("usedCar_search.do")
	public String refund_search(String select, String text, Model model) {
		List<UsedCarDTO> usedCarDTO = usedCarServiceImpl.refund_search(select, text);
		if (select.equals("name")) {
			model.addAttribute("searchMethod", "name");
		} else if (select.equals("carNum")){
			model.addAttribute("searchMethod", "carNum");
		} else if (select.equals("phone")){
			model.addAttribute("searchMethod", "phone");
		}
		model.addAttribute("usedCarDTO", usedCarDTO);
		
		return "usedCarSales/admin_usedCar";
	}

}