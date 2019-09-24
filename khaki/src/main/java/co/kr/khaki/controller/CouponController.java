package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.coupon.CouponDAO;
import co.kr.khaki.coupon.CouponDTO;

@Controller
public class CouponController {

	@Autowired
	CouponDAO dao;

	// 쿠폰 등록
	@RequestMapping("insertCp.do")
	public String cpInsert(CouponDTO couponDTO) {
		// endDate 지정

		// 쿠폰 등록
		dao.couponInsert(couponDTO);
		return "coupon/insertCp";
	}

	// 쿠폰 삭제
	@RequestMapping("deleteCp.do")
	public String cpDelete(CouponDTO couponDTO, Model model) {

		dao.couponDelete(couponDTO);

		// 삭제 후 쿠폰 리스트 불러오기
		List<CouponDTO> list = dao.couponSelectAll();
		model.addAttribute("list", list);

		return "coupon/coupon";
	}

	// 쿠폰 검색
	@RequestMapping("selectCp.do")
	public String cpSelect(CouponDTO couponDTO) {

		return "coupon/coupon";
	}

	// 쿠폰 리스트 불러오기
	@RequestMapping("selectAllCp.do")
	public String cpSelectAll(Model model) {
		List<CouponDTO> list = dao.couponSelectAll();
		model.addAttribute("list", list);
		return "coupon/coupon";
	}
}
