package co.kr.khaki.refund.DAO;
	
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.refund.DTO.RefundDTO;
import co.kr.khaki.reservation.DTO.PayDTO;


@Repository
public class RefundDAOImpl implements RefundDAOInterface {

	@Autowired
	SqlSessionTemplate my;

	@Override
	public void insert(RefundDTO RefundDTO) {
		System.out.println("RefundDAO Insert!");
		my.insert("refundDAO.insert", RefundDTO);
	}
	
	@Override
	public void update(RefundDTO RefundDTO) {
		System.out.println("RefundDAO Update!");
		my.update("refundDAO.update", RefundDTO);
	}
	
	@Override
	public RefundDTO select(String impUid) {
		System.out.println("RefundDTO select!");
		return my.selectOne("refundDAO.select", impUid);
	}
	
	@Override
	public List<RefundDTO> selectAll() {
		System.out.println("RefundDTO selectAll!");
		return my.selectList("refundDAO.selectAll");
	}

}