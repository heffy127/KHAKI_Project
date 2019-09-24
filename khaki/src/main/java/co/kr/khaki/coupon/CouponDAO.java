package co.kr.khaki.coupon;

import java.text.SimpleDateFormat;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	// 쿠폰 등록
	public void couponInsert(CouponDTO couponDTO) {
		myBatis.insert("cpDAO.cpInsert", couponDTO);
	}
	
	// 쿠폰 삭제
	public void couponDelete(CouponDTO couponDTO) {
		SimpleDateFormat cur = new SimpleDateFormat("yyyy/mm/dd");
		System.out.println(cur);
		String end = couponDTO.getEndDate().substring(0,8);
		/*
		 * if(cur == end) { myBatis.delete("cpDAO.cpDelete", couponDTO); }
		 */
	}
	
	// 쿠폰 검색
	public CouponDTO couponSelect(CouponDTO couponDTO) {
		System.out.println("쿠폰 검색 완료");
		return myBatis.selectOne("cpDAO.cpSelect", couponDTO);
	}
	
	// 쿠폰 리스트
	public List<CouponDTO> couponSelectAll() {
		System.out.println("쿠폰 리스트 불러오기 완료");
		return myBatis.selectList("cpDAO.cpSelectAll");
	}
}







