package co.kr.khaki.controller;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.member.MemberDTO;
import co.kr.khaki.pay.PayDAO;
import co.kr.khaki.pay.PayDTO;
import co.kr.khaki.refund.RefundDAO;
import co.kr.khaki.refund.RefundDTO;

@Controller
public class RefundController {
   
      @Autowired
      PayDAO pdao;
      
      @Autowired
      MemberDAO memberDAO;
      
      @Autowired
      RefundDAO refundDAO;
      
      
      @RequestMapping("refund.do")
  	  public String refund(String buy_impUid) {
    	  // reservation DB에 주문번호로 select해오기 위해 payDTO 객체 생성
    	  PayDTO payDTO = new PayDTO();
    	  // payDTO의 주문번호에 get메소드로 입력	
    	  payDTO.setBuy_impUid(buy_impUid);
    	  
    	  // 입력한 주문번호를 파라메터로 넘겨서 pDTO에 select 해옴
    	  PayDTO pDTO = pdao.select(payDTO);
    	  
    	  // model로 넘길 refundDTO 객체 생성
    	  RefundDTO refundDTO = new RefundDTO();
    	  System.out.println(buy_impUid + "주문번호확인!!!");
    	  refundDTO.setImpUid(buy_impUid);
    	  refundDTO.setId(pDTO.getBuy_id());
    	  
    	  // 환불 신청한 고객의 이름을 가져오기 위해 memberDTO로 이름 검색
    	  MemberDTO memberDTO = memberDAO.selectId(pDTO.getBuy_id());
    	  refundDTO.setName(memberDTO.getName());
    	  
    	  // 현재 년,월,일 입력
    	  Calendar cal = Calendar.getInstance();
          int year2 = cal.get(cal.YEAR);
  		  String year3 = Integer.toString(year2);
  		  String[] year4 = year3.split("");
  		  String year5 = year4[2] + year4[3];
  		  int year = Integer.parseInt(year5);
  		  int mon = cal.get(cal.MONTH) + 1;
  		  int day = cal.get(cal.DATE);
  		  System.out.println(mon + " mon");
  		  System.out.println(day + " day");
          String refundRequest = "";
          String realYear = Integer.toString(year);
          String realMon = "";
          String realDay = "";
          if(mon >= 10) {
        	  realMon = Integer.toString(mon);
          } else {
        	  realMon = "0" + Integer.toString(mon);
          }
          if(day >= 10) {
        	  realDay = Integer.toString(day);
          } else {
        	  realDay = "0" + Integer.toString(day);
          }
          refundRequest = realYear + "." + realMon + "." + realDay;
    	  refundDTO.setRefundRequest(refundRequest);
    	  
    	  refundDTO.setBurum(pDTO.getBuy_burum());
    	  refundDTO.setAmount(pDTO.getBuy_totalAmount());
    	  
    	  String[] coupon = pDTO.getBuy_discount().split(",");
    	  refundDTO.setUsePoint(pDTO.getBuy_usePoint());
    	  
    	  refundDTO.setPointOrCoupon(pDTO.getBuy_useCoupon());
    	  refundDTO.setCouponNum(coupon[2]);
    	  refundDAO.insert(refundDTO);
    	  
    	  return "pay/payResult";
  	  }
   
}