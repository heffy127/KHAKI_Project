package co.kr.khaki.key;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClaimDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(ClaimDTO claimDTO) {
		my.insert("claimDAO.insert", claimDTO);
	}
}
