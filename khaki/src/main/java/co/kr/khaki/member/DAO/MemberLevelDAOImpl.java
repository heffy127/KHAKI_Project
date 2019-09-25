package co.kr.khaki.member.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.member.DTO.MemberLevelDTO;

@Repository
public class MemberLevelDAOImpl implements MemberLevelDAOInter {
	
	@Autowired
	SqlSessionTemplate my;
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.MemberLevelDAO#selectId(java.lang.String)
	 */
	@Override
	public MemberLevelDTO selectId(String id) {
		MemberLevelDTO memberLevelDTO = my.selectOne("memberLevelDAO.selectId", id);
		System.out.println("멤버 레벨 select 완료");
		return memberLevelDTO;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.MemberLevelDAO#insert(java.lang.String)
	 */
	@Override
	public void insert(String id) {
		my.selectOne("memberLevelDAO.insert", id);
		System.out.println("멤버 레벨 insert 완료");
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.MemberLevelDAO#update(co.kr.khaki.member.DTO.MemberLevelDTO)
	 */
	@Override
	public void update(MemberLevelDTO memberLevelDTO) {
		my.selectOne("memberLevelDAO.update", memberLevelDTO);
		System.out.println("멤버 레벨 update 완료");
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.MemberLevelDAO#selectAll()
	 */
	@Override
	public List<MemberLevelDTO> selectAll() {
		List<MemberLevelDTO> list = my.selectList("memberLevelDAO.selectAll");
		System.out.println("멤버 레벨 selectAll 완료");
		return list;
	}
	
}
