package co.kr.khaki.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.common.CalculateMemberLevel;
import co.kr.khaki.coupon.CouponUseDAO;
import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.member.DAO.MemberDAO;
import co.kr.khaki.member.DAO.MemberLevelDAO;
import co.kr.khaki.member.DTO.InsertPointDTO;
import co.kr.khaki.member.DTO.MemberAdminDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.member.DTO.MemberLevelDTO;
import co.kr.khaki.pay.PayDAO;
import co.kr.khaki.pay.PayDTO;
import co.kr.khaki.refund.RefundDAO;
import co.kr.khaki.refund.RefundDTO;

@Controller
public class RefundController {

	@Autowired
	PayDAO pdao;

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	RefundDAO refundDAO;

	@Autowired
	MemberLevelDAO memberLevelDAO;

	@Autowired
	CouponUseDAO cpuDAO;

	@RequestMapping("admin_reservation.do")
	public String admin_reservation(Model model) {
		List<PayDTO> pdto = pdao.selectAll();
		model.addAttribute("pdto", pdto);
		model.addAttribute("searchMethod", "buy_impUid");
		model.addAttribute("searchInputText", "");
		return "checkReservation/admin_reservation";
	}

	@RequestMapping("refund.do")
	public String refund(String buy_impUid) {
		// reservation DB에 주문번호로 select해오기 위해 payDTO 객체 생성
		PayDTO payDTO = new PayDTO();
		// payDTO의 주문번호에 get메소드로 입력
		payDTO.setBuy_impUid(buy_impUid);

		// 입력한 주문번호를 파라메터로 넘겨서 pDTO에 select 해옴
		PayDTO pDTO = pdao.select(payDTO);

		// model로 넘길 refundDTO 객체 생성
		RefundDTO refundDTO = new RefundDTO();
		System.out.println(buy_impUid + "주문번호확인!!!");
		refundDTO.setImpUid(buy_impUid);
		refundDTO.setId(pDTO.getBuy_id());

		// 환불 신청한 고객의 이름을 가져오기 위해 memberDTO로 이름 검색
		MemberDTO memberDTO = memberDAO.selectId(pDTO.getBuy_id());
		refundDTO.setName(memberDTO.getName());

		// 현재 년,월,일 입력
		Calendar cal = Calendar.getInstance();
		int year2 = cal.get(cal.YEAR);
		String year3 = Integer.toString(year2);
		String[] year4 = year3.split("");
		String year5 = year4[2] + year4[3];
		int year = Integer.parseInt(year5);
		int mon = cal.get(cal.MONTH) + 1;
		int day = cal.get(cal.DATE);
		System.out.println(mon + " mon");
		System.out.println(day + " day");
		String refundRequest = "";
		String realYear = Integer.toString(year);
		String realMon = "";
		String realDay = "";
		if (mon >= 10) {
			realMon = Integer.toString(mon);
		} else {
			realMon = "0" + Integer.toString(mon);
		}
		if (day >= 10) {
			realDay = Integer.toString(day);
		} else {
			realDay = "0" + Integer.toString(day);
		}
		refundRequest = realYear + "." + realMon + "." + realDay;
		refundDTO.setRefundRequest(refundRequest);

		refundDTO.setBurum(pDTO.getBuy_burum());
		refundDTO.setAmount(pDTO.getBuy_totalAmount());
		try {
			if (pDTO.getBuy_discount().equals("")) {
				System.out.println("쿠폰 사용 안했음");
			} else {
				String[] coupon = pDTO.getBuy_discount().split(",");
				refundDTO.setCouponNum(coupon[2]);
				System.out.println(coupon[2] + "쿠폰번호!!!!!!!!");
			}
		} catch (Exception e) {
			System.out.println("쿠폰적용하지 않았을 때 출력");
		}

		refundDTO.setUsePoint(pDTO.getBuy_usePoint());

		refundDTO.setPointOrCoupon(pDTO.getBuy_useCoupon());
		refundDAO.insert(refundDTO);

		return "pay/payResult";
	}

	@RequestMapping("refundSelectYN.do")
	public String refundSelectYN(String impUid, Model model) {
		System.out.println(impUid + " : 넘어온 주문번호 확인");
		RefundDTO refundDTO = refundDAO.select(impUid);
		if (refundDTO != null) {
			System.out.println(refundDTO.getRefundYN() + " : 넘길 값 확인");
			model.addAttribute("refundDTO", refundDTO);
		}
		return "checkReservation/refundSelectYN";
	}

	@RequestMapping("refundUpdate.do")
	public String refundUpdate(String impUid) {
		RefundDTO refundDTO = new RefundDTO();
		System.out.println(impUid + "주문번호@@@");
		refundDTO.setImpUid(impUid);
		refundDTO.setRefundYN("Y");
		refundDAO.update(refundDTO); // 환불 테이블에 환불완료(Y)표시
		RefundDTO refundDTO2 = refundDAO.select(impUid); // 주문번호로 select하여 해당 주문번호의 정보를 불러옴
		InsertPointDTO insertPointDTO = new InsertPointDTO();
		insertPointDTO.setId(refundDTO2.getId());
		insertPointDTO.setPoint(Integer.parseInt(refundDTO2.getUsePoint()));
		memberDAO.updatePoint(insertPointDTO); // 고객이 사용한 포인트만큼 다시 환불
		CouponUseDTO cpuDTO = new CouponUseDTO();
		System.out.println(refundDTO.getCouponNum() + "ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ@@");
		if (refundDTO.getCouponNum() == null) {

		} else {
			System.out.println(refundDTO2.getCouponNum()+"adafadfsdfsdaf");
			cpuDTO.setNum(Integer.parseInt(refundDTO2.getCouponNum()));
			cpuDAO.update(cpuDTO); // 고객이 사용한 쿠폰또한 다시 원상복구(유효기간이 이미 지난 쿠폰의 경우 어차피 사용은 못함)
		}

		return "checkReservation/admin_reservation";
	}

	@RequestMapping("refund_search.do")
	public String refund_search(String select, String text, Model model) {
		System.out.println(select + "넘어온 데이터 확인");
		System.out.println(text + "넘어온 데이터 확인");

		if (select.equals("buy_impUid")) { // id 검색
			List<PayDTO> pdto = pdao.selectImpUid(text);
			model.addAttribute("pdto", pdto);
			model.addAttribute("searchMethod", "buy_impUid"); // selectBox 아이디 선택
			model.addAttribute("searchInputText", text);
		} else if (select.equals("buy_id")){
			List<PayDTO> pdto = pdao.selectId(text);
			model.addAttribute("pdto", pdto);
			model.addAttribute("searchMethod", "buy_id"); // selectBox 아이디 선택
			model.addAttribute("searchInputText", text);
		} else if (select.equals("buy_name")){
			List<PayDTO> pdto = pdao.selectName(text);
			model.addAttribute("pdto", pdto);
			model.addAttribute("searchMethod", "buy_name"); // selectBox 아이디 선택
			model.addAttribute("searchInputText", text);
		} else if (select.equals("buy_carNum")){
			List<PayDTO> pdto = pdao.selectCarNum(text);
			model.addAttribute("pdto", pdto);
			model.addAttribute("searchMethod", "buy_carNum"); // selectBox 아이디 선택
			model.addAttribute("searchInputText", text);
		}

		return "checkReservation/admin_reservation";
	}

}