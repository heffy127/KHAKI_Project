package co.kr.khaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.survey.Car_surveyDTO;
import co.kr.khaki.survey.Car_surveyResultDTO;
import co.kr.khaki.survey.SurveyDAO;

@Controller
public class SurveyController {

	@Autowired
	SurveyDAO surveyDAO;
	
	@RequestMapping("survey1.do")
	public String survey1() {
		
		return "survey/survey1";
	}
	
	@RequestMapping("survey2.do")
	public String survey2() {
		
		return "survey/survey2";
	}
	
	@RequestMapping("surveyFin.do")
	public String surveyFin(Car_surveyDTO car_surveyDTO) {
		surveyDAO.insert(car_surveyDTO); // 설문결과 insert
		
		return "home/home"; // 일단 메인으로 되돌아오게 함
	}
	
	@RequestMapping("admin_surveyResult.do")
	public String admin_surveyResult(Model model) {
		Car_surveyResultDTO car_surveyResultDTO1 = surveyDAO.selectQ1();
		Car_surveyResultDTO car_surveyResultDTO2 = surveyDAO.selectQ2();
		Car_surveyResultDTO car_surveyResultDTO3 = surveyDAO.selectQ3();
		Car_surveyResultDTO car_surveyResultDTO4 = surveyDAO.selectQ4();
		Car_surveyResultDTO car_surveyResultDTO5 = surveyDAO.selectQ5();
		model.addAttribute("car_surveyResultDTO1", car_surveyResultDTO1);
		model.addAttribute("car_surveyResultDTO2", car_surveyResultDTO2);
		model.addAttribute("car_surveyResultDTO3", car_surveyResultDTO3);
		model.addAttribute("car_surveyResultDTO4", car_surveyResultDTO4);
		model.addAttribute("car_surveyResultDTO5", car_surveyResultDTO5);
		return "survey/surveyResult"; // 일단 메인으로 되돌아오게 함
	}
}
