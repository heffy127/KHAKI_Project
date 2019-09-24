package co.kr.khaki.car;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.member.LicenseDTO;

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
      
      public List<NewCarDTO> selectThree() {
         List<NewCarDTO> list = my.selectList("carDAO.selectThree");
         System.out.println("List<NewCarDTO> selectThree");
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
         List<CarDTO> list = my.selectList("carDAO.carListInfo",zoneNum);
         System.out.println("3 DAO : " + list.size());
         return list;
      }
      
      public CarDTO carNumSearch(String car_num) {
         CarDTO cdto = my.selectOne("carDAO.carNumSearch", car_num);
         return cdto;
      }
      
      public List<CarDTO> search1(String buy_carModel) {
         //System.out.println("2번 : " +buy_carModel);
         List<CarDTO> list = my.selectList("carDAO.search1", buy_carModel);
         //System.out.println("3번 : "+ list.size());
         return list;
      }
      
      public LicenseDTO mapLisence(String id) {
    	  LicenseDTO dto = my.selectOne("licenseDAO.selectId", id);
    	  return dto;
      }
}