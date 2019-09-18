package co.kr.khaki.key;

import java.util.List;

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
	
	public List<ClaimDTO> selectAll() {
		List<ClaimDTO> list = my.selectList("claimDAO.selectAll");
		return list;
	}
	public List<ClaimDTO> selectCate(String category) {
		List<ClaimDTO> list = my.selectList("claimDAO.selectCate",category);
		return list;
	}
	
	public void result(ClaimDTO claimDTO) {
		my.update("claimDAO.update", claimDTO);
	}
	
}
