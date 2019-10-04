package co.kr.khaki.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.khaki.board.BoardDAO;
import co.kr.khaki.board.BoardDTO;
import co.kr.khaki.car.CarDAO;
import co.kr.khaki.car.CarDTO;
import co.kr.khaki.car.NewCarDTO;
import co.kr.khaki.notice.DAO.NoticeDAO;
import co.kr.khaki.notice.DTO.NoticeDTO;

@Service
public class HomeServiceImpl implements HomeServiceInter {

   @Autowired
   NoticeDAO noticeDAO;
   @Autowired
   BoardDAO boardDAO;
   @Autowired
   CarDAO carDAO;

   // 공지사항 5개
	/* (non-Javadoc)
	 * @see co.kr.khaki.home.service.HomeServiceInter#selectNoticeFive()
	 */
	@Override
	public List<NoticeDTO> selectNoticeFive() {
		
		return noticeDAO.selectFive();
	}
	
	// 자유게시판 추천순 5개
	/* (non-Javadoc)
	 * @see co.kr.khaki.home.service.HomeServiceInter#selectBoardFive()
	 */
	@Override
	public List<BoardDTO> selectBoardFive() {
		
		return boardDAO.selectFive();
	}
	
	// 신규 등록 차량 3대
	/* (non-Javadoc)
	 * @see co.kr.khaki.home.service.HomeServiceInter#selectCarThree()
	 */
	@Override
	public List<NewCarDTO> selectCarThree() {
		
		return carDAO.selectThree();
	}
	
	
	
}
