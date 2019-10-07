package co.kr.khaki.coupon;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CouponUseDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<CouponUseDTO> select(CouponUseDTO cpuDTO) {
		System.out.println("CouponUseDTO select!");
		return my.selectList("cpuDAO.select", cpuDTO);
	}
	
	public List<CouponUseDTO> select2(String cp_id) {
		System.out.println("CouponUseDTO select2!");
		return my.selectList("cpuDAO.select2", cp_id);
	}
	
	public int selectCount(String cp_id) {
		System.out.println("CouponUseDTO selectCount!");
		return my.selectOne("cpuDAO.selectCount", cp_id);
	}
	
	public void delete(CouponUseDTO cpuDTO) {
		System.out.println("CouponUseDTO delete!");
		my.delete("cpuDAO.delete", cpuDTO);
	}
	
	public void update(CouponUseDTO cpuDTO) {
		System.out.println("CouponUseDTO Update!");
		my.update("cpuDAO.update", cpuDTO);
	}
	
	public void updateN(CouponUseDTO cpuDTO) {
		System.out.println("CouponUseDTO UpdateN!");
		my.update("cpuDAO.updateN", cpuDTO);
	}
	
}

