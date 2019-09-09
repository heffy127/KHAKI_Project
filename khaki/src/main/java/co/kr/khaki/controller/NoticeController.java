package co.kr.khaki.controller;

// 포토 업로더를 위한 import
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.khaki.notice.NoticeDAO;
import co.kr.khaki.notice.NoticeDTO;
import co.kr.khaki.notice.pagination;

// 실제 내가 사용을 위한 import
import org.springframework.ui.Model;
import java.util.List;

@Controller
public class NoticeController {

	@Autowired
	NoticeDAO ndao;
	
	@RequestMapping("notice.do")
	public String board(Model model, @RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize) {
		// pageSize는 기본 10으로 요청이 있을 때는 바뀌어서 가져오게끔
		// spring 흐름 알기
		// 클라이언트 > 요청 > FC > 해당 Controller > (model 객체로 넘김) > View단
		List<NoticeDTO> notice_list = ndao.selectAll();
		System.out.println(notice_list);
		
		// 해당 view에서 jstl 또는 스크립트 릿으로 위의 명칭한 이름으로 받는다
		
		//test
		System.out.println("현재 페이지 : " + curPage+ "/ 현재 페이지 사이즈 : "+pageSize);
		
		// 공지사항 글 select
		List<NoticeDTO> notice_list_notice = ndao.select_notice();
		//System.out.println("공지사항 갯수 : "+notice_list_notice.size());
		
		// 이벤트 글 select
		List<NoticeDTO> notice_list_event = ndao.select_event();
		System.out.println("이벤트글 갯수 : "+notice_list_event.size());
		

		// 총 게시글 수
		int listCnt = notice_list.size();
		
		pagination pg = new pagination(listCnt, curPage, pageSize);
    	// for문으로 출력해오는 것을 수로 어떻게 처리하는 것에 따라 다름
    	
    	
    	System.out.println(listCnt + ", 총 페이지수 : " + pg.getPageCnt() + ", 총 블럭수 : "
    	+ pg.getRangeCnt()+", 현재 블럭 : "+pg.getCurRange()+", startIndex : "+pg.getStartIndex()+", endIndex : "+pg.getEndIndex());
		
    	
		model.addAttribute("nlist", notice_list);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination",pg);
		model.addAttribute("noticelist", notice_list_notice);
		model.addAttribute("eventlist", notice_list_event);
		
		
		return "notice/notice";
	}
	
	@RequestMapping("noticeInsert.do")
	public String noticeInsert(int curPage, int pageSize, Model model) {
		
		System.out.println("-------------------");
		System.out.println("noticeInsert");
		System.out.println("페이지네이션 테스트");
		System.out.println("현재 페이지 : " + curPage+" / 페이지당 게시글 수 : "+ pageSize);
		System.out.println("-------------------");
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("curPage", curPage);
		
		return "notice/noticeInsert";
	}
	
	@RequestMapping(value="noticeInsertProcess.do", method = RequestMethod.POST)
	   public String noticeInsertProcess(NoticeDTO noticeDTO, Model model, @RequestParam(defaultValue="1") int curPage, 
				@RequestParam(defaultValue="10") int pageSize) {
	      //System.out.println(noticeDTO);
	      System.out.println("NoticeController InsertProcess!");
	      ndao.insert(noticeDTO);
			
	      System.err.println("저장할 내용 : " + noticeDTO.getContent());
	      List<NoticeDTO> notice_list = ndao.selectAll();
	      int listCnt = notice_list.size();
	      	// 공지사항 글 select
			List<NoticeDTO> notice_list_notice = ndao.select_notice();
			//System.out.println("공지사항 갯수 : "+notice_list_notice.size());
			
			// 이벤트 글 select
			List<NoticeDTO> notice_list_event = ndao.select_event();
			System.out.println("이벤트글 갯수 : "+notice_list_event.size());
	      
	      
	      pagination pg = new pagination(listCnt, curPage, pageSize);
	      
	      model.addAttribute("nlist", notice_list);
	      model.addAttribute("listCnt", listCnt);
	      model.addAttribute("pagination",pg);
	      model.addAttribute("noticelist", notice_list_notice);
		  model.addAttribute("eventlist", notice_list_event);
	      
	      
	      return "notice/notice";
	      // notice/notice는 게시판 맨 처음 부분(selectAll 등의 전체 적인 곳이 나오는 곳)
	   }

