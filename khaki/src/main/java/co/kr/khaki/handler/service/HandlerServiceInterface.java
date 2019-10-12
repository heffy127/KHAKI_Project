package co.kr.khaki.handler.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.car.CarDTO;
import co.kr.khaki.handler.DTO.HandlerDTO;
import co.kr.khaki.handler.DTO.HandlerUseDTO;
import co.kr.khaki.member.DTO.MemberDTO;

public interface HandlerServiceInterface {

	List<HandlerDTO> handlerBoard();

	List<HandlerDTO> handlerDetailSearch(String startLocation);

	List<HandlerDTO> handlerDetailSearch2(String returnLocation);

	MemberDTO handlerIdCheck(MemberDTO memberDTO);

	// handler.jsp에서 아직 핸들러가 아닌 회원이 핸들러 신청하기 버튼을 클릭 했을 경우
	// 사용자의 useCount(카키 이용횟수)를 파악해 5번 이상 이용한 회원 일 경우 핸들러 신청 가능.
	String handlerUseCountCheck(MemberDTO memberDTO);

	// 핸들러 게시판에서 신청하기 버튼 누를 때마다 handleruse db에 insert
	void handlerUse(HandlerUseDTO handlerUseDTO);

	List<HandlerUseDTO> handlerUseSelect(String h_id);

	void handlerUseUpdate(HandlerUseDTO handlerUseDTO);

	void handlerDelete(HandlerDTO handlerDTO);
	
	public CarDTO carNumSelect(String CarNum);

}