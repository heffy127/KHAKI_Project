package co.kr.khaki.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.coupon.CouponUseDAO;
import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.member.DAO.MemberDAOInter;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.reservation.DTO.PayDTO;

@Controller
public class ConfirmController {
	
	@Autowired
	CouponUseDAO cpuDAO;
	
	@Autowired
	MemberDAOInter memberDAO;
	
	@RequestMapping("confirm.do")
	   public String confirm(Model model, PayDTO payDTO, String buy_carImage) {
	      model.addAttribute("payDTO", payDTO);
	      model.addAttribute("buy_carImage", buy_carImage);
	     MemberDTO memberDTO = memberDAO.selectId(payDTO.getBuy_id());
	     model.addAttribute("memberDTO", memberDTO);
	      return "confirm/confirm";
	   }
	
	@RequestMapping("couponConfirm.do")
	public String CouponConfirm(CouponUseDTO cpuDTO, Model model) {
		System.out.println(cpuDTO.getCp_id() + "AAAAAAAAAAAAA");
		List<CouponUseDTO> cpu = cpuDAO.select(cpuDTO);
		List<CouponUseDTO> cpu2 = new ArrayList<CouponUseDTO>();
		System.out.println("cpu Select");
		
		Calendar cal = Calendar.getInstance();
		 
		//현재 년도, 월, 일
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE ) ;
		for (CouponUseDTO couponUseDTO : cpu) {
			
			String result = couponUseDTO.getCp_end();
			StringTokenizer result2 = new StringTokenizer(result, "."); // 박준영군의 기가막힌 아이디어 스트링토크나이저....
			int result2count = result2.countTokens();
			String endYear1 = "";
			String endYear2 = "";
			String endYear3 = "";
			for (int i = 0; i < result2count; i++) {
				String data = result2.nextToken();
				if(i == 0) {
					endYear1 = "20" + data;
				} else if(i == 1) {
					endYear2 = data;
				} else if(i == 2) {
					endYear3 = data;
				}
			}
			System.out.println(year + endYear1 + month + endYear2 + date + endYear3);
			// 쿠폰을 아직 사용 안한 경우(N)일 경우
			if(couponUseDTO.getCp_using().equals("N")) {
				// 현재 년도와 쿠폰의 년도가 같을 경우
				if(year == Integer.parseInt(endYear1)) {
					if(month == Integer.parseInt(endYear2)) { // 현재 월이 유효기간월과 같을 경우
						if(date == Integer.parseInt(endYear3)) { // 현재 일이 유효기간 일과 같을 경우
							// 년,월,일이 다 같을 경우 쿠폰 사용 가능
							cpu2.add(couponUseDTO);
						} else if(date > Integer.parseInt(endYear3)) { // 현재 일이 유효기간 일보다 클 경우(현재 15, 유효 14)
							// 유효기간 지남(일)
						} else if(date < Integer.parseInt(endYear3)) { // 현재 일이 유효기간 일보다 작을 경우(현재 15, 유효 16)
							// 유효기간 아직 안지났을 경우
							cpu2.add(couponUseDTO);
						}
					} else if(month > Integer.parseInt(endYear2)) { // 현재 월이 유효기간 월보다 클 경우(현재 09, 유효 08)
						// 유효기간 지남(월)
					} else if(month < Integer.parseInt(endYear2)) { // 현재 월이 유효기간 월보다 작을 경우(현재 09, 유효 10)
						// 유효기간 아직 안지났을 경우
						cpu2.add(couponUseDTO);
					}
					
				} else if(year > Integer.parseInt(endYear1)) { // 현재 년도가 유효기간년도보다 클 경우(현재 2019, 유효 2018)
					// 유효기간 지남
				} else if(year < Integer.parseInt(endYear1)) {// 현재 년도가 유효기간년도보다 작을 경우(현재 2019, 유효 2020)
					// 유효기간 아직 안지났을 경우
					cpu2.add(couponUseDTO);
				}
			}
			
			
		}
		model.addAttribute("cpulist", cpu2);
		
		return "confirm/couponConfirm";
	}
	
}
