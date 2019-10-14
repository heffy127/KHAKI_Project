package co.kr.khaki.refund.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.refund.DTO.RefundDTO;
import co.kr.khaki.refund.service.RefundServiceInterface;
import co.kr.khaki.reservation.DTO.PayDTO;

@Controller
public class RefundController {

	@Autowired
	RefundServiceInterface refundServiceImpl;

	@RequestMapping("admin_reservation.do")
	public String admin_reservation(Model model) {
		List<PayDTO> pdto = refundServiceImpl.admin_reservation();
		
		model.addAttribute("pdto", pdto);
		model.addAttribute("searchMethod", "buy_impUid");
		model.addAttribute("searchInputText", "");
		return "checkReservation/admin_reservation";
	}

	@RequestMapping("refund.do")
	public String refund(String buy_impUid) {
		refundServiceImpl.refund(buy_impUid);
		return "pay/payResult";
	}

	@RequestMapping("refundSelectYN.do")
	public String refundSelectYN(String impUid, Model model) {
		RefundDTO refundDTO = refundServiceImpl.refundSelectYN(impUid);
		model.addAttribute("refundDTO", refundDTO);
		return "checkReservation/refundSelectYN";
	}

	@RequestMapping("refundUpdate.do")
	public String refundUpdate(String impUid) {
		refundServiceImpl.refundUpdate(impUid);
		return "checkReservation/admin_reservation";
	}

	@RequestMapping("refund_search.do")
	public String refund_search(String select, String text, Model model) {

		if (select.equals("buy_impUid")) { // id 검색
			List<PayDTO> pdto = refundServiceImpl.refund_search(select, text);
			model.addAttribute("pdto", pdto);
			model.addAttribute("searchMethod", "buy_impUid"); // selectBox 아이디 선택
			model.addAttribute("searchInputText", text);
		} else if (select.equals("buy_id")){
			List<PayDTO> pdto = refundServiceImpl.refund_search(select, text);
			model.addAttribute("pdto", pdto);
			model.addAttribute("searchMethod", "buy_id"); // selectBox 아이디 선택
			model.addAttribute("searchInputText", text);
		} else if (select.equals("buy_name")){
			List<PayDTO> pdto = refundServiceImpl.refund_search(select, text);
			model.addAttribute("pdto", pdto);
			model.addAttribute("searchMethod", "buy_name"); // selectBox 아이디 선택
			model.addAttribute("searchInputText", text);
		} else if (select.equals("buy_carNum")){
			List<PayDTO> pdto = refundServiceImpl.refund_search(select, text);
			model.addAttribute("pdto", pdto);
			model.addAttribute("searchMethod", "buy_carNum"); // selectBox 아이디 선택
			model.addAttribute("searchInputText", text);
		}

		return "checkReservation/admin_reservation";
	}

}