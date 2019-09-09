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
		cdao.insert(claimDTO);
		return "key/claimView";
	}
}
