package co.kr.khaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.survey.Car_surveyDTO;
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
}
