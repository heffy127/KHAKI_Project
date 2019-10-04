package co.kr.khaki.survey.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.common.pagination;
import co.kr.khaki.member.DAO.MemberDAOInter;
import co.kr.khaki.member.DTO.InsertPointDTO;
import co.kr.khaki.member.service.MemberServiceImpl;
import co.kr.khaki.member.service.MemberServiceInter;
import co.kr.khaki.survey.DAO.SurveyDAOInter;
import co.kr.khaki.survey.DTO.Car_surveyDTO;
import co.kr.khaki.survey.DTO.Car_surveyResultDTO;
import co.kr.khaki.survey.service.SurveyServiceInter;

@Controller
public class SurveyController {

   @Autowired
   SurveyDAOInter surveyDAO;
   @Autowired
   MemberDAOInter memberDAO;
   @Autowired
   SurveyServiceInter surveyServiceInter;
   @Autowired
   MemberServiceInter memberServiceInter;
   
   
   // profile에서 key 첫화면 호출
   @RequestMapping("survey.do")
   public String survey() {
	   return "key/survey";
   }
   
   @RequestMapping("survey1.do")
   public String survey1() {
      
      return "survey/survey1";
   }
   
   @RequestMapping("survey2.do")
   public String survey2() {
      
      return "survey/survey2";
   }
   
   @RequestMapping("surveyFin.do")
   public String surveyFin(Car_surveyDTO car_surveyDTO, HttpSession session) {
      surveyServiceInter.insertSurvey(car_surveyDTO); // 설문 결과 insert
      memberServiceInter.updatePoint((String)session.getAttribute("sessionId"), 50); // 50포인트 적립
      return "register/check"; // ajax용
   }
   
   @RequestMapping("admin_surveyResult.do")
   public String admin_surveyResult(Model model) {
      Car_surveyResultDTO car_surveyResultDTO1 = surveyServiceInter.selectSurveyQ1();
      Car_surveyResultDTO car_surveyResultDTO2 = surveyServiceInter.selectSurveyQ2();
      Car_surveyResultDTO car_surveyResultDTO3 = surveyServiceInter.selectSurveyQ3();
      Car_surveyResultDTO car_surveyResultDTO4 = surveyServiceInter.selectSurveyQ4();
      Car_surveyResultDTO car_surveyResultDTO5 = surveyServiceInter.selectSurveyQ5();
      model.addAttribute("car_surveyResultDTO1", car_surveyResultDTO1);
      model.addAttribute("car_surveyResultDTO2", car_surveyResultDTO2);
      model.addAttribute("car_surveyResultDTO3", car_surveyResultDTO3);
      model.addAttribute("car_surveyResultDTO4", car_surveyResultDTO4);
      model.addAttribute("car_surveyResultDTO5", car_surveyResultDTO5);
      return "survey/surveyResult";
   }
   
   @RequestMapping("surveyQ6.do")
   public String surveyQ6(Model model,
          @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="4") int pageSize) {
       int listCnt = 0;
       List<String> list = surveyServiceInter.selectOpinion();
       model.addAttribute("opinionList", list);
       listCnt = list.size();
      
         /* 페이지 네이션 */
         // 총 게시글 수

        pagination pg = new pagination(listCnt, curPage, pageSize);
        // for문으로 출력해오는 것을 수로 어떻게 처리하는 것에 따라 다름
         
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("pagination",pg);
        /**/

      return "survey/surveyQ6";
   }
}