package co.kr.khaki.reservation.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.common.CalculateMemberLevel;
import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.reservation.DTO.PayDTO;
import co.kr.khaki.reservation.service.ReservationServiceInterface;

@Controller
public class ReservationController {

	@Autowired
	ReservationServiceInterface reservationServiceImpl;

	@RequestMapping("search2.do")
	public String search2(Model model, String buy_endTime, String buy_startTime, String buy_carNum) {
		String cnt = reservationServiceImpl.search2(buy_endTime, buy_startTime, buy_carNum);
		model.addAttribute("cnt", cnt);
		return "pay/search2";
	}

	@RequestMapping("searchCar.do") // 차량명에 해당하는 자료들의 갯수 불러옴
	public String selectCar(Model model, String buy_carModel) {
		String cnt = reservationServiceImpl.selectCar(buy_carModel);
		model.addAttribute("cnt", cnt);
		return "pay/searchCar";
	}

	@RequestMapping("searchEndTime.do")
	public String searchEndTIme(Model model, String buy_endTime, String buy_carModel) {
		String cnt = reservationServiceImpl.searchEndTIme(buy_endTime, buy_carModel);
		model.addAttribute("cnt", cnt);
		return "pay/searchEndTime";
	}

	@RequestMapping("searchStartTime.do")
	public String searchStartTime(Model model, String buy_startTime, String buy_carModel) {
		String cnt = reservationServiceImpl.searchStartTime(buy_startTime, buy_carModel);
		model.addAttribute("cnt", cnt);
		return "pay/searchStartTime";
	}

	@RequestMapping("searchCarNum.do")
	public String searchCarNum(Model model) {
		return "pay/searchCarNum";
	}

	@RequestMapping("payResult.do")
	public String payResult(PayDTO payDTO, CalculateMemberLevel cal) {
		reservationServiceImpl.payResult(payDTO, cal);
		return "pay/payResult";
	}

	@RequestMapping("pointUseInput.do")
	public String pointUseInput(String id, String point) {
		reservationServiceImpl.pointUseInput(id, point);
		return "pay/payResult";
	}

	@RequestMapping("burumService.do")
	public String burumService(PayDTO payDTO) {
		reservationServiceImpl.burumService(payDTO);
		return "pay/payResult";
	}

	@RequestMapping("couponUsing.do")
	public String couponUsing(CouponUseDTO cpuDTO) {
		reservationServiceImpl.couponUsing(cpuDTO);
		return "pay/payResult";
	}

	@RequestMapping("checkReservation.do")
	public String checkReservation(String id, Model model) {

		ArrayList returnList = reservationServiceImpl.checkReservation(id);

		model.addAttribute("plist", returnList.get(0));
		model.addAttribute("carImage", returnList.get(1));
		return "checkReservation/checkReservation";
	}

	@RequestMapping("reservation_endTime_check.do")
	public String reservation_endTime_check(String id, Model model) {
		System.out.println("페이지에서 넘긴 id : " + id);
		String check = reservationServiceImpl.reservation_endTime_check(id);
		if (!check.equals("Y")) {
			check = "N";
		}
		System.out.println("check : " + check);
		model.addAttribute("check", check);

		return "checkReservation/reservation_endTime_check";
	}

	@RequestMapping("reservation_endTime_insert.do")
	public String reservation_endTime_insert(String id, Model model) {
		System.out.println("컨트롤러");
		String check = reservationServiceImpl.reservation_endTime_insert(id);
		return "checkReservation/reservation_endTime_check";
	}

}