package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.pay.PayDAO;
import co.kr.khaki.pay.PayDTO;

@Controller
public class CheckReservationController {
	
	@Autowired
	PayDAO pdao;
	
	@RequestMapping("checkReservation.do")
	public String checkReservation(Model model) {

		List<PayDTO> pay_list = pdao.selectAll();
		System.out.println(pay_list);
		for (int i = 0; i < pay_list.size(); i++) {
			PayDTO dto = pay_list.get(i);
			dto.setBuy_totalAmount(dto.getBuy_amount());
			if(dto.getBuy_addAmount() == null) {
				dto.setBuy_addAmount("0");
				dto.setBuy_totalAmount((Integer.parseInt(dto.getBuy_amount()) + Integer.parseInt(dto.getBuy_addAmount())) + "");
			} else {
				dto.setBuy_totalAmount((Integer.parseInt(dto.getBuy_amount()) + Integer.parseInt(dto.getBuy_addAmount())) + "");
			}
		}
		model.addAttribute("plist", pay_list);
		return "checkReservation/checkReservation";
	}

}
