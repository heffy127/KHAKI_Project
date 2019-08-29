package co.kr.khaki.car;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarDAO {
	
		@Autowired
		SqlSessionTemplate my;
		
		public List<CarDTO> selectCar(String buy_carModel) {
			System.out.println("2 DAO : " + buy_carModel);
			List<CarDTO> list = my.selectList("carDAO.selectCar",buy_carModel);
			System.out.println("3 DAO selectCar 성공 : " + list.size() + "개");
			return list;
		}
		
		public void insert(CarDTO carDTO) {
			my.insert("carDAO.insert", carDTO);
			System.out.println("insert 성공");
		}
		
		public void delete(String car_num) {
			my.delete("carDAO.delete", car_num);
		}
		
		public List<CarDTO> carListInfo(Integer zoneNum) {
			System.out.println("2 DAO : " + zoneNum);
			List<CarDTO> list = my.selectList("carListInfo",zoneNum);
			System.out.println("3 DAO : " + list.size());
			return list;
		}
}
