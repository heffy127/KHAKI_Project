package co.kr.khaki.survey.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.survey.DTO.Car_surveyDTO;
import co.kr.khaki.survey.DTO.Car_surveyResultDTO;

@Repository
public class SurveyDAOImpl implements SurveyDAOInter {
   
   @Autowired
   SqlSessionTemplate my;
   
   // 설문지 결과 DB에 저장
   /* (non-Javadoc)
 * @see co.kr.khaki.survey.DAO.SurveyDAOInter#insert(co.kr.khaki.survey.DTO.Car_surveyDTO)
 */
@Override
public void insert(Car_surveyDTO car_surveyDTO) {
      my.insert("surveyDAO.insert", car_surveyDTO);
      System.out.println("surveyDAO.insert 성공");
   }
   
   // 설문지 1번문항 결과 추출
   /* (non-Javadoc)
 * @see co.kr.khaki.survey.DAO.SurveyDAOInter#selectQ1()
 */
@Override
public Car_surveyResultDTO selectQ1() {
      Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ1");
      System.out.println("surveyDAO.selectQ1 성공");
      
      return car_surveyResultDTO;
   }
   
   // 설문지 2번문항 결과 추출
   /* (non-Javadoc)
 * @see co.kr.khaki.survey.DAO.SurveyDAOInter#selectQ2()
 */
@Override
public Car_surveyResultDTO selectQ2() {
      Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ2");
      System.out.println("surveyDAO.selectQ2 성공");
      
      return car_surveyResultDTO;
   }
   
   // 설문지 3번문항 결과 추출
   /* (non-Javadoc)
 * @see co.kr.khaki.survey.DAO.SurveyDAOInter#selectQ3()
 */
@Override
public Car_surveyResultDTO selectQ3() {
      Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ3");
      System.out.println("surveyDAO.selectQ3 성공");
      
      return car_surveyResultDTO;
   }
   
   // 설문지 4번문항 결과 추출
   /* (non-Javadoc)
 * @see co.kr.khaki.survey.DAO.SurveyDAOInter#selectQ4()
 */
@Override
public Car_surveyResultDTO selectQ4() {
      Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ4");
      System.out.println("surveyDAO.selectQ4 성공");
      
      return car_surveyResultDTO;
   }
   
   // 설문지 5번문항 결과 추출
   /* (non-Javadoc)
 * @see co.kr.khaki.survey.DAO.SurveyDAOInter#selectQ5()
 */
@Override
public Car_surveyResultDTO selectQ5() {
      Car_surveyResultDTO car_surveyResultDTO = my.selectOne("surveyDAO.selectQ5");
      System.out.println("surveyDAO.selectQ5 성공");
      
      return car_surveyResultDTO;
   }
   
   // 설문지 추가의견 추출
   /* (non-Javadoc)
 * @see co.kr.khaki.survey.DAO.SurveyDAOInter#selectOpinion()
 */
@Override
public List<String> selectOpinion() {
      List<String> list = my.selectList("surveyDAO.selectOpinion");
      System.out.println("surveyDAO.selectOpinion 성공");
      
      return list;
   }
}