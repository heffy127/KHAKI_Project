package co.kr.khaki.notice.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.khaki.common.pagination;
import co.kr.khaki.notice.DAO.NoticeDAO;
import co.kr.khaki.notice.DTO.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeServiceInterface {

	@Autowired
	NoticeDAO ndao;
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#board(int, int)
	 */
	@Override
	public ArrayList board(int curPage, int pageSize) {
		// pageSize는 기본 10으로 요청이 있을 때는 바뀌어서 가져오게끔
		// spring 흐름 알기
		// 클라이언트 > 요청 > FC > 해당 Controller > (model 객체로 넘김) > View단
		List<NoticeDTO> notice_list = ndao.selectAll();
		// 해당 view에서 jstl 또는 스크립트 릿으로 위의 명칭한 이름으로 받는다
		
		// 공지사항 글 select
		List<NoticeDTO> notice_list_notice = ndao.select_notice();
		
		// 이벤트 글 select
		List<NoticeDTO> notice_list_event = ndao.select_event();
		// 총 게시글 수
		int listCnt = notice_list.size();
		
		pagination pg = new pagination(listCnt, curPage, pageSize);
    	// for문으로 출력해오는 것을 수로 어떻게 처리하는 것에 따라 다름
    	
    	ArrayList arr = new ArrayList();
		
    	arr.add(notice_list);
    	arr.add(notice_list_notice);
    	arr.add(notice_list_event);
    	arr.add(pg);
		
		return arr;
	}
	
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeInsertProcess(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model, int, int)
	 */
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeInsertProcess(co.kr.khaki.notice.DTO.NoticeDTO, int, int)
	 */
	@Override
   public ArrayList noticeInsertProcess(NoticeDTO noticeDTO, int curPage, int pageSize) {
		System.out.println("NoticeController InsertProcess!");
		ndao.insert(noticeDTO);
		
		//System.out.println("저장할 내용 : " + noticeDTO.getContent());
		List<NoticeDTO> notice_list = ndao.selectAll();
		int listCnt = notice_list.size();
	  	// 공지사항 글 select
		List<NoticeDTO> notice_list_notice = ndao.select_notice();
		// 이벤트 글 select
		List<NoticeDTO> notice_list_event = ndao.select_event();
      
		pagination pg = new pagination(listCnt, curPage, pageSize);
		
		ArrayList arr = new ArrayList();
		
		arr.add(notice_list);
		arr.add(pg);
		arr.add(notice_list_notice);
		arr.add(notice_list_event);
		
	  return arr;
	  // notice/notice는 게시판 맨 처음 부분(selectAll 등의 전체 적인 곳이 나오는 곳)
   }

	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeUpdate(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model)
	 */
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeUpdate(co.kr.khaki.notice.DTO.NoticeDTO)
	 */
	@Override
	public NoticeDTO noticeUpdate(NoticeDTO noticeDTO){
		noticeDTO = ndao.select(noticeDTO);
		return noticeDTO;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeUpdate2(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model, int, int)
	 */
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeUpdate2(co.kr.khaki.notice.DTO.NoticeDTO, int, int)
	 */
	@Override
	public ArrayList noticeUpdate2(NoticeDTO noticeDTO, int curPage, int pageSize){
		System.out.println("NoticeController Update2!");
		
		// noticeDTO내용 update(DB)
		ndao.update(noticeDTO);
		
		List<NoticeDTO> notice_list = ndao.selectAll();
		int listCnt = notice_list.size();
		// 공지사항 글 select
		List<NoticeDTO> notice_list_notice = ndao.select_notice();
		//System.out.println("공지사항 갯수 : "+notice_list_notice.size());
		
		// 이벤트 글 select
		List<NoticeDTO> notice_list_event = ndao.select_event();
		
		// 페이지네이션
		pagination pg = new pagination(listCnt, curPage, pageSize);
		
		ArrayList arr = new ArrayList();
		
		arr.add(notice_list);
		arr.add(notice_list_notice);
		arr.add(notice_list_event);
		arr.add(pg);
	    
		return arr;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeSelect(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model)
	 */
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeSelect(co.kr.khaki.notice.DTO.NoticeDTO)
	 */
	@Override
	public NoticeDTO noticeSelect(NoticeDTO noticeDTO){
		
		noticeDTO = ndao.select(noticeDTO);
		// 조회수 1증가 후 update
		noticeDTO.setHit(noticeDTO.getHit()+1);
		ndao.update(noticeDTO);
		
		return noticeDTO;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeDelete(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model, int, int)
	 */
	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeDelete(co.kr.khaki.notice.DTO.NoticeDTO, int, int)
	 */
	@Override
	public ArrayList noticeDelete(NoticeDTO noticeDTO, int curPage, int pageSize){
		
		ndao.delete(noticeDTO);
		
		List<NoticeDTO> notice_list = ndao.selectAll();
		int listCnt = notice_list.size();
		// 공지사항 글 select
		List<NoticeDTO> notice_list_notice = ndao.select_notice();
		//System.out.println("공지사항 갯수 : "+notice_list_notice.size());
		
		// 이벤트 글 select
		List<NoticeDTO> notice_list_event = ndao.select_event();

		pagination pg = new pagination(listCnt, curPage, pageSize);
		 
		ArrayList arr = new ArrayList();
		
		arr.add(notice_list);
		arr.add(notice_list_notice);
		arr.add(notice_list_event);
		arr.add(pg);
		
		return arr;
	}	
}