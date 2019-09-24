package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.key.ClaimDAO;
import co.kr.khaki.key.ClaimDTO;

@Controller
public class ClaimController {
	
	@Autowired
	ClaimDAO cdao;

	@RequestMapping("claim.do")
	public String claim() {
		return "key/claim";
	}
	@RequestMapping("claimInsert.do")
	public String claimInsert(ClaimDTO claimDTO) {
		cdao.insert(claimDTO);
		return "key/key";
	}
	@RequestMapping("claimView.do")
	public String claimView(Model model) {
		List<ClaimDTO> list = cdao.selectAll();
		model.addAttribute("list", list);
		return "key/claimView";	
	}
	
	@RequestMapping("claimView1.do")
	public String claimView1(Model model,String category) {
		List<ClaimDTO> list = cdao.selectCate(category);
		model.addAttribute("list", list);
		return "key/claimView";	
	}
	
	@RequestMapping("claimResult.do")
	public String claimResult(Model model,ClaimDTO claimDTO) {
		cdao.result(claimDTO);
		List<ClaimDTO> list = cdao.selectAll();
		model.addAttribute("list", list);
		return "key/claimView";
	}
}
