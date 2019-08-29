package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.handler.HandlerDAO;
import co.kr.khaki.handler.HandlerDTO;
import co.kr.khaki.handler.HandlerStatusDTO;
import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.member.MemberDTO;

@Controller
public class HandlerController {
	
	@Autowired
	HandlerDAO hdao;
	
	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping("handler.do")
	public String handler() {
		return "handler/handler";
	}
	
	@RequestMapping("handlerBoard.do")
	public String handlerBoard(Model model) {
		List<HandlerDTO> handler = hdao.selectAll();
		System.out.println("Controller SelectAll");
		model.addAttribute("hlist", handler);
		return "handler/handlerBoard";
	}
	
	@RequestMapping("handlerJquery.do")
	public String handlerJquery(Model model) {
		return "handler/handlerJquery";
	}
	
	@RequestMapping("handlerDetailSearch.do")
	public String handlerDetailSearch(HandlerDTO hdto, Model model) {
		List<HandlerDTO> handler = hdao.select(hdto);
		System.out.println("Controller Select");
		model.addAttribute("hlist", handler);
		return "handler/handlerDetailSearch";
	}
	
	@RequestMapping("handlerDetailSearch2.do")
	public String handlerDetailSearch2(HandlerDTO hdto, Model model) {
		List<HandlerDTO> handler = hdao.select2(hdto);
		System.out.println("Controller Select2");
		model.addAttribute("hlist2", handler);
		return "handler/handlerDetailSearch2";
	}
	
	@RequestMapping("handlerIdCheck.do")
	public String handlerIdCheck(MemberDTO memberDTO, Model model) {
		memberDTO = memberDAO.selectId(memberDTO.getId());
		model.addAttribute("memberDTO", memberDTO);
		return "handler/handlerIdCheck";
	}
	
	// handler.jsp에서 아직 핸들러가 아닌 회원이 핸들러 신청하기 버튼을 클릭 했을 경우
	// 사용자의 useCount(카키 이용횟수)를 파악해 5번 이상 이용한 회원 일 경우 핸들러 신청 가능.
	@RequestMapping("handlerUseCountCheck.do")
	public String handlerUseCountCheck(MemberDTO memberDTO, Model model) {
		memberDTO = memberDAO.selectId(memberDTO.getId()); // ajax에서 sessionId를 data로 보내서 해당 id로 select
		System.out.println(memberDTO.getId() + " : sessionId 확인");
		System.out.println(memberDTO.getUseCount() + " : useCount 확인"); // sessionId와 useCount 확인.
		String handler = ""; // handler여부에 들어갈 데이터 변수 생성
		HandlerStatusDTO hsDTO = new HandlerStatusDTO();
		System.out.println("확이이인");
		hsDTO.setId(memberDTO.getId()); // handler여부 DTO에 set id
		if(Integer.parseInt(memberDTO.getUseCount()) > 4) { // select해 온 useCount가 4보다 클 경우(5이상인 경우)
			handler = "Y";
			hsDTO.setHandler(handler);
			System.out.println("입력 될 데이터 : " + hsDTO.getId() + ", " + hsDTO.getHandler());
			memberDAO.updateHandler(hsDTO); 
			model.addAttribute("useCountCheck", handler);
		} else if(memberDTO.getUseCount() == "") { // select해 온 useCount가 한번도 이용을 하지 않아 비어 있을 경우(NULL)
			handler = "N";
			hsDTO.setHandler(handler);
			System.out.println("입력 될 데이터 : " + hsDTO.getId() + ", " + hsDTO.getHandler());
			memberDAO.updateHandler(hsDTO);
			model.addAttribute("useCountCheck", handler);
		} else { // 4미만일 경우
			handler = "N";
			hsDTO.setHandler(handler);
			System.out.println("입력 될 데이터 : " + hsDTO.getId() + ", " + hsDTO.getHandler());
			memberDAO.updateHandler(hsDTO);
			model.addAttribute("useCountCheck", handler);
		}
		model.addAttribute("useCountCheck", handler); // 핸들러 여부 결과 Y/N 중 하나를 다음 페이지로 전송
		
		return "handler/handlerUseCountCheck";
	}
	
}
