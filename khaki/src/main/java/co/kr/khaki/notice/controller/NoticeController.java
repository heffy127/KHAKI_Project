package co.kr.khaki.notice.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
// 실제 내가 사용을 위한 import
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.common.pagination;
import co.kr.khaki.notice.DTO.NoticeDTO;
import co.kr.khaki.notice.service.NoticeServiceInterface;

@Controller
public class NoticeController {

	@Autowired
	NoticeServiceInterface noticeServiceImpl;
	
	@RequestMapping("notice.do")
	public String board(Model model, @RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize) {
		
		
		// spring 흐름 알기
		// 클라이언트 > 요청 > FC > 해당 Controller > (model 객체로 넘김) > View단
		
		ArrayList arr = noticeServiceImpl.board(curPage, pageSize);
		
		List<NoticeDTO> notice_list = (List<NoticeDTO>) arr.get(0);
		List<NoticeDTO> notice_list_notice = (List<NoticeDTO>) arr.get(1);
		List<NoticeDTO> notice_list_event = (List<NoticeDTO>) arr.get(2);
		pagination pg = (pagination) arr.get(3);
    	// for문으로 출력해오는 것을 수로 어떻게 처리하는 것에 따라 다름
    	
		model.addAttribute("nlist", notice_list);
		model.addAttribute("listCnt", pg.getListCnt());
		model.addAttribute("pagination",pg);
		model.addAttribute("noticelist", notice_list_notice);
		model.addAttribute("eventlist", notice_list_event);
		
		
		return "notice/notice";
	}
	
	@RequestMapping("noticeInsert.do")
	public String noticeInsert() {
		return "notice/noticeInsert";
	}
	
	@RequestMapping(value="noticeInsertProcess.do", method = RequestMethod.POST)
	   public String noticeInsertProcess(NoticeDTO noticeDTO, Model model, @RequestParam(defaultValue="1") int curPage, 
				@RequestParam(defaultValue="10") int pageSize) {
	      System.out.println("NoticeController InsertProcess!");
	      ArrayList arr = noticeServiceImpl.noticeInsertProcess(noticeDTO, curPage, pageSize);
	      
	      List<NoticeDTO> notice_list = (List<NoticeDTO>) arr.get(0);

	      pagination pg = (pagination) arr.get(1);
	      // 공지사항 글 select
		  List<NoticeDTO> notice_list_notice = (List<NoticeDTO>) arr.get(2);
		  //System.out.println("공지사항 갯수 : "+notice_list_notice.size());
			
		  // 이벤트 글 select
		  List<NoticeDTO> notice_list_event = (List<NoticeDTO>) arr.get(3);
	      
	      model.addAttribute("nlist", notice_list);
	      model.addAttribute("listCnt", pg.getListCnt());
	      model.addAttribute("pagination",pg);
	      model.addAttribute("noticelist", notice_list_notice);
		  model.addAttribute("eventlist", notice_list_event);
	      
	      return "notice/notice";
	      // notice/notice는 게시판 맨 처음 부분(selectAll 등의 전체 적인 곳이 나오는 곳)
	   }

	@RequestMapping("noticeUpdate1.do")
	public String noticeUpdate(NoticeDTO noticeDTO, Model model){
		
		System.out.println("NoticeController Update1!");
		noticeDTO = noticeServiceImpl.noticeUpdate(noticeDTO);
		model.addAttribute("ndto", noticeDTO);
		
		return "notice/noticeUpdate";
	}
	
	@RequestMapping("noticeUpdate2.do")
	public String noticeUpdate2(NoticeDTO noticeDTO, Model model, @RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize){
		
		ArrayList arr = noticeServiceImpl.noticeUpdate2(noticeDTO, curPage, pageSize);
		List<NoticeDTO> notice_list = (List<NoticeDTO>) arr.get(0);
		// 공지사항 글 select
		List<NoticeDTO> notice_list_notice = (List<NoticeDTO>) arr.get(1);
		//System.out.println("공지사항 갯수 : "+notice_list_notice.size());
		// 이벤트 글 select
		List<NoticeDTO> notice_list_event = (List<NoticeDTO>) arr.get(2);

		pagination pg = (pagination) arr.get(3);
		
		model.addAttribute("nlist", notice_list);
	    model.addAttribute("listCnt", pg.getListCnt());
	    model.addAttribute("pagination",pg);
	    model.addAttribute("noticelist", notice_list_notice);
		model.addAttribute("eventlist", notice_list_event);
	    
	    
		return "notice/notice";
	}
	
	@RequestMapping("noticeSelect.do")
	public String noticeSelect(NoticeDTO noticeDTO, Model model){
		
		noticeDTO = noticeServiceImpl.noticeSelect(noticeDTO);
		model.addAttribute("ndto", noticeDTO);

		return "notice/noticeSelect";
	}
	
	@RequestMapping("noticeDelete.do")
	public String noticeDelete(NoticeDTO noticeDTO, Model model, @RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize){
		
		System.out.println("NoticeController Delete!");
		ArrayList arr = noticeServiceImpl.noticeDelete(noticeDTO, curPage, pageSize);
		
		List<NoticeDTO> notice_list = (List<NoticeDTO>) arr.get(0);
		// 공지사항 글 select
		List<NoticeDTO> notice_list_notice = (List<NoticeDTO>) arr.get(1);
		
		// 이벤트 글 select
		List<NoticeDTO> notice_list_event = (List<NoticeDTO>) arr.get(2);
		
		pagination pg = (pagination) arr.get(3);
		 
		model.addAttribute("listCnt", pg.getListCnt());
		model.addAttribute("pagination",pg);
		model.addAttribute("nlist", notice_list);
		model.addAttribute("noticelist", notice_list_notice);
		model.addAttribute("eventlist", notice_list_event);
		
		
		return "notice/notice";
	}	
}