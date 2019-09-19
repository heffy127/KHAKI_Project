package co.kr.khaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.usedCar.UsedCarDAO;
import co.kr.khaki.usedCar.UsedCarDTO;

@Controller
public class UsedCarController {
	
	@Autowired
	UsedCarDAO usedCarDAO;

	@RequestMapping("nanumCar.do")
	public String nanumCar() {
		return "usedCarSales/usedCarSales";
	}
	
	@RequestMapping("usedCarSales.do")
	public String usedCarSales(UsedCarDTO usedCarDTO, Model model) {
		usedCarDAO.insert(usedCarDTO);
		return "usedCarSales/usedCarSales";
	}


}