package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.handler.HandlerDAO;
import co.kr.khaki.handler.HandlerDTO;
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
	
}
