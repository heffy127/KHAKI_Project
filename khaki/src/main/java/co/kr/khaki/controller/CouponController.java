package co.kr.khaki.controller;

import java.util.List;
import java.util.Random;

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
		String cId = "";
		boolean a = true;
		int check = 0;
		while (a) {
			cId = "CP_" + couponDTO.getcOption() + "_";
			Random rd = new Random();
			cId += rd.nextInt(999999);
			check = dao.couponIdSelect(cId);
			if (check == 0) {
				couponDTO.setcId(cId);
				dao.couponInsert(couponDTO);
				a = false;
			} else {
				a = true;
			}
		}
		return "coupon/admin_coupon1";
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

	// 쿠폰 리스트 불러오기
	@RequestMapping("admin_coupon.do")
	public String admin_coupon() {
		return "coupon/admin_coupon_choice";
	}

	// 쿠폰 리스트 불러오기
	@RequestMapping("admin_coupon1.do")
	public String admin_coupon1() {
		return "coupon/admin_coupon1";
	}
	// 쿠폰 리스트 불러오기
	@RequestMapping("admin_coupon2.do")
	public String admin_coupon2() {
		return "coupon/admin_coupon2";
	}
	// 쿠폰 리스트 불러오기
	@RequestMapping("admin_coupon3.do")
	public String admin_coupon3() {
		return "coupon/admin_coupon3";
	}
}
