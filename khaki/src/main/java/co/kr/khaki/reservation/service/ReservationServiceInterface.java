package co.kr.khaki.reservation.service;

import java.util.ArrayList;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.common.CalculateMemberLevel;
import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.reservation.DTO.PayDTO;

public interface ReservationServiceInterface {

	String search2(String buy_endTime, String buy_startTime, String buy_carNum);

	// 차량명에 해당하는 자료들의 갯수 불러옴
	String selectCar(String buy_carModel);

	String searchEndTIme(String buy_endTime, String buy_carModel);

	String searchStartTime(String buy_startTime, String buy_carModel);

	String payResult(PayDTO payDTO, CalculateMemberLevel cal);

	String pointUseInput(String id, String point);

	String burumService(PayDTO payDTO);

	String couponUsing(CouponUseDTO cpuDTO);

	ArrayList checkReservation(String id);
	
	String reservation_endTime_check(String id);

}