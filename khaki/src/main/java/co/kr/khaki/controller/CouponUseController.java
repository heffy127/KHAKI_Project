package co.kr.khaki.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.coupon.CouponDAO;
import co.kr.khaki.coupon.CouponDTO;
import co.kr.khaki.coupon.CouponUseDAO;
import co.kr.khaki.coupon.CouponUseDTO;

@Controller
public class CouponUseController {

	@Autowired
	CouponUseDAO cpuDAO;
	
	@Autowired
	CouponDAO cpDAO;
	
	
	 @RequestMapping("couponUseInsert.do") 
	 public String my_coupon_in(CouponUseDTO cpuDTO, Model model) { 
		 cpuDAO.insert(cpuDTO);
		 
		 List<CouponDTO> list = cpDAO.couponSelectAll();
		 model.addAttribute(list);
		 
		 return "coupon/coupon"; 
	 }
	
	
	@RequestMapping("couponUseAll.do")
	public String couponUseAll() {

		return "coupon/couponUseAll";
	}

	// 쿠폰 리스트 불러오기
	@RequestMapping("my_coupon_book.do")
	public String my_coupon_book(String cp_id, Model model) {
		List<CouponUseDTO> cpuDTO = cpuDAO.select2(cp_id);
		SimpleDateFormat format1 = new SimpleDateFormat ("yyMMdd");
		Date time = new Date();
		String today = format1.format(time);
		List<CouponUseDTO> cpuDTO_check = new ArrayList<CouponUseDTO>();
		for (CouponUseDTO couponUseDTO : cpuDTO) {
			
			String result = couponUseDTO.getCp_end();
			StringTokenizer result2 = new StringTokenizer(result, "."); // 박준영군의 기가막힌 아이디어 스트링토크나이저....
			int result2count = result2.countTokens();
			String end_text = "";
			for (int i = 0; i < result2count; i++) {
				String token = result2.nextToken();
				if(token.length() == 1) {
					end_text += "0" + token;
				} else {
					end_text += token;
				}
			}

			if(Integer.parseInt(end_text) - Integer.parseInt(today) >= 0) {
				System.out.println("사용가능");
				cpuDTO_check.add(couponUseDTO);
			} else {
				System.out.println("유효기간지남");
			}
			
		}
		
		model.addAttribute("cpuDTO", cpuDTO_check);
		
		return "coupon/my_coupon_book";
	}

}
