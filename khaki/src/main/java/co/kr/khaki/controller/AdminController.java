package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.member.LicenseDAO;
import co.kr.khaki.member.LicenseDTO;
import co.kr.khaki.member.MemberAdminDAO;
import co.kr.khaki.member.MemberAdminDTO;
import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.member.MemberDTO;
import co.kr.khaki.member.MemberLevelDAO;

@Controller
public class AdminController {

   @Autowired
   MemberDAO memberDAO;
   @Autowired
   MemberLevelDAO memberLevelDAO;
   @Autowired
   LicenseDAO licenseDAO;
   @Autowired
   MemberAdminDAO memberAdminDAO;
   
   @RequestMapping("admin.do")
   public String admin() {   
   
      return "admin/admin";
   }
   
   
   // 관리자 회원 관리 창
   @RequestMapping("admin_memberAll.do")
   public String admin_memberAll(Model model) {   
      List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectAll(); 
      model.addAttribute("memberAdminList",memberAdminList);
      model.addAttribute("searchMethod", "id"); // selectBox 기본 아이디 선택
      
      return "member/manage/memberAll";
   }

   // 관리자 페이지 검색
   @RequestMapping("admin_search.do")
   public String admin_search(String searchSelect, String search ,Model model) {   
      if(searchSelect.equals("id")) { // id 검색
         List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectId(search);
         model.addAttribute("memberAdminList", memberAdminList);
         model.addAttribute("searchMethod", "id"); // selectBox 아이디 선택
      }else { // name 검색
         List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectName(search);
         model.addAttribute("memberAdminList", memberAdminList);
         model.addAttribute("searchMethod", "name"); // selectBox 이름 선택
      }
      
      return "member/manage/memberAll";
   }
   
   // 관리자 운전면허 정렬
   @RequestMapping("admin_licenseSort.do")
   public String admin_licenseSort(String permission, Model model) {
      if(permission.equals("NULL")) { // 미등록 조회
         List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectLicenseSort_null();
         model.addAttribute("memberAdminList",memberAdminList);
      }else { // 그 외 조회
         List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectLicenseSort(permission);
         model.addAttribute("memberAdminList",memberAdminList);
      }
      
      return "member/manage/memberAll";
   }
   
   // 관리자 푸시 정렬
   @RequestMapping("admin_selectPushSort.do")
   public String admin_selectPushSort(String push, Model model) {
      if(push.equals("sms")) { // 휴대전화 푸시 조회
         List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectPushSort_smsPush();
         model.addAttribute("memberAdminList",memberAdminList);
      }else { // 그 외 조회
         List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectPushSort_emailPush();
         model.addAttribute("memberAdminList",memberAdminList);
      }
      
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