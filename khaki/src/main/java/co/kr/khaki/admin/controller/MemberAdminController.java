package co.kr.khaki.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.admin.DTO.MemberAdminDTO;
import co.kr.khaki.admin.service.MemberAdminServiceInter;
import co.kr.khaki.common.pagination;
import co.kr.khaki.member.DTO.LicenseDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.member.service.MemberServiceInter;

@Controller
public class MemberAdminController {


   @Autowired
   MemberServiceInter memberServiceInter;
   @Autowired
   MemberAdminServiceInter memberAdminServiceInter;
   
   @RequestMapping("admin.do")
   public String admin() {   
   
      return "admin/admin";
   }
   
   
   // 관리자 회원 관리 창
   @RequestMapping("admin_memberAll.do")
   public String admin_memberAll(Model model,  
         @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="6") int pageSize) {   
      List<MemberAdminDTO> memberAdminList = memberAdminServiceInter.selectAll(); 
      model.addAttribute("memberAdminList",memberAdminList);
      model.addAttribute("searchMethod", "id"); // selectBox 기본 아이디 선택
      
      /* 페이지 네이션 */
      // 총 게시글 수
        int listCnt = memberAdminList.size();
     pagination pg = new pagination(listCnt, curPage, pageSize);
     // for문으로 출력해오는 것을 수로 어떻게 처리하는 것에 따라 다름
      
     model.addAttribute("listCnt", listCnt);
     model.addAttribute("pagination",pg);
     model.addAttribute("modelPaging", "all");
     /**/
     
      return "member/manage/memberAll"; 
   }

   // 관리자 페이지 검색
   @RequestMapping("admin_search.do")
   public String admin_search(String searchSelect, String search,
         @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="6") int pageSize, Model model) {   
     int listCnt = 0;
      if(searchSelect.equals("id")) { // id 검색
        List<MemberAdminDTO> memberAdminList = memberAdminServiceInter.selectFromId(search);
        listCnt = memberAdminList.size();
         model.addAttribute("memberAdminList", memberAdminList);
         model.addAttribute("searchMethod", "id"); // selectBox 아이디 선택
      }else { // name 검색
        List<MemberAdminDTO> memberAdminList = memberAdminServiceInter.selectFromName(search);
        listCnt = memberAdminList.size();
         model.addAttribute("memberAdminList", memberAdminList);
         model.addAttribute("searchMethod", "name"); // selectBox 이름 선택
      }

      System.out.println(curPage);
      System.out.println(pageSize);
      /* 페이지 네이션 */
      // 총 게시글 수
       
     pagination pg = new pagination(listCnt, curPage, pageSize);
     // for문으로 출력해오는 것을 수로 어떻게 처리하는 것에 따라 다름
     model.addAttribute("listCnt", listCnt);
     model.addAttribute("pagination",pg);
     /**/
      
      return "member/manage/memberAll";
   }
   
   // 관리자 운전면허 정렬
   @RequestMapping("admin_licenseSort.do")
   public String admin_licenseSort(String permission,  Model model,
         @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="6") int pageSize) {
     
     int listCnt = 0;
      List<MemberAdminDTO> memberAdminList = memberAdminServiceInter.selectLicense(permission);
      listCnt = memberAdminList.size();
      
      /* 페이지 네이션 */
      // 총 게시글 수

     pagination pg = new pagination(listCnt, curPage, pageSize);
     // for문으로 출력해오는 것을 수로 어떻게 처리하는 것에 따라 다름
      
     model.addAttribute("memberAdminList",memberAdminList);
     model.addAttribute("listCnt", listCnt);
     model.addAttribute("pagination",pg);
     /**/
      
      return "member/manage/memberAll";
   }
   
   // 관리자 푸시 정렬
   @RequestMapping("admin_selectPushSort.do")
   public String admin_selectPushSort(String push, Model model,
         @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="6") int pageSize) {
      int listCnt = 0;
      List<MemberAdminDTO> memberAdminList = memberAdminServiceInter.selectPush(push);
      
      listCnt = memberAdminList.size();
      /* 페이지 네이션 */
      // 총 게시글 수
 
     pagination pg = new pagination(listCnt, curPage, pageSize);
     // for문으로 출력해오는 것을 수로 어떻게 처리하는 것에 따라 다름
      
     model.addAttribute("memberAdminList",memberAdminList);
     model.addAttribute("listCnt", listCnt);
     model.addAttribute("pagination",pg);
     /**/
      
      return "member/manage/memberAll";
   }
   
   // 관리자 회원 운전면허정보 심사 창
   @RequestMapping("admin_licenseAdmin.do")
   public String license(MemberDTO memberDTO, LicenseDTO licenseDTO, Model model) {
      licenseDTO = memberServiceInter.selectLicenseFromId(memberDTO.getId());
      model.addAttribute("licenseDTO", licenseDTO);
      model.addAttribute("memberDTO",memberDTO);
      return "member/manage/licenseAdmin";
   }
   
   // 면허 승인 과정
   @RequestMapping("admin_licenseAdmin_fin.do")
   public String admin_licenseAdmin_fin(LicenseDTO licenseDTO) {
      memberAdminServiceInter.updatePermission(licenseDTO);
      return "mypage/allCheck"; // ajax용
   }
   
   // 관리자 채팅창
   @RequestMapping("counselingChatAdmin.do")
   public String chat() {   
   
      return "chat/counselingChatAdmin";
   }
}