package co.kr.khaki.usedCar;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UsedCarDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(UsedCarDTO UsedCarDTO) {
		System.out.println("UsedCarDAO Insert!");
		my.insert("usedCarDAO.insert", UsedCarDTO);
	}
}

