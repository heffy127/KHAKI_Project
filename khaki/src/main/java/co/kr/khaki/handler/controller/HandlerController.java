package co.kr.khaki.handler.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.car.CarDTO;
import co.kr.khaki.handler.DTO.HandlerDTO;
import co.kr.khaki.handler.DTO.HandlerUseDTO;
import co.kr.khaki.handler.service.HandlerServiceInterface;
import co.kr.khaki.member.DTO.MemberDTO;

@Controller
public class HandlerController {
	
	@Autowired
	HandlerServiceInterface handlerServiceImpl;

	@RequestMapping("handler.do")
	public String handler() {
		return "handler/handler";
	}

	@RequestMapping("handlerBoard.do")
	public String handlerBoard(Model model) {
		List<HandlerDTO> hd = handlerServiceImpl.handlerBoard();
		model.addAttribute("hlist", hd);
		return "handler/handlerBoard";
	}

	@RequestMapping("handlerJquery.do")
	public String handlerJquery(Model model) {
		return "handler/handlerJquery";
	}

	@RequestMapping("handlerDetailSearch.do")
	public String handlerDetailSearch(HandlerDTO hdto, Model model) {
		List<HandlerDTO> handler = handlerServiceImpl.handlerDetailSearch(hdto);
		model.addAttribute("hlist", handler);
		return "handler/handlerDetailSearch";
	}

	@RequestMapping("handlerDetailSearch2.do")
	public String handlerDetailSearch2(HandlerDTO hdto, Model model) {
		List<HandlerDTO> handler = handlerServiceImpl.handlerDetailSearch2(hdto);
		model.addAttribute("hlist2", handler);
		return "handler/handlerDetailSearch2";
	}

	@RequestMapping("handlerIdCheck.do")
	public String handlerIdCheck(MemberDTO memberDTO, Model model) {
		MemberDTO memberDTO2 = handlerServiceImpl.handlerIdCheck(memberDTO);
		model.addAttribute("memberDTO", memberDTO2);
		return "handler/handlerIdCheck";
	}

	// handler.jsp에서 아직 핸들러가 아닌 회원이 핸들러 신청하기 버튼을 클릭 했을 경우
	// 사용자의 useCount(카키 이용횟수)를 파악해 5번 이상 이용한 회원 일 경우 핸들러 신청 가능.
	@RequestMapping("handlerUseCountCheck.do")
	public String handlerUseCountCheck(MemberDTO memberDTO, Model model) {
		String result = handlerServiceImpl.handlerUseCountCheck(memberDTO);
		model.addAttribute("useCountCheck", result);
		return "handler/handlerUseCountCheck";
	}

	// 핸들러 게시판에서 신청하기 버튼 누를 때마다 handleruse db에 insert
	@RequestMapping("handlerUse.do")
	public String handlerUse(HandlerUseDTO handlerUseDTO) {
		handlerServiceImpl.handlerUse(handlerUseDTO);
		return "handler/handlerUse";
	}

	@RequestMapping("handlerUseSelect.do")
	public String handlerUseSelect(String h_id, Model model) {
		List<HandlerUseDTO> hu = handlerServiceImpl.handlerUseSelect(h_id);
		model.addAttribute("hulist", hu);
		return "handler/handlerUseSelect";
	}

	@RequestMapping("handlerUseUpdate.do")
	public String handlerUseUpdate(HandlerUseDTO handlerUseDTO) {
		handlerServiceImpl.handlerUseUpdate(handlerUseDTO);
		return "handler/handlerUseSelect";
	}

	@RequestMapping("handlerDelete.do")
	public String handlerDelete(HandlerDTO handlerDTO) {
		handlerServiceImpl.handlerDelete(handlerDTO);

		return "handler/handlerDelete";
	}
	
	@RequestMapping("carNumSelect.do")
	public String carNumSelect(String carNum, Model model) {
		System.out.println("carNum : " + carNum);
		CarDTO carDTO = handlerServiceImpl.carNumSelect(carNum);
		System.out.println("get carImage : " + carDTO.getCar_image());
		model.addAttribute("carDTO", carDTO);
		return "handler/carNumSelect";
	}

}
