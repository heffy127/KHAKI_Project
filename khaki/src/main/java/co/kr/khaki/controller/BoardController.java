package co.kr.khaki.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.khaki.board.BoardDAO;
import co.kr.khaki.board.BoardDTO;
import co.kr.khaki.board.BoardReplyDAO;
import co.kr.khaki.board.BoardReplyDTO;

@Controller
public class BoardController {

	@Autowired
	BoardDAO dao;
	@Autowired
	BoardReplyDAO daoRe;

	// 게시글 작성 페이지 넘김
	@RequestMapping("insertPage.do")
	public String insertPage() {
		return "board/insertPage";
	}
	

	// 게시글 작성
	@RequestMapping("insert.do")
	public String boardInsert(BoardDTO boardDTO, Model model) {
		dao.insert(boardDTO);
		List<BoardDTO> list = dao.selectAll();
		model.addAttribute("list", list);
		return "board/board";
	}

	/*
	 * // 다중파일업로드(Smart Editor)
	 * 
	 * @RequestMapping(value = "/file_uploader_html5.do", method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public String multiplePhotoUpload(HttpServletRequest request) {
	 * // 파일정보 StringBuffer sb = new StringBuffer(); try { // 파일명을 받는다 - 일반 원본파일명
	 * String oldName = request.getHeader("file-name"); // 파일 기본경로 _ 상세경로 String
	 * filePath = "D:/jeongds/d/khaki/src/main/webapp/resources/photoUpload/";
	 * String saveName = sb.append(new
	 * SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
	 * .append(UUID.randomUUID().toString()).append(oldName.substring(oldName.
	 * lastIndexOf("."))) .toString(); InputStream is = request.getInputStream();
	 * OutputStream os = new FileOutputStream(filePath + saveName); int numRead;
	 * byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))]; while
	 * ((numRead = is.read(b, 0, b.length)) != -1) { os.write(b, 0, numRead); }
	 * os.flush(); os.close(); // 정보 출력 sb = new StringBuffer();
	 * sb.append("&bNewLine=true").append("&sFileName=").append(oldName).append(
	 * "&sFileURL=") .append("/khaki/resources/photoUpload/").append(saveName); }
	 * catch (Exception e) { e.printStackTrace(); } return sb.toString(); }
	 */
	
	// 게시판 리스트 불러오기
	@RequestMapping("board.do")
	public String boardList(Model model) {
		List<BoardDTO> list = dao.selectAll();
		model.addAttribute("list", list);
		return "board/board";
	}

	// 게시판 제목 클릭시 view page로 넘김
	@RequestMapping("select.do")
	public String select(BoardDTO boardDTO, Model model) {
		// 게시글 조회수 증가 
		dao.updateViews(boardDTO);
		
		// 내용 select
		BoardDTO dto = dao.select(boardDTO);
		model.addAttribute("dto", dto);
		System.out.println(dto.getbNum());
		System.out.println("view페이지 호출 완료");
		
		//댓글 불러오기
		List<BoardReplyDTO> listRe = daoRe.selectAll();
		model.addAttribute("listRe", listRe);
		System.out.println("댓글완료");
		return "board/viewPage";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET )
	public String boardDelete(BoardDTO boardDTO, Model model) {
		dao.delete(boardDTO);
		
		List<BoardDTO> list = dao.selectAll(); 
		model.addAttribute("list", list);
		
		return "board/board";
	}
	
	// 게시글 추천
	@RequestMapping("updateHit.do")
	public String boardGood(BoardDTO boardDTO) {
		dao.updateHit(boardDTO);
		System.out.println("추천완료");
		return "board/updateHit";
	}
	
	// 게시글 추천값 가져와서 출력하기
	@RequestMapping("updateHitSelect.do")
	public String updateHitSelect(BoardDTO boardDTO, Model model) {
		BoardDTO dto2 = dao.select(boardDTO);
		model.addAttribute("dto2", dto2);
		System.out.println("추천 select");
		return "board/updateHitSelect";
	}
	// 게시글 수정 페이지 넘김
	@RequestMapping("updatePage.do")
	public String updatePage(BoardDTO boardDTO, Model model) {
		// 내용 select
		BoardDTO dto = dao.select(boardDTO);
		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "board/updatePage";
	}
	
	// 게시글 수정
	@RequestMapping("update.do")
	public String boardUpdate(BoardDTO boardDTO, Model model) {
		dao.update(boardDTO);
		// 게시글 수정 후에 리스트 불러오기
		List<BoardDTO> list = dao.selectAll(); 
		model.addAttribute("list", list);
		return "board/board";
	}

}
