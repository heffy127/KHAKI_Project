package co.kr.khaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.pay.PayDAO;
import co.kr.khaki.pay.PayDTO;

@Controller
public class PayController {
   
      @Autowired
      PayDAO pdao;

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
            pdao.insert(payDTO);
            return "pay/payResult";
         }
   
}