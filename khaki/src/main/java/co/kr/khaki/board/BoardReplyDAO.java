package co.kr.khaki.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardReplyDAO {

	@Autowired
	SqlSessionTemplate myBatis;

	public void insert(BoardReplyDTO boardReplyDTO) {
		myBatis.insert("reDAO.insert", boardReplyDTO);
		System.out.println("댓글 등록 완료 DAO");
	}

	public List<BoardReplyDTO> select(BoardReplyDTO boardReplyDTO) {
		System.out.println("댓글 불러오기 완료");
		return myBatis.selectList("reDAO.select", boardReplyDTO);
	}

	public List<BoardReplyDTO> selectAll() {
		System.out.println("댓글리스트 호출 완료 DAO");
		return myBatis.selectList("reDAO.selectAll");
	}

	public void delete(BoardReplyDTO boardReplyDTO) {
		myBatis.delete("reDAO.delete", boardReplyDTO);
		System.out.println("댓글 삭제 완료");
	}
}
