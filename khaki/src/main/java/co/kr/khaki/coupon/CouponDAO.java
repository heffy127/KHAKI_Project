package co.kr.khaki.coupon;

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
		System.out.println("cpDAO insert Success!!");
		myBatis.insert("cpDAO.cpInsert", couponDTO);
	}

	// 쿠폰 삭제
	public void couponDelete(CouponDTO couponDTO) {
		System.out.println("cpDAO delete success ~");
		myBatis.delete("cpDAO.cpDelete", couponDTO);
	}

	// 쿠폰 검색
	public CouponDTO couponSelect(CouponDTO couponDTO) {
		System.out.println("쿠폰 검색 완료");
		return myBatis.selectOne("cpDAO.cpSelect", couponDTO);
	}

	// 쿠폰 아이디 검색
	public int couponIdSelect(String cId) {
		System.out.println("쿠폰 아이디 검색 완료");
		return myBatis.selectOne("cpDAO.couponIdSelect", cId);
	}

	// 쿠폰 리스트
	public List<CouponDTO> couponSelectAll() {
		System.out.println("쿠폰 리스트 불러오기 완료");
		return myBatis.selectList("cpDAO.cpSelectAll");
	}
}