	@RequestMapping("noticeUpdate1.do")
	public String noticeUpdate(NoticeDTO noticeDTO, Model model, @RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize){
		
		System.out.println("-------------------");
        System.out.println("NoticeUpdate1");
        System.out.println("페이지네이션 테스트");
        System.out.println("현재 페이지 : " + curPage+" / 페이지당 게시글 수 : "+ pageSize);
        System.out.println("-------------------");
		
		
		System.out.println("NoticeController Update1!");
		noticeDTO = ndao.select(noticeDTO);
		model.addAttribute("ndto", noticeDTO);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("curPage", curPage);
		
		return "notice/noticeUpdate";
	}
	
	@RequestMapping("noticeUpdate2.do")
	public String noticeUpdate2(NoticeDTO noticeDTO, Model model, @RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize){
		System.out.println("NoticeController Update2!");
		ndao.update(noticeDTO);
		
		System.out.println("-------------------");
        System.out.println("NoticeUpdate2");
        System.out.println("페이지네이션 테스트");
        System.out.println("현재 페이지 : " + curPage+" / 페이지당 게시글 수 : "+ pageSize);
        System.out.println("-------------------");
		
		
		List<NoticeDTO> notice_list = ndao.selectAll();
		int listCnt = notice_list.size();
		// 공지사항 글 select
		List<NoticeDTO> notice_list_notice = ndao.select_notice();
		//System.out.println("공지사항 갯수 : "+notice_list_notice.size());
		
		// 이벤트 글 select
		List<NoticeDTO> notice_list_event = ndao.select_event();
		System.out.println("이벤트글 갯수 : "+notice_list_event.size());  
		
		
		pagination pg = new pagination(listCnt, curPage, pageSize);
		
		model.addAttribute("nlist", notice_list);
	    model.addAttribute("listCnt", listCnt);
	    model.addAttribute("pagination",pg);
	    model.addAttribute("noticelist", notice_list_notice);
		model.addAttribute("eventlist", notice_list_event);
	    
	    
		return "notice/notice";
	}
	
	@RequestMapping("noticeSelect.do")
	public String noticeSelect(NoticeDTO noticeDTO, Model model, @RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize){
		
		System.out.println("-------------------");
        System.out.println("NoticeSelect");
        System.out.println("페이지네이션 테스트");
        System.out.println("현재 페이지 : " + curPage+" / 페이지당 게시글 수 : "+ pageSize);
        System.out.println("-------------------");
		
		noticeDTO = ndao.select(noticeDTO);
		// 조회수 1증가 후 update
		noticeDTO.setHit(noticeDTO.getHit()+1);
		ndao.update(noticeDTO);
		model.addAttribute("ndto", noticeDTO);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("curPage", curPage);
		
		return "notice/noticeSelect";
	}
	
	@RequestMapping("noticeDelete.do")
	public String noticeDelete(NoticeDTO noticeDTO, Model model, @RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="10") int pageSize){
		
		System.out.println("-------------------");
        System.out.println("NoticeDelete");
        System.out.println("페이지네이션 테스트");
        System.out.println("현재 페이지 : " + curPage+" / 페이지당 게시글 수 : "+ pageSize);
        System.out.println("-------------------");
		
		System.out.println("NoticeController Delete!");
		ndao.delete(noticeDTO);
		
		List<NoticeDTO> notice_list = ndao.selectAll();
		int listCnt = notice_list.size();
		// 공지사항 글 select
		List<NoticeDTO> notice_list_notice = ndao.select_notice();
		//System.out.println("공지사항 갯수 : "+notice_list_notice.size());
		
		// 이벤트 글 select
		List<NoticeDTO> notice_list_event = ndao.select_event();
		System.out.println("이벤트글 갯수 : "+notice_list_event.size()); 

		
		pagination pg = new pagination(listCnt, curPage, pageSize);
		 
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination",pg);
		model.addAttribute("nlist", notice_list);
		model.addAttribute("noticelist", notice_list_notice);
		model.addAttribute("eventlist", notice_list_event);
		
		
		return "notice/notice";
	}	
 
    // 다중파일업로드
    @RequestMapping(value = "/file_uploader_html5.do",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            //String filePath = "D:/min/project3/khaki/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/khaki/resources/photoUpload/";	//종합본에서의 filepath
            String filePath = "D:/projectKHAKI/egit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/khaki/resources/photoUpload/";	//노트북시 서버경로
            
            //서버경로로 설정
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("/khaki/resources/photoUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
	
}
