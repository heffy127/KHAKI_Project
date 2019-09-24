package co.kr.khaki.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.khaki.common.AuthNumber;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.member.DTO.SocialDTO;

@Controller
@SessionAttributes({"memberDTO","go","reco", "socialDTO"})
public class SmsController {
	
	  @RequestMapping("sms.do")   
      //샘플은 sms.do로 사용하지만 각자의 시그니쳐 넣어서 활용 ex) smsmin.do와 같이
      // RequestMapping을 통해서 각자 도메인 주소로 가게끔 설계 
      public String sms(){
         // smstest 페이지로 이동하기 위한 컨트롤러로 각자 사용하는 컨트롤러에 가져가서 사용하면 됨
         
         return "sms/smsindex";
      }
	  
	  @RequestMapping("smsRegister.do")   
	  //샘플은 sms.do로 사용하지만 각자의 시그니쳐 넣어서 활용 ex) smsmin.do와 같이
	  // RequestMapping을 통해서 각자 도메인 주소로 가게끔 설계 
	  public String smsRegister(Model model, MemberDTO memberDTO, SocialDTO socialDTO, String go, String reco){
		  // smstest 페이지로 이동하기 위한 컨트롤러로 각자 사용하는 컨트롤러에 가져가서 사용하면 됨
		  System.out.println("여긴 smsRegister " + socialDTO.getSocial_id());
		  model.addAttribute("memberDTO", memberDTO);	// 회원가입 정보
		  model.addAttribute("socialDTO", socialDTO);	// 소셜 로그인 정보
		  model.addAttribute("go",go);	// 홈화면 면허등록화면 분기 정보
		  model.addAttribute("reco",reco);	// 추천인 정보
		  return "sms/smsRegister";
	  }
	  
	  @RequestMapping("smsPhoneAuth.do")   
	  //샘플은 sms.do로 사용하지만 각자의 시그니쳐 넣어서 활용 ex) smsmin.do와 같이
	  // RequestMapping을 통해서 각자 도메인 주소로 가게끔 설계 
	  public String smsPhoneAuth(String phone, Model model, String go, String reco){
		  // smstest 페이지로 이동하기 위한 컨트롤러로 각자 사용하는 컨트롤러에 가져가서 사용하면 됨
		AuthNumber ean = new AuthNumber();
		String authNum = ean.makeAuthNum();
			
		model.addAttribute("authNum", authNum);
		model.addAttribute("phone", phone);
		return "sms/smsPhoneAuth";
	  }
      
      @RequestMapping("smssend_phAuth.do")
      public String smssend_phChk(){
         
         return "sms/smssend_phAuth";
      }
      
      @RequestMapping("smssend_regi.do")
      public String smssend_regi(){
    	  
    	  return "sms/smssend_regi";
      }
      
      @RequestMapping("smssend_findIdPw.do")
      public String smssend_findId(){
         
         return "sms/smssend_findIdPw";
      }
}
