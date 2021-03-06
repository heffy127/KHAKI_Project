package co.kr.khaki.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	public void insert(BoardDTO boardDTO) {
		myBatis.insert("bDAO.insert", boardDTO);
		System.out.println(boardDTO.getTitle());
		System.out.println("insert 완료");
	}
	
	public void update(BoardDTO boardDTO) {
		myBatis.update("bDAO.update", boardDTO);
		System.out.println("update 완료");
	}
	public void updateViews(BoardDTO boardDTO) {
		myBatis.update("bDAO.updateViews", boardDTO);
		System.out.println("View update 완료");
	}
	public void updateHit(BoardDTO boardDTO) {
		myBatis.update("bDAO.updateHit", boardDTO);
		System.out.println("Hit update 완료");
	}
	public void delete(BoardDTO boardDTO) {
		myBatis.delete("bDAO.delete", boardDTO);
		System.out.println("delete 완료");
	}
	public BoardDTO select(BoardDTO boardDTO) {
		System.out.println("select 완료");
		return myBatis.selectOne("bDAO.select", boardDTO);
	}
	public List<BoardDTO> selectAll() {
		System.out.println("selectAll 완료");
		return myBatis.selectList("bDAO.selectAll");
	}
	
	// 메인페이지 추천 내림차순 5개 select
	public List<BoardDTO> selectFive() {
		System.out.println("selectFive 완료");
		return myBatis.selectList("bDAO.selectFive");
	}
	
	public List<BoardDTO> selectWriter(String writer) {
		System.out.println("selectWriter 완료");
		return myBatis.selectList("bDAO.selectWriter",writer);
	}
	
	public int countWrite(String writer) {
		System.out.println("countWrite 완료");
		return myBatis.selectOne("bDAO.countWrite",writer);
	}
	
	
	
}
