package co.kr.khaki.refund;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.pay.PayDTO;

@Repository
public class RefundDAO {

	@Autowired
	SqlSessionTemplate my;

	public void insert(RefundDTO RefundDTO) {
		System.out.println("RefundDAO Insert!");
		my.insert("refundDAO.insert", RefundDTO);
	}

}