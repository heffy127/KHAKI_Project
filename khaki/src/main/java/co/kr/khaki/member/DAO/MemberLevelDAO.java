package co.kr.khaki.member.DAO;

import java.util.List;

import co.kr.khaki.member.DTO.MemberLevelDTO;

public interface MemberLevelDAO {

	MemberLevelDTO selectId(String id);

	void insert(String id);

	void update(MemberLevelDTO memberLevelDTO);

	List<MemberLevelDTO> selectAll();

}