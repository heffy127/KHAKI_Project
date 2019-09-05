package co.kr.khaki.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.car.CarDAO;
import co.kr.khaki.car.CarDTO;
import co.kr.khaki.pay.PayDAO;
import co.kr.khaki.pay.PayDTO;

@Controller
public class CheckReservationController {
	
	@Autowired
	PayDAO pdao;
	
	@Autowired
	CarDAO cdao;
	
	
	@RequestMapping("checkReservation.do")
	public String checkReservation(Model model) {

		List<PayDTO> pay_list = pdao.selectAll();
		List<String> carImageList = new ArrayList<String>();
		System.out.println(pay_list + "확인11111111");
		for (int i = 0; i < pay_list.size(); i++) {
			System.out.println("확인22222222222");
			PayDTO dto = pay_list.get(i);
			dto.setBuy_totalAmount(dto.getBuy_amount());
			if(dto.getBuy_addAmount() == null) {
				dto.setBuy_addAmount("0");
				dto.setBuy_totalAmount((Integer.parseInt(dto.getBuy_amount()) + Integer.parseInt(dto.getBuy_addAmount())) + "");
			} else {
				dto.setBuy_totalAmount((Integer.parseInt(dto.getBuy_amount()) + Integer.parseInt(dto.getBuy_addAmount())) + "");
			}
			System.out.println(dto.getBuy_carNum() + " 차번호 확인ㄴㄴㄴㄴ");
			CarDTO cdto = cdao.carNumSearch((String)dto.getBuy_carNum());
			System.out.println(cdto + " 차이미지이이이이");
			carImageList.add(cdto.getCar_image());
			System.out.println("최종!!!!! 이 부분이 나와야 함");
		}
		
		model.addAttribute("plist", pay_list);
		model.addAttribute("carImage", carImageList);
		return "checkReservation/checkReservation";
	}

}
