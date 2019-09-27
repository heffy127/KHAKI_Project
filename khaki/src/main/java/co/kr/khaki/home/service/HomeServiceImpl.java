package co.kr.khaki.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.khaki.board.BoardDAO;
import co.kr.khaki.board.BoardDTO;
import co.kr.khaki.car.CarDAO;
import co.kr.khaki.car.CarDTO;
import co.kr.khaki.car.NewCarDTO;
import co.kr.khaki.notice.NoticeDAO;
import co.kr.khaki.notice.NoticeDTO;

@Service
public class HomeServiceImpl {

   @Autowired
   NoticeDAO noticeDAO;
   @Autowired
   BoardDAO boardDAO;
   @Autowired
   CarDAO carDAO;

   // 공지사항 5개
	public List<NoticeDTO> selectNoticeFive() {
		
		return noticeDAO.selectFive();
	}
	
	// 자유게시판 추천순 5개
	public List<BoardDTO> selectBoardFive() {
		
		return boardDAO.selectFive();
	}
	
	// 신규 등록 차량 3대
	public List<NewCarDTO> selectCarThree() {
		
		return carDAO.selectThree();
	}
	
	
	
}
