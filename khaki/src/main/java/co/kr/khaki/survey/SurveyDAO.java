package co.kr.khaki.survey;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(Car_surveyDTO car_surveyDTO) {
		my.insert("surveyDAO.insert", car_surveyDTO);
		System.out.println("surveyDAO.insert 성공");
	}
}
