package co.kr.khaki.confirm.service;

import java.util.List;

import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.member.DTO.MemberDTO;

public interface ConfirmServiceInterface {

	MemberDTO confirm(String id);

	long timeGap(String sTime, String eTime);

	List<CouponUseDTO> CouponConfirm(CouponUseDTO cpuDTO);

}