package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.coupon.CouponUseDAO;
import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.pay.PayDTO;

@Controller
public class ConfirmController {
	
	@Autowired
	CouponUseDAO cpuDAO;
	
	@RequestMapping("confirm.do")
	   public String confirm(Model model, PayDTO payDTO, String buy_carImage) {
	      model.addAttribute("payDTO", payDTO);
	      model.addAttribute("buy_carImage", buy_carImage);
	      return "confirm/confirm";
	   }
	
	@RequestMapping("couponConfirm.do")
	public String CouponConfirm(CouponUseDTO cpuDTO, Model model) {
		System.out.println(cpuDTO.getCp_id() + "AAAAAAAAAAAAA");
		List<CouponUseDTO> cpu = cpuDAO.select(cpuDTO);
		System.out.println("cpu Select");

		// cpuDAO.delete(cpuDTO);
		model.addAttribute("cpulist", cpu);
		
		return "confirm/couponConfirm";
	}
	
}
