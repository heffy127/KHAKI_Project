package co.kr.khaki.survey.service;

import java.util.List;

import co.kr.khaki.survey.DTO.Car_surveyDTO;
import co.kr.khaki.survey.DTO.Car_surveyResultDTO;

public interface SurveyServiceInter {

	// 차량 공유 서비스 설문 결과 DB에 저장
	void insertSurvey(Car_surveyDTO car_surveyDTO);

	// 설문지 1번 문항 추출
	Car_surveyResultDTO selectSurveyQ1();

	// 설문지 2번 문항 추출
	Car_surveyResultDTO selectSurveyQ2();

	// 설문지 3번 문항 추출
	Car_surveyResultDTO selectSurveyQ3();

	// 설문지 4번 문항 추출
	Car_surveyResultDTO selectSurveyQ4();

	// 설문지 5번 문항 추출
	Car_surveyResultDTO selectSurveyQ5();

	// 설문지 추가의견 목록 추출
	List<String> selectOpinion();

}