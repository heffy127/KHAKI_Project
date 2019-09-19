package co.kr.khaki.notice;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO Insert!");
		
		Date today = new Date();
		SimpleDateFormat sp = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss a");
		
		noticeDTO.setWrite_date(sp.format(today));
		// write_date의 value에 상관없이 오늘날짜가 들어가도록 설계(DB상에서 바로 넣는 방법 찾아보기...)
		System.out.println(noticeDTO);
		my.insert("nDAO.insert", noticeDTO);
	}
	
	public void update(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO Update!");
		my.update("nDAO.update", noticeDTO);
	}
	
	public void delete(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO delete!");
		my.delete("nDAO.delete", noticeDTO);
	}
	
	public NoticeDTO select(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO select!");
		return my.selectOne("nDAO.select", noticeDTO);
	}
	
	public List<NoticeDTO> selectAll() {
		System.out.println("NoticeDAO selectAll!");
		return my.selectList("nDAO.selectAll");
	}
	
	// 메인페이지에 최근 글 5개만 가져옴
	public List<NoticeDTO> selectFive() {
		System.out.println("NoticeDAO selectFive!");
		return my.selectList("nDAO.selectFive");
	}
	
	public List<NoticeDTO> select_notice(){
		System.out.println("NoticeDAO select_notice");
		return my.selectList("nDAO.select_notice");
	}
	
	public List<NoticeDTO> select_event(){
		System.out.println("NoticeDAO select_event");
		return my.selectList("nDAO.select_event");
	}
	
}

