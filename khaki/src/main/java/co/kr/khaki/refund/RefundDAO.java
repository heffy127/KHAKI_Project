package co.kr.khaki.refund;
	
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class RefundDAO {

	@Autowired
	SqlSessionTemplate my;

	public void insert(RefundDTO RefundDTO) {
		System.out.println("RefundDAO Insert!");
		my.insert("refundDAO.insert", RefundDTO);
	}
	
	public RefundDTO select(String impUid) {
		System.out.println("RefundDTO select!");
		return my.selectOne("refundDAO.select", impUid);
	}

}