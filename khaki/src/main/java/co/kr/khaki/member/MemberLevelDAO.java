package co.kr.khaki.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberLevelDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public MemberLevelDTO selectId(String id) {
		MemberLevelDTO memberLevelDTO = my.selectOne("memberLevelDAO.selectId", id);
		System.out.println("멤버 레벨 select 완료");
		return memberLevelDTO;
	}
	
	public void insert(String id) {
		my.selectOne("memberLevelDAO.insert", id);
		System.out.println("멤버 레벨 insert 완료");
	}
	
	public void update(MemberLevelDTO memberLevelDTO) {
		my.selectOne("memberLevelDAO.update", memberLevelDTO);
		System.out.println("멤버 레벨 update 완료");
	}
	
	public List<MemberLevelDTO> selectAll() {
		List<MemberLevelDTO> list = my.selectList("memberLevelDAO.selectAll");
		System.out.println("멤버 레벨 selectAll 완료");
		return list;
	}
	
}
