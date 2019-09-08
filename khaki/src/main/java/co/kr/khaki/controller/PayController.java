package co.kr.khaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.coupon.CouponUseDAO;
import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.handler.HandlerDAO;
import co.kr.khaki.handler.HandlerDTO;
import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.pay.PayDAO;
import co.kr.khaki.pay.PayDTO;

@Controller
public class PayController {
   
      @Autowired
      PayDAO pdao;
      
      @Autowired
  	  MemberDAO memberDAO;
      
      @Autowired
  	  HandlerDAO hdao;
      
      @Autowired
  	  CouponUseDAO cpuDAO;

      String cnt;

      @RequestMapping("search2.do")
      public String search2(Model model, String buy_endTime, String buy_startTime,String buy_carNum) {
         System.out.println("컨트롤러 : " + buy_carNum + "," + buy_startTime + "," + buy_endTime);
         cnt = pdao.search2(buy_endTime, buy_carNum,buy_startTime);
         model.addAttribute("cnt", cnt);
         return "pay/search2";
      }
      
      @RequestMapping("searchCar.do") //차량명에 해당하는 자료들의 갯수 불러옴
      public String selectCar(Model model, String buy_carModel) {
         cnt = pdao.selectCar(buy_carModel);
         model.addAttribute("cnt", cnt);
         return "pay/searchCar";
      }

      @RequestMapping("searchEndTime.do")
      public String searchEndTIme(Model model, String buy_endTime, String buy_carModel) {
         cnt = pdao.selectEndTime(buy_endTime, buy_carModel);
         model.addAttribute("cnt", cnt);
         return "pay/searchEndTime";
      }

      @RequestMapping("searchStartTime.do")
      public String searchStartTime(Model model, String buy_startTime, String buy_carModel) {
         cnt = pdao.selectStartTime(buy_startTime, buy_carModel);
         model.addAttribute("cnt", cnt);
         return "pay/searchStartTime";
      }
      
      @RequestMapping("searchCarNum.do")
      public String searchCarNum(Model model, PayDTO payDTO) {
         
         return "pay/searchCarNum";
      }
      
      @RequestMapping("payResult.do")
         public String payResult(PayDTO payDTO) {
            System.out.println("PayDAO Insert~");
            System.out.println(payDTO.getBuy_startTime() + "aaaaaaaaaaa");
            System.out.println(payDTO.getBuy_endTime() + "aaaaaaaaaaa");
            pdao.insert(payDTO);
            memberDAO.updatePointCount(payDTO);
            return "pay/payResult";
         }
      
      @RequestMapping("pointUseInput.do")
      public String payResult(String getPoint) {
    	 // 결제화면에서 포인트 사용을 했을 경우 입력한 포인트만큼 memberDB에서 포인트 차감
    	 // ex) 100포인트 사용시 100 * (-1) = -100
    	 // 현재 포인트가 500포인트라면 500 + (-100) = 400
    	 PayDTO payDTO = new PayDTO();
    	 getPoint = Integer.toString(Integer.parseInt(getPoint) * (-1));
    	 payDTO.setBuy_point(getPoint);
         memberDAO.updatePointCount(payDTO);
         return "pay/payResult";
      }
      
      @RequestMapping("burumService.do")
  	  public String burumService(PayDTO payDTO) {
    	  System.out.println("부름서비스 확인 " + payDTO.getBuy_carNum());
      	  HandlerDTO hDTO = new HandlerDTO();
    	
      	  hDTO.setCarNum(payDTO.getBuy_carNum());
      	  hDTO.setCarModel(payDTO.getBuy_carModel());
      	  hDTO.setStartLocation(payDTO.getBuy_startLocation());
    	  hDTO.setReturnLocation(payDTO.getBuy_returnLocation());
    	  hDTO.setHandler(payDTO.getBuy_id());
    	  hDTO.setPoint(Integer.parseInt(payDTO.getBuy_amount()) / 2);
    	  String[] c = payDTO.getBuy_startTime().split("");
    	  String comp = c[0]+c[1] + "." + c[2]+c[3] + "." + c[4]+c[5] + " " + c[6]+c[7] + ":" + c[8]+c[9];
    	  hDTO.setComplete(comp);
    	  System.out.println("hdto set완료!!!");
    	  hdao.insert(hDTO);
    	  System.out.println("hdao insert완료오오오");
  		
  		  return "pay/payResult";
  	  }
      
      @RequestMapping("couponUsing.do")
  	  public String couponUsing(CouponUseDTO cpuDTO) {
    	  System.out.println("쿠폰 사용처리");
    	  cpuDAO.update(cpuDTO);
  		  return "pay/payResult";
  	  }
   
}