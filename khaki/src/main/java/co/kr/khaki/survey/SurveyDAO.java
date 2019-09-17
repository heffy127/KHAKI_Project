package co.kr.khaki.survey;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	// 설문지 결과 DB에 저장
	public void insert(Car_surveyDTO car_surveyDTO) {
		my.insert("surveyDAO.insert", car_surveyDTO);
		System.out.println("surveyDAO.insert 성공");
	}
	
	// 설문지 1번문항 결과 추출
	public Car_surveyResultDTO selectQ1() {
		Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ1");
		System.out.println("surveyDAO.selectQ1 성공");
		
		return car_surveyResultDTO;
	}
	
	// 설문지 2번문항 결과 추출
	public Car_surveyResultDTO selectQ2() {
		Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ2");
		System.out.println("surveyDAO.selectQ2 성공");
		
		return car_surveyResultDTO;
	}
	
	// 설문지 3번문항 결과 추출
	public Car_surveyResultDTO selectQ3() {
		Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ3");
		System.out.println("surveyDAO.selectQ3 성공");
		
		return car_surveyResultDTO;
	}
	
	// 설문지 4번문항 결과 추출
	public Car_surveyResultDTO selectQ4() {
		Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ4");
		System.out.println("surveyDAO.selectQ4 성공");
		
		return car_surveyResultDTO;
	}
	
	// 설문지 5번문항 결과 추출
	public Car_surveyResultDTO selectQ5() {
		Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ5");
		System.out.println("surveyDAO.selectQ5 성공");
		
		return car_surveyResultDTO;
	}
}
