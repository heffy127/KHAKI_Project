package co.kr.khaki.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.board.BoardDAO;
import co.kr.khaki.board.BoardDTO;
import co.kr.khaki.board.BoardReplyDAO;
import co.kr.khaki.board.BoardReplyDTO;
import co.kr.khaki.common.pagination;
import co.kr.khaki.member.DAO.MemberDAOImpl;
import co.kr.khaki.member.DTO.MemberDTO;

@Controller
public class BoardController {

	@Autowired
	BoardDAO dao;

	@Autowired
	BoardReplyDAO daoRe;
	
	@Autowired
	MemberDAOImpl memImpl;

	// 게시글 작성 페이지 넘김
	@RequestMapping("insertPage.do")
	public String insertPage() {
		return "board/insertPage";
	}

	// 게시글 작성
	@RequestMapping("insert.do")
	public String boardInsert(BoardDTO boardDTO, Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "10") int pageSize) {
		dao.insert(boardDTO);
		List<BoardDTO> list = dao.selectAll();

		// pagination
		int listCnt = list.size();
		pagination pg = new pagination(listCnt, curPage, pageSize);

		model.addAttribute("list", list); // 게시글

		// pagination 부분
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		model.addAttribute("list", list);
		return "board/board";
	}

	// 게시판 리스트 불러오기
	@RequestMapping("board.do")
	public String boardList(Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "10") int pageSize) {

		List<BoardDTO> list = dao.selectAll();

		// pagination
		int listCnt = list.size();
		pagination pg = new pagination(listCnt, curPage, pageSize);

		model.addAttribute("list", list); // 게시글

		// pagination 부분
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);

		return "board/board";
	}

	// 내글 보기 리스트 불러오기
	@RequestMapping("mypage_myBoard.do")
	public String mypage_boardList(String writer, Model model) {
		List<BoardDTO> list = dao.selectWriter(writer);
		model.addAttribute("list", list);
		return "mypage/myBoard";
	}

	// 내글 보기 글 삭제
	@RequestMapping(value = "delete_myboard.do", method = RequestMethod.POST)
	public String delete_myboard(BoardDTO boardDTO, Model model, HttpSession session) {
		dao.delete(boardDTO);

		List<BoardDTO> list = dao.selectWriter((String) session.getAttribute("sessionId"));
		model.addAttribute("list", list);

		return "mypage/myBoard";
	}

	// 게시판 제목 클릭시 view page로 넘김
	@RequestMapping("select.do")
	public String select(BoardDTO boardDTO, Model model) {
		// 게시글 조회수 증가
		dao.updateViews(boardDTO);

		// 내용 select
		BoardDTO dto = dao.select(boardDTO);
		// 게시글 작성자 프로필 사진 호출
		String memPhoto = memImpl.selectPhoto(dto.getWriter());
		
		System.out.println(dto.getWriter());
		System.out.println(memPhoto);
		
		model.addAttribute("dto", dto);
		model.addAttribute("memPhoto", memPhoto);
		System.out.println("view페이지 호출 완료");

		// 댓글 불러오기
		BoardReplyDTO boardReplyDTO = new BoardReplyDTO();
		boardReplyDTO.setbNum(boardDTO.getbNum());
		List<BoardReplyDTO> listRe = daoRe.select(boardReplyDTO);
		model.addAttribute("listRe", listRe);
		System.out.println("댓글완료");
		return "board/viewPage";
	}

	// 게시글 삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String boardDelete(BoardDTO boardDTO, Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "10") int pageSize) {
		dao.delete(boardDTO);

		List<BoardDTO> list = dao.selectAll();

		// pagination
		int listCnt = list.size();
		pagination pg = new pagination(listCnt, curPage, pageSize);

		model.addAttribute("list", list); // 게시글

		// pagination 부분
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
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
		System.out.println("test:");
		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "board/updatePage";
	}

	// 게시글 수정
	@RequestMapping("update.do")
	public String boardUpdate(BoardDTO boardDTO, Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "10") int pageSize) {
		dao.update(boardDTO);
		// 게시글 수정 후에 리스트 불러오기
		List<BoardDTO> list = dao.selectAll();

		// pagination
		int listCnt = list.size();
		pagination pg = new pagination(listCnt, curPage, pageSize);

		model.addAttribute("list", list); // 게시글

		// pagination 부분
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		model.addAttribute("list", list);
		return "board/board";
	}

}
