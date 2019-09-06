package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.board.BoardDAO;
import co.kr.khaki.board.BoardDTO;
import co.kr.khaki.board.BoardReplyDAO;
import co.kr.khaki.board.BoardReplyDTO;

@Controller
public class BoardReplyController {
	
	@Autowired
	BoardReplyDAO daoRe;
	@Autowired
	BoardDAO dao;
	
	//댓글 작성
	@RequestMapping("insertRe.do")
	public String ReplyInsert(BoardReplyDTO boardReplyDTO, Model model) {
		daoRe.insert(boardReplyDTO);
		// 게시글 가져오기
		BoardDTO boardDTO = new BoardDTO();
		BoardDTO dto = dao.select(boardDTO);
		model.addAttribute("dto", dto);
		// 댓글 가져오기
		List<BoardReplyDTO> listRe = daoRe.selectAll();
		model.addAttribute("listRe", listRe);
		System.out.println("댓글 추가 controller Reply");
		return "board/viewPage";
	}
	
}
