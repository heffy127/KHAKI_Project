package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.khaki.board.BoardDAO;
import co.kr.khaki.board.BoardDTO;
import co.kr.khaki.board.BoardReplyDAO;
import co.kr.khaki.board.BoardReplyDTO;
import co.kr.khaki.member.DAO.MemberDAOImpl;

@Controller
public class BoardReplyController {

	@Autowired
	BoardReplyDAO daoRe;
	@Autowired
	BoardDAO dao;
	@Autowired
	MemberDAOImpl memImpl;


	// 댓글 작성
	@RequestMapping("insertRe.do")
	public String ReplyInsert(BoardReplyDTO boardReplyDTO, Model model) {
		daoRe.insert(boardReplyDTO);
		// 게시글 가져오기
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setbNum(boardReplyDTO.getbNum());
		// 내용 select
		BoardDTO dto = dao.select(boardDTO);
		// 작성자 프로필 사진
		String memPhoto = memImpl.selectPhoto(dto.getWriter());
		
		model.addAttribute("dto", dto);
		model.addAttribute("memPhoto", memPhoto);
		// 댓글 가져오기
		boardReplyDTO.setbNum(boardDTO.getbNum());
		List<BoardReplyDTO> listRe = daoRe.select(boardReplyDTO);
		model.addAttribute("listRe", listRe);
		System.out.println("댓글 추가 controller Reply");
		return "board/viewPage";
	}

	// 댓글삭제

	@RequestMapping(value = "deleteRe.do", method = RequestMethod.POST)
	public String replyDelete(BoardReplyDTO boardReplyDTO, Model model) {
		daoRe.delete(boardReplyDTO); 
		// 게시글 가져오기 
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setbNum(boardReplyDTO.getbNum());
		BoardDTO dto = dao.select(boardDTO);
		model.addAttribute("dto", dto); 
		// 댓글 가져오기
		List<BoardReplyDTO> listRe = daoRe.select(boardReplyDTO);
		model.addAttribute("listRe", listRe);
		System.out.println("댓글 삭제 controller Reply");
		return "board/viewPage";
	}

}
