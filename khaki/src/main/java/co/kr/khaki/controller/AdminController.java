package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.org.apache.xpath.internal.operations.Mod;

import co.kr.khaki.member.LicenseDAO;
import co.kr.khaki.member.LicenseDTO;
import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.member.MemberDTO;
import co.kr.khaki.member.MemberLevelDAO;
import co.kr.khaki.member.MemberLevelDTO;

@Controller
public class AdminController {

	@Autowired
	MemberDAO memberDAO;
	@Autowired
	MemberLevelDAO memberLevelDAO;
	@Autowired
	LicenseDAO licenseDAO;
	
	@RequestMapping("admin.do")
	public String admin() {	
	
		return "admin/admin";
	}
	
	// 관리자 회원 관리 창
	@RequestMapping("admin_memberAll.do")
	public String admin_memberAll(Model model) {	
		List<MemberDTO> memberList = memberDAO.selectAll();
		List<MemberLevelDTO> memberLevelList = memberLevelDAO.selectAll();
		List<LicenseDTO> licenseList = licenseDAO.selectAll();
		model.addAttribute("memberList", memberList);
		model.addAttribute("memberLevelList", memberLevelList);
		model.addAttribute("licenseList", licenseList);
		return "member/manage/memberAll";
	}

	// 관리자 회원 운전면허정보 심사 창
	@RequestMapping("admin_licenseAdmin.do")
	public String license(MemberDTO memberDTO, LicenseDTO licenseDTO, Model model) {
		licenseDTO = licenseDAO.selectId(memberDTO.getId());
		model.addAttribute("licenseDTO", licenseDTO);
		model.addAttribute("memberDTO",memberDTO);
		return "member/manage/licenseAdmin";
	}
	
	// 면허 승인 과정
	@RequestMapping("admin_licenseAdmin_fin.do")
	public String admin_licenseAdmin_fin(LicenseDTO licenseDTO) {
		licenseDAO.updatePermission(licenseDTO);
		return "mypage/allCheck"; // ajax용
	}
}