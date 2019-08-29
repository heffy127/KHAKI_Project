package co.kr.khaki.pay;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(PayDTO PayDTO) {
		System.out.println("PayDAO Insert!");
		my.insert("pDAO.insert", PayDTO);
	}
	
	public void update(PayDTO PayDTO) {
		System.out.println("PayDAO Update!");
		my.update("pDAO.update", PayDTO);
	}
	
	public void delete(PayDTO PayDTO) {
		System.out.println("PayDAO delete!");
		my.delete("pDAO.delete", PayDTO);
	}
	
	public List<PayDTO> select(PayDTO PayDTO) {
		System.out.println("PayDAO select!");
		return my.selectList("pDAO.select", PayDTO);
	}
	
	public List<PayDTO> select2(PayDTO PayDTO) {
		System.out.println("PayDAO select!");
		return my.selectList("pDAO.select2", PayDTO);
	}
	
	public List<PayDTO> selectAll() {
		System.out.println("PayDAO selectAll!");
		return my.selectList("pDAO.selectAll");
	}
	
	String cnt;

	public String selectCar(String buy_carModel) {
	   cnt = my.selectOne("payDAO.selectCar", buy_carModel);
	   return cnt;
	}

	public String selectEndTime(String buy_endTime, String buy_carModel) {
	   PayDTO pDTO = new PayDTO();
	   pDTO.setBuy_carModel(buy_carModel);
	   pDTO.setBuy_endTime(buy_endTime);
	   cnt = my.selectOne("payDAO.selectEndTime", pDTO);
	   return cnt;
	}

	public String selectStartTime(String buy_startTime, String buy_carModel) {
	   PayDTO pDTO = new PayDTO();
	   pDTO.setBuy_carModel(buy_carModel);
	   pDTO.setBuy_startTime(buy_startTime);
	   cnt = my.selectOne("payDAO.selectStartTime", pDTO);
	   return cnt;
	}
	
	
}

