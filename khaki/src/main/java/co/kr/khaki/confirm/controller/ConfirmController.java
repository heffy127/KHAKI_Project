package co.kr.khaki.confirm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.confirm.service.ConfirmServiceInterface;
import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.reservation.DTO.PayDTO;

@Controller
public class ConfirmController {

	@Autowired
	ConfirmServiceInterface confirmServiceImpl;

	@RequestMapping("confirm.do")
	public String confirm(Model model, PayDTO payDTO, String buy_carImage) {
		model.addAttribute("payDTO", payDTO);
		model.addAttribute("buy_carImage", buy_carImage);
		MemberDTO memberDTO = confirmServiceImpl.confirm(payDTO.getBuy_id());
		model.addAttribute("memberDTO", memberDTO);
		
		long timeGap = confirmServiceImpl.timeGap(payDTO.getBuy_startTime(), payDTO.getBuy_endTime());
		
		model.addAttribute("timeGap", timeGap);
		return "confirm/confirm";
	}

	@RequestMapping("couponConfirm.do")
	public String CouponConfirm(CouponUseDTO cpuDTO, Model model) {
		
		List<CouponUseDTO> cpu2 = confirmServiceImpl.CouponConfirm(cpuDTO);
		model.addAttribute("cpulist", cpu2);

		return "confirm/couponConfirm";
	}

}
