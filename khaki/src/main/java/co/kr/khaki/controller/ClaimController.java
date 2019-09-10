package co.kr.khaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.key.ClaimDAO;
import co.kr.khaki.key.ClaimDTO;

@Controller
public class ClaimController {
	
	@Autowired
	ClaimDAO cdao;

	@RequestMapping("key.do")
	public String key() {
		return "key/key";
	}
	@RequestMapping("claim.do")
	public String claim() {
		return "key/claim";
	}
	@RequestMapping("claimInsert.do")
	public String claimInsert(ClaimDTO claimDTO) {
		claimDTO.setClaim_resNum(1);
		claimDTO.setClaim_suspect("mos4657");
		claimDTO.setClaim_id("mos4657");
		claimDTO.setClaim_result("회초리3대");
		cdao.insert(claimDTO);
		
		return "key/claimView";
	}
}
