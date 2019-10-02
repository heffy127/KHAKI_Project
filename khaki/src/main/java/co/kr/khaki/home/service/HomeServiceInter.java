package co.kr.khaki.home.service;

import java.util.List;

import co.kr.khaki.board.BoardDTO;
import co.kr.khaki.car.NewCarDTO;
import co.kr.khaki.notice.NoticeDTO;

public interface HomeServiceInter {

	// 공지사항 5개
	List<NoticeDTO> selectNoticeFive();

	// 자유게시판 추천순 5개
	List<BoardDTO> selectBoardFive();

	// 신규 등록 차량 3대
	List<NewCarDTO> selectCarThree();

}