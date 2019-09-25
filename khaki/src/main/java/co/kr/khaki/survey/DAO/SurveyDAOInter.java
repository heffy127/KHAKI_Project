package co.kr.khaki.survey.DAO;

import java.util.List;

import co.kr.khaki.survey.DTO.Car_surveyDTO;
import co.kr.khaki.survey.DTO.Car_surveyResultDTO;

public interface SurveyDAOInter {

	// 설문지 결과 DB에 저장
	void insert(Car_surveyDTO car_surveyDTO);

	// 설문지 1번문항 결과 추출
	Car_surveyResultDTO selectQ1();

	// 설문지 2번문항 결과 추출
	Car_surveyResultDTO selectQ2();

	// 설문지 3번문항 결과 추출
	Car_surveyResultDTO selectQ3();

	// 설문지 4번문항 결과 추출
	Car_surveyResultDTO selectQ4();

	// 설문지 5번문항 결과 추출
	Car_surveyResultDTO selectQ5();

	// 설문지 추가의견 추출
	List<String> selectOpinion();

}