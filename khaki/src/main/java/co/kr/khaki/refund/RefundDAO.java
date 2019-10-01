package co.kr.khaki.refund;
	
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.reservation.DTO.PayDTO;


@Repository
public class RefundDAO {

	@Autowired
	SqlSessionTemplate my;

	public void insert(RefundDTO RefundDTO) {
		System.out.println("RefundDAO Insert!");
		my.insert("refundDAO.insert", RefundDTO);
	}
	
	public void update(RefundDTO RefundDTO) {
		System.out.println("RefundDAO Update!");
		my.update("refundDAO.update", RefundDTO);
	}
	
	public RefundDTO select(String impUid) {
		System.out.println("RefundDTO select!");
		return my.selectOne("refundDAO.select", impUid);
	}
	
	public List<RefundDTO> selectAll() {
		System.out.println("RefundDTO selectAll!");
		return my.selectList("refundDAO.selectAll");
	}

}