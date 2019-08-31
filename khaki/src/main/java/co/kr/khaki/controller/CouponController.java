package co.kr.khaki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CouponController {

	@RequestMapping("coupon.do")
	public String board() {
		
		return "coupon/coupon";
	}
	
	@RequestMapping("couponUseAll.do")
	public String couponUseAll() {
		
		return "coupon/couponUseAll";
	}
	
}
