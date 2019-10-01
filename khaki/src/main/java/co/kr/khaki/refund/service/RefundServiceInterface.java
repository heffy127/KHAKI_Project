package co.kr.khaki.refund.service;

import java.util.List;

import co.kr.khaki.refund.DTO.RefundDTO;
import co.kr.khaki.reservation.DTO.PayDTO;

public interface RefundServiceInterface {

	List<PayDTO> admin_reservation();

	void refund(String buy_impUid);

	RefundDTO refundSelectYN(String impUid);

	String refundUpdate(String impUid);

	List<PayDTO> refund_search(String select, String text);

}