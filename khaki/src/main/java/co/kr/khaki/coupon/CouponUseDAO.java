package co.kr.khaki.coupon;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.handler.HandlerDTO;

@Repository
public class CouponUseDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<CouponUseDTO> select(CouponUseDTO cpuDTO) {
		System.out.println("CouponUseDTO select!");
		return my.selectList("cpuDAO.select", cpuDTO);
	}
	
	public void delete(CouponUseDTO cpuDTO) {
		System.out.println("CouponUseDTO delete!");
		my.delete("cpuDAO.delete", cpuDTO);
	}
	
	public void update(CouponUseDTO cpuDTO) {
		System.out.println("CouponUseDTO Update!");
		my.update("cpuDAO.update", cpuDTO);
	}
	
}

