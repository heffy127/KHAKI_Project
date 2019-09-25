package co.kr.khaki.survey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.khaki.member.DAO.MemberDAOInter;
import co.kr.khaki.survey.DAO.SurveyDAOInter;
import co.kr.khaki.survey.DTO.Car_surveyDTO;
import co.kr.khaki.survey.DTO.Car_surveyResultDTO;

@Service
public class SurveyServiceImpl implements SurveyServiceInter {

	 @Autowired
     SurveyDAOInter surveyDAO;
     @Autowired
     MemberDAOInter memberDAO;
     
     // 차량 공유 서비스 설문 결과 DB에 저장
     /* (non-Javadoc)
	 * @see co.kr.khaki.survey.service.SurveyServiceInter#insertSurvey(co.kr.khaki.survey.DTO.Car_surveyDTO)
	 */
    @Override
	public void insertSurvey(Car_surveyDTO car_surveyDTO) {
    	 
    	 surveyDAO.insert(car_surveyDTO); // 설문결과 insert
	 }
     
     // 설문지 1번 문항 추출
     /* (non-Javadoc)
	 * @see co.kr.khaki.survey.service.SurveyServiceInter#selectSurveyQ1()
	 */
    @Override
	public Car_surveyResultDTO selectSurveyQ1() {
		
    	 return surveyDAO.selectQ1();
	}
     
     // 설문지 2번 문항 추출
     /* (non-Javadoc)
	 * @see co.kr.khaki.survey.service.SurveyServiceInter#selectSurveyQ2()
	 */
    @Override
	public Car_surveyResultDTO selectSurveyQ2() {
    	 
    	 return surveyDAO.selectQ1();
     }
     
     // 설문지 3번 문항 추출
     /* (non-Javadoc)
	 * @see co.kr.khaki.survey.service.SurveyServiceInter#selectSurveyQ3()
	 */
    @Override
	public Car_surveyResultDTO selectSurveyQ3() {
    	 
    	 return surveyDAO.selectQ1();
     }
     
     // 설문지 4번 문항 추출
     /* (non-Javadoc)
	 * @see co.kr.khaki.survey.service.SurveyServiceInter#selectSurveyQ4()
	 */
    @Override
	public Car_surveyResultDTO selectSurveyQ4() {
    	 
    	 return surveyDAO.selectQ1();
     }
     
     // 설문지 5번 문항 추출
     /* (non-Javadoc)
	 * @see co.kr.khaki.survey.service.SurveyServiceInter#selectSurveyQ5()
	 */
    @Override
	public Car_surveyResultDTO selectSurveyQ5() {
    	 
    	 return surveyDAO.selectQ1();
     }
     
     // 설문지 추가의견 목록 추출
     /* (non-Javadoc)
	 * @see co.kr.khaki.survey.service.SurveyServiceInter#selectOpinion()
	 */
    @Override
	public List<String> selectOpinion() {
    	 
    	 return surveyDAO.selectOpinion();
     }
    
}
